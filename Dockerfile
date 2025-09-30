# Lightweight Python base image
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# System deps for common Python wheels and Jupyter
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    ca-certificates \
    tini \
    libxml2 \
    libxslt1.1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# Install Python deps first (better layer caching)
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip \
    && pip install -r /tmp/requirements.txt

# Create a non-root user to run Jupyter safely
RUN useradd -m -u 1000 appuser \
    && chown -R appuser:appuser /workspace

USER appuser

EXPOSE 8888

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--ServerApp.token=", "--ServerApp.password="]


