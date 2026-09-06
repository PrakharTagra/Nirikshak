# LM-Verify Production Deployment Guide

Complete step-by-step production deployment guide for **lmverifywebapp**:
- **Frontends**: Hosted on **Vercel** (Global CDN + Instant SSL)
- **Backends**: Hosted on **AWS EC2** managed with **PM2** and reverse-proxied via **Nginx**
- **Database**: **MongoDB Atlas** (Managed Cloud Database)

---

## 🏗️ Architecture Overview

```text
               ┌────────────────────────┐
               │    Vercel CDN (Edge)   │
               ├────────────────────────┤
               │  CLM Admin Portal      │ (https://clm.yourdomain.com or vercel.app)
               │  Senior Inspector Web  │ (https://ac.yourdomain.com or vercel.app)
               └───────────┬────────────┘
                           │ HTTPS API Requests
                           ▼
               ┌────────────────────────┐
               │   AWS EC2 Instance     │
               ├────────────────────────┤
               │   Nginx (Port 80/443)  │ <── Free Let's Encrypt SSL
               │     ├── /clm-api/      │ ──> localhost:4001
               │     └── /ac-api/       │ ──> localhost:4002
               ├────────────────────────┤
               │   PM2 Process Manager  │
               │     ├── admin-backend  │ (Port 4001)
               │     └── ac-backend     │ (Port 4002)
               └───────────┬────────────┘
                           │ Encrypted TLS Connection
                           ▼
               ┌────────────────────────┐
               │  MongoDB Atlas Cluster │
               └────────────────────────┘
```

---

## 📋 Prerequisites
1. **AWS Account**: Access to EC2 (Ubuntu 22.04 or 24.04 LTS, recommended instance: `t3.small` or `t3.medium`, `t3.micro` also works).
2. **MongoDB Atlas Account**: Database connection string (`mongodb+srv://...`).
3. **Vercel Account**: Linked to your GitHub repository.
4. *(Recommended)* A custom domain name pointing to your EC2 IP (if setting up SSL via Certbot).

---

## STEP 1: AWS EC2 Backend Setup

### 1.1 Launch EC2 Instance & Configure Security Group
1. Go to **AWS Console > EC2 > Launch Instance**.
2. Select **Ubuntu Server 24.04 LTS** (or 22.04 LTS), 64-bit (x86).
3. Instance Type: `t3.small` or `t3.micro`.
4. Choose or create an SSH Key Pair (`.pem` file).
5. Under **Network settings > Security Group**, add the following inbound rules:

| Type | Protocol | Port Range | Source | Description |
|---|---|---|---|---|
| **SSH** | TCP | 22 | My IP (or `0.0.0.0/0`) | Secure Shell access |
| **HTTP** | TCP | 80 | `0.0.0.0/0` | Let's Encrypt challenge & HTTP traffic |
| **HTTPS** | TCP | 443 | `0.0.0.0/0` | Secure SSL API traffic |

6. Launch the instance. Optionally allocate and associate an **Elastic IP** so the IP address does not change on reboot.

---

### 1.2 Connect to EC2 & Clone the Repository
Open your local terminal and connect via SSH:

```bash
chmod 400 your-key.pem
ssh -i "your-key.pem" ubuntu@<YOUR_EC2_PUBLIC_IP>
```

Clone your repository and navigate to the project directory:

```bash
# Clone the repository
git clone https://github.com/PrakharTagra/Nirikshak.git
cd Nirikshak/lmverifywebapp
```

---

### 1.3 Run Automated Server Setup
Run the included setup script to install Node.js 20, PM2, Nginx, and Certbot:

```bash
sudo bash deploy/setup-ec2.sh
```

---

### 1.4 Configure Environment Variables
Create your production `.env` file from the template:

```bash
cp .env.example .env
nano .env
```

Set the following variables:
```dotenv
# MongoDB Atlas
MONGODB_URI=mongodb+srv://<username>:<password>@nirikshak.4beivhx.mongodb.net/lm_verify?retryWrites=true&w=majority

# Authentication Secret (Generate one with: openssl rand -base64 32)
JWT_SECRET=your_super_strong_random_secret_string_here
JWT_EXPIRES_IN=8h
INSPECTOR_TOKEN_TTL=7d

# Ports
ADMIN_BACKEND_PORT=4001
SENIOR_INSPECTOR_BACKEND_PORT=4002

# Vercel Frontend Origins (Comma-separated, no trailing slash)
ADMIN_FRONTEND_ORIGIN=https://lmverify-admin.vercel.app
SENIOR_INSPECTOR_FRONTEND_ORIGIN=https://lmverify-senior-inspector.vercel.app
```

Save and exit (`Ctrl + O`, `Enter`, `Ctrl + X`).

---

### 1.5 Install Dependencies & Seed Initial Data
Install monorepo dependencies:

```bash
npm install --production=false
```

Seed initial admin credentials and system indexes:

```bash
# Create MongoDB collections and indexes
npm run db:indexes

# Seed the master Controller of Legal Metrology (CLM) user
npm run seed:admin
```
*(Save the printed admin login credentials securely!)*

---

### 1.6 Start Backends with PM2
Launch both backend services using the PM2 ecosystem configuration:

```bash
pm2 start ecosystem.config.cjs
pm2 save
```

Verify that both services are running:

```bash
pm2 status
```
*You should see `lmv-admin-backend` (port 4001) and `lmv-senior-inspector-backend` (port 4002) in `online` status.*

To view logs anytime:
```bash
pm2 logs
```

---

### 1.7 Configure Nginx Reverse Proxy
Enable the Nginx reverse proxy configuration:

```bash
sudo cp deploy/nginx/lmverify.conf /etc/nginx/sites-available/lmverify.conf
sudo ln -sf /etc/nginx/sites-available/lmverify.conf /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl reload nginx
```

Test your endpoints locally on EC2:
```bash
# Gateway root check
curl http://localhost/

# CLM Admin API health check
curl http://localhost/clm-api/health

# AC Senior Inspector API health check
curl http://localhost/ac-api/health
```
*Both should return `{"status":"ok", ...}`.*

---

### 1.8 (Recommended) Enable HTTPS / SSL with Let's Encrypt
If you have a domain or subdomain pointing to your EC2 IP (e.g. `api.yourdomain.com`):

```bash
sudo certbot --nginx -d api.yourdomain.com
```
*Certbot will automatically modify `/etc/nginx/sites-available/lmverify.conf` to add SSL certificates and enable HTTP-to-HTTPS redirect.*

If you do NOT have a custom domain yet, you can test directly using HTTP: `http://<YOUR_EC2_PUBLIC_IP>/clm-api` and `http://<YOUR_EC2_PUBLIC_IP>/ac-api`.

---

## STEP 2: MongoDB Atlas Network Access
Before connecting from EC2:
1. Log into [MongoDB Atlas](https://cloud.mongodb.com/).
2. Under **Security**, click **Network Access**.
3. Click **Add IP Address**.
4. Enter your EC2 **Elastic IP** (or `0.0.0.0/0` for universal cloud access protected by strong password).
5. Click **Confirm**.

---

## STEP 3: Vercel Frontend Deployment

You will create two separate projects in Vercel from your Nirikshak repository.

### App 1: Controller of Legal Metrology (Admin Portal)
1. Go to [vercel.com/dashboard](https://vercel.com/dashboard) and click **Add New... > Project**.
2. Select your `Nirikshak` repository.
3. Configure the project settings:
   - **Project Name**: `lmverify-admin`
   - **Framework Preset**: `Vite`
   - **Root Directory**: Click *Edit* and select:
     ```text
     lmverifywebapp/admin-frontend
     ```
   - **Build and Output Settings**:
     - Build Command: `npm run build` (default)
     - Output Directory: `dist` (default)
     - Install Command: `npm install` (default)
   - **Environment Variables**:
     Add the following variable:
     - **Name**: `VITE_ADMIN_API_URL`
     - **Value**:
       - *With domain & SSL:* `https://api.yourdomain.com/clm-api`
       - *With IP:* `http://<YOUR_EC2_PUBLIC_IP>/clm-api`
4. Click **Deploy**.
5. Once deployed, copy your production domain (e.g., `https://lmverify-admin.vercel.app`).

---

### App 2: Senior Inspector Portal
1. Go to [vercel.com/dashboard](https://vercel.com/dashboard) and click **Add New... > Project**.
2. Select your `Nirikshak` repository again.
3. Configure the project settings:
   - **Project Name**: `lmverify-senior-inspector`
   - **Framework Preset**: `Vite`
   - **Root Directory**: Click *Edit* and select:
     ```text
     lmverifywebapp/senior-inspector-frontend
     ```
   - **Build and Output Settings**:
     - Build Command: `npm run build` (default)
     - Output Directory: `dist` (default)
     - Install Command: `npm install` (default)
   - **Environment Variables**:
     Add the following variable:
     - **Name**: `VITE_AC_API_URL`
     - **Value**:
       - *With domain & SSL:* `https://api.yourdomain.com/ac-api`
       - *With IP:* `http://<YOUR_EC2_PUBLIC_IP>/ac-api`
4. Click **Deploy**.
5. Once deployed, copy your production domain (e.g., `https://lmverify-senior-inspector.vercel.app`).

---

### STEP 4: Finalize CORS on EC2
Once Vercel gives you your production domains:
1. SSH into your EC2 server.
2. Edit `.env` in `lmverifywebapp`:
   ```bash
   nano .env
   ```
3. Update the origin variables with your exact Vercel URLs:
   ```dotenv
   ADMIN_FRONTEND_ORIGIN=https://lmverify-admin.vercel.app
   SENIOR_INSPECTOR_FRONTEND_ORIGIN=https://lmverify-senior-inspector.vercel.app
   ```
4. Reload the backend processes in PM2:
   ```bash
   pm2 restart all --update-env
   ```

---

## 🛠️ Maintenance & Useful Commands

### Checking Service Status
```bash
pm2 status
```

### Viewing Live Logs
```bash
# All services
pm2 logs

# Admin backend only
pm2 logs lmv-admin-backend

# Inspector backend only
pm2 logs lmv-senior-inspector-backend
```

### Pulling Latest Updates & Redeploying Backends
```bash
cd ~/Nirikshak/lmverifywebapp
git pull origin main
npm install
pm2 restart all
```

### Nginx Management
```bash
# Test configuration
sudo nginx -t

# Reload configuration without downtime
sudo systemctl reload nginx

# Restart Nginx
sudo systemctl restart nginx
```

---

## ✅ Deployment Verification Checklist

- [ ] EC2 Security Group allows ports 22, 80, 443.
- [ ] MongoDB Atlas allows connections from EC2 IP.
- [ ] `pm2 status` reports `lmv-admin-backend` and `lmv-senior-inspector-backend` as `online`.
- [ ] `curl http://<EC2-IP>/clm-api/health` returns status `ok`.
- [ ] `curl http://<EC2-IP>/ac-api/health` returns status `ok`.
- [ ] Admin frontend loads on Vercel and can log in using credentials from `npm run seed:admin`.
- [ ] Senior Inspector frontend loads on Vercel and can connect to its API.
- [ ] Refreshing any page (e.g. `/dashboard` or `/login`) works without 404 errors (handled by `vercel.json`).
