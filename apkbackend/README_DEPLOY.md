# 🚀 Complete Deployment Guide: Nirikshak Backend on AWS EC2
### Process Manager (PM2) + DuckDNS (Dynamic DNS) + Nginx + Free Let's Encrypt SSL

This guide covers deploying `apkbackend` on an **AWS EC2 instance** with **PM2** process management, dynamic domain mapping via **DuckDNS**, and **SSL/HTTPS** encryption using **Let's Encrypt (Certbot)** and **Nginx**.

---

## 📋 Architecture Overview

```
[Android APK App / Client]
         │  HTTPS (Port 443)
         ▼
[DuckDNS Domain (e.g. nirikshak-api.duckdns.org)]
         │
         ▼
[AWS EC2 Security Group (Ports 80, 443, 22)]
         │
         ▼
[Nginx Reverse Proxy & SSL Termination]
         │  HTTP (localhost:5000)
         ▼
[PM2 Process Manager (nirikshak-backend)]
         │  Node.js / Express
         ▼
[MongoDB Atlas Cloud Database]
```

---

## Step 1: AWS EC2 Instance & Security Group Configuration

1. **Launch EC2 Instance**:
   - **AMI**: Ubuntu Server 22.04 LTS or 24.04 LTS (64-bit x86).
   - **Instance Type**: `t2.micro` or `t3.micro` (Free-Tier eligible).
   - **Key Pair**: Select or create a `.pem` key pair for SSH access.
   - **Storage**: Default 8 GB - 20 GB gp3 SSD.

2. **Configure Security Group Inbound Rules**:
   In the EC2 Management Console, open **Security Groups** attached to your instance and add:
   
   | Type | Protocol | Port Range | Source | Purpose |
   |---|---|---|---|---|
   | **SSH** | TCP | 22 | My IP (or `0.0.0.0/0`) | Remote SSH access |
   | **HTTP** | TCP | 80 | `0.0.0.0/0` | Certbot SSL challenge & HTTP redirect |
   | **HTTPS** | TCP | 443 | `0.0.0.0/0` | Secure SSL API traffic from APK |

   > [!IMPORTANT]
   > **Do NOT expose Port 5000 to the internet (`0.0.0.0/0`)**. Port 5000 is internal; only Nginx on `127.0.0.1` will forward requests to it.

---

## Step 2: DuckDNS Domain Setup

1. Go to [https://www.duckdns.org](https://www.duckdns.org) and log in (GitHub, Google, Reddit, etc.).
2. Under **Domains**, pick a subdomain for your backend (e.g., `nirikshak-api`).
3. Note down:
   - Your full domain: `nirikshak-api.duckdns.org`
   - Your account **Token**: `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`
4. Set the initial IP to your EC2 instance's **Public IPv4 address** and click **update ip**.

---

## Step 3: Connect to EC2 & Run Automated Setup

1. **SSH into your EC2 instance**:
   ```bash
   ssh -i /path/to/your-key.pem ubuntu@<ec2-public-ip>
   ```

2. **Clone your repository or upload `apkbackend`**:
   ```bash
   git clone <your-github-repo-url>
   cd Nirikshak/apkbackend
   ```
   *(Or if copying directly, ensure you are in the `apkbackend` directory)*.

3. **Run the EC2 provisioning script**:
   ```bash
   chmod +x deploy/setup-ec2.sh
   ./deploy/setup-ec2.sh
   ```
   *This automatically installs Node.js 20 LTS, PM2, Nginx, Certbot, UFW firewall, and creates log directories.*

4. **Install app dependencies**:
   ```bash
   npm install --production
   ```

5. **Configure Environment Variables**:
   ```bash
   cp .env.example .env
   nano .env
   ```
   Fill in your production variables:
   ```env
   PORT=5000
   NODE_ENV=production
   MONGO_URI=mongodb+srv://<username>:<password>@cluster0.xxxxx.mongodb.net/nirikshak?retryWrites=true&w=majority
   DNS_OVERRIDE=false
   ```
   Save and exit (`Ctrl + O`, `Enter`, `Ctrl + X`).

---

## Step 4: Configure DuckDNS Auto-Updater

Run the DuckDNS setup script to register a cron job that refreshes your EC2 IP every 5 minutes:
```bash
chmod +x deploy/duckdns-setup.sh
./deploy/duckdns-setup.sh <your-subdomain> <your-token>
```
*Example:*
```bash
./deploy/duckdns-setup.sh nirikshak-api 9a8b7c6d-1234-5678-90ab-cdef12345678
```

Verify the log:
```bash
cat ~/duckdns/duck.log
# Should print: DuckDNS update response: OK
```

---

## Step 5: Configure Nginx Reverse Proxy

1. Copy the Nginx configuration file:
   ```bash
   sudo cp deploy/nginx.conf /etc/nginx/sites-available/nirikshak
   ```

2. Edit the file to add your DuckDNS domain:
   ```bash
   sudo nano /etc/nginx/sites-available/nirikshak
   ```
   Replace `server_name YOUR_SUBDOMAIN.duckdns.org;` with your actual domain (e.g., `server_name nirikshak-api.duckdns.org;`).

3. Enable the site and disable the default site:
   ```bash
   sudo ln -sf /etc/nginx/sites-available/nirikshak /etc/nginx/sites-enabled/
   sudo rm -f /etc/nginx/sites-enabled/default
   ```

4. Test Nginx configuration and reload:
   ```bash
   sudo nginx -t
   sudo systemctl reload nginx
   ```

---

## Step 6: Obtain Free SSL Certificate via Let's Encrypt (Certbot)

Run Certbot to generate and configure your SSL certificate:
```bash
sudo certbot --nginx -d <your-subdomain>.duckdns.org
```

- Enter your email address for urgent renewal notices.
- Agree to the Terms of Service.
- Choose whether to automatically redirect HTTP traffic to HTTPS (choose **Redirect** / Option 2).

Certbot will automatically install the certificate, configure HTTPS on port 443 in `/etc/nginx/sites-available/nirikshak`, and set up auto-renewal via systemd timer.

To test automatic renewal:
```bash
sudo certbot renew --dry-run
```

---

## Step 7: Launch Application with PM2 Process Manager

1. **Start the backend using the PM2 configuration**:
   ```bash
   npm run pm2:start
   ```

2. **Verify application status**:
   ```bash
   pm2 status
   ```

3. **Check live logs**:
   ```bash
   pm2 logs nirikshak-backend
   ```
   You should see:
   ```
   ✅ Connected to MongoDB Atlas Cloud Database
   🚀 Nirikshak Backend running on port 5000
   📱 Health Check: http://localhost:5000/health
   ```

4. **Enable Auto-Startup on EC2 Reboot**:
   Run:
   ```bash
   pm2 startup
   ```
   PM2 will output a command starting with `sudo env PATH=...`. Copy and paste that command into your terminal, and run it.
   Then save the running process list:
   ```bash
   pm2 save
   ```
   *Now, even if your EC2 instance reboots or stops/starts, PM2 will automatically restart `nirikshak-backend` on boot!*

---

## Step 8: MongoDB Atlas Network Access

Ensure MongoDB Atlas allows incoming connections from your EC2 instance:
1. Log in to [MongoDB Atlas](https://cloud.mongodb.com).
2. Navigate to **Security** -> **Network Access**.
3. Click **Add IP Address**:
   - For dedicated Elastic IP: Enter your EC2 Elastic IP.
   - Or to allow from any IP (protected by strong DB credentials): Select **Allow Access From Anywhere (`0.0.0.0/0`)**.
4. Click **Confirm**.

---

## Step 9: Verify Your Deployment

Test your secure endpoint from any terminal or browser:

```bash
# Test health check endpoint via HTTPS
curl -I https://<your-subdomain>.duckdns.org/health
```

Expected response:
```http
HTTP/2 200
server: nginx
content-type: application/json; charset=utf-8
...
```

To see the JSON body:
```bash
curl https://<your-subdomain>.duckdns.org/health
```
```json
{
  "status": "healthy",
  "service": "nirikshak-backend",
  "uptimeSeconds": 124,
  "timestamp": "2026-09-07T17:25:30.123Z",
  "database": {
    "status": "connected",
    "connected": true
  },
  "memory": {
    "rss": "42 MB",
    "heapUsed": "21 MB"
  }
}
```

---

## Step 10: Point Your Android APK App to the Server

In your Android application code (Retrofit / OkHttp / Axios / Fetch), update your base API URL:

```java
// Android Retrofit / Java
public static final String BASE_URL = "https://<your-subdomain>.duckdns.org/";
```
```kotlin
// Android Retrofit / Kotlin
const val BASE_URL = "https://<your-subdomain>.duckdns.org/"
```
```javascript
// React Native / Flutter / JS
export const API_BASE_URL = 'https://<your-subdomain>.duckdns.org';
```

Because your backend now uses a valid trusted Let's Encrypt certificate on HTTPS, Android won't require `usesCleartextTraffic="true"` and network security policies will pass cleanly!

---

## 🛠️ Handy PM2 Commands Cheat Sheet

| Task | Command |
|---|---|
| View Status | `pm2 status` |
| View Realtime Logs | `pm2 logs nirikshak-backend` |
| View CPU / RAM Monitor | `pm2 monit` |
| Restart Server (Zero Downtime) | `npm run pm2:reload` |
| Stop Server | `npm run pm2:stop` |
| Restart Server | `pm2 restart nirikshak-backend` |
| View Process Details | `pm2 describe nirikshak-backend` |
| Clear Stored Logs | `pm2 flush` |
