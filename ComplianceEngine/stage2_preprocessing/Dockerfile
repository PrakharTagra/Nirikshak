FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 libglib2.0-0 build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Permanently install Stage 4 PaddleOCR & image dependencies
RUN pip install --no-cache-dir \
    paddlepaddle==2.6.2 \
    paddleocr>=2.7.0 \
    opencv-python-headless \
    numpy \
    Pillow \
    scipy \
    shapely \
    pyclipper

COPY app ./app

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
