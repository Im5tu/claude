# BentoHero

Hero where the visual is a bento grid of product screenshots or feature previews. Text is left-aligned. The bento IS the product demo — shows what the product does before the user reads what it says.

```
---
component: BentoHero
category: heroes
subtype: bento-product

dimension-fit:
  contrast-dark: low
  contrast-light: high
  energy-restrained: low
  energy-moderate: high
  energy-energetic: high
  motion-minimal: low
  motion-moderate: high
  motion-expressive: low
  # escape (contrast-dark + energy-restrained): luxury brand with genuinely distinct product lines or offerings that must coexist in the hero; each cell must use rich photography only — no icons, stats, or text-heavy elements
  # escape (energy-restrained + texture-high): maker with multiple distinct product categories where each deserves visual presence; all cells filled with craft photography, not icons or stats
  # note (energy-restrained + editorial): a brief requiring BentoHero is not an editorial-minimal brief — if both point in opposite directions, reconsider the aesthetic choice rather than overriding the component

visual-weight: heavy
content-density: rich
trend-alignment: trending
motion-profile: moderate

use-when:
  - SaaS or digital product with a visual interface worth showing
  - Bold Studio when product screenshots have strong visual personality
  - Multiple feature areas that benefit from simultaneous preview
  - The product has strong visual identity (charts, maps, dashboards, creative tools)

avoid-when:
  - Dark Luxury — bento grid reads as busy, not restrained
  - Warm Artisan — product-grid energy conflicts with handcrafted warmth
  - Service businesses with no product screenshots
  - When screenshots are unpolished or low-fidelity

pairs-well-with: [FeatureTabs, LogoStrip, StatsStrip]
pairs-poorly-with: [AlternatingRows — too product-heavy in sequence]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION, STAGGER } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface BentoItem {
  image: string;
  alt: string;
  label?: string;
  /** "wide" spans 2 cols, "tall" spans 2 rows, "default" = 1x1 */
  span?: "wide" | "tall" | "default";
}

interface BentoHeroProps {
  badge?: string;
  headline: string;
  subline: string;
  primaryCta: { label: string; href: string };
  secondaryCta?: { label: string; href: string };
  /** 4-6 bento items recommended */
  bentoItems: BentoItem[];
}

export function BentoHero({
  badge,
  headline,
  subline,
  primaryCta,
  secondaryCta,
  bentoItems,
}: BentoHeroProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    // Text stagger
    const textItems = ref.current.querySelectorAll("[data-animate]");
    gsap.set(textItems, { y: 24, opacity: 0 });
    gsap.to(textItems, {
      y: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: STAGGER.normal,
      ease: EASE.enter,
      delay: 0.15,
    });

    // Bento cards cascade in with scale
    const bentoCards = ref.current.querySelectorAll(".bento-card");
    gsap.set(bentoCards, { scale: 0.93, opacity: 0, y: 20 });
    gsap.to(bentoCards, {
      scale: 1, opacity: 1, y: 0,
      duration: DURATION.moderate,
      stagger: 0.07,
      ease: EASE.enter,
      delay: 0.4,
    });
  }, { scope: ref });

  return (
    <section
      ref={ref}
      id="hero"
      className="relative min-h-screen flex items-center bg-surface-primary overflow-hidden"
    >
      <div className="mx-auto max-w-7xl w-full px-6 grid grid-cols-1 gap-12 lg:grid-cols-2 lg:gap-16 items-center pt-32 pb-16 lg:pt-40 lg:pb-24">
        {/* Left: Text */}
        <div>
          {badge && (
            <span
              data-animate
              className="inline-block rounded-full bg-accent/10 px-4 py-1.5 text-caption font-semibold text-accent tracking-widest uppercase"
            >
              {badge}
            </span>
          )}
          <h1
            data-animate
            className="mt-6 font-display font-bold text-display-xl leading-[1.05] tracking-tight text-primary max-w-[20ch]"
          >
            {headline}
          </h1>
          <p
            data-animate
            className="mt-6 text-body-lg text-secondary max-w-[44ch] leading-relaxed"
          >
            {subline}
          </p>
          <div data-animate className="mt-10 flex flex-wrap gap-4">
            <a
              href={primaryCta.href}
              className="inline-flex items-center rounded-lg bg-accent px-7 py-3.5 text-body-sm font-semibold text-white transition-all duration-200 hover:bg-accent-light hover:scale-[1.02] active:scale-[0.98]"
            >
              {primaryCta.label}
            </a>
            {secondaryCta && (
              <a
                href={secondaryCta.href}
                className="inline-flex items-center rounded-lg border border-border px-7 py-3.5 text-body-sm font-medium text-primary transition-colors hover:bg-surface-secondary"
              >
                {secondaryCta.label}
              </a>
            )}
          </div>
        </div>

        {/* Right: Bento grid */}
        <div className="grid grid-cols-2 gap-3 auto-rows-[160px]">
          {bentoItems.map((item, i) => (
            <div
              key={i}
              className={`bento-card group relative overflow-hidden rounded-xl border border-border bg-surface-secondary transition-transform duration-300 hover:-translate-y-0.5 hover:shadow-md ${
                item.span === "wide" ? "col-span-2" : ""
              } ${item.span === "tall" ? "row-span-2" : ""}`}
            >
              <img
                src={item.image}
                alt={item.alt}
                className="h-full w-full object-cover object-top transition-transform duration-500 group-hover:scale-[1.02]"
              />
              {item.label && (
                <div className="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/50 to-transparent px-3 pb-2 pt-6">
                  <span className="text-caption font-medium text-white/80">{item.label}</span>
                </div>
              )}
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
```
