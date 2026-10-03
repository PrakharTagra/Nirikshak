# Nirikshak Backends — Complete Render Deployment & Anti-Sleep Guide

This guide explains how to deploy all backend services of **Nirikshak** on **Render** (Free Tier or Paid) and connect them to your already deployed **Vercel** frontends, while completely eliminating Render's 15-minute automatic inactivity sleeping issue.

---

## 🏗️ Architecture & Service Mapping

| Backend Service | Directory (`rootDir`) | Build Command | Start Command | Default Health/Ping Route | Connected Frontend / Client |
|---|---|---|---|---|---|
| **`nirikshak-apk-backend`** | `apkbackend` | `npm install` | `npm start` | `/ping` | Android Mobile App |
| **`lmverify-admin-backend`** | `lmverifywebapp` | `npm install` | `npm run start:clm-api` | `/ping` | `admin-frontend` (Vercel) |
| **`lmverify-senior-inspector-backend`** | `lmverifywebapp` | `npm install` | `npm run start:ac-api` | `/ping` | `senior-inspector-frontend` (Vercel) |
| **`lmverify-local-scraper`** | `lmVerify/local-scraper` | `npm install` | `npm start` | `/ping` | `lmVerify/frontend` (Vercel) |
| **`nirikshak-compliance-engine`** | `ComplianceEngine/orchestrator` | `npm install` | `npm start` | `/ping` | AI Compliance / Inspection API |

---

## ⚡ How the Anti-Sleep / Keep-Alive System Works

Render's free tier automatically suspends (spins down) any web service after **15 minutes of inactivity** (no incoming HTTP traffic). The next request takes 30–60 seconds cold start.

To prevent this from happening, a multi-layered keep-alive mechanism is now integrated:

### 1. Dedicated Lightweight `/ping` & `/api/ping` Route
Every backend service now exposes an unthrottled, instantaneous endpoint:
```http
GET /ping
GET /api/ping
```
Response:
```json
{
  "status": "ok",
  "message": "pong",
  "service": "<service-name>",
  "uptimeSeconds": 182,
  "timestamp": "2026-10-03T12:00:00.000Z"
}
```
* **Zero Database Overhead**: Does not perform database lookups.
* **Bypasses Rate Limiting**: Excluded from strict API rate limits.

### 2. Built-in In-App Self-Pinger
Render automatically injects the `RENDER_EXTERNAL_URL` environment variable into your running service (e.g., `https://nirikshak-apk-backend.onrender.com`).
When started on Render, each backend automatically activates an internal keep-alive timer that pings itself via Render's public network every **12 minutes** (< 15 min limit), resetting Render's inactivity counter continuously.

### 3. Automated GitHub Actions Keep-Alive Workflow
Since frozen containers cannot wake themselves up, an automated GitHub Actions workflow is provided at `.github/workflows/keep-alive.yml`.
* Runs every **10 minutes** automatically via GitHub Actions (100% free).
* Pings all your deployed Render URLs.
* Can also be triggered manually anytime from GitHub Actions tab.

### 4. Optional: Free External Monitors (Cron-Job.org / UptimeRobot)
If you prefer an external monitor:
1. Go to [cron-job.org](https://cron-job.org) (free) or [uptimerobot.com](https://uptimerobot.com).
2. Create an HTTP GET cron job pointing to `https://<your-service>.onrender.com/ping`.
3. Set execution schedule to **every 10 minutes**.

---

## 🚀 Deployment Option A: 1-Click Render Blueprint (Recommended)

The repository includes a ready-to-use `render.yaml` Blueprint file.

1. Push your repository changes to GitHub:
   ```bash
   git add .
   git commit -m "feat: configure render deployment and anti-sleep keep-alive routes"
   git push origin main
   ```
2. Log in to [Render Dashboard](https://dashboard.render.com/).
3. Click **New +** -> **Blueprint**.
4. Connect your `Nirikshak` GitHub repository.
5. Render will parse `render.yaml` and display all 5 services.
6. Provide your MongoDB Atlas URI (`MONGO_URI` / `MONGODB_URI`) when prompted.
7. Click **Apply**. Render will build and deploy all services simultaneously!

---

## 🛠️ Deployment Option B: Manual Setup via Render Web Dashboard

If you prefer deploying services individually:

### 1. Main Mobile APK Backend (`nirikshak-apk-backend`)
1. In Render, click **New +** -> **Web Service**.
2. Connect your repository.
3. Configure settings:
   - **Name**: `nirikshak-apk-backend`
   - **Language**: `Node`
   - **Root Directory**: `apkbackend`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Health Check Path**: `/ping`
4. Add Environment Variables:
   - `MONGO_URI`: `mongodb+srv://<user>:<password>@cluster0.xxxxx.mongodb.net/nirikshak?retryWrites=true&w=majority`
   - `NODE_ENV`: `production`

---

### 2. CLM Admin Backend (`lmverify-admin-backend`)
1. Click **New +** -> **Web Service**.
2. Configure settings:
   - **Name**: `lmverify-admin-backend`
   - **Language**: `Node`
   - **Root Directory**: `lmverifywebapp`
   - **Build Command**: `npm install`
   - **Start Command**: `npm run start:clm-api`
   - **Health Check Path**: `/ping`
3. Add Environment Variables:
   - `MONGODB_URI`: `mongodb+srv://<user>:<password>@cluster0.xxxxx.mongodb.net/lm_verify?retryWrites=true&w=majority`
   - `JWT_SECRET`: `your_secure_random_jwt_secret_here`
   - `JWT_EXPIRES_IN`: `8h`
   - `ADMIN_FRONTEND_ORIGIN`: `https://<your-admin-frontend>.vercel.app`
   - `NODE_ENV`: `production`

---

### 3. Senior Inspector / AC Backend (`lmverify-senior-inspector-backend`)
1. Click **New +** -> **Web Service**.
2. Configure settings:
   - **Name**: `lmverify-senior-inspector-backend`
   - **Language**: `Node`
   - **Root Directory**: `lmverifywebapp`
   - **Build Command**: `npm install`
   - **Start Command**: `npm run start:ac-api`
   - **Health Check Path**: `/ping`
3. Add Environment Variables:
   - `MONGODB_URI`: `mongodb+srv://<user>:<password>@cluster0.xxxxx.mongodb.net/lm_verify?retryWrites=true&w=majority`
   - `JWT_SECRET`: `your_secure_random_jwt_secret_here` (Use same secret as admin backend)
   - `JWT_EXPIRES_IN`: `8h`
   - `INSPECTOR_TOKEN_TTL`: `7d`
   - `SENIOR_INSPECTOR_FRONTEND_ORIGIN`: `https://<your-senior-inspector-frontend>.vercel.app`
   - `NODE_ENV`: `production`

---

### 4. Local Scraper Backend (`lmverify-local-scraper`)
1. Click **New +** -> **Web Service**.
2. Configure settings:
   - **Name**: `lmverify-local-scraper`
   - **Language**: `Node`
   - **Root Directory**: `lmVerify/local-scraper`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Health Check Path**: `/ping`
3. Add Environment Variables:
   - `NODE_ENV`: `production`
   - `PORT`: `5000`

---

### 5. Compliance Engine Orchestrator (`nirikshak-compliance-engine`)
1. Click **New +** -> **Web Service**.
2. Configure settings:
   - **Name**: `nirikshak-compliance-engine`
   - **Language**: `Node`
   - **Root Directory**: `ComplianceEngine/orchestrator`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Health Check Path**: `/ping`
3. Add Environment Variables:
   - `MONGODB_URI`: `mongodb+srv://<user>:<password>@cluster0.xxxxx.mongodb.net/nirikshak?retryWrites=true&w=majority`
   - `GROQ_API_KEY`: `your_groq_api_key_here`
   - `NODE_ENV`: `production`

---

## 🌐 Updating Vercel Frontend Environment Variables

Once Render finishes deploying your backend services, copy the public URL provided by Render (e.g. `https://lmverify-admin-backend.onrender.com`) and update your Vercel projects:

### 1. `admin-frontend` on Vercel:
In your Vercel Project Settings -> **Environment Variables**:
```env
VITE_ADMIN_API_URL=https://lmverify-admin-backend.onrender.com/api
```
*Trigger a Redeploy on Vercel after saving.*

### 2. `senior-inspector-frontend` on Vercel:
In your Vercel Project Settings -> **Environment Variables**:
```env
VITE_AC_API_URL=https://lmverify-senior-inspector-backend.onrender.com/api
```
*Trigger a Redeploy on Vercel after saving.*

### 3. `lmVerify/frontend` on Vercel:
In your Vercel Project Settings -> **Environment Variables**:
```env
VITE_API_BASE_URL=https://lmverify-local-scraper.onrender.com
```
*Trigger a Redeploy on Vercel after saving.*

### 4. Android App (APK):
Update the base URL in your Android app configuration or build config to point to:
```
https://nirikshak-apk-backend.onrender.com
```

---

## 🔒 Crucial MongoDB Atlas Setting

Render web services use dynamic outbound IP addresses on the free tier. To ensure your backends can connect to MongoDB Atlas without `ECONNREFUSED` or timeout errors:
1. Log in to [MongoDB Atlas](https://cloud.mongodb.com/).
2. Navigate to **Network Access** under Security.
3. Click **Add IP Address**.
4. Select **Allow Access from Anywhere** (`0.0.0.0/0`).
5. Click **Confirm**.

---

## ⏱️ Setting up GitHub Actions Keep-Alive Pinger

To ensure the free services never sleep even after reboots:
1. Go to your GitHub repository -> **Settings** -> **Secrets and variables** -> **Actions**.
2. Under **Variables** (or Secrets), add:
   - `RENDER_APK_URL`: `https://nirikshak-apk-backend.onrender.com`
   - `RENDER_ADMIN_URL`: `https://lmverify-admin-backend.onrender.com`
   - `RENDER_SENIOR_INSP_URL`: `https://lmverify-senior-inspector-backend.onrender.com`
   - `RENDER_SCRAPER_URL`: `https://lmverify-local-scraper.onrender.com`
   - `RENDER_COMPLIANCE_URL`: `https://nirikshak-compliance-engine.onrender.com`
3. Go to the **Actions** tab on GitHub, select **Nirikshak Render Keep-Alive Pinger**, and click **Run workflow**.
4. The workflow will run automatically every 10 minutes 24/7!
