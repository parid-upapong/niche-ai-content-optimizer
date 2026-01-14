import DashboardShell from '@/components/layout/DashboardShell';
import { VoicePrintCard } from '@/components/ui/VoicePrintCard';
import { SEOInsightsSidebar } from '@/components/ui/SEOInsightsSidebar';

export default function DashboardPage() {
  const mockKeywords = [
    { term: 'Organic Growth Hacks 2024', relevance: 98, difficulty: 'Medium' as const },
    { term: 'Niche Community Building', relevance: 85, difficulty: 'Low' as const },
    { term: 'AI Marketing ROI', relevance: 72, difficulty: 'High' as const },
  ];

  return (
    <DashboardShell>
      <div className="flex gap-8">
        <div className="flex-1 space-y-8">
          <header>
            <h1 className="text-3xl font-extrabold text-slate-900 tracking-tight">Brand Command Center</h1>
            <p className="text-slate-500 mt-2">Manage your Brand Voice Synthesis (BVS) and SEO orchestration.</p>
          </header>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <VoicePrintCard 
              brandName="EchoNiche Pro" 
              tone={['Professional', 'Futuristic', 'Empathetic']} 
              resonance={92} 
            />
            {/* Additional Brand Cards for Multi-tenant support */}
            <div className="border-2 border-dashed border-slate-200 rounded-2xl flex flex-col items-center justify-center p-6 text-slate-400 hover:border-brand-primary hover:text-brand-primary cursor-pointer transition-colors group">
              <div className="w-10 h-10 rounded-full bg-slate-100 flex items-center justify-center mb-2 group-hover:bg-indigo-50 transition-colors">
                <span className="text-2xl">+</span>
              </div>
              <span className="text-sm font-semibold">New Brand Identity</span>
            </div>
          </div>

          <div className="bg-white rounded-2xl border border-slate-200 p-8">
            <div className="flex justify-between items-center mb-6">
              <h3 className="font-bold text-xl">Recent Content Intelligence</h3>
              <button className="text-brand-primary text-sm font-bold hover:underline">View All Logs</button>
            </div>
            
            <div className="overflow-x-auto">
              <table className="w-full text-left">
                <thead>
                  <tr className="border-b border-slate-100">
                    <th className="pb-4 font-bold text-slate-400 text-xs uppercase tracking-widest">Article Title</th>
                    <th className="pb-4 font-bold text-slate-400 text-xs uppercase tracking-widest">BVS Match</th>
                    <th className="pb-4 font-bold text-slate-400 text-xs uppercase tracking-widest">SEO Score</th>
                    <th className="pb-4 font-bold text-slate-400 text-xs uppercase tracking-widest">Status</th>
                  </tr>
                </thead>
                <tbody className="text-sm">
                  <tr className="border-b border-slate-50">
                    <td className="py-4 font-medium">How AI Redefines Niche Marketing in 2024</td>
                    <td className="py-4"><span className="text-emerald-500 font-bold">95%</span></td>
                    <td className="py-4"><span className="text-indigo-500 font-bold">88/100</span></td>
                    <td className="py-4"><span className="px-2 py-1 bg-green-100 text-green-700 rounded text-[10px] font-bold uppercase">Published</span></td>
                  </tr>
                  <tr className="border-b border-slate-50">
                    <td className="py-4 font-medium">The Silent Power of Brand Lexicons</td>
                    <td className="py-4"><span className="text-amber-500 font-bold">82%</span></td>
                    <td className="py-4"><span className="text-indigo-500 font-bold">92/100</span></td>
                    <td className="py-4"><span className="px-2 py-1 bg-slate-100 text-slate-700 rounded text-[10px] font-bold uppercase">Drafting</span></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <SEOInsightsSidebar keywords={mockKeywords} />
      </div>
    </DashboardShell>
  );
}