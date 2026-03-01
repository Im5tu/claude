# AlternatingRows

Full-viewport-width rows with image and text alternating sides. Each row is a considered piece of real estate — not a card, but a section-within-a-section. For brands with rich imagery and content that needs room to breathe.

```
---
component: AlternatingRows
category: content
subtype: alternating-image-text

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: medium
visual-weight: medium
content-density: moderate
trend-alignment: evergreen
motion-profile: moderate

use-when:
  - 2-4 distinct service or feature areas each with their own image
  - Brand needs to show depth — each row tells its own story
  - Refined Professional or Warm Artisan where trust is built line by line
  - Dark Luxury features section where each feature deserves full-width respect

avoid-when:
  - More than 5 rows (page becomes exhausting — use FeatureTabs instead)
  - When the images are of poor quality or all look similar (breaks the per-row story)
  - Bold Studio as primary features section — too rhythmic and conventional

pairs-well-with: [BentoGrid as earlier section, StatsStrip as break, CaseStudyTeaser]
pairs-poorly-with: [SplitHero as immediate follow — both have side-by-side layouts]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION } from "@/lib/animations";
import { ImageClipReveal } from "@/components/animations/image-clip-reveal";

gsap.registerPlugin(ScrollTrigger);

interface FeaturePoint {
  text: string;
}

interface AlternatingRow {
  eyebrow: string;
  headline: string;
  description: string;
  features: FeaturePoint[];
  cta?: { label: string; href: string };
  image: string;
  imageAlt: string;
}

interface AlternatingRowsProps {
  rows: AlternatingRow[];
}

function Row({ row, index }: { row: AlternatingRow; index: number }) {
  const rowRef = useRef<HTMLDivElement>(null);
  const isEven = index % 2 === 0;

  useGSAP(() => {
    if (!rowRef.current) return;

    const textItems = rowRef.current.querySelectorAll("[data-row-text]");
    gsap.set(textItems, { x: isEven ? -24 : 24, opacity: 0 });
    gsap.to(textItems, {
      x: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: 0.07,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: rowRef.current,
        start: "top 75%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: rowRef });

  return (
    <div
      ref={rowRef}
      className={`flex flex-col gap-12 lg:gap-20 lg:flex-row items-center py-16 lg:py-24 ${
        !isEven ? "lg:flex-row-reverse" : ""
      }`}
    >
      {/* Image */}
      <div className="w-full lg:w-1/2">
        <ImageClipReveal direction={isEven ? "left" : "up"} className="overflow-hidden rounded-2xl shadow-lg">
          <img
            src={row.image}
            alt={row.imageAlt}
            className="w-full object-cover aspect-[4/3]"
            width={800}
            height={600}
          />
        </ImageClipReveal>
      </div>

      {/* Text */}
      <div className={`w-full lg:w-1/2 ${isEven ? "lg:pl-4" : "lg:pr-4"}`}>
        <p
          data-row-text
          className="text-caption font-semibold text-accent tracking-widest uppercase mb-4"
        >
          {row.eyebrow}
        </p>
        <h2
          data-row-text
          className="font-display font-bold text-h1 leading-tight tracking-tight text-primary max-w-[24ch]"
        >
          {row.headline}
        </h2>
        <p
          data-row-text
          className="mt-5 text-body-lg text-secondary max-w-[50ch] leading-relaxed"
        >
          {row.description}
        </p>
        {row.features.length > 0 && (
          <ul data-row-text className="mt-6 space-y-3">
            {row.features.map((f, i) => (
              <li key={i} className="flex items-start gap-3">
                <span className="mt-1 inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-accent/10 text-accent">
                  <svg width="10" height="10" viewBox="0 0 10 10" fill="none" aria-hidden="true">
                    <path d="M2 5l2.5 2.5L8 2.5" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                  </svg>
                </span>
                <span className="text-body text-secondary">{f.text}</span>
              </li>
            ))}
          </ul>
        )}
        {row.cta && (
          <div data-row-text className="mt-8">
            <a
              href={row.cta.href}
              className="inline-flex items-center gap-2 rounded-lg border border-border px-6 py-3 text-body-sm font-medium text-primary transition-all duration-200 hover:bg-surface-secondary hover:border-border-strong"
            >
              {row.cta.label}
              <svg width="14" height="14" viewBox="0 0 14 14" fill="none" aria-hidden="true">
                <path d="M3 7h8M7 3l4 4-4 4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
              </svg>
            </a>
          </div>
        )}
      </div>
    </div>
  );
}

export function AlternatingRows({ rows }: AlternatingRowsProps) {
  return (
    <section className="bg-surface-primary">
      <div className="mx-auto max-w-7xl px-6 divide-y divide-border">
        {rows.map((row, i) => (
          <Row key={i} row={row} index={i} />
        ))}
      </div>
    </section>
  );
}
```
