version: '3.8'

services:
  api_gateway:
    build: ./core
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/echoniche
      - REDIS_URL=redis://redis:6379/0
      - OPENAI_API_KEY=${OPENAI_API_KEY}
    depends_on:
      - db
      - redis

  worker:
    build: ./core
    command: celery -A tasks worker --loglevel=info
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/echoniche
    depends_on:
      - redis

  db:
    image: ankane/pgvector:latest # PostgreSQL with Vector support
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: echoniche
    ports:
      - "5432:5432"

  redis:
    image: redis:alpine
    ports:
      - "6379:6379"