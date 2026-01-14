from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.api.v1 import auth, content_gen # assumed structure

app = FastAPI(
    title="EchoNiche AI Backend",
    version="1.0.0",
    description="Next-gen MarTech API for Brand Voice Synthesis and Niche SEO."
)

# Set up CORS for Next.js frontend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # Tighten for production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include Routers
app.include_router(auth.router, prefix="/api/v1")
# app.include_router(content_gen.router, prefix="/api/v1")

@app.get("/")
async def root():
    return {
        "status": "online",
        "service": "EchoNiche-API",
        "orchestrator_version": "v1.0-swarm"
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)