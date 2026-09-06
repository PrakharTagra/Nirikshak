# Nirikshak Mobile App Developer Integration Specification
## Legal Metrology Officer (LMO) Inspection & Statutory Workflow

---

### 1. Architectural Workflow Overview

```text
+-------------------+        1. Captures Photos         +------------------------+
|   Field Officer   | ------------------------------->  |  Nirikshak Mobile App  |
|      (LMO)        |                                   +------------------------+
+-------------------+                                               |
                                                                    | 2. POST /api/v1/inspect
                                                                    | (images, officerId, etc.)
                                                                    v
                                                        +------------------------+
                                                        |    ComplianceEngine    |
                                                        | (OCR, Rules, Cloudinary|
                                                        +------------------------+
                                                                    |
                                                                    | 3. Creates Report in DB
                                                                    |    status: "pending"
                                                                    v
                                                        +------------------------+
                                                        |     MongoDB Atlas      |
                                                        |  reports collection    |
                                                        +------------------------+
                                                                    |
                                                                    | 4. Appears on Dashboard
                                                                    v
+------------------------+      5. Manually Accepts /   +------------------------+
|  Assistant Controller  | <--------------------------- | Senior Inspector Web   |
|   (Regional Office)    |         Rejects Report       |        Console         |
+------------------------+                              +------------------------+
```

1. **Photo Capture & Upload**: The Legal Metrology Officer (LMO) takes packaging photos in the field using the mobile app and submits them.
2. **AI Compliance Analysis**: The server executes preprocessing, OCR, rule engine checks, and generates a signed statutory PDF uploaded directly to Cloudinary CDN.
3. **Statutory Status `pending`**:
   - **CRITICAL**: The generated inspection report is saved in MongoDB with **`status: "pending"`**.
   - The AI analysis result (e.g., `NON_COMPLIANT` or `COMPLIANT`) is stored as **`complianceResult`**.
   - Under legal metrology law, the system **never automatically approves or rejects** a legal inspection.
4. **Assistant Controller Review**: The report is automatically routed to the Assistant Controller (AC) of the officer's jurisdiction. The AC inspects the PDF and evidence, then **manually Accepts (`approved`) or Rejects (`rejected`)** the report.
5. **Mobile Status Updates**: The mobile app can check the decision status at any time.

---

### 2. Inspection Submission API

#### `POST /api/v1/inspect`

Submit packaging photos taken in the field.

- **URL**: `http://<EC2_IP_OR_DOMAIN>:3000/api/v1/inspect`
- **Content-Type**: `multipart/form-data`
- **Method**: `POST`

#### Form-Data Fields:

| Field Name | Type | Required | Description |
| :--- | :--- | :--- | :--- |
| `images` | File(s) | **Yes** | 1 to 10 packaging panel photos (`.jpg`, `.jpeg`, `.png`, `.webp`). Multiple files under the same key `images`. |
| `officerId` | String | **Recommended** | The MongoDB `_id` of the logged-in LMO officer (e.g. `req.user.id`). If provided, the backend automatically resolves their assigned jurisdiction. |
| `jurisdictionId` | String | Optional | The jurisdiction ID of the region where inspection is conducted. (Optional if `officerId` is supplied). |
| `productName` | String | Optional | Known product/commodity name. If omitted or empty, Nirikshak's AI automatically identifies the brand and commodity. |
| `packageDimensions` | String | Optional | Packaging dimensions if measured (e.g., `"15cm x 10cm x 5cm"`). |
| `inspectedAt` | ISO 8601 String | Optional | Timestamp when the photo was clicked (e.g., `"2026-09-06T10:30:00.000Z"`). Defaults to current server time. |

#### Example cURL Request:

```bash
curl -X POST http://<SERVER_HOST>:3000/api/v1/inspect \
  -F "images=@/path/to/front_panel.jpg" \
  -F "images=@/path/to/back_panel.jpg" \
  -F "officerId=60d5ecb8b5c08b001f3b2021" \
  -F "productName=Britannia Good Day 100g"
```

#### Example Response (`200 OK`):

```json
{
  "success": true,
  "data": {
    "reportId": "REP-31626-1788691234567",
    "referenceNo": "REP-31626-1788691234567",
    "productName": "Britannia Good Day 100g",
    "status": "pending",
    "complianceResult": "NON_COMPLIANT",
    "assessmentStatus": "NON_COMPLIANT",
    "officerId": "60d5ecb8b5c08b001f3b2021",
    "jurisdictionId": "60d5ecb8b5c08b001f3b1001",
    "pdfUrl": "https://res.cloudinary.com/.../REP-31626-1788691234567.pdf",
    "directPdfUrl": "http://<SERVER_HOST>:3000/api/v1/reports/REP-31626-1788691234567/pdf",
    "cloudinaryUrl": "https://res.cloudinary.com/.../REP-31626-1788691234567.pdf",
    "preprocessedImages": [
      "https://res.cloudinary.com/.../preprocessed_panel_1.jpg"
    ],
    "evidenceImages": [
      {
        "findingId": "RULE_NET_QTY_FONT_SIZE",
        "rule": "Net Quantity Font Height Requirement",
        "field": "net_quantity",
        "severity": "CRITICAL",
        "message": "Font height 1.8mm is below statutory minimum 2.0mm",
        "evidenceUrl": "https://res.cloudinary.com/.../evidence_crop_1.jpg"
      }
    ],
    "summary": {
      "totalViolations": 1,
      "criticalCount": 1
    }
  }
}
```

---

### 3. Report Status & Decision Query API

#### `GET /api/v1/reports/:id`

Retrieve the current statutory status and Assistant Controller decision.

- **URL**: `http://<SERVER_HOST>:3000/api/v1/reports/{reportId}`
- **Method**: `GET`

#### Example Response When Pending:

```json
{
  "success": true,
  "data": {
    "reportId": "REP-31626-1788691234567",
    "referenceNo": "REP-31626-1788691234567",
    "productName": "Britannia Good Day 100g",
    "status": "pending",
    "complianceResult": "NON_COMPLIANT",
    "officerId": "60d5ecb8b5c08b001f3b2021",
    "jurisdictionId": "60d5ecb8b5c08b001f3b1001",
    "decisionReason": null,
    "decidedBy": null,
    "decidedAt": null,
    "pdfUrl": "https://res.cloudinary.com/.../report.pdf"
  }
}
```

#### Example Response When Decided by Assistant Controller:

##### Accepted / Approved:
```json
{
  "success": true,
  "data": {
    "reportId": "REP-31626-1788691234567",
    "referenceNo": "REP-31626-1788691234567",
    "productName": "Britannia Good Day 100g",
    "status": "approved",
    "complianceResult": "NON_COMPLIANT",
    "officerId": "60d5ecb8b5c08b001f3b2021",
    "decisionReason": null,
    "decidedBy": "60d5ecb8b5c08b001f3b9999",
    "decidedAt": "2026-09-06T11:45:00.000Z",
    "pdfUrl": "https://res.cloudinary.com/.../report.pdf"
  }
}
```

##### Rejected with Reason:
```json
{
  "success": true,
  "data": {
    "reportId": "REP-31626-1788691234567",
    "referenceNo": "REP-31626-1788691234567",
    "productName": "Britannia Good Day 100g",
    "status": "rejected",
    "complianceResult": "NON_COMPLIANT",
    "officerId": "60d5ecb8b5c08b001f3b2021",
    "decisionReason": "Manufacturer provided valid exemption certificate dated 2026-08-15 under Rule 26.",
    "decidedBy": "60d5ecb8b5c08b001f3b9999",
    "decidedAt": "2026-09-06T11:50:00.000Z",
    "pdfUrl": "https://res.cloudinary.com/.../report.pdf"
  }
}
```

---

### 4. Inspector's Own Reports List API

#### `GET /api/inspector/reports`

For the mobile app's **"My Inspections"** history screen:

- **URL**: `http://<WEB_APP_HOST>:4002/api/inspector/reports`
- **Method**: `GET`
- **Header**: `Authorization: Bearer <JWT_TOKEN>` (obtained during LMO login at `/api/inspector/auth/login`)

Returns an array of all reports filed by this LMO, sorted newest first, showing current status (`pending`, `approved`, `rejected`) and any rejection reasons.

---

### 5. Mobile App UI Guidelines

1. **Two Distinct Statuses to Render**:
   - **Statutory Workflow Status (`status`)**:
     - `pending`: Amber badge: `⏳ Awaiting Controller Approval`
     - `approved`: Green badge: `✓ Approved by Controller`
     - `rejected`: Red badge: `✗ Rejected / Discharged` (show `decisionReason` in an alert box)
   - **AI Compliance Finding (`complianceResult`)**:
     - `NON_COMPLIANT`: Red tag: `⚠ Violations Detected`
     - `COMPLIANT`: Green tag: `✓ Verified Compliant`
2. **Immediate Feedback After Upload**:
   - Once `POST /api/v1/inspect` finishes, immediately show the inspection summary, the Cloudinary PDF preview link, and indicate:
     *"Report filed successfully. Status is Pending review by the Assistant Controller."*
3. **No Automatic Decisions**:
   - Inform the user that statutory decisions cannot be finalized by the app or server AI; only the designated Assistant Controller can record the official decision.
