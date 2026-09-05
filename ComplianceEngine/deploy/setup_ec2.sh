#!/usr/bin/env bash
# ==============================================================================
# Nirikshak ComplianceEngine — Automated AWS EC2 Setup Script
# Supported OS: Ubuntu 22.04 LTS / Ubuntu 24.04 LTS
# ==============================================================================

set -euo pipefail

echo "=================================================================="
echo "  NIRIKSHAK COMPLIANCE ENGINE — AWS EC2 PROVISIONING SCRIPT"
echo "=================================================================="

# 1. Update system packages
echo "[1/6] Updating system packages..."
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y ca-certificates curl gnupg lsb-release ufw git nginx certbot python3-certbot-nginx

# 2. Configure 4GB Swap Space (Prevents OOM during PaddleOCR execution)
if [ ! -f /swapfile ]; then
    echo "[2/6] Creating 4GB swapfile for memory-intensive OCR..."
    sudo fallocate -l 4G /swapfile
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
    sudo sysctl vm.swappiness=10
    echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
else
    echo "[2/6] Swapfile already exists. Skipping."
fi

# 3. Install official Docker Engine & Docker Compose
echo "[3/6] Installing Docker & Docker Compose..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg --yes
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Enable docker service and add current user to docker group
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker "$USER" || true

# 4. Configure Firewall (UFW)
echo "[4/6] Configuring firewall (Allowing SSH, HTTP, HTTPS)..."
sudo ufw allow 22/tcp comment 'SSH'
sudo ufw allow 80/tcp comment 'HTTP'
sudo ufw allow 443/tcp comment 'HTTPS'
sudo ufw --force enable

# 5. Configure Nginx Reverse Proxy
echo "[5/6] Setting up Nginx reverse proxy..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/nginx.conf" ]; then
    sudo cp "$SCRIPT_DIR/nginx.conf" /etc/nginx/sites-available/compliance-engine
    sudo rm -f /etc/nginx/sites-enabled/default
    sudo ln -sf /etc/nginx/sites-available/compliance-engine /etc/nginx/sites-enabled/
    sudo nginx -t && sudo systemctl restart nginx
fi

# 6. Set up systemd service for automatic container startup
echo "[6/6] Installing systemd auto-restart service..."
if [ -f "$SCRIPT_DIR/compliance-engine.service" ]; then
    sudo cp "$SCRIPT_DIR/compliance-engine.service" /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl enable compliance-engine.service
fi

echo ""
echo "=================================================================="
echo "  EC2 PROVISIONING COMPLETE!"
echo "=================================================================="
echo "Next Steps:"
echo "1. Log out and log back in (or run 'newgrp docker') so docker group takes effect."
echo "2. Edit ComplianceEngine/.env with your GROQ_API_KEY, MONGODB_URI, and CLOUDINARY credentials."
echo "3. Start the containers:"
echo "     cd ComplianceEngine && docker compose up -d --build"
echo "4. Test the health endpoint:"
echo "     curl http://localhost:3000/health"
echo "5. (Optional) If you have a domain name, configure SSL with Certbot:"
echo "     sudo certbot --nginx -d your-domain.com"
echo "=================================================================="
