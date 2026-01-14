"use client";
import React from 'react';
import { LayoutDashboard, Target, MessageSquare, Settings } from 'lucide-react';

export default function BrandDNAPage() {
  const toneAttributes = [
    { label: "Formal", value: 20 },
    { label: "Professional", value: 85 },
    { label: "Witty", value: 40 },
    { label: "Empathetic", value: 90 },
  ];

  return (
    <div className="max-w-5xl mx-auto space-y-8 p-8">
      <header>
        <h1 className="text-3xl font-bold text-slate-900">Brand DNA Configurator</h1>
        <p className="text-slate-500">Define the unique essence and linguistic patterns for AI content generation.</p>
      </header>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        {/* Tone Modulation */}
        <section className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm space-y-6">
          <h2 className="text-xl font-semibold flex items-center gap-2">
            <Target className="text-brand-primary" /> Tone Modulation
          </h2>
          {toneAttributes.map((attr) => (
            <div key={attr.label} className="space-y-2">
              <div className="flex justify-between text-sm font-medium">
                <span className="text-slate-700">{attr.label}</span>
                <span className="text-brand-primary">{attr.value}%</span>
              </div>
              <input 
                type="range" 
                className="w-full h-1.5 bg-slate-100 rounded-lg appearance-none cursor-pointer accent-brand-primary" 
                defaultValue={attr.value} 
              />
            </div>
          ))}
        </section>

        {/* Niche Lexicon */}
        <section className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm space-y-6">
          <h2 className="text-xl font-semibold flex items-center gap-2">
            <MessageSquare className="text-brand-secondary" /> Industry Lexicon
          </h2>
          <div className="space-y-4">
            <p className="text-sm text-slate-500 italic">Keywords or phrases the AI should prioritize or avoid for this specific brand.</p>
            <div className="flex flex-wrap gap-2">
              {['Smart Automation', 'Eco-friendly', 'Hyper-local', 'Precision'].map(term => (
                <span key={term} className="px-3 py-1 bg-brand-surface border border-brand-primary/20 text-brand-primary rounded-full text-sm font-medium">
                  {term} ✕
                </span>
              ))}
              <button className="px-3 py-1 border border-dashed border-slate-300 text-slate-400 rounded-full text-sm hover:border-brand-primary transition-colors">
                + Add Term
              </button>
            </div>
          </div>
        </section>
      </div>

      <div className="bg-brand-dark p-8 rounded-2xl text-white flex justify-between items-center shadow-lg">
        <div>
          <h3 className="text-lg font-bold">Ready to Generate Content?</h3>
          <p className="text-slate-400 text-sm">Your Brand DNA is synchronized with the Swarm Orchestrator.</p>
        </div>
        <button className="bg-white text-brand-dark px-6 py-3 rounded-xl font-bold hover:bg-slate-100 transition-colors">
          Open Content Studio
        </button>
      </div>
    </div>
  );
}