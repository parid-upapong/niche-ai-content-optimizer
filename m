# ML Strategy: Niche Industry Fine-Tuning

## 1. Problem Statement
Generic LLMs (GPT-4, Claude) often produce "hallucinated genericisms" when dealing with specific Thai niche markets (e.g., specific terms in the "Dropshipping" community or "Cosmetic Manufacturing" regulations).

## 2. Approach: Lexicon-Augmented Fine-Tuning
We do not just fine-tune on text; we fine-tune on **Semantic Mappings**.
- **Source:** The `lexicon` JSONB field in our PostgreSQL database.
- **Process:** We generate synthetic contrastive pairs where a "Generic AI sentence" is corrected into a "Niche Professional sentence."

## 3. Key Metrics for Success
1.  **Terminology Precision (TP):** Percentage of industry-specific terms used correctly vs. total industry terms required.
2.  **Brand Voice Distance (BVD):** Cosine similarity between the generated content vector and the Brand's "Voice Print" vector stored in `pgvector`.
3.  **SEO Keyword Integration:** Successful placement of LSI (Latent Semantic Indexing) keywords without breaking natural flow.

## 4. Model Selection
*   **Base Model:** Open-source models like `Llama-3-8B` or `SeaLLM` (for Thai language proficiency).
*   **Method:** QLoRA (Quantized Low-Rank Adaptation) to keep training costs low for the MarTech platform while maintaining high output quality.