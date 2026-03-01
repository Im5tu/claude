# StackedValueProps

Vertical stack of 3-4 rows. Each row: large decorative static number + divider line + short description beside it. Full width. Typographic hierarchy carries the whole section — no images needed. For brands where authority is communicated through restraint.

```
---
component: StackedValueProps
category: content
subtype: numbered-value-stack

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: low
  energy-energetic: medium
visual-weight: light
content-density: moderate
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - Refined Professional or Editorial Minimal where typography does the heavy lifting
  - Dark Luxury with 3-4 core philosophy or service statements
  - The brand can be distilled into 3-4 powerful one-line propositions
  - You want authoritative weight without photography or illustrations

avoid-when:
  - Clean SaaS — product features need screenshots, not typography alone
  - Warm Artisan — the architectural coolness conflicts with human warmth
  - When you have more than 4 items (the stack becomes a list, not a statement)

pairs-well-with: [FeaturedTestimonial, CenteredHero, MagazineGrid]
pairs-poorly-with: [BentoGrid, IconGrid — both carry numerical/icon weight]
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

interface ValueProp {
  /** Static decorative label — e.g. "01", "I", "A" */
  marker: string;
  headline: string;
  description: string;
  /** Optional link — rendered as "Learn more →" */
  href?: string;
}

interface StackedValuePropsProps {
  eyebrow?: string;
  props: ValueProp[];
}

export function StackedValueProps({ eyebrow, props }: StackedValuePropsProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    const rows = ref.current.querySelectorAll(".value-row");
    gsap.set(rows, { y: 24, opacity: 0 });
    gsap.to(rows, {
      y: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: 0.1,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 75%",
        toggleActions: "play none none none",
      },
    });

    // Lines draw across
    const lines = ref.current.querySelectorAll(".value-line");
    gsap.set(lines, { scaleX: 0, transformOrigin: "left center" });
    gsap.to(lines, {
      scaleX: 1,
      duration: 0.7,
      stagger: 0.12,
      ease: "power3.out",
      scrollTrigger: {
        trigger: ref.current,
        start: "top 75%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-primary">
      <div className="mx-auto max-w-7xl px-6">
        {eyebrow && (
          <p className="text-caption font-semibold text-accent tracking-widest uppercase mb-12">
            {eyebrow}
          </p>
        )}

        <div className="divide-y divide-border">
          {props.map((prop, i) => (
            <div
              key={i}
              className="value-row grid grid-cols-1 gap-6 py-10 lg:grid-cols-12 lg:gap-12 lg:items-start"
            >
              {/* Decorative marker — static text, never CounterTicker */}
              <div className="lg:col-span-2">
                <span
                  className="font-display font-bold text-primary/15 leading-none select-none"
                  style={{ fontSize: "clamp(3rem, 5vw, 5rem)" }}
                  aria-hidden="true"
                >
                  {prop.marker}
                </span>
              </div>

              {/* Divider line — animates */}
              <div className="hidden lg:col-span-1 lg:flex lg:items-center">
                <div className="value-line h-px w-full bg-border" />
              </div>

              {/* Content */}
              <div className="lg:col-span-9">
                <h3 className="font-display font-semibold text-h2 leading-tight tracking-tight text-primary">
                  {prop.headline}
                </h3>
                <p className="mt-3 text-body-lg text-secondary max-w-[60ch] leading-relaxed">
                  {prop.description}
                </p>
                {prop.href && (
                  <a
                    href={prop.href}
                    className="mt-5 inline-block text-body-sm font-medium text-accent underline underline-offset-4 decoration-accent/30 hover:decoration-accent transition-colors"
                  >
                    Learn more &rarr;
                  </a>
                )}
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
```
