# Navbar — Morphing Pill

Fixed pill navbar that starts transparent and morphs to frosted glass on scroll. Detects the hero section exiting the viewport using IntersectionObserver — no scroll event listeners.

```
// Usage note — no metadata block required for chrome components.
// Chrome components are always included regardless of style preset.
// This navbar adapts to each preset via CSS variables.
```

**Variant defaults by dimensional signal:**

| Dimensional Signal | Variant | Notes |
|--------|---------|-------|
| contrast-dark + energy-energetic | Pill, centered | Transparent → glass morph |
| contrast-light + energy-moderate + technical | Pill, centered | Transparent → glass morph |
| contrast-dark + energy-restrained | Full-width, flush top | No pill rounding, dark background |
| contrast-light + energy-restrained | Full-width, flush top | Border-bottom on scroll |
| contrast-light + energy-restrained + texture-high | Pill, centered | Softer radius (`rounded-2xl`) |
| contrast-light + energy-restrained + editorial | SidebarNav | Left-rail on desktop, hamburger mobile |

> These are defaults optimized for dimensional personality. Override when the brand's brief signals a specific navigation character that differs — document the override rationale.

```tsx
"use client";
import { useState, useEffect } from "react";
import { cn } from "@/lib/utils";
import { Menu, X } from "lucide-react";

interface NavbarProps {
  brand: string;
  links: { label: string; href: string }[];
  cta: { label: string; href: string };
  /** "pill" is default (energy-energetic, energy-moderate, texture-high)
   *  "full-width" for contrast-dark + restrained, contrast-light + restrained */
  variant?: "pill" | "full-width";
}

export function Navbar({ brand, links, cta, variant = "pill" }: NavbarProps) {
  const [isScrolled, setIsScrolled] = useState(false);
  const [isMobileOpen, setIsMobileOpen] = useState(false);

  // IntersectionObserver on #hero — no scroll listener
  useEffect(() => {
    const heroEl = document.getElementById("hero");
    if (!heroEl) return;

    const observer = new IntersectionObserver(
      ([entry]) => setIsScrolled(!entry.isIntersecting),
      { threshold: 0.1 },
    );
    observer.observe(heroEl);
    return () => observer.disconnect();
  }, []);

  // Close mobile menu on escape
  useEffect(() => {
    const handleKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") setIsMobileOpen(false);
    };
    document.addEventListener("keydown", handleKey);
    return () => document.removeEventListener("keydown", handleKey);
  }, []);

  const isPill = variant === "pill";

  return (
    <>
      <nav
        className={cn(
          "fixed z-50 transition-all duration-300",
          isPill
            ? [
                "top-4 left-1/2 -translate-x-1/2",
                "w-[calc(100%-2rem)] max-w-6xl rounded-full px-6 py-3",
                isScrolled
                  ? "bg-white/80 dark:bg-neutral-950/80 backdrop-blur-xl border border-neutral-200/50 dark:border-neutral-800/50 shadow-sm"
                  : "bg-transparent",
              ]
            : [
                "top-0 left-0 right-0",
                "px-6 py-4 lg:px-10",
                isScrolled
                  ? "bg-white/95 dark:bg-neutral-950/95 backdrop-blur-xl border-b border-border shadow-sm"
                  : "bg-transparent",
              ],
        )}
        aria-label="Primary navigation"
      >
        <div className={cn("flex items-center justify-between", !isPill && "mx-auto max-w-7xl")}>
          {/* Brand */}
          <a
            href="/"
            className={cn(
              "text-lg font-display font-bold transition-colors duration-300",
              isScrolled ? "text-primary" : "text-white dark:text-white",
            )}
          >
            {brand}
          </a>

          {/* Desktop links */}
          <div className="hidden md:flex items-center gap-8">
            {links.map((link) => (
              <a
                key={link.href}
                href={link.href}
                className={cn(
                  "relative text-sm font-medium transition-colors duration-300",
                  // Underline animation
                  "after:absolute after:bottom-0 after:left-0 after:h-[2px] after:w-full",
                  "after:origin-left after:scale-x-0 after:bg-accent",
                  "after:transition-transform after:duration-300 after:ease-out",
                  "hover:after:scale-x-100",
                  isScrolled
                    ? "text-secondary hover:text-primary"
                    : "text-white/80 hover:text-white dark:text-white/80 dark:hover:text-white",
                )}
              >
                {link.label}
              </a>
            ))}
          </div>

          {/* CTA + mobile toggle */}
          <div className="flex items-center gap-3">
            <a
              href={cta.href}
              className={cn(
                "hidden md:inline-flex items-center text-sm font-medium",
                "transition-all duration-200 hover:scale-[1.02] active:scale-[0.98]",
                isPill
                  ? "rounded-full px-5 py-2 bg-accent text-white hover:bg-accent-light"
                  : "rounded-lg px-5 py-2 bg-accent text-white hover:bg-accent-light",
              )}
            >
              {cta.label}
            </a>
            <button
              onClick={() => setIsMobileOpen(!isMobileOpen)}
              className="md:hidden p-2 rounded-lg transition-colors hover:bg-surface-secondary"
              aria-expanded={isMobileOpen}
              aria-controls="mobile-menu"
              aria-label="Toggle navigation"
            >
              {isMobileOpen ? (
                <X className={cn("h-5 w-5 transition-colors", isScrolled ? "text-primary" : "text-white")} />
              ) : (
                <Menu className={cn("h-5 w-5 transition-colors", isScrolled ? "text-primary" : "text-white")} />
              )}
            </button>
          </div>
        </div>
      </nav>

      {/* Mobile fullscreen menu */}
      {isMobileOpen && (
        <div
          id="mobile-menu"
          className="fixed inset-0 z-40 bg-surface-primary flex flex-col items-center justify-center gap-8"
          role="dialog"
          aria-modal="true"
          aria-label="Navigation menu"
        >
          <button
            onClick={() => setIsMobileOpen(false)}
            className="absolute top-6 right-6 p-2"
            aria-label="Close menu"
          >
            <X className="h-6 w-6 text-primary" />
          </button>
          {links.map((link) => (
            <a
              key={link.href}
              href={link.href}
              className="text-2xl font-display font-medium text-primary transition-colors hover:text-accent"
              onClick={() => setIsMobileOpen(false)}
            >
              {link.label}
            </a>
          ))}
          <a
            href={cta.href}
            className="mt-4 rounded-full bg-accent px-8 py-3.5 text-base font-medium text-white"
            onClick={() => setIsMobileOpen(false)}
          >
            {cta.label}
          </a>
        </div>
      )}
    </>
  );
}
```
