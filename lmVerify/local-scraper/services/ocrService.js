/**
 * services/ocrService.js
 *
 * Runs OCR specifically on product packaging images for Legal Metrology compliance.
 *
 * Architecture:
 * 1. Checks if the preprocessor & OCR microservice (http://127.0.0.1:8000) is running.
 * 2. If running, dispatches OCR batches to the microservice.
 * 3. If offline, invokes the standalone Python OCR CLI (ComplianceEngine/stage4_ocr/ocr_images_cli.py)
 *    using PaddleOCR directly.
 * 4. Merges and formats extracted text and bounding regions for the compliance pipeline.
 */

import { spawn } from "child_process";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const CLI_PATH = path.resolve(
  __dirname,
  "../../../ComplianceEngine/stage4_ocr/ocr_images_cli.py"
);

const OCR_SERVICE_URL = process.env.PREPROCESSOR_URL || "http://127.0.0.1:8000";

/**
 * Checks whether the Python Preprocessor & OCR microservice is healthy.
 */
async function checkServiceHealth(timeoutMs = 1500) {
  try {
    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(), timeoutMs);
    const res = await fetch(`${OCR_SERVICE_URL}/health`, {
      signal: controller.signal,
    });
    clearTimeout(timer);
    return res.ok;
  } catch {
    return false;
  }
}

/**
 * Dispatches image URLs to the standalone Python CLI runner via stdin.
 *
 * @param {string[]} imageUrls
 * @returns {Promise<object>}
 */
function runCliOcr(imageUrls) {
  return new Promise((resolve) => {
    const pythonBin = process.env.PYTHON_PATH || "python";
    const proc = spawn(pythonBin, [CLI_PATH], {
      windowsHide: true,
      stdio: ["pipe", "pipe", "pipe"],
    });

    let stdout = "";
    let stderr = "";

    proc.stdout.on("data", (chunk) => {
      stdout += chunk.toString("utf8");
    });

    proc.stderr.on("data", (chunk) => {
      stderr += chunk.toString("utf8");
    });

    proc.on("error", (err) => {
      console.warn(`[ocrService] Subprocess failed to start: ${err.message}`);
      resolve({
        success: false,
        error: err.message,
        results: [],
        combined_text: "",
      });
    });

    proc.on("close", (code) => {
      if (code !== 0) {
        console.warn(`[ocrService] CLI exited with code ${code}. Stderr: ${stderr.slice(-300)}`);
      }
      try {
        const jsonStart = stdout.indexOf("{");
        if (jsonStart !== -1) {
          const parsed = JSON.parse(stdout.slice(jsonStart));
          return resolve(parsed);
        }
      } catch (err) {
        console.warn(`[ocrService] Failed to parse CLI output: ${err.message}`);
      }
      resolve({
        success: false,
        error: `CLI failed with code ${code}`,
        results: [],
        combined_text: "",
      });
    });

    const payload = JSON.stringify({ images: imageUrls });
    proc.stdin.write(payload);
    proc.stdin.end();
  });
}

/**
 * Calls the online Stage 2/4 OCR microservice batch endpoint via HTTP multipart/form-data.
 *
 * @param {string[]} imageUrls
 * @returns {Promise<object|null>}
 */
async function callMicroserviceBatch(imageUrls) {
  const form = new FormData();
  let appendedCount = 0;

  for (let i = 0; i < imageUrls.length; i++) {
    const u = imageUrls[i];
    try {
      const res = await fetch(u, {
        headers: {
          "User-Agent":
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36",
        },
      });
      if (!res.ok) continue;
      const arrayBuffer = await res.arrayBuffer();
      const contentType = res.headers.get("content-type") || "image/jpeg";
      const blob = new Blob([arrayBuffer], { type: contentType });
      form.append("images", blob, `product_img_${i}.jpg`);
      appendedCount++;
    } catch {
      // Ignore individual image download failure
    }
  }

  if (appendedCount === 0) return null;

  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 25000);
  try {
    const res = await fetch(`${OCR_SERVICE_URL}/preprocess/ocr/batch`, {
      method: "POST",
      body: form,
      signal: controller.signal,
    });
    if (!res.ok) throw new Error(`Microservice returned HTTP ${res.status}`);
    const data = await res.json();
    return {
      success: true,
      count: data.items?.length || 0,
      combined_text: data.combined_text || "",
      results: (data.items || []).map((it, idx) => ({
        index: idx,
        url: imageUrls[idx] || it.filename,
        success: true,
        text: it.extracted_text || "",
        regions: it.regions || [],
        declarations: it.declarations || {},
      })),
    };
  } finally {
    clearTimeout(timeout);
  }
}

/**
 * Runs OCR on an array of product packaging images.
 *
 * @param {Array<string|{url: string}>} productImages - Array of URLs or image objects
 * @param {object} [options]
 * @param {number} [options.maxImages=6] - Max images to process
 * @returns {Promise<{
 *   success: boolean,
 *   imagesProcessed: number,
 *   combinedText: string,
 *   lines: Array<{ id: number, text: string, confidence: number, source: string }>,
 *   results: Array<object>
 * }>}
 */
export async function runOcrOnProductImages(productImages, options = {}) {
  const maxImages = options.maxImages || 6;

  if (!productImages || !Array.isArray(productImages) || productImages.length === 0) {
    return {
      success: true,
      imagesProcessed: 0,
      combinedText: "",
      lines: [],
      results: [],
    };
  }

  const urls = productImages
    .map((img) => (typeof img === "string" ? img : img?.url))
    .filter((url) => url && typeof url === "string" && !url.startsWith("data:"))
    .slice(0, maxImages);

  if (urls.length === 0) {
    return {
      success: true,
      imagesProcessed: 0,
      combinedText: "",
      lines: [],
      results: [],
    };
  }

  console.log(`\n🔍 [ocrService] Running PaddleOCR on ${urls.length} product packaging image(s)...`);
  const t0 = Date.now();

  let ocrData = null;

  // 1. Check if microservice is live
  const isHealthy = await checkServiceHealth();
  if (isHealthy) {
    console.log(`[ocrService] Preprocessor & OCR microservice is live on ${OCR_SERVICE_URL}`);
    try {
      ocrData = await callMicroserviceBatch(urls);
    } catch (err) {
      console.warn(`[ocrService] Microservice call failed: ${err.message}, falling back to CLI.`);
    }
  }

  // 2. Direct CLI fallback
  if (!ocrData || !ocrData.success) {
    console.log(`[ocrService] Executing Python PaddleOCR CLI for ${urls.length} product image(s)...`);
    ocrData = await runCliOcr(urls);
  }

  const elapsed = ((Date.now() - t0) / 1000).toFixed(2);
  const results = ocrData?.results || [];
  const combinedText = ocrData?.combined_text || "";

  // Extract structured lines
  const lines = [];
  let lineId = 0;

  for (const item of results) {
    if (!item.success || !item.text) continue;
    const itemLines = item.text.split("\n").map((l) => l.trim()).filter(Boolean);
    for (const l of itemLines) {
      lines.push({
        id: `ocr-${lineId++}`,
        text: l,
        confidence: 0.95,
        source: "product-packaging-image-ocr",
        imageUrl: item.url,
      });
    }
  }

  console.log(
    `[ocrService] Completed OCR in ${elapsed}s. Scanned: ${results.filter((r) => r.success).length}/${urls.length} image(s), Extracted text lines: ${lines.length}.`
  );

  return {
    success: true,
    imagesProcessed: results.filter((r) => r.success).length,
    elapsedSeconds: parseFloat(elapsed),
    combinedText,
    lines,
    results,
  };
}
