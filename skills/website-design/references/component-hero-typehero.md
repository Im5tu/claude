# TypeHero

Typography IS the visual. Oversized headline fills most of the viewport. Three-zone flex-col layout: label at top, headline in the middle zone, subline and CTA at the bottom. No background image — ever.

```
---
component: TypeHero
category: heroes
subtype: typographic-statement

dimension-fit:
  contrast-dark: medium
  contrast-light: low
  energy-restrained: low
  energy-moderate: medium
  energy-energetic: high
  motion-minimal: low
  motion-moderate: high
  motion-expressive: medium
  # escape (contrast-light + energy-restrained): thought-leadership or philosophy-first firm where the founding conviction IS the credibility signal, and no photography or product visual exists
  # escape (energy-restrained + texture-high): brand whose primary offering is ideas, words, or coaching — where typography IS the craft demonstration and imagery would misrepresent the product

visual-weight: heavy
content-density: sparse
trend-alignment: trending
motion-profile: moderate

use-when:
  - The brand's typography IS the identity
  - Bold Studio preset — kinetic, oversized, warehouse-gallery energy
  - Single powerful concept that needs no supporting image
  - Dark Luxury when the statement alone is enough atmosphere

avoid-when:
  - Refined Professional — oversized type reads as aggressive, not authoritative
  - Warm Artisan — impersonal, lacks human warmth
  - Clean SaaS unless the product itself is exceptionally high-concept
  - NEVER add a background image or photograph to this variant

pairs-well-with: [StatsStrip, AlternatingRows, FeaturedTestimonial]
pairs-poorly-with: [SplitHero — cannot follow with an immediately conventional layout]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface TypeHeroProps {
  /** Small overline label — e.g., "Est. 2019" or "Design Studio" */
  label: string;
  /** The main headline — make it short and powerful */
  headline: string;
  /** The accent keyword within the headline to colorize */
  accentWord?: string;
  subline: string;
  primaryCta: { label: string; href: string };
  secondaryCta?: { label: string; href: string };
}

export function TypeHero({
  label,
  headline,
  accentWord,
  subline,
  primaryCta,
  secondaryCta,
}: TypeHeroProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    // Label fades in first
    const labelEl = ref.current.querySelector(".type-hero-label");
    if (labelEl) {
      gsap.fromTo(labelEl, { opacity: 0, y: 12 }, {
        opacity: 1, y: 0,
        duration: DURATION.moderate,
        ease: EASE.enter,
        delay: 0.1,
      });
    }

    // Headline words reveal upward — clip mask technique
    const words = ref.current.querySelectorAll(".type-hero-word");
    gsap.fromTo(words,
      { y: "105%", opacity: 0 },
      {
        y: "0%",
        opacity: 1,
        duration: 0.65,
        stagger: 0.06,
        ease: "power4.out",
        delay: 0.25,
      }
    );

    // Bottom zone: subline + CTAs
    const bottom = ref.current.querySelectorAll("[data-bottom-animate]");
    gsap.fromTo(bottom,
      { opacity: 0, y: 16 },
      {
        opacity: 1, y: 0,
        duration: DURATION.moderate,
        stagger: 0.08,
        ease: EASE.enter,
        delay: 0.7,
      }
    );
  }, { scope: ref });

  // Split headline into words for reveal
  const words = headline.split(" ");

  return (
    <section
      ref={ref}
      id="hero"
      className="relative min-h-screen flex flex-col bg-surface-primary"
    >
      {/* Zone 1: Label — top */}
      <div className="px-6 pt-32 lg:pt-40">
        <span className="type-hero-label inline-block text-caption font-semibold text-secondary tracking-widest uppercase opacity-0">
          {label}
        </span>
      </div>

      {/* Zone 2: Headline — middle, starts at justify-start with top padding */}
      <div className="flex-1 flex items-start px-6 pt-12 lg:pt-16">
        <h1
          className="font-display font-bold leading-[0.92] tracking-tight text-primary"
          style={{ fontSize: "clamp(80px, 14vw, 220px)" }}
        >
          {words.map((word, i) => {
            const isAccent = accentWord && word.toLowerCase().replace(/[.,!?;:]$/, "") === accentWord.toLowerCase();
            return (
              <span key={i} className="inline-block overflow-hidden align-bottom">
                <span
                  className={`type-hero-word inline-block ${
                    isAccent ? "text-accent italic" : ""
                  }`}
                >
                  {word}
                  {i < words.length - 1 && "\u00A0"}
                </span>
              </span>
            );
          })}
        </h1>
      </div>

      {/* Zone 3: Subline + CTA — bottom */}
      <div className="px-6 pb-10 flex flex-col sm:flex-row sm:items-end sm:justify-between gap-8">
        <p
          data-bottom-animate
          className="text-body-lg text-secondary max-w-[44ch] leading-relaxed opacity-0"
        >
          {subline}
        </p>
        <div data-bottom-animate className="flex flex-wrap gap-4 shrink-0 opacity-0">
          <a
            href={primaryCta.href}
            className="inline-flex items-center rounded-lg bg-primary px-7 py-3.5 text-body-sm font-semibold text-white transition-all duration-200 hover:opacity-80 hover:scale-[1.02] active:scale-[0.98]"
          >
            {primaryCta.label}
          </a>
          {secondaryCta && (
            <a
              href={secondaryCta.href}
              className="inline-flex items-center rounded-lg border border-border px-7 py-3.5 text-body-sm font-medium text-primary transition-all duration-200 hover:bg-surface-secondary"
            >
              {secondaryCta.label}
            </a>
          )}
        </div>
      </div>
    </section>
  );
}
```
