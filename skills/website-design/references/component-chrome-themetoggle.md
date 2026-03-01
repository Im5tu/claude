# ThemeToggle

Dark mode toggle. Reads system preference on mount, persists to localStorage. Use in navbar when the site supports dark mode.

```tsx
"use client";
import { useEffect, useState } from "react";
import { Sun, Moon } from "lucide-react";
import { cn } from "@/lib/utils";

export function ThemeToggle() {
  const [dark, setDark] = useState(false);

  useEffect(() => {
    const stored = localStorage.getItem("theme");
    const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches;
    const isDark = stored === "dark" || (!stored && prefersDark);
    setDark(isDark);
    document.documentElement.classList.toggle("dark", isDark);
  }, []);

  const toggle = () => {
    const next = !dark;
    setDark(next);
    document.documentElement.classList.toggle("dark", next);
    localStorage.setItem("theme", next ? "dark" : "light");
  };

  return (
    <button
      onClick={toggle}
      className={cn(
        "relative h-8 w-8 rounded-full flex items-center justify-center",
        "text-secondary hover:text-primary transition-colors duration-200",
        "focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-accent",
      )}
      aria-label={dark ? "Switch to light mode" : "Switch to dark mode"}
    >
      <Sun
        className={cn(
          "h-4 w-4 absolute transition-all duration-300",
          dark ? "opacity-0 rotate-90 scale-0" : "opacity-100 rotate-0 scale-100",
        )}
      />
      <Moon
        className={cn(
          "h-4 w-4 absolute transition-all duration-300",
          dark ? "opacity-100 rotate-0 scale-100" : "opacity-0 -rotate-90 scale-0",
        )}
      />
    </button>
  );
}
```
