-- Enable Vector support for RAG and Brand Voice similarity searches
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "vector";

-- Enums for content status and intent
CREATE TYPE content_status AS ENUM ('draft', 'review_pending', 'published', 'archived');
CREATE TYPE search_intent AS ENUM ('informational', 'navigational', 'commercial', 'transactional');
CREATE TYPE tone_type AS ENUM ('professional', 'witty', 'authoritative', 'empathetic', 'minimalist', 'bold');