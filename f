# EchoNiche Frontend: Interactive Content Suite

## Overview
This frontend is built with **Next.js 14** using the App Router. It serves as the primary interface for SMEs to interact with the Brand Voice Synthesis (BVS) and SEO Analyst agents.

## Key Features
- **BVS Editor:** A writing environment that provides real-time feedback on how well the text matches the defined Brand Voice.
- **Semantic SEO Sidebar:** Visualizes topical authority scores and suggests content clusters based on the `SEO_STRATEGIST_SYSTEM_PROMPT` logic.
- **DNA Configurator:** A specialized settings page for fine-tuning the `tone_attributes` used by the backend LLM.

## Tech Stack
- **Framework:** Next.js 14 (App Router)
- **Styling:** Tailwind CSS + Headless UI (Radix)
- **Icons:** Lucide React
- **Animations:** Framer Motion (planned for transitions)

## Getting Started
1. Install dependencies: `npm install`
2. Run development server: `npm run dev`
3. Backend configuration: Ensure `NEXT_PUBLIC_API_URL` points to the FastAPI gateway.