# BentoGrid

Mixed-size card grid — NOT a uniform 3-column layout. Cards have variable spans. The asymmetry creates visual hierarchy and communicates that some features matter more than others.

```
---
component: BentoGrid
category: content
subtype: bento-feature-grid

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: low
  energy-moderate: high
  energy-energetic: high
visual-weight: heavy
content-density: rich
trend-alignment: trending
motion-profile: moderate

use-when:
  - 4-8 features where some are more important than others
  - Bold Studio or Clean SaaS personality — structured visual energy
  - Each feature has a distinct icon or illustration
  - The section needs visual interest without requiring photography

avoid-when:
  - Dark Luxury — the busyness of bento conflicts with restrained opulence
  - Refined Professional — bento reads as trendy rather than authoritative
  - Fewer than 4 features (use IconGrid instead — bento with 3 items looks sparse)
  - When all features are genuinely equal in importance (use IconGrid)

pairs-well-with: [StatsStrip, LogoStrip, AlternatingRows as follow-on section]
pairs-poorly-with: [MagazineGrid — both are grid-based, too similar in rhythm]
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

interface BentoFeature {
  icon: ReactNode;
  title: string;
  description: string;
  /** "wide" = 2 cols, "tall" = 2 rows, "default" = 1x1 */
  span?: "wide" | "tall" | "default";
  /** Optional link for the card */
  href?: string;
  /** Optional image to fill the card background (tall/wide cards) */
  backgroundImage?: string;
}

interface BentoGridProps {
  eyebrow?: string;
  headline: string;
  subline?: string;
  features: BentoFeature[];
}

function BentoCard({ feature }: { feature: BentoFeature }) {
  const Tag = feature.href ? "a" : "div";
  const linkProps = feature.href ? { href: feature.href } : {};

  return (
    <Tag
      {...linkProps}
      className={`bento-card group relative overflow-hidden rounded-2xl border border-border bg-surface-secondary p-8 transition-all duration-300 hover:-translate-y-1 hover:shadow-lg hover:border-border-strong ${
        feature.span === "wide" ? "md:col-span-2" : ""
      } ${feature.span === "tall" ? "md:row-span-2" : ""}`}
    >
      {/* Optional background image for larger cards */}
      {feature.backgroundImage && (
        <>
          <div
            className="absolute inset-0 bg-cover bg-center transition-transform duration-500 group-hover:scale-[1.03]"
            style={{ backgroundImage: `url(${feature.backgroundImage})` }}
          />
          <div className="absolute inset-0 bg-gradient-to-br from-surface-secondary/90 to-surface-secondary/60" />
        </>
      )}

      <div className="relative z-10">
        <div className="mb-5 inline-flex h-11 w-11 items-center justify-center rounded-xl bg-accent/10 text-accent">
          {feature.icon}
        </div>
        <h3 className="font-display font-semibold text-h3 text-primary leading-tight">
          {feature.title}
        </h3>
        <p className="mt-3 text-body-sm text-secondary leading-relaxed">
          {feature.description}
        </p>
        {feature.href && (
          <span className="mt-5 inline-flex items-center gap-1.5 text-body-sm font-medium text-accent opacity-0 transition-opacity duration-200 group-hover:opacity-100">
            Learn more
            <svg width="14" height="14" viewBox="0 0 14 14" fill="none" aria-hidden="true">
              <path d="M3 7h8M7 3l4 4-4 4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
            </svg>
          </span>
        )}
      </div>
    </Tag>
  );
}

export function BentoGrid({ eyebrow, headline, subline, features }: BentoGridProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    // Section header
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

    // Cards cascade
    const cards = ref.current.querySelectorAll(".bento-card");
    gsap.set(cards, { y: 32, opacity: 0 });
    gsap.to(cards, {
      y: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: 0.08,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 70%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-primary">
      <div className="mx-auto max-w-7xl px-6">
        {/* Section header */}
        <div className="mb-12 max-w-[54ch]">
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

        {/* Bento grid — asymmetric, 3-col base */}
        <div className="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3 md:auto-rows-[220px]">
          {features.map((feature, i) => (
            <BentoCard key={i} feature={feature} />
          ))}
        </div>
      </div>
    </section>
  );
}
```
