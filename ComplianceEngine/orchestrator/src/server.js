'use strict';

const express = require('express');
const cors = require('cors');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const mongoose = require('mongoose');

const config = require('./config');
const logger = require('./utils/logger');
const { ensureDirs } = require('./utils/fileHelpers');
const { runPipelineForProduct } = require('./pipeline/orchestrator');
const { uploadPdf, isConfigured: isCloudinaryConfigured } = require('./utils/cloudinary');
const Report = require('./models/Report');

const app = express();
const PORT = process.env.PORT || 3000;

app.enable('trust proxy');

// Helper to get fully-qualified public URL
function getBaseUrl(req) {
  const proto = req.headers['x-forwarded-proto'] || req.protocol || 'https';
  const host = req.headers['x-forwarded-host'] || req.get('host');
  return `${proto}://${host}`;
}

// Enable CORS and JSON parsing
app.use(cors());
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ extended: true, limit: '50mb' }));

// Static route to serve generated local reports as fallback
app.use('/output', express.static(config.paths.output));

// Temporary upload directory with proper extension preservation
const uploadDir = path.join(config.paths.temp, 'api_uploads');
ensureDirs(uploadDir);

const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, uploadDir),
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname).toLowerCase() || '.jpg';
    const cleanName = path.basename(file.originalname, ext).replace(/[^a-zA-Z0-9_-]/g, '_');
    cb(null, `${cleanName}_${Date.now()}_${Math.random().toString(36).slice(2, 7)}${ext}`);
  },
});

const upload = multer({
  storage,
  limits: {
    fileSize: 30 * 1024 * 1024, // 30 MB per image
    files: 10,                 // Up to 10 panels
  },
  fileFilter: (req, file, cb) => {
    const allowed = /\.(jpg|jpeg|png|webp|heic|heif)$/i;
    if (!allowed.test(file.originalname) && !file.mimetype.startsWith('image/')) {
      return cb(new Error('Only image files (jpg, jpeg, png, webp, heic) are accepted'));
    }
    cb(null, true);
  },
});

// Connect to MongoDB Atlas
if (process.env.MONGODB_URI) {
  mongoose
    .connect(process.env.MONGODB_URI, { serverSelectionTimeoutMS: 8000 })
    .then(() => logger.info('server', 'Connected to MongoDB Atlas successfully.'))
    .catch((err) => logger.error('server', `MongoDB Atlas connection error: ${err.message}`));
} else {
  logger.warn('server', 'MONGODB_URI is not set. Final PDF references will not be saved to MongoDB Atlas.');
}

function cleanupFiles(filePaths) {
  if (!Array.isArray(filePaths)) return;
  for (const p of filePaths) {
    try {
      if (p && fs.existsSync(p)) fs.unlinkSync(p);
    } catch (_) {}
  }
}

// ---------------------------------------------------------------------------
// Health & Diagnostic Endpoint
// ---------------------------------------------------------------------------
app.get('/health', (req, res) => {
  res.json({
    status: 'healthy',
    engine: 'Nirikshak Legal Metrology Compliance Engine',
    timestamp: new Date().toISOString(),
    services: {
      mongodb: mongoose.connection.readyState === 1 ? 'connected' : 'disconnected',
      cloudinary: isCloudinaryConfigured ? 'configured' : 'unconfigured',
      groqExtraction: Boolean(process.env.GROQ_API_KEY),
    },
  });
});

// ---------------------------------------------------------------------------
// Main Endpoint: Process Packaging Photos on Server & Store Only the Final PDF
// ---------------------------------------------------------------------------
app.post('/api/v1/inspect', upload.array('images', 10), async (req, res) => {
  const uploadedFiles = req.files || [];
  if (uploadedFiles.length === 0) {
    return res.status(400).json({
      success: false,
      error: 'No images provided. Upload 1 or more packaging photos in the "images" field.',
    });
  }

  const localFilePaths = uploadedFiles.map((f) => f.path);
  logger.info('api', `Received ${uploadedFiles.length} photo(s) for compliance processing...`);

  try {
    const {
      productName = 'Package Inspection',
      packageDimensions = null,
      isEcommerce = false,
    } = req.body;

    const pipelineOptions = {
      packageDimensions: packageDimensions ? String(packageDimensions).trim() : null,
      isEcommerce: isEcommerce === 'true' || isEcommerce === true,
    };

    // 1. Run COMPLETE processing pipeline entirely on the server
    // (Preprocessing -> OCR -> Font Clearance -> LLM Extraction -> Rule Engine -> Evidence Crops -> PDF Builder -> Cloudinary Upload)
    const result = await runPipelineForProduct(localFilePaths, pipelineOptions);

    // 2. Resolve genuine product name (prioritize AI-detected commodity/brand over dummy test strings)
    const dummyNames = new Set([
      'package inspection',
      'package report',
      'test packaged commodity',
      'bourbon biscuits 120g',
      'packaged commodity',
      'test product',
      ''
    ]);
    const userProvided = (req.body.productName || '').trim();
    const isDummy = dummyNames.has(userProvided.toLowerCase());
    const finalProductName = (!isDummy && userProvided ? userProvided : null) || result.detectedProductName || userProvided || 'Packaged Commodity';

    const reportId = `REP-${result.productId}-${Date.now()}`;
    const directPdfUrl = `${getBaseUrl(req)}/api/v1/reports/${reportId}/pdf`;
    const finalPdfUrl = result.pdfUrl || directPdfUrl;

    // 3. Store ONLY the final statutory assessment and Cloudinary asset links into MongoDB Atlas
    let dbRecord = null;
    if (mongoose.connection.readyState === 1) {
      try {
        dbRecord = await Report.create({
          reportId,
          reference_no: reportId,
          productId: String(result.productId),
          productName: finalProductName,
          status: result.status,
          pdfUrl: finalPdfUrl,
          cloudinaryUrl: result.cloudinaryUrl,
          directPdfUrl,
          preprocessedImages: result.preprocessedImages || [],
          evidenceImages: result.violationEvidences || [],
          summary: result.summary || {},
        });
        logger.info('api', `Final PDF & evidence links saved to MongoDB Atlas: ${reportId} (${finalProductName})`);
      } catch (dbErr) {
        logger.error('api', `Failed to save assessment to MongoDB Atlas: ${dbErr.message}`);
      }
    }

    // 4. Clean up uploaded temporary photos from disk immediately
    cleanupFiles(localFilePaths);

    // 5. Return complete statutory assessment and Cloudinary links to the mobile app
    const finalReportId = dbRecord ? dbRecord.reportId : reportId;
    return res.status(200).json({
      success: true,
      data: {
        reportId: finalReportId,
        productName: finalProductName,
        status: result.status,
        pdfUrl: finalPdfUrl,
        directPdfUrl,
        cloudinaryUrl: result.cloudinaryUrl,
        preprocessedImages: result.preprocessedImages || [],
        evidenceImages: result.violationEvidences || [],
        annotatedNetQuantityUrl: result.annotatedNetQuantityUrl || null,
        summary: result.summary || {},
      },
    });
  } catch (err) {
    logger.error('api', `Processing failed: ${err.message}`, err);
    cleanupFiles(localFilePaths);
    return res.status(500).json({
      success: false,
      error: 'Failed to process packaging and generate report.',
      detail: err.message,
    });
  }
});

// ---------------------------------------------------------------------------
// Fetch Final Assessment & Cloudinary Asset Links by Report ID or Product ID
// ---------------------------------------------------------------------------
app.get('/api/v1/reports/:id', async (req, res) => {
  try {
    if (mongoose.connection.readyState !== 1) {
      return res.status(503).json({ success: false, error: 'Database not connected' });
    }

    const query = mongoose.Types.ObjectId.isValid(req.params.id)
      ? { _id: req.params.id }
      : { $or: [{ reportId: req.params.id }, { productId: req.params.id }] };

    const report = await Report.findOne(query).lean();
    if (!report) {
      return res.status(404).json({ success: false, error: 'Report not found in database.' });
    }

    const directPdfUrl = `${getBaseUrl(req)}/api/v1/reports/${report.reportId}/pdf`;

    res.json({
      success: true,
      data: {
        reportId: report.reportId,
        productName: report.productName,
        status: report.status,
        pdfUrl: report.cloudinaryUrl || report.pdfUrl || directPdfUrl,
        directPdfUrl,
        cloudinaryUrl: report.cloudinaryUrl,
        preprocessedImages: report.preprocessedImages || [],
        evidenceImages: report.evidenceImages || [],
        summary: report.summary || {},
        createdAt: report.createdAt,
      },
    });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// ---------------------------------------------------------------------------
// Direct PDF Viewer Endpoint: Redirects to the Cloudinary PDF
// ---------------------------------------------------------------------------
app.get('/api/v1/reports/:id/pdf', async (req, res) => {
  try {
    let report = null;

    if (mongoose.connection.readyState === 1) {
      const query = mongoose.Types.ObjectId.isValid(req.params.id)
        ? { _id: req.params.id }
        : { $or: [{ reportId: req.params.id }, { productId: req.params.id }] };

      report = await Report.findOne(query).lean();
    }

    const targetUrl = report?.cloudinaryUrl || report?.pdfUrl;
    if (targetUrl && targetUrl.startsWith('http')) {
      return res.redirect(targetUrl);
    }

    return res.status(404).json({ success: false, error: 'PDF report not found.' });
  } catch (err) {
    logger.error('server', `Error fetching PDF for ${req.params.id}: ${err.message}`);
    res.status(500).json({ success: false, error: err.message });
  }
});

// Backward compatibility alias for inspections
app.get('/api/v1/inspections/:id', (req, res) => res.redirect(`/api/v1/reports/${req.params.id}`));
app.get('/api/v1/inspections/:id/pdf', (req, res) => res.redirect(`/api/v1/reports/${req.params.id}/pdf`));

// List all generated reports from MongoDB Atlas
app.get('/api/v1/reports', async (req, res) => {
  try {
    if (mongoose.connection.readyState !== 1) {
      return res.status(503).json({ success: false, error: 'Database not connected' });
    }
    const page = Math.max(1, parseInt(req.query.page || '1', 10));
    const limit = Math.min(50, Math.max(1, parseInt(req.query.limit || '10', 10)));
    const skip = (page - 1) * limit;

    const [items, total] = await Promise.all([
      Report.find({}, 'reportId productId pdfUrl status productName createdAt')
        .sort({ createdAt: -1 })
        .skip(skip)
        .limit(limit)
        .lean(),
      Report.countDocuments(),
    ]);

    res.json({
      success: true,
      data: {
        items,
        total,
        page,
        pages: Math.ceil(total / limit),
      },
    });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// Start listening
app.listen(PORT, '0.0.0.0', () => {
  logger.info('server', `ComplianceEngine API running on http://0.0.0.0:${PORT}`);
  logger.info('server', `Health check available at http://0.0.0.0:${PORT}/health`);
});

module.exports = app;
