# IconGrid

4-6 item uniform grid. Small lucide-react icon + bold title + 2-line description. Quick-scan section. Anti-bento: all cards are the same size. For sections where the content IS uniform — no hierarchy needed.

```
---
component: IconGrid
category: content
subtype: icon-feature-grid

dimension-fit:
  contrast-dark: low
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: low
visual-weight: light
content-density: moderate
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - 4-6 features that are genuinely equal in importance
  - Quick-scan section below the fold (not the primary features section)
  - Clean SaaS — technical feature checklist with clean visual rhythm
  - Refined Professional — services overview before more detailed AlternatingRows

avoid-when:
  - Bold Studio as primary features section (too uniform, lacks kinetic energy)
  - When features are clearly hierarchical (use BentoGrid instead)
  - Dark Luxury — the grid lightness conflicts with restrained opulence

pairs-well-with: [StatsStrip, LogoStrip, AlternatingRows as deeper dive]
pairs-poorly-with: [BentoGrid — both are grids; choose one or the other]
---
```

```tsx
"use client";
import { useRef, type ReactNode } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface IconFeature {
  /** Lucide-react icon component (or any ReactNode) */
  icon: ReactNode;
  title: string;
  description: string;
}

interface IconGridProps {
  eyebrow?: string;
  headline: string;
  subline?: string;
  features: IconFeature[];
  /** Number of columns on desktop — default 3 */
  cols?: 2 | 3 | 4;
}

const colClass: Record<number, string> = {
  2: "sm:grid-cols-2",
  3: "sm:grid-cols-2 lg:grid-cols-3",
  4: "sm:grid-cols-2 lg:grid-cols-4",
};

export function IconGrid({ eyebrow, headline, subline, features, cols = 3 }: IconGridProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    const header = ref.current.querySelectorAll("[data-header]");
    gsap.set(header, { y: 20, opacity: 0 });
    gsap.to(header, {
      y: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: 0.08,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 80%",
        toggleActions: "play none none none",
      },
    });

    const items = ref.current.querySelectorAll(".icon-card");
    gsap.set(items, { y: 24, opacity: 0 });
    gsap.to(items, {
      y: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: 0.07,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 70%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-secondary">
      <div className="mx-auto max-w-7xl px-6">
        {/* Header */}
        <div className="mb-12 text-center max-w-[52ch] mx-auto">
          {eyebrow && (
            <p data-header className="text-caption font-semibold text-accent tracking-widest uppercase mb-4">
              {eyebrow}
            </p>
          )}
          <h2 data-header className="font-display font-bold text-h1 leading-tight tracking-tight text-primary">
            {headline}
          </h2>
          {subline && (
            <p data-header className="mt-4 text-body-lg text-secondary leading-relaxed">
              {subline}
            </p>
          )}
        </div>

        {/* Uniform grid */}
        <div className={`grid grid-cols-1 gap-8 ${colClass[cols]}`}>
          {features.map((feature, i) => (
            <div
              key={i}
              className="icon-card group"
            >
              {/* Icon */}
              <div className="mb-4 inline-flex h-12 w-12 items-center justify-center rounded-xl border border-border bg-surface-primary text-accent transition-colors duration-200 group-hover:bg-accent group-hover:text-white group-hover:border-accent">
                {feature.icon}
              </div>
              <h3 className="font-display font-semibold text-h4 text-primary mb-2">
                {feature.title}
              </h3>
              <p className="text-body-sm text-secondary leading-relaxed max-w-[32ch]">
                {feature.description}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
```
