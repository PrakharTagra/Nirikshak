#!/usr/bin/env bash
# ================================================================
# Nirikshak Backend - EC2 Ubuntu Automated Server Provisioning
# ================================================================
# Run this script on a fresh Ubuntu 22.04 or 24.04 LTS EC2 instance:
#   chmod +x setup-ec2.sh
#   ./setup-ec2.sh
# ================================================================

set -e

echo "=========================================================="
echo "🚀 1/6: Updating System Packages..."
echo "=========================================================="
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git ufw nginx certbot python3-certbot-nginx

echo "=========================================================="
echo "📦 2/6: Installing Node.js 20 LTS..."
echo "=========================================================="
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs
fi
node -v
npm -v

echo "=========================================================="
echo "⚙️ 3/6: Installing PM2 Process Manager Globally..."
echo "=========================================================="
sudo npm install -g pm2
pm2 -v

echo "=========================================================="
echo "🛡️ 4/6: Configuring System Firewall (UFW)..."
echo "=========================================================="
# Allow SSH, HTTP, and HTTPS (Keep port 5000 blocked from public, only Nginx connects to it)
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw --force enable || true
sudo ufw status

echo "=========================================================="
echo "📁 5/6: Preparing Application Directories & Logs..."
echo "=========================================================="
mkdir -p logs

echo "=========================================================="
echo "✅ 6/6: Base Provisioning Completed!"
echo "=========================================================="
echo ""
echo "Next Steps:"
echo " 1. Copy your .env configuration: cp .env.example .env && nano .env"
echo " 2. Install app dependencies: npm install --production"
echo " 3. Setup DuckDNS: ./deploy/duckdns-setup.sh <subdomain> <token>"
echo " 4. Setup Nginx: sudo cp deploy/nginx.conf /etc/nginx/sites-available/nirikshak"
echo "    - Edit domain inside: sudo nano /etc/nginx/sites-available/nirikshak"
echo "    - Enable site: sudo ln -s /etc/nginx/sites-available/nirikshak /etc/nginx/sites-enabled/"
echo "    - Remove default: sudo rm -f /etc/nginx/sites-enabled/default"
echo "    - Test and reload: sudo nginx -t && sudo systemctl reload nginx"
echo " 5. Obtain Free SSL via Let's Encrypt:"
echo "    sudo certbot --nginx -d <your-subdomain>.duckdns.org"
echo " 6. Launch Backend with PM2:"
echo "    npm run pm2:start"
echo "    pm2 save"
echo "    pm2 startup (run the generated sudo command to persist on reboot)"
echo "=========================================================="
