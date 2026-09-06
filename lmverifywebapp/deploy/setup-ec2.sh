#!/usr/bin/env bash
# ==============================================================================
# LM-Verify AWS EC2 Setup Script (Ubuntu 22.04 / 24.04 LTS)
# Optimized for AWS EC2 m7i-flex.large (8 GiB Storage & 8 GiB RAM)
# Run with: sudo bash deploy/setup-ec2.sh
# ==============================================================================

set -e

# Detect calling non-root user (defaults to ubuntu)
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(getent passwd "$ACTUAL_USER" | cut -d: -f6)
ACTUAL_HOME="${ACTUAL_HOME:-/home/$ACTUAL_USER}"

echo "=========================================================="
echo " LM-Verify AWS EC2 Setup (Target User: $ACTUAL_USER)"
echo " Server Spec: m7i-flex.large | Optimized for 8 GiB Storage"
echo "=========================================================="

echo ""
echo "--- Initial Storage Status ---"
df -h /
echo "------------------------------"
echo ""

# 1. Update and clean system packages (aggressive cleanup for 8 GiB disk)
echo "[1/7] Updating and upgrading APT packages..."
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
apt-get install -y curl git ufw nginx certbot python3-certbot-nginx

echo "[2/7] Cleaning package caches to reclaim disk space..."
apt-get autoremove -y --purge
apt-get clean
rm -rf /var/lib/apt/lists/*
apt-get update -y

# 2. Cap systemd journal logs to prevent disk bloat
echo "[3/7] Restricting system journal log size to 50M..."
journalctl --vacuum-size=50M || true
mkdir -p /etc/systemd/journald.conf.d
cat << 'EOF' > /etc/systemd/journald.conf.d/lmverify-size.conf
[Journal]
SystemMaxUse=50M
RuntimeMaxUse=30M
EOF
systemctl restart systemd-journald || true

# 3. Install Node.js 20 LTS (NodeSource)
echo "[4/7] Installing Node.js 20 LTS..."
if ! command -v node >/dev/null 2>&1; then
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
    apt-get install -y nodejs
else
    echo "Node.js is already installed: $(node -v)"
fi

echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"

# 4. Install PM2 globally and configure pm2-logrotate
echo "[5/7] Installing PM2 and configuring automatic log rotation..."
npm install -g pm2
npm cache clean --force || true

# Run pm2-logrotate as the target user so it manages user logs
sudo -u "$ACTUAL_USER" pm2 install pm2-logrotate || true
sudo -u "$ACTUAL_USER" pm2 set pm2-logrotate:max_size 10M || true
sudo -u "$ACTUAL_USER" pm2 set pm2-logrotate:retain 3 || true
sudo -u "$ACTUAL_USER" pm2 set pm2-logrotate:compress true || true

# 5. Configure firewall (UFW)
echo "[6/7] Configuring firewall (UFW)..."
ufw allow OpenSSH
ufw allow 'Nginx Full'
ufw --force enable || true

# 6. Setup PM2 system startup for target user
echo "[7/7] Configuring PM2 to auto-start on EC2 system reboot for $ACTUAL_USER..."
env PATH="$PATH:/usr/bin" pm2 startup systemd -u "$ACTUAL_USER" --hp "$ACTUAL_HOME" || true

# Setup logs directory
mkdir -p logs
chown -R "$ACTUAL_USER":"$ACTUAL_USER" logs

echo ""
echo "--- Post-Setup Storage Status ---"
df -h /
echo "---------------------------------"
echo ""
echo "=========================================================="
echo " EC2 base environment setup completed successfully!"
echo "=========================================================="
echo ""
echo "Next steps (as user '$ACTUAL_USER'):"
echo " 1. Copy and configure your environment file:"
echo "    cp .env.example .env && nano .env"
echo "    (Set your MONGODB_URI and JWT_SECRET)"
echo ""
echo " 2. Verify MongoDB Atlas connectivity:"
echo "    npm run db:test"
echo ""
echo " 3. Initialize MongoDB indexes and create master admin:"
echo "    npm run db:indexes"
echo "    npm run seed:admin"
echo ""
echo " 4. Start backend services with PM2:"
echo "    pm2 start ecosystem.config.cjs"
echo "    pm2 save"
echo ""
echo " 5. Enable Nginx reverse proxy:"
echo "    sudo cp deploy/nginx/lmverify.conf /etc/nginx/sites-available/lmverify.conf"
echo "    sudo ln -sf /etc/nginx/sites-available/lmverify.conf /etc/nginx/sites-enabled/"
echo "    sudo rm -f /etc/nginx/sites-enabled/default"
echo "    sudo nginx -t && sudo systemctl reload nginx"
echo ""
echo " 6. Setup SSL for HTTPS (required for Vercel communication):"
echo "    sudo certbot --nginx -d <your-ip>.sslip.io"
echo "=========================================================="
