import React from 'react';
import { LayoutDashboard, PenTool, Search, Settings, BarChart3, Users } from 'lucide-react';

interface SidebarItemProps {
  icon: React.ElementType;
  label: string;
  active?: boolean;
}

const SidebarItem = ({ icon: Icon, label, active }: SidebarItemProps) => (
  <div className={`flex items-center space-x-3 px-4 py-3 rounded-lg cursor-pointer transition-all ${
    active ? 'bg-brand-primary text-white' : 'text-slate-400 hover:bg-slate-800 hover:text-white'
  }`}>
    <Icon size={20} />
    <span className="font-medium">{label}</span>
  </div>
);

export default function DashboardShell({ children }: { children: React.ReactNode }) {
  return (
    <div className="flex h-screen bg-slate-950 text-slate-50 overflow-hidden font-sans">
      {/* Sidebar */}
      <aside className="w-64 border-r border-slate-800 flex flex-col p-6 space-y-8 shrink-0">
        <div className="flex items-center space-x-2 px-2">
          <div className="w-8 h-8 rounded-lg bvs-gradient flex items-center justify-center font-bold">E</div>
          <span className="text-xl font-bold tracking-tight">EchoNiche <span className="text-brand-secondary">AI</span></span>
        </div>
        
        <nav className="flex-1 space-y-2">
          <SidebarItem icon={LayoutDashboard} label="Overview" active />
          <SidebarItem icon={PenTool} label="Content Lab" />
          <SidebarItem icon={Search} label="SEO Architect" />
          <SidebarItem icon={Users} label="Brand Voice DNA" />
          <SidebarItem icon={BarChart3} label="Analytics" />
        </nav>

        <div className="pt-6 border-t border-slate-800">
          <SidebarItem icon={Settings} label="Settings" />
        </div>
      </aside>

      {/* Main Content Area */}
      <main className="flex-1 flex flex-col min-w-0 bg-slate-50 text-slate-900 overflow-hidden">
        <header className="h-16 border-b border-slate-200 bg-white flex items-center justify-between px-8 shrink-0">
          <h2 className="text-sm font-semibold uppercase tracking-wider text-slate-500">Workspace / Project Echo-Niche</h2>
          <div className="flex items-center space-x-4">
            <div className="flex -space-x-2">
              <div className="w-8 h-8 rounded-full border-2 border-white bg-indigo-500" />
              <div className="w-8 h-8 rounded-full border-2 border-white bg-pink-500" />
            </div>
            <button className="bg-slate-900 text-white px-4 py-2 rounded-full text-sm font-medium hover:opacity-90 transition-opacity">
              Generate New
            </button>
          </div>
        </header>

        <div className="flex-1 overflow-y-auto p-8">
          <div className="max-w-7xl mx-auto space-y-8">
            {children}
          </div>
        </div>
      </main>
    </div>
  );
}