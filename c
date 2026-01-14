"""
SWARM ORCHESTRATOR
Defines the interaction between specialized agents for Niche Content Production.
"""

from typing import List, TypedDict
from langgraph.graph import StateGraph, END

class SwarmState(TypedDict):
    topic: str
    brand_id: str
    seo_data: dict
    draft: str
    review_score: float
    iteration_count: int

def seo_researcher(state: SwarmState):
    # Agent 1: Performs Deep SEO Analysis
    print(f"--- RESEARCHING NICHE: {state['topic']} ---")
    state['seo_data'] = {"keywords": ["niche A", "niche B"], "semantic_gaps": ["Gap 1"]}
    return state

def voice_writer(state: SwarmState):
    # Agent 2: Generates content using Brand Voice Synthesis
    print(f"--- WRITING WITH BRAND VOICE: {state['brand_id']} ---")
    state['draft'] = "Simulated high-quality niche content..."
    return state

def brand_critic(state: SwarmState):
    # Agent 3: Quality Control for Brand Alignment
    print("--- CRITIQUING BRAND ALIGNMENT ---")
    state['review_score'] = 0.95 # Simulated score
    state['iteration_count'] += 1
    return state

# Define the Graph
workflow = StateGraph(SwarmState)

workflow.add_node("researcher", seo_researcher)
workflow.add_node("writer", voice_writer)
workflow.add_node("critic", brand_critic)

workflow.set_entry_point("researcher")
workflow.add_edge("researcher", "writer")
workflow.add_edge("writer", "critic")

workflow.add_conditional_edges(
    "critic",
    lambda x: "end" if x["review_score"] > 0.8 or x["iteration_count"] > 2 else "writer",
    {
        "end": END,
        "writer": "writer"
    }
)

swarm_app = workflow.compile()