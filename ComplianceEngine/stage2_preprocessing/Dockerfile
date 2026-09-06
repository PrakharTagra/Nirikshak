FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 libglib2.0-0 libgomp1 build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY stage2_preprocessing/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && pip uninstall -y opencv-python opencv-contrib-python opencv-python-headless \
    && pip install --no-cache-dir "opencv-python-headless<=4.6.0.66"

COPY stage2_preprocessing/app ./app
COPY stage4_ocr ./stage4_ocr

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
