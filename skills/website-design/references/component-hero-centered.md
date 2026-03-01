# CenteredHero

Centered editorial hero. Typography-first. Headline at minimum `clamp(100px, 14vw, 180px)`. For editorial-minimal only — deliberate whitespace, type as design. No decorative shapes unless they are typographic.

```
---
component: CenteredHero
category: heroes
subtype: centered-editorial

dimension-fit:
  contrast-dark: low
  contrast-light: high
  energy-restrained: high
  energy-moderate: low
  energy-energetic: low
  motion-minimal: high
  motion-moderate: low
  motion-expressive: low
  # escape (contrast-dark + energy-energetic): a flagship statement or manifesto page where deliberate restraint within a bold identity is the strategic choice — the centered silence IS the power move
  # escape (energy-restrained + texture-high): a founding statement or craft philosophy as the sole hero content, with a subtle decorative typographic character as the only visual, on a warm-toned surface
# escape: brand's entire value proposition is a single declaration of restraint (luxury goods, private membership) AND no photography is available AND the emptiness is intended as negative-space confidence

visual-weight: light
content-density: sparse
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - Editorial-minimal preset — content-first, type-as-design
  - The brand's primary differentiator is its writing or intellectual position
  - Magazine, publisher, design studio, thought-leadership brand
  - When generous whitespace and type scale carry the whole section

avoid-when:
  - Bold Studio — centered layout reads as too polished/conventional for warehouse energy
  - Warm Artisan — needs human warmth, not typographic cool
  - When the brand needs a visual anchor (image, product, or animation)

pairs-well-with: [MagazineGrid, StackedValueProps, FeaturedTestimonial]
pairs-poorly-with: [BentoHero, GradientMeshHero — tone clash]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { EASE, DURATION } from "@/lib/animations";

interface CenteredHeroProps {
  /** Small issue/category label — e.g. "Issue 04" or "Design Practice" */
  issue?: string;
  headline: string;
  subline: string;
  primaryCta?: { label: string; href: string };
  /** Optional abstract typographic decoration — e.g. a large numeral or ligature */
  decorativeChar?: string;
}

export function CenteredHero({
  issue,
  headline,
  subline,
  primaryCta,
  decorativeChar,
}: CenteredHeroProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    // Decorative character — very slow, almost imperceptible entrance
    const deco = ref.current.querySelector(".centered-deco");
    if (deco) {
      gsap.fromTo(deco, { opacity: 0 }, { opacity: 1, duration: 2, ease: "none", delay: 0.1 });
    }

    // Issue label
    const issueEl = ref.current.querySelector(".centered-issue");
    if (issueEl) {
      gsap.fromTo(issueEl, { opacity: 0 }, { opacity: 1, duration: DURATION.moderate, ease: EASE.enter, delay: 0.3 });
    }

    // Headline — line by line (treat each line break as a unit)
    const headlineWords = ref.current.querySelectorAll(".centered-word");
    gsap.fromTo(headlineWords,
      { y: "110%", opacity: 0 },
      {
        y: "0%",
        opacity: 1,
        duration: 0.7,
        stagger: 0.05,
        ease: "power4.out",
        delay: 0.5,
      }
    );

    // Subline + CTA
    const bottom = ref.current.querySelectorAll("[data-centered-bottom]");
    gsap.fromTo(bottom,
      { opacity: 0, y: 12 },
      { opacity: 1, y: 0, duration: DURATION.moderate, stagger: 0.1, ease: EASE.enter, delay: 1.0 }
    );
  }, { scope: ref });

  const words = headline.split(" ");

  return (
    <section
      ref={ref}
      id="hero"
      className="relative min-h-screen flex flex-col items-center justify-center bg-surface-primary px-6 text-center overflow-hidden pt-32 pb-16"
    >
      {/* Decorative large character — purely typographic, very low opacity */}
      {decorativeChar && (
        <span
          className="centered-deco pointer-events-none absolute inset-0 flex items-center justify-center font-display font-bold text-primary/[0.04] select-none"
          style={{ fontSize: "clamp(300px, 50vw, 600px)", lineHeight: 1 }}
          aria-hidden="true"
        >
          {decorativeChar}
        </span>
      )}

      <div className="relative z-10 max-w-5xl mx-auto">
        {issue && (
          <p className="centered-issue text-caption font-semibold text-secondary tracking-widest uppercase mb-10 opacity-0">
            {issue}
          </p>
        )}

        <h1
          className="font-display font-bold leading-[0.95] tracking-tight text-primary"
          style={{ fontSize: "clamp(100px, 14vw, 180px)" }}
        >
          {words.map((word, i) => (
            <span key={i} className="inline-block overflow-hidden align-bottom">
              <span className="centered-word inline-block">
                {word}
                {i < words.length - 1 && "\u00A0"}
              </span>
            </span>
          ))}
        </h1>

        {/* Thin rule — editorial signature */}
        <div
          data-centered-bottom
          className="mx-auto mt-12 h-px w-16 bg-border opacity-0"
        />

        <p
          data-centered-bottom
          className="mx-auto mt-8 max-w-[52ch] text-body-lg text-secondary leading-relaxed opacity-0"
        >
          {subline}
        </p>

        {primaryCta && (
          <a
            data-centered-bottom
            href={primaryCta.href}
            className="inline-block mt-10 text-body-sm font-medium text-primary underline underline-offset-4 decoration-border hover:decoration-primary transition-colors opacity-0"
          >
            {primaryCta.label} &rarr;
          </a>
        )}
      </div>
    </section>
  );
}
```
