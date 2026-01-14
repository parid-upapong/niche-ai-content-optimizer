import React from 'react';
import { Target, Search, ArrowUpRight } from 'lucide-react';

interface KeywordMetric {
  term: string;
  relevance: number;
  difficulty: 'Low' | 'Medium' | 'High';
}

export const SEOInsightsSidebar = ({ keywords }: { keywords: KeywordMetric[] }) => {
  return (
    <div className="w-80 border-l border-slate-200 bg-white p-6 shrink-0 hidden xl:block">
      <div className="flex items-center space-x-2 mb-8">
        <Target className="text-emerald-500" size={20} />
        <h3 className="font-bold text-slate-900 tracking-tight">Semantic SEO Brief</h3>
      </div>

      <div className="space-y-6">
        <section>
          <label className="text-[11px] font-bold text-slate-400 uppercase tracking-widest mb-4 block">Topical Authority Gaps</label>
          <div className="space-y-3">
            {keywords.map((kw, i) => (
              <div key={i} className="group cursor-pointer p-3 rounded-xl border border-transparent hover:border-slate-200 hover:bg-slate-50 transition-all">
                <div className="flex justify-between items-center mb-1">
                  <span className="text-sm font-semibold text-slate-700">{kw.term}</span>
                  <ArrowUpRight size={14} className="text-slate-300 group-hover:text-brand-primary" />
                </div>
                <div className="flex items-center space-x-3 text-[10px]">
                  <span className="text-emerald-600 font-bold">{kw.relevance}% Rel.</span>
                  <span className={`px-1.5 py-0.5 rounded ${
                    kw.difficulty === 'Low' ? 'bg-green-100 text-green-700' : 
                    kw.difficulty === 'Medium' ? 'bg-amber-100 text-amber-700' : 'bg-red-100 text-red-700'
                  }`}>
                    {kw.difficulty} Diff
                  </span>
                </div>
              </div>
            ))}
          </div>
        </section>

        <section className="p-4 bg-slate-900 rounded-2xl text-white">
          <div className="flex items-center space-x-2 mb-3">
            <Search size={16} className="text-indigo-400" />
            <span className="text-xs font-bold uppercase tracking-wider">Search Intent</span>
          </div>
          <p className="text-sm text-slate-400 leading-relaxed">
            The audience is searching for <span className="text-white italic">"High ROI Niche Markets"</span> with an <span className="text-indigo-300 underline underline-offset-4 font-medium">Informational Intent</span>. 
            Prioritize data-backed case studies.
          </p>
        </section>
      </div>
    </div>
  );
};