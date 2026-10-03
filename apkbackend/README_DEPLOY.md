# 🚀 Deployment Guide: Nirikshak Mobile App Backend

This guide covers deploying `apkbackend` on **Render** (Cloud Web Service) or an **AWS EC2 instance** with PM2 and Nginx.

---

## 🏗️ Architecture Overview

```text
[Android APK Mobile App / Client]
         │  HTTPS (Port 443)
         ▼
[Render Cloud Service (https://nirikshak-apk-backend.onrender.com)]
         │  HTTP / Native Node.js Express (Port 5000)
         ▼
[MongoDB Atlas Cloud Database]
```

---

## Option 1: Render Deployment (Recommended & Active)

`apkbackend` is pre-configured for 1-click deployment on **Render**:

1. **Service Type**: Web Service
2. **Runtime**: Node
3. **Root Directory**: `apkbackend`
4. **Build Command**: `npm install`
5. **Start Command**: `npm start`
6. **Health Check Path**: `/ping`
7. **Environment Variables**:
   * `NODE_ENV`: `production`
   * `MONGO_URI`: `mongodb+srv://<user>:<password>@cluster0.xxxxx.mongodb.net/nirikshak?retryWrites=true&w=majority`
   * `COMPLIANCE_ENGINE_URL`: `https://nirikshak-compliance-engine.onrender.com`

### Live Production Endpoints:
* **Base URL**: `https://nirikshak-apk-backend.onrender.com`
* **Ping / Keep-Alive**: `https://nirikshak-apk-backend.onrender.com/ping`
* **Health Check**: `https://nirikshak-apk-backend.onrender.com/health`

---

## Connecting the Android Mobile App

In your Android application source code, configure the API base URL:

### Java (`Constants.java` / `RetrofitClient.java`):
```java
public class ApiConfig {
    public static final String BASE_URL = "https://nirikshak-apk-backend.onrender.com/";
}
```

### Kotlin (`NetworkModule.kt`):
```kotlin
object NetworkConfig {
    const val BASE_URL = "https://nirikshak-apk-backend.onrender.com/"
}
```

---

## Option 2: Self-Hosted AWS EC2 Deployment

If deploying to a dedicated Ubuntu virtual machine:

1. **Provision Ubuntu 22.04 LTS Instance**.
2. **Run setup script**:
   ```bash
   chmod +x deploy/setup-ec2.sh
   ./deploy/setup-ec2.sh
   ```
3. **Configure Environment**:
   ```bash
   cp .env.example .env
   nano .env
   ```
4. **Start with PM2**:
   ```bash
   npm run pm2:start
   pm2 save
   pm2 startup
   ```
