-- 1. ORGANIZATIONS & USERS
CREATE TABLE organizations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. BRAND PROFILES (The "Brand Soul")
CREATE TABLE brand_profiles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    org_id UUID REFERENCES organizations(id) ON DELETE CASCADE,
    brand_name VARCHAR(100) NOT NULL,
    tagline TEXT,
    mission_statement TEXT,
    
    -- Brand Voice Synthesis (BVS) Core
    primary_tone tone_type DEFAULT 'professional',
    secondary_tone tone_type,
    lexicon JSONB DEFAULT '{"preferred_terms": [], "forbidden_terms": []}', -- Targeted niche vocabulary
    brand_voice_embedding vector(1536), -- Vector representation of the brand's writing style
    
    target_audience_specs JSONB, -- Demographic/Psychographic data
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. SEO DATA & SEMANTIC CLUSTERS
CREATE TABLE seo_projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    brand_id UUID REFERENCES brand_profiles(id) ON DELETE CASCADE,
    niche_name VARCHAR(255) NOT NULL,
    competitor_urls TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE semantic_clusters (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES seo_projects(id) ON DELETE CASCADE,
    cluster_topic VARCHAR(255) NOT NULL,
    total_search_volume INTEGER,
    average_difficulty DECIMAL(5,2),
    intent search_intent DEFAULT 'informational'
);

CREATE TABLE keywords (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cluster_id UUID REFERENCES semantic_clusters(id) ON DELETE CASCADE,
    keyword VARCHAR(255) NOT NULL,
    volume INTEGER,
    difficulty DECIMAL(5,2),
    is_primary BOOLEAN DEFAULT false
);

-- 4. CONTENT LOGS & AI OUTPUTS
CREATE TABLE content_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    brand_id UUID REFERENCES brand_profiles(id),
    seo_cluster_id UUID REFERENCES semantic_clusters(id),
    
    title TEXT NOT NULL,
    raw_content TEXT, -- Markdown format
    optimized_content TEXT, -- Post SEO-refinement
    
    model_metadata JSONB, -- model_name, tokens, temperature, prompt_id
    current_status content_status DEFAULT 'draft',
    
    -- Performance & Feedback (The RLHF loop)
    human_rating SMALLINT CHECK (human_rating BETWEEN 1 AND 5),
    edit_distance_ratio DECIMAL(3,2), -- Measure how much the user changed the AI output
    
    version INTEGER DEFAULT 1,
    parent_id UUID REFERENCES content_logs(id), -- Tracking iterations
    
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 5. KNOWLEDGE BASE (For RAG/Context)
CREATE TABLE brand_assets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    brand_id UUID REFERENCES brand_profiles(id) ON DELETE CASCADE,
    asset_type VARCHAR(50), -- 'pdf', 'url', 'text'
    content_chunk TEXT,
    embedding vector(1536),
    metadata JSONB
);

-- Indexes for performance
CREATE INDEX idx_brand_voice_vec ON brand_profiles USING hnsw (brand_voice_embedding vector_cosine_ops);
CREATE INDEX idx_asset_vec ON brand_assets USING hnsw (embedding vector_cosine_ops);
CREATE INDEX idx_keywords_cluster ON keywords(cluster_id);
CREATE INDEX idx_content_brand ON content_logs(brand_id);