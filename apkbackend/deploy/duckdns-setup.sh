#!/usr/bin/env bash
# ================================================================
# DuckDNS Auto-Updater Setup Script for AWS EC2
# ================================================================
# Usage:
#   chmod +x duckdns-setup.sh
#   ./duckdns-setup.sh <duckdns_domain_without_extension> <duckdns_token>
#
# Example:
#   ./duckdns-setup.sh my-nirikshak-api 9a8b7c6d-1234-5678-90ab-cdef12345678
# ================================================================

set -e

DOMAIN="$1"
TOKEN="$2"

if [ -z "$DOMAIN" ] || [ -z "$TOKEN" ]; then
    echo "❌ Error: Missing parameters."
    echo "Usage: $0 <domain_subdomain> <token>"
    echo "Example: $0 nirikshak-api 12345678-abcd-ef01-2345-6789abcdef01"
    exit 1
fi

DUCK_DIR="$HOME/duckdns"
mkdir -p "$DUCK_DIR"

echo "📝 Creating DuckDNS update script in $DUCK_DIR/duck.sh..."
cat << 'EOF' > "$DUCK_DIR/duck.sh"
#!/bin/bash
DOMAIN="DUCKDNS_DOMAIN_PLACEHOLDER"
TOKEN="DUCKDNS_TOKEN_PLACEHOLDER"

RESPONSE=$(curl -s "https://www.duckdns.org/update?domains=${DOMAIN}&token=${TOKEN}&ip=")
echo "[$(date '+%Y-%m-%d %H:%M:%S')] DuckDNS update response: ${RESPONSE}" >> ~/duckdns/duck.log
EOF

# Replace placeholders with actual values
sed -i "s/DUCKDNS_DOMAIN_PLACEHOLDER/${DOMAIN}/g" "$DUCK_DIR/duck.sh"
sed -i "s/DUCKDNS_TOKEN_PLACEHOLDER/${TOKEN}/g" "$DUCK_DIR/duck.sh"

chmod 700 "$DUCK_DIR/duck.sh"

echo "🚀 Performing initial test update..."
"$DUCK_DIR/duck.sh"
cat "$DUCK_DIR/duck.log"

echo "⏰ Configuring crontab to update every 5 minutes..."
# Append cron job if not already present
CRON_JOB="*/5 * * * * $DUCK_DIR/duck.sh >/dev/null 2>&1"
( crontab -l 2>/dev/null | grep -v "$DUCK_DIR/duck.sh" ; echo "$CRON_JOB" ) | crontab -

echo "✅ DuckDNS updater successfully installed!"
echo "   Domain: ${DOMAIN}.duckdns.org"
echo "   Crontab: Running every 5 minutes"
echo "   Log File: $DUCK_DIR/duck.log"
