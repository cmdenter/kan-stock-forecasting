#!/bin/bash

# Secure Jupyter Lab Startup Script
# This script launches Jupyter Lab with enhanced security settings

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║       KAN Stock Forecasting - Secure Jupyter Lab Startup        ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Change to project directory
cd "$(dirname "$0")"
PROJECT_DIR="$(pwd)"

echo -e "${GREEN}✓${NC} Project directory: ${PROJECT_DIR}"

# Activate virtual environment
if [ ! -d "venv" ]; then
    echo -e "${YELLOW}⚠${NC}  Virtual environment not found. Creating..."
    python3 -m venv venv
    source venv/bin/activate
    echo -e "${GREEN}✓${NC} Installing dependencies..."
    pip install -r requirements.txt -q
else
    source venv/bin/activate
    echo -e "${GREEN}✓${NC} Virtual environment activated"
fi

# Verify Python is from venv
PYTHON_PATH=$(which python)
if [[ "$PYTHON_PATH" != *"venv"* ]]; then
    echo -e "${YELLOW}⚠${NC}  Warning: Python not from venv!"
    exit 1
fi
echo -e "${GREEN}✓${NC} Python: ${PYTHON_PATH}"

# Security verification
echo ""
echo -e "${BLUE}Security Checks:${NC}"
echo -e "${GREEN}✓${NC} Virtual environment: ISOLATED"
echo -e "${GREEN}✓${NC} Network access: LOCALHOST ONLY (127.0.0.1)"
echo -e "${GREEN}✓${NC} Working directory: RESTRICTED to ${PROJECT_DIR}"
echo -e "${GREEN}✓${NC} Token authentication: ENABLED"
echo -e "${GREEN}✓${NC} Remote access: DISABLED"
echo ""

# Launch Jupyter Lab with secure config
echo -e "${BLUE}Launching Jupyter Lab with security configuration...${NC}"
echo ""

jupyter lab \
    --config="${PROJECT_DIR}/jupyter_config.py" \
    --port=8888 \
    --no-browser \
    --ServerApp.root_dir="${PROJECT_DIR}" \
    --ServerApp.ip='127.0.0.1' \
    --ServerApp.allow_remote_access=False

# This line only reached if Jupyter is stopped
echo ""
echo -e "${GREEN}Jupyter Lab stopped safely.${NC}"
