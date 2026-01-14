@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 210 40% 98%;
    --foreground: 222.2 84% 4.9%;
    --card: 0 0% 100%;
    --card-foreground: 222.2 84% 4.9%;
    --popover: 0 0% 100%;
    --popover-foreground: 222.2 84% 4.9%;
    --brand-primary: 243 75% 59%;
    --brand-secondary: 330 81% 60%;
    --accent: 210 40% 96.1%;
    --accent-foreground: 222.2 47.4% 11.2%;
    --success: 142 70% 45%;
    --warning: 38 92% 50%;
    --destructive: 0 84.2% 60.2%;
    --border: 214.3 31.8% 91.4%;
    --input: 214.3 31.8% 91.4%;
    --ring: 243 75% 59%;
    --radius: 0.75rem;
  }

  .dark {
    --background: 222.2 84% 4.9%;
    --foreground: 210 40% 98%;
    --card: 222.2 84% 4.9%;
    --brand-primary: 243 75% 70%;
    --border: 217.2 32.6% 17.5%;
  }
}

@layer components {
  .glass-panel {
    @apply bg-white/70 backdrop-blur-md border border-white/20 shadow-xl;
  }
  
  .bvs-gradient {
    @apply bg-gradient-to-br from-indigo-500 via-purple-500 to-pink-500;
  }

  .seo-indicator-pulse {
    @apply relative flex h-3 w-3;
  }
}

/* Custom Typography for Thai & English Niche Markets */
body {
  font-feature-settings: "rlig" 1, "calt" 1;
  -webkit-font-smoothing: antialiased;
}