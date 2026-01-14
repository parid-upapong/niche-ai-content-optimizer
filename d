# EchoNiche AI: Database Design & Rationale (v1.0)
**Signature:** db-arch | DB Architect

## 1. Overview
The database is designed to handle multi-tenant brand identities, complex SEO semantic relationships, and a high-frequency content generation log. We use **PostgreSQL** with **pgvector** to support the RAG (Retrieval-Augmented Generation) requirements for Brand Voice consistency.

## 2. Key Modules
### 2.1 Brand Identity & Voice Print
Stores the "DNA" of the brand. Instead of simple text descriptions, we use structured `tone_attributes` and a `lexicon` (JSONB) to allow the AI to modulate its output.

### 2.2 Niche Semantic SEO
Moves beyond flat keywords. The schema supports **Clusters** and **Intent Mapping**, allowing the AI to understand *why* a user is searching, not just *what* they are searching for.

### 2.3 Content Lifecycle & Feedback
Logs every generation. Critically, it includes `feedback_loops` (rating, edits) which are essential for Phase 1's Brand Voice Synthesis refinement.

## 3. Performance Considerations
*   **Indexing:** B-Tree for standard lookups; GIN for JSONB brand attributes; HNSW/IVFFlat for vector embeddings.
*   **Versioning:** Content logs use a `parent_id` structure to track iterations and AI refinements.