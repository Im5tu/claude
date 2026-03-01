# SplitHero

Text left / image right. 55/45 split. Full viewport height. The default hero for professional and artisan brands where the visual supports the text rather than dominating it.

```
---
component: SplitHero
category: heroes
subtype: split-text-image

dimension-fit:
  contrast-dark: low
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: low
  motion-minimal: high
  motion-moderate: low
  motion-expressive: low

visual-weight: medium
content-density: moderate
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - Brand has a strong product image or lifestyle photograph
  - Content needs equal visual and text weight
  - Professional services, SaaS products, artisan businesses
  - The headline needs to be read before the visual is consumed

avoid-when:
  - The image is a wide landscape (use FullBleedImageHero instead)
  - Bold Studio preset — the split reads as too safe/conventional
  - Dark Luxury — image deserves full bleed treatment

pairs-well-with: [LogoStrip, BentoGrid, AlternatingRows]
pairs-poorly-with: [AlternatingRows as immediate next section — too visually similar]
---
```

> For SaaS/technical contexts where the hero is immediately followed by a product/feature section, prefer `min-h-[75vh]` over `min-h-screen` — full viewport height creates awkward whitespace above the fold transition when the next section is dense.

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { EASE, DURATION, STAGGER } from "@/lib/animations";
import { ImageClipReveal } from "@/components/animations/image-clip-reveal";

interface SplitHeroProps {
  badge?: string;
  headline: string;
  subline: string;
  primaryCta: { label: string; href: string };
  secondaryCta?: { label: string; href: string };
  image: string;
  imageAlt: string;
  /** Flip layout: image left, text right */
  reverse?: boolean;
}

export function SplitHero({
  badge,
  headline,
  subline,
  primaryCta,
  secondaryCta,
  image,
  imageAlt,
  reverse = false,
}: SplitHeroProps) {
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
      delay: 0.15,
    });
  }, { scope: ref });

  return (
    <section
      ref={ref}
      id="hero"
      className="relative min-h-screen flex items-center bg-surface-primary overflow-hidden"
    >
      <div
        className={`mx-auto max-w-7xl w-full px-6 grid grid-cols-1 gap-12 lg:gap-0 items-center lg:grid-cols-11 pt-32 pb-16 lg:pt-40 lg:pb-24 ${
          reverse ? "lg:flex-row-reverse" : ""
        }`}
      >
        {/* Text column — 6 of 11 cols */}
        <div className={`lg:col-span-6 ${reverse ? "lg:order-2 lg:pl-16" : "lg:pr-16"}`}>
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
            className="mt-6 font-display font-bold text-display-xl leading-[1.05] tracking-tight text-primary max-w-[22ch]"
          >
            {headline}
          </h1>
          <p
            data-animate
            className="mt-6 text-body-lg text-secondary max-w-[48ch] leading-relaxed"
          >
            {subline}
          </p>
          <div data-animate className="mt-10 flex flex-wrap gap-4">
            <a
              href={primaryCta.href}
              className="inline-flex items-center rounded-lg bg-accent px-7 py-3.5 text-body-sm font-semibold text-white transition-all duration-200 hover:bg-accent-light hover:scale-[1.02] active:scale-[0.98] shadow-sm hover:shadow-md"
            >
              {primaryCta.label}
            </a>
            {secondaryCta && (
              <a
                href={secondaryCta.href}
                className="inline-flex items-center rounded-lg border border-border px-7 py-3.5 text-body-sm font-medium text-primary transition-all duration-200 hover:bg-surface-secondary hover:border-border-strong"
              >
                {secondaryCta.label}
              </a>
            )}
          </div>
        </div>

        {/* Image column — 5 of 11 cols */}
        <div className={`lg:col-span-5 ${reverse ? "lg:order-1" : ""}`}>
          <ImageClipReveal direction="up" className="overflow-hidden rounded-2xl shadow-xl">
            <img
              src={image}
              alt={imageAlt}
              className="w-full h-auto object-cover aspect-[4/3]"
              width={900}
              height={675}
            />
          </ImageClipReveal>
        </div>
      </div>
    </section>
  );
}
```
