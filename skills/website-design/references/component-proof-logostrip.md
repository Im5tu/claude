# LogoStrip

Grayscale client or partner logos in a row. Images only — never plain text company names. Two variants: static row and infinite marquee scroll. Both: grayscale 50% opacity at rest, full color + 100% opacity on hover.

```
---
component: LogoStrip
category: proof
subtype: client-logo-row

dimension-fit:
  contrast-dark: medium
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: medium
visual-weight: light
content-density: sparse
trend-alignment: evergreen
motion-profile: none

use-when:
  - Immediately after the hero — the fastest credibility signal
  - Whenever "trusted by" logos are available (minimum 5)
  - Any preset — logos adapt visually via grayscale treatment

avoid-when:
  - You don't have actual logo assets (text-only company names are BANNED)
  - Fewer than 5 logos (looks sparse — add more or skip the section)

pairs-well-with: [SplitHero, StatsStrip, TestimonialGrid]
pairs-poorly-with: [CaseStudyTeaser — two client-reference sections in sequence]
---
```

> **LOGO RULES — Non-negotiable:**
> - ALL logos must be `<img>` elements with real image src. SVG inline or img tag.
> - Text-only company names are BANNED (see anti-patterns)
> - Grayscale 50% at rest: `grayscale opacity-50`
> - Full color on hover: `hover:grayscale-0 hover:opacity-100`

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface Logo {
  name: string;
  /** Image src — required. Must be a real image file, not text. */
  src: string;
  /** Optional width override */
  width?: number;
  /** Optional link */
  href?: string;
}

interface LogoStripProps {
  label?: string;
  logos: Logo[];
}

/** Static row — logos fade in on scroll */
export function LogoStrip({ label, logos }: LogoStripProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    const items = ref.current.querySelectorAll(".logo-item");
    gsap.set(items, { y: 12, opacity: 0 });
    gsap.to(items, {
      y: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: 0.05,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 85%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  return (
    <section ref={ref} className="py-8 lg:py-12 bg-surface-primary">
      <div className="mx-auto max-w-7xl px-6">
        {label && (
          <p className="text-center text-caption font-medium text-disabled uppercase tracking-widest mb-8">
            {label}
          </p>
        )}
        <div className="flex flex-wrap items-center justify-center gap-x-12 gap-y-8">
          {logos.map((logo) => {
            const Content = (
              <img
                src={logo.src}
                alt={logo.name}
                className="h-7 object-contain grayscale opacity-50 transition-all duration-300 hover:grayscale-0 hover:opacity-100"
                width={logo.width ?? 120}
                height={28}
              />
            );
            return (
              <div key={logo.name} className="logo-item">
                {logo.href ? (
                  <a href={logo.href} aria-label={logo.name} className="block">
                    {Content}
                  </a>
                ) : (
                  Content
                )}
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}

/**
 * MarqueeLogoStrip — infinitely scrolling logo marquee.
 * Uses CSS animation — no GSAP needed.
 * Logos are duplicated to create a seamless loop.
 */
export function MarqueeLogoStrip({ label, logos }: LogoStripProps) {
  // Duplicate logos for seamless loop
  const doubled = [...logos, ...logos];

  return (
    <section className="py-8 lg:py-12 bg-surface-primary overflow-hidden">
      {label && (
        <p className="text-center text-caption font-medium text-disabled uppercase tracking-widest mb-8 px-6">
          {label}
        </p>
      )}

      {/* Mask edges for fade-out effect */}
      <div
        className="relative"
        style={{
          maskImage: "linear-gradient(to right, transparent, black 10%, black 90%, transparent)",
          WebkitMaskImage: "linear-gradient(to right, transparent, black 10%, black 90%, transparent)",
        }}
      >
        <div
          className="flex items-center gap-x-14 w-max"
          style={{
            animation: "marquee 30s linear infinite",
          }}
        >
          {doubled.map((logo, i) => (
            <img
              key={`${logo.name}-${i}`}
              src={logo.src}
              alt={logo.name}
              aria-hidden={i >= logos.length} // hide duplicates from screen readers
              className="h-7 object-contain grayscale opacity-50 transition-all duration-300 hover:grayscale-0 hover:opacity-100 shrink-0"
              width={logo.width ?? 120}
              height={28}
            />
          ))}
        </div>
      </div>

      {/* Marquee keyframes — add to globals.css if not already present */}
      {/* @keyframes marquee { from { transform: translateX(0); } to { transform: translateX(-50%); } } */}
    </section>
  );
}
```

> **Add to `globals.css`:**
> ```css
> @keyframes marquee {
>   from { transform: translateX(0); }
>   to { transform: translateX(-50%); }
> }
> ```
