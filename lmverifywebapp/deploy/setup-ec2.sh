#!/usr/bin/env bash
# ==============================================================================
# LM-Verify EC2 Setup Script (Ubuntu 20.04 / 22.04 / 24.04 LTS)
# Run with: sudo bash deploy/setup-ec2.sh
# ==============================================================================

set -e

echo "=========================================================="
echo " Starting LM-Verify AWS EC2 Server Setup"
echo "=========================================================="

# 1. Update system packages
echo "[1/6] Updating APT packages..."
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y curl git ufw nginx certbot python3-certbot-nginx

# 2. Install Node.js 20 LTS (NodeSource)
echo "[2/6] Installing Node.js 20 LTS..."
if ! command -v node >/dev/null 2>&1; then
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    echo "Node.js is already installed: $(node -v)"
fi

echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"

# 3. Install PM2 globally
echo "[3/6] Installing PM2 Process Manager..."
sudo npm install -g pm2

# 4. Configure firewall (UFW)
echo "[4/6] Configuring firewall..."
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw --force enable || true

# 5. Setup PM2 system startup
echo "[5/6] Configuring PM2 to auto-start on EC2 system reboot..."
env PATH=$PATH:/usr/bin pm2 startup systemd -u $USER --hp $HOME || true

# 6. Setup logs directory
mkdir -p logs

echo "=========================================================="
echo " EC2 base environment setup completed successfully!"
echo "=========================================================="
echo ""
echo "Next steps:"
echo " 1. Copy your .env configuration:"
echo "    cp .env.example .env && nano .env"
echo " 2. Install dependencies:"
echo "    npm install"
echo " 3. Start services with PM2:"
echo "    pm2 start ecosystem.config.cjs"
echo "    pm2 save"
echo " 4. Configure Nginx reverse proxy:"
echo "    sudo cp deploy/nginx/lmverify.conf /etc/nginx/sites-available/lmverify.conf"
echo "    sudo ln -s /etc/nginx/sites-available/lmverify.conf /etc/nginx/sites-enabled/"
echo "    sudo rm -f /etc/nginx/sites-enabled/default"
echo "    sudo nginx -t && sudo systemctl reload nginx"
echo "=========================================================="
