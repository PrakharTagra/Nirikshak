# LM-Verify Production Deployment Guide

Complete step-by-step production deployment guide for **lmverifywebapp**:
- **Frontends**: Hosted on **Vercel** (Edge CDN + Automatic SSL)
- **Backends**: Hosted on **AWS EC2** (`m7i-flex.large`, Ubuntu, 8 GiB Storage) managed with **PM2** and **Nginx**
- **Database**: **MongoDB Atlas** (Managed Cloud Database)

---

## ??? Architecture Overview

```text
               +--------------------------------------------------------+
               ¦                   Vercel Edge CDN                      ¦
               +--------------------------------------------------------¦
               ¦   CLM Admin Portal         ¦  Senior Inspector Web     ¦
               ¦   (lmverify-admin)         ¦  (lmverify-senior-insp)   ¦
               +--------------------------------------------------------+
                             ¦ HTTPS API                  ¦ HTTPS API
                             ¦ Requests                   ¦ Requests
                             ?                            ?
               +--------------------------------------------------------+
               ¦          AWS EC2 (m7i-flex.large, Ubuntu)              ¦
               +--------------------------------------------------------¦
               ¦  Nginx Gateway (Port 80 / 443 with Free SSL)           ¦
               ¦    +-- /clm-api/  --> localhost:4001                   ¦
               ¦    +-- /ac-api/   --> localhost:4002                   ¦
               ¦    +-- /deploy-webhook --> localhost:4005 (optional)   ¦
               +--------------------------------------------------------¦
               ¦  PM2 Process Manager (with automatic log rotation)     ¦
               ¦    +-- lmv-admin-backend            (Port 4001)        ¦
               ¦    +-- lmv-senior-inspector-backend (Port 4002)        ¦
               ¦    +-- lmv-webhook-listener         (Port 4005)        ¦
               +--------------------------------------------------------+
                                           ¦ Encrypted TLS
                                           ?
               +--------------------------------------------------------+
               ¦                 MongoDB Atlas Cluster                  ¦
               ¦  Collections: users, reports, rules, inspectionreports ¦
               +--------------------------------------------------------+
```

---

## ?? System Specifications & Prerequisites

| Component | Target Spec / Service | Notes |
|---|---|---|
| **EC2 Instance** | `m7i-flex.large` (2 vCPUs, 8 GiB RAM) | High performance compute |
| **EC2 Storage** | **8 GiB EBS Volume (Ubuntu 22.04 / 24.04)** | Optimized for low disk footprint |
| **Database** | **MongoDB Atlas** (`mongodb+srv://...`) | Zero schema modifications |
| **Frontends** | **Vercel** | Standalone builds with Vite |
| **SSL / HTTPS** | **Let's Encrypt via Certbot** | Instant free SSL using `sslip.io` or custom domain |

> [!WARNING]
> **Storage Safety Notice for 8 GiB Disk**:
> Ubuntu 22.04/24.04 consumes ~3 to 3.5 GiB of the 8 GiB disk.
> - **DO NOT create a swap file** (e.g. `fallocate -l 4G /swapfile`). The machine already has **8 GiB of physical RAM** (Node.js and Nginx use only ~350 MB). A swap file would immediately fill 100% of your disk!
> - The automated setup script configures `pm2-logrotate` (10 MB cap, 3 copies) and caps systemd logs to 50 MB to prevent disk exhaustion.

---

## STEP 1: AWS EC2 Security Group Configuration

1. In the **AWS Management Console > EC2 > Instances**, select your instance.
2. Under the **Security** tab, click your **Security Group**.
3. Under **Inbound rules**, click **Edit inbound rules** and ensure these 3 rules are present:

| Type | Protocol | Port Range | Source | Description |
|---|---|---|---|---|
| **SSH** | TCP | 22 | Your IP (or `0.0.0.0/0`) | Remote SSH access |
| **HTTP** | TCP | 80 | `0.0.0.0/0` | Web traffic & Let's Encrypt challenge |
| **HTTPS** | TCP | 443 | `0.0.0.0/0` | Encrypted SSL API traffic (Required by Vercel) |

4. *(Recommended)* Allocate an **Elastic IP** in EC2 and associate it with your instance so your public IP never changes on reboot.

---

## STEP 2: MongoDB Atlas Network Access

Before the EC2 backend can connect to MongoDB Atlas:
1. Log into your [MongoDB Atlas Dashboard](https://cloud.mongodb.com/).
2. In the left menu under **Security**, click **Network Access**.
3. Click **Add IP Address**.
4. Enter your EC2 instance's **Elastic IP** (or choose `Allow Access from Anywhere` / `0.0.0.0/0` for initial setup).
5. Click **Confirm**.

---

## STEP 3: Server Setup on AWS EC2

### 3.1 Connect via SSH
From your local terminal:

```bash
chmod 400 your-key.pem
ssh -i "your-key.pem" ubuntu@<YOUR_EC2_PUBLIC_IP>
```

### 3.2 Clone the Repository
```bash
git clone https://github.com/PrakharTagra/Nirikshak.git
cd Nirikshak/lmverifywebapp
```

### 3.3 Run Automated Server Setup
Run the included setup script. It installs Node.js 20 LTS, PM2, Nginx, Certbot, configures UFW firewall, cleans package caches to preserve disk space, and sets up `pm2-logrotate`:

```bash
sudo bash deploy/setup-ec2.sh
```

Check the disk space output at the end of the script:
```bash
df -h /
```
*(You will typically see 4.5+ GiB of free storage available).*

---

## STEP 4: Configure Backend Environment

Create your `.env` file from `.env.example`:

```bash
cp .env.example .env
nano .env
```

Configure your environment variables:

```dotenv
# MongoDB Atlas Connection String
MONGODB_URI=mongodb+srv://<username>:<password>@<cluster>.mongodb.net/lm_verify?retryWrites=true&w=majority

# Authentication Secret (Generate one with: openssl rand -base64 32)
JWT_SECRET=replace_with_a_secure_random_jwt_secret_key
JWT_EXPIRES_IN=8h
INSPECTOR_TOKEN_TTL=7d

# Ports
ADMIN_BACKEND_PORT=4001
SENIOR_INSPECTOR_BACKEND_PORT=4002

# Allowed Frontend Origins (Automatic support for *.vercel.app is enabled)
ADMIN_FRONTEND_ORIGIN=https://lmverify-admin.vercel.app
SENIOR_INSPECTOR_FRONTEND_ORIGIN=https://lmverify-senior-inspector.vercel.app
```

Save and exit (`Ctrl + O`, `Enter`, `Ctrl + X`).

---

## STEP 5: Test DB & Seed Admin Credentials

Test the connection to your MongoDB Atlas cluster:

```bash
# Test connection to MongoDB Atlas
npm run db:test
```
*You should see `Connected successfully to MongoDB Atlas!` and `Atlas connection is healthy`.*

Initialize collection indexes and create the initial Master Admin (CLM):

```bash
# Initialize MongoDB indexes
npm run db:indexes

# Seed the master Controller of Legal Metrology admin account
npm run seed:admin
```
*(Note down the printed admin email and password securely!)*

---

## STEP 6: Launch Backends with PM2

Start both backend services:

```bash
pm2 start ecosystem.config.cjs
pm2 save
```

Verify service status:

```bash
pm2 status
```
*Both `lmv-admin-backend` and `lmv-senior-inspector-backend` should display status `online`.*

---

## STEP 7: Configure Nginx Reverse Proxy

Enable the LM-Verify Nginx configuration:

```bash
sudo cp deploy/nginx/lmverify.conf /etc/nginx/sites-available/lmverify.conf
sudo ln -sf /etc/nginx/sites-available/lmverify.conf /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl reload nginx
```

Verify health endpoints locally:

```bash
# Gateway status
curl http://localhost/

# CLM Admin API health
curl http://localhost/clm-api/health

# Senior Inspector API health
curl http://localhost/ac-api/health
```
*All three commands should return JSON responses with status `ok`.*

---

## STEP 8: Enable Free SSL (Required for Vercel)

> [!IMPORTANT]
> Because Vercel serves frontends over **HTTPS**, web browsers block any API requests made to an insecure `http://` endpoint (**Mixed Content Error**). You **must** enable SSL on your EC2 instance.

### Option A: Instant Free SSL with `sslip.io` (No Custom Domain Needed!)
`sslip.io` is a free public DNS service that maps your IP address directly to a hostname. If your EC2 public IP is `54.123.45.67`, the hostname `54.123.45.67.sslip.io` resolves directly to your EC2 instance.

Run Certbot with your `sslip.io` domain:

```bash
sudo certbot --nginx -d <YOUR_EC2_PUBLIC_IP>.sslip.io
```
*(Enter your email, agree to terms, and Certbot will automatically install a genuine Let's Encrypt certificate and update Nginx!)*

Your secure API endpoints will now be:
- Admin API: `https://<YOUR_EC2_PUBLIC_IP>.sslip.io/clm-api`
- Inspector API: `https://<YOUR_EC2_PUBLIC_IP>.sslip.io/ac-api`

### Option B: Custom Domain (e.g. `api.yourdomain.com`)
If you own a domain:
1. Create an `A Record` in your DNS provider pointing `api.yourdomain.com` to your EC2 Public IP.
2. Run Certbot:
   ```bash
   sudo certbot --nginx -d api.yourdomain.com
   ```
Your secure API endpoints will be:
- Admin API: `https://api.yourdomain.com/clm-api`
- Inspector API: `https://api.yourdomain.com/ac-api`

---

## STEP 9: Vercel Frontend Deployment

Deploy the two frontends as separate projects on Vercel:

### App 1: Controller of Legal Metrology (Admin Portal)
1. Go to [vercel.com/dashboard](https://vercel.com/dashboard) and click **Add New... > Project**.
2. Select your `Nirikshak` repository.
3. Configure settings:
   - **Project Name**: `lmverify-admin`
   - **Framework Preset**: `Vite`
   - **Root Directory**: Click *Edit* and select:
     ```text
     lmverifywebapp/admin-frontend
     ```
   - **Build & Output Settings**: Leave as defaults (`npm run build`, `dist`).
   - **Environment Variables**:
     - **Key**: `VITE_ADMIN_API_URL`
     - **Value**: `https://<YOUR_EC2_PUBLIC_IP>.sslip.io/clm-api` *(or your custom domain)*
4. Click **Deploy**.

### App 2: Senior Inspector Portal
1. In Vercel, click **Add New... > Project**.
2. Select the `Nirikshak` repository again.
3. Configure settings:
   - **Project Name**: `lmverify-senior-inspector`
   - **Framework Preset**: `Vite`
   - **Root Directory**: Click *Edit* and select:
     ```text
     lmverifywebapp/senior-inspector-frontend
     ```
   - **Build & Output Settings**: Leave as defaults (`npm run build`, `dist`).
   - **Environment Variables**:
     - **Key**: `VITE_AC_API_URL`
     - **Value**: `https://<YOUR_EC2_PUBLIC_IP>.sslip.io/ac-api` *(or your custom domain)*
4. Click **Deploy**.

---

## ??? Maintenance & Useful Commands

### Check Disk Space
```bash
df -h /
```

### PM2 Process Monitoring
```bash
# View running services and memory usage
pm2 status

# View live aggregate logs
pm2 logs

# View specific service logs
pm2 logs lmv-admin-backend
pm2 logs lmv-senior-inspector-backend

# Restart all services
pm2 restart all
```

### Free Up Disk Space (If Ever Needed)
```bash
# Clean APT packages and caches
sudo apt-get clean && sudo apt-get autoremove -y --purge

# Vacuum system logs
sudo journalctl --vacuum-size=50M

# Flush PM2 logs
pm2 flush
```

---

## ? Deployment Verification Checklist

- [ ] EC2 Security Group allows ports 22, 80, and 443.
- [ ] MongoDB Atlas Network Access whitelists EC2 IP.
- [ ] `npm run db:test` successfully connects to Atlas.
- [ ] `npm run db:indexes` initializes all collections.
- [ ] `npm run seed:admin` creates master CLM account.
- [ ] `pm2 status` shows backends `online`.
- [ ] SSL certificate active via Certbot (`https://...`).
- [ ] Vercel Admin Portal deploys and logs into dashboard.
- [ ] Vercel Senior Inspector Portal deploys and loads review queues.
