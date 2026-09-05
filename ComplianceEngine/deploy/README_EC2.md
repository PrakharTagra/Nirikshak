# Nirikshak ComplianceEngine — AWS EC2 Deployment Guide & App Developer API Reference

This guide provides step-by-step instructions to deploy the complete **ComplianceEngine** backend to an **AWS EC2** instance, connect it to **Cloudinary** and **MongoDB Atlas**, and provide the production endpoint to your mobile/web app developer.

---

## 1. AWS EC2 Instance Recommendation & Setup

### A. Recommended Instance Specifications
The pipeline utilizes **OpenCV**, **PaddleOCR**, and **ReportLab**.
* **Recommended:** `t3.large` (2 vCPU, 8 GiB RAM) or `c6i.large`
* **Minimum with Swap:** `t3.medium` (2 vCPU, 4 GiB RAM) — *the provided `setup_ec2.sh` script automatically provisions a 4 GiB swapfile to prevent Out-Of-Memory errors during OCR model loading.*
* **OS:** Ubuntu 22.04 LTS or Ubuntu 24.04 LTS (x86_64)
* **Storage:** 25 GB - 35 GB gp3 SSD

### B. AWS Security Group Configuration
In the AWS EC2 Management Console, ensure your instance’s **Inbound Security Group Rules** allow:
| Type | Protocol | Port Range | Source | Purpose |
|---|---|---|---|---|
| SSH | TCP | 22 | Your IP (or 0.0.0.0/0) | Admin SSH access |
| HTTP | TCP | 80 | 0.0.0.0/0 | Web traffic / Nginx |
| HTTPS | TCP | 443 | 0.0.0.0/0 | Secure SSL traffic / App requests |
| Custom TCP *(Optional)* | TCP | 3000 | 0.0.0.0/0 | Direct API port (if not using Nginx) |

---

## 2. Deploying on the EC2 Instance (Step-by-Step)

### Step 1: Connect to your EC2 instance
```bash
ssh -i /path/to/your-key.pem ubuntu@<EC2-PUBLIC-IP>
```

### Step 2: Clone the repository
```bash
git clone https://github.com/PrakharTagra/Nirikshak.git
cd Nirikshak
```

### Step 3: Run the automated provisioning script
```bash
chmod +x ComplianceEngine/deploy/setup_ec2.sh
./ComplianceEngine/deploy/setup_ec2.sh
```
*This script updates packages, enables a 4GB swapfile, installs Docker & Docker Compose, sets up UFW firewall rules, and configures Nginx.*

### Step 4: Configure Environment Variables
```bash
cd ComplianceEngine
cp .env.example .env
nano .env
```
Fill in your credentials:
```env
PORT=3000
PREPROCESSOR_URL=http://preprocessor:8000
GROQ_API_KEY=gsk_your_groq_api_key_here
GROQ_MODEL=openai/gpt-oss-20b
MONGODB_URI=mongodb+srv://<username>:<password>@cluster0.abcde.mongodb.net/nirikshak?retryWrites=true&w=majority
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret
```

### Step 5: Start the Containers
```bash
docker compose up -d --build
```
Verify the containers are running:
```bash
docker compose ps
docker compose logs -f orchestrator
```

### Step 6: Verify the API Health
```bash
curl http://localhost/health
# or externally from your computer:
curl http://<EC2-PUBLIC-IP>/health
```
You will receive:
```json
{
  "status": "healthy",
  "engine": "Nirikshak Legal Metrology Compliance Engine",
  "timestamp": "2026-09-06T01:00:00.000Z",
  "services": {
    "mongodb": "connected",
    "cloudinary": "configured",
    "groqExtraction": true
  }
}
```

---

## 3. Configuring HTTPS (SSL) for Mobile App Security

Modern mobile platforms (iOS and Android) require HTTPS for production network calls.

### Option A: Free Let\'s Encrypt SSL (If you have a domain name)
If you point a domain (e.g. `api.yourdomain.com`) to the EC2 Public IP:
```bash
sudo certbot --nginx -d api.yourdomain.com
```
Certbot will configure SSL automatically and enable auto-renewal.

### Option B: Cloudflare Tunnel (No domain configuration or open ports needed)
```bash
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
sudo dpkg -i cloudflared.deb
cloudflared tunnel --url http://localhost:3000
```
Cloudflare will give you an instant public HTTPS URL like `https://quick-tunnel-name.trycloudflare.com` to share with your developer.

---

## 4. API Reference for the App Developer

Share this section directly with your app developer.

### Base URL
```text
https://<YOUR-DOMAIN-OR-IP>
```

---

### Endpoint 1: Health Check
* **Method:** `GET`
* **Path:** `/health`
* **Description:** Check if the backend, MongoDB Atlas, and Cloudinary are connected.
* **Response (200 OK):**
```json
{
  "status": "healthy",
  "services": {
    "mongodb": "connected",
    "cloudinary": "configured",
    "groqExtraction": true
  }
}
```

---

### Endpoint 2: Submit Package Photos for Legal Metrology Audit
* **Method:** `POST`
* **Path:** `/api/v1/inspect`
* **Content-Type:** `multipart/form-data`

#### Request Parameters (Form-Data)
| Field Name | Type | Required | Description |
|---|---|---|---|
| `images` | File(s) | **Yes** | 1 to 10 photos of packaging panels (e.g., Principal Display Panel, Back, MRP stamp). |
| `productName` | String | No | Name or title of the product (e.g., `"Bourbon Biscuits 120g"`). |
| `packageDimensions` | String | No | Length × Width × Height (e.g. `"120x80x40 mm"` or `"10x5x15 cm"`). If omitted, dimensions are derived automatically from the label. |
| `isEcommerce` | Boolean | No | Set to `true` if inspecting an e-commerce marketplace photo/listing. |

#### Response (200 OK)
```json
{
  "success": true,
  "data": {
    "reportId": "REP-1-1725580000000",
    "pdfUrl": "https://res.cloudinary.com/your-cloud/raw/upload/v1725580000/compliance_reports/report_product_1.pdf",
    "directPdfUrl": "https://<YOUR-DOMAIN-OR-IP>/api/v1/reports/REP-1-1725580000000/pdf",
    "status": "NON-COMPLIANT",
    "productName": "Bourbon Biscuits 120g"
  }
}
```

---

### Endpoint 3: Direct PDF Viewer (For Mobile Screen Display)
* **Method:** `GET`
* **Path:** `/api/v1/reports/:id/pdf`
* **Description:** Stream or redirect directly to the final, complete PDF report. Your app's in-app PDF viewer or WebView can load this URL directly to display the report on the mobile screen without any client-side overhead.

---

### Endpoint 4: Fetch Final PDF Record by ID from MongoDB Atlas
* **Method:** `GET`
* **Path:** `/api/v1/reports/:id`
* **Description:** Retrieve the PDF URL stored in MongoDB Atlas for a given report ID or product ID.
* **Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "reportId": "REP-1-1725580000000",
    "pdfUrl": "https://res.cloudinary.com/your-cloud/raw/upload/v1725580000/compliance_reports/report_product_1.pdf",
    "directPdfUrl": "https://<YOUR-DOMAIN-OR-IP>/api/v1/reports/REP-1-1725580000000/pdf",
    "status": "NON-COMPLIANT",
    "productName": "Bourbon Biscuits 120g",
    "createdAt": "2026-09-06T01:05:00.000Z"
  }
}
```

---

### Endpoint 5: List All Reports from MongoDB Atlas
* **Method:** `GET`
* **Path:** `/api/v1/reports?page=1&limit=10`
* **Description:** Retrieve past PDF report links stored in MongoDB Atlas with pagination.

---

## 5. Integration Code Samples for the App Developer

### Flutter / Dart
```dart
import \'dart:io\';
import \'package:http/http.dart\' as http;

Future<void> submitComplianceAudit(List<File> images, String productName) async {
  var uri = Uri.parse('https://<YOUR-API-URL>/api/v1/inspect');
  var request = http.MultipartRequest('POST', uri);

  request.fields['productName'] = productName;

  for (var image in images) {
    request.files.add(await http.MultipartFile.fromPath('images', image.path));
  }

  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 200) {
    print('Inspection Result: ${response.body}');
    // Open response['data']['pdfUrl'] in in-app PDF viewer or browser
  } else {
    print('Error: ${response.statusCode}');
  }
}
```

### React Native / JavaScript
```javascript
const submitAudit = async (photoUris, productName) => {
  const formData = new FormData();
  formData.append('productName', productName);

  photoUris.forEach((uri, index) => {
    formData.append('images', {
      uri,
      name: `panel_${index}.jpg`,
      type: 'image/jpeg',
    });
  });

  const response = await fetch('https://<YOUR-API-URL>/api/v1/inspect', {
    method: 'POST',
    body: formData,
    headers: {
      'Content-Type': 'multipart/form-data',
    },
  });

  const result = await response.json();
  console.log('Cloudinary PDF Report URL:', result.data.pdfUrl);
  return result.data;
};
```

### cURL
```bash
curl -X POST https://<YOUR-API-URL>/api/v1/inspect \
  -F "images=@front_pdp.jpg" \
  -F "images=@back_panel.jpg" \
  -F "productName=Sample Biscuits"
```
