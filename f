import React, { useState, useEffect } from 'react';
import { Sparkles, BarChart3, Type, Save, Languages } from 'lucide-react';
import { Progress } from "@/components/ui/progress";

interface EditorProps {
  initialContent?: string;
  brandVoiceId: string;
}

export const InteractiveEditor: React.FC<EditorProps> = ({ initialContent = "", brandVoiceId }) => {
  const [content, setContent] = useState(initialContent);
  const [seoScore, setSeoScore] = useState(45);
  const [voiceAlignment, setVoiceAlignment] = useState(72);
  const [isGenerating, setIsGenerating] = useState(false);

  // Mock AI Suggestion Logic
  const handleAIImprove = async () => {
    setIsGenerating(true);
    // Logic to call /api/v1/content/generate with Brand Voice context
    setTimeout(() => {
      setIsGenerating(false);
      setVoiceAlignment(95);
    }, 1500);
  };

  return (
    <div className="grid grid-cols-12 gap-6 h-[calc(100vh-120px)]">
      {/* Main Editor Area */}
      <div className="col-span-12 lg:col-span-8 flex flex-col bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
        <div className="border-b border-slate-100 p-4 flex justify-between items-center bg-slate-50/50">
          <div className="flex gap-2">
            <button className="p-2 hover:bg-white rounded border border-transparent hover:border-slate-200 transition-all"><Type size={18} /></button>
            <button className="p-2 hover:bg-white rounded border border-transparent hover:border-slate-200 transition-all"><Languages size={18} /></button>
          </div>
          <div className="flex gap-3">
            <button 
              onClick={handleAIImprove}
              disabled={isGenerating}
              className="flex items-center gap-2 bg-gradient-to-r from-brand-primary to-brand-secondary text-white px-4 py-2 rounded-lg font-medium hover:opacity-90 transition-opacity disabled:opacity-50"
            >
              {isGenerating ? "Refining Voice..." : <><Sparkles size={16} /> Enhance with BVS</>}
            </button>
            <button className="flex items-center gap-2 bg-slate-900 text-white px-4 py-2 rounded-lg font-medium hover:bg-slate-800 transition-colors">
              <Save size={16} /> Save
            </button>
          </div>
        </div>
        
        <textarea
          className="flex-1 p-8 focus:outline-none text-lg leading-relaxed text-slate-700 resize-none"
          placeholder="เริ่มเขียนคอนเทนต์ของคุณที่นี่ หรือให้ AI ช่วยสร้างตามน้ำเสียงของแบรนด์..."
          value={content}
          onChange={(e) => setContent(e.target.value)}
        />
      </div>

      {/* SEO & Brand Intelligence Sidebar */}
      <div className="col-span-12 lg:col-span-4 flex flex-col gap-6">
        {/* Voice Alignment Card */}
        <div className="bg-white p-6 rounded-xl border border-slate-200 shadow-sm">
          <h3 className="text-sm font-semibold text-slate-500 uppercase tracking-wider mb-4 flex items-center gap-2">
            <Sparkles size={14} className="text-brand-secondary" /> Brand Voice Match
          </h3>
          <div className="flex items-end justify-between mb-2">
            <span className="text-3xl font-bold text-slate-900">{voiceAlignment}%</span>
            <span className="text-sm text-green-600 font-medium">Perfect Tone</span>
          </div>
          <Progress value={voiceAlignment} className="h-2 mb-4" />
          <p className="text-sm text-slate-500 italic">
            "Your content matches the 'Empathetic Expert' profile established in your settings."
          </p>
        </div>

        {/* SEO Semantic Card */}
        <div className="bg-white p-6 rounded-xl border border-slate-200 shadow-sm">
          <h3 className="text-sm font-semibold text-slate-500 uppercase tracking-wider mb-4 flex items-center gap-2">
            <BarChart3 size={14} className="text-brand-primary" /> SEO Semantic Score
          </h3>
          <div className="flex items-end justify-between mb-2">
            <span className="text-3xl font-bold text-slate-900">{seoScore}</span>
            <span className="text-sm text-orange-500 font-medium">Needs Keywords</span>
          </div>
          <Progress value={seoScore} className="h-2 mb-6" />
          
          <div className="space-y-3">
            <p className="text-xs font-bold text-slate-400 uppercase">Missing Semantic Clusters:</p>
            {['Digital Transformation', 'SME Growth Strategy', 'AI Integration'].map((tag) => (
              <div key={tag} className="flex items-center justify-between p-2 rounded bg-slate-50 border border-slate-100">
                <span className="text-sm text-slate-600">{tag}</span>
                <span className="text-[10px] bg-slate-200 px-1.5 py-0.5 rounded font-bold text-slate-500">+8 PTS</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};