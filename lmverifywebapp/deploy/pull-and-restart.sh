#!/usr/bin/env bash
# ==============================================================================
# Script triggered by GitHub Webhook to pull commits and reload PM2
# ==============================================================================

set -e

# Resolve repository directory
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_DIR"

echo "=================================================="
echo " [$(date -u +"%Y-%m-%dT%H:%M:%SZ")] Deploying new commit..."
echo " Working directory: $REPO_DIR"
echo "=================================================="

# 1. Pull latest commits from GitHub
git fetch origin main
git reset --hard origin/main

# 2. Install any updated dependencies and clean cache (preserves 8 GiB disk)
npm install --production=false
npm cache clean --force

# 3. Restart PM2 services (pm2 restart revives errored processes)
pm2 restart ecosystem.config.cjs
pm2 save

echo "=================================================="
echo " [$(date -u +"%Y-%m-%dT%H:%M:%SZ")] Deployment successful!"
echo "=================================================="
