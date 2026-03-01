# SplitHeroPortrait

Text column left + full-height portrait photograph right. The portrait image is `min-h-screen object-cover` — it is not a landscape product shot but a tall, human-scale image. Specifically for refined-professional where the person is central to the brand.

```
---
component: SplitHeroPortrait
category: heroes
subtype: split-portrait

dimension-fit:
  contrast-dark: medium
  contrast-light: high
  energy-restrained: high
  energy-moderate: medium
  energy-energetic: low
  motion-minimal: high
  motion-moderate: low
  motion-expressive: low
  # escape (contrast-dark + energy-energetic): solo practitioner or founder whose personal energy and visual presence IS the brand's boldest claim — the portrait becomes the studio's most daring visual choice
  # escape (contrast-light + energy-moderate + technical): founder-led SaaS or practitioner-researcher where the human identity is the primary differentiator from competitors

visual-weight: medium
content-density: moderate
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - Refined Professional service business where the principal is the brand
  - Warm Artisan maker/craftsperson whose face is integral to trust
  - The image is a tall portrait photograph, not a landscape mockup
  - Personal brand, professional services, consulting, coaching

avoid-when:
  - Bold Studio — portrait reads too safe
  - Clean SaaS — product should be the visual, not a person
  - When you only have landscape/wide images (use SplitHero instead)

pairs-well-with: [StatsStrip, TestimonialGrid, AlternatingRows]
pairs-poorly-with: [TypeHero, CenteredHero]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { EASE, DURATION, STAGGER } from "@/lib/animations";

interface SplitHeroPortraitProps {
  badge?: string;
  headline: string;
  subline: string;
  primaryCta: { label: string; href: string };
  secondaryCta?: { label: string; href: string };
  /** Tall portrait image — ideally 2:3 or 3:4 aspect at source */
  portraitImage: string;
  portraitAlt: string;
  /** Optional trust line beneath CTAs — e.g. "15 years advising FTSE 500 companies" */
  trustLine?: string;
}

export function SplitHeroPortrait({
  badge,
  headline,
  subline,
  primaryCta,
  secondaryCta,
  portraitImage,
  portraitAlt,
  trustLine,
}: SplitHeroPortraitProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;
    const items = ref.current.querySelectorAll("[data-animate]");
    gsap.set(items, { y: 24, opacity: 0 });
    gsap.to(items, {
      y: 0,
      opacity: 1,
      duration: DURATION.moderate,
      stagger: STAGGER.normal,
      ease: EASE.enter,
      delay: 0.2,
    });

    // Portrait image: clip reveal from bottom
    const portrait = ref.current.querySelector(".portrait-image-wrap");
    if (portrait) {
      gsap.fromTo(portrait,
        { clipPath: "inset(100% 0 0 0)" },
        { clipPath: "inset(0% 0 0 0)", duration: 0.8, ease: "power4.inOut", delay: 0.1 }
      );
    }
  }, { scope: ref });

  return (
    <section
      ref={ref}
      id="hero"
      className="relative flex min-h-screen bg-surface-primary overflow-hidden"
    >
      {/* Text column */}
      <div className="flex items-start w-full max-w-7xl mx-auto px-6 grid grid-cols-1 lg:grid-cols-2">
        <div className="flex flex-col justify-start pt-40 pb-24 lg:pr-16">
          {badge && (
            <span
              data-animate
              className="inline-block text-caption font-semibold text-accent tracking-widest uppercase mb-8"
            >
              {badge}
            </span>
          )}
          <h1
            data-animate
            className="font-display font-bold text-display-xl leading-[1.05] tracking-tight text-primary max-w-[20ch]"
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
          {trustLine && (
            <p data-animate className="mt-8 text-caption text-secondary">
              {trustLine}
            </p>
          )}
        </div>

        {/* Portrait image column — full height, no rounding, edge-to-edge */}
        <div className="portrait-image-wrap hidden lg:block relative min-h-screen">
          <img
            src={portraitImage}
            alt={portraitAlt}
            className="absolute inset-0 h-full w-full object-cover object-top"
            width={800}
            height={1200}
          />
          {/* Subtle fade into background on left edge */}
          <div className="absolute inset-y-0 left-0 w-24 bg-gradient-to-r from-surface-primary to-transparent" />
        </div>
      </div>
    </section>
  );
}
```
