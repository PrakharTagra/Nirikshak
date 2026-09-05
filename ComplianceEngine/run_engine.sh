#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "======================================================================"
echo "  NIRIKSHAK COMPLIANCE ENGINE -- RUNNER"
echo "  Legal Metrology (Packaged Commodities) Rules, 2011"
echo "======================================================================"
echo ""

case "$1" in
  service)
    echo "[*] Starting Stage 2 Preprocessing & OCR Microservice on port 8000..."
    cd "$DIR/stage2_preprocessing"
    exec python -m uvicorn app.main:app --host 0.0.0.0 --port 8000
    ;;
  test)
    echo "[*] Running Orchestrator Unit Tests..."
    cd "$DIR/orchestrator"
    exec node test/testNetQuantityMultiPieceLayer.js
    ;;
  cli|*)
    echo "[*] Running Compliance Pipeline Orchestrator..."
    cd "$DIR/orchestrator"
    shift || true
    exec node src/cli.js "$@"
    ;;
esac
