import React from 'react';
import { Sparkles, Zap, BrainCircuit } from 'lucide-react';

interface VoicePrintProps {
  brandName: string;
  tone: string[];
  resonance: number;
}

export const VoicePrintCard = ({ brandName, tone, resonance }: VoicePrintProps) => {
  return (
    <div className="bg-white rounded-2xl p-6 border border-slate-200 shadow-sm hover:shadow-md transition-shadow">
      <div className="flex justify-between items-start mb-6">
        <div>
          <h3 className="text-lg font-bold text-slate-900">{brandName} Voice Print</h3>
          <p className="text-sm text-slate-500">Active BVS Engine: v1.0.2</p>
        </div>
        <div className="p-2 bg-indigo-50 rounded-lg">
          <BrainCircuit className="text-brand-primary" size={24} />
        </div>
      </div>

      <div className="space-y-4">
        <div className="flex flex-wrap gap-2">
          {tone.map((t) => (
            <span key={t} className="px-3 py-1 rounded-full bg-slate-100 text-slate-700 text-xs font-semibold border border-slate-200 uppercase tracking-wider">
              {t}
            </span>
          ))}
        </div>

        <div className="pt-4 space-y-2">
          <div className="flex justify-between text-sm mb-1">
            <span className="text-slate-600 font-medium">Brand Resonance Score</span>
            <span className="text-indigo-600 font-bold">{resonance}%</span>
          </div>
          <div className="h-2 w-full bg-slate-100 rounded-full overflow-hidden">
            <div 
              className="h-full bvs-gradient transition-all duration-1000" 
              style={{ width: `${resonance}%` }}
            />
          </div>
        </div>
      </div>

      <div className="mt-6 flex items-center justify-between text-[10px] font-bold uppercase tracking-widest text-slate-400">
        <div className="flex items-center gap-1"><Zap size={10} className="text-amber-500" /> Niche Optimized</div>
        <div className="flex items-center gap-1"><Sparkles size={10} className="text-pink-500" /> Humanized Output</div>
      </div>
    </div>
  );
};