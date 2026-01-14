# Multi-stage Dockerfile for EchoNiche AI Backend
# Stage 1: Build
FROM python:3.11-slim as builder

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Stage 2: Production
FROM python:3.11-slim as runner

WORKDIR /app

# Copy only the necessary files from builder
COPY --from=builder /root/.local /root/.local
COPY ./app ./app

# Ensure scripts in .local are usable
ENV PATH=/root/.local/bin:$PATH
ENV PYTHONPATH=/app

# Expose FastAPI port
EXPOSE 8000

# Healthcheck for orchestration stability
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8000/health || exit 1

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "4"]