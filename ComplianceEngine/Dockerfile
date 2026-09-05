# Dockerfile for Nirikshak ComplianceEngine Orchestrator + Stage-9 Reporting
FROM node:20-bookworm-slim

# Install Python & build dependencies for OpenCV, Pillow, ReportLab
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    libgl1 \
    libglib2.0-0 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Link python3 to python
RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /app

# Install Python Stage-9 requirements
COPY stage9_reporting/requirements.txt ./stage9_reporting/
RUN pip install --no-cache-dir --break-system-packages -r stage9_reporting/requirements.txt

# Copy orchestrator dependency definitions
COPY orchestrator/package*.json ./orchestrator/
WORKDIR /app/orchestrator
RUN npm install --omit=dev

WORKDIR /app

# Copy all engine code
COPY stage9_reporting ./stage9_reporting
COPY orchestrator ./orchestrator

# Default working directory
WORKDIR /app/orchestrator

ENV PYTHON_CMD=python3
ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

CMD ["node", "src/server.js"]
