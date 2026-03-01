# VerticalTimeline

Alternating left/right entries along a center vertical line. Each entry: date, title, description, optional small image. For about pages, company history, personal brand origin stories, transformation narratives.

```
---
component: VerticalTimeline
category: process
subtype: vertical-alternating-timeline

dimension-fit:
  contrast-dark: medium
  contrast-light: high
  energy-restrained: high
  energy-moderate: low
  energy-energetic: low
visual-weight: medium
content-density: rich
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - About page company history or founding story
  - Personal brand — "my journey" narrative
  - Brand where time and accumulated experience are a primary differentiator — the dates and milestones are themselves the evidence
  - Transformation narrative where the client's or brand's state changes meaningfully at each stage (see §3a HOW-THEY-WORK disambiguation)

avoid-when:
  - Homepage as main process section (HorizontalTimeline or NumberedSteps is better)
  - Bold Studio — the alternating rhythm feels too conventional
  - Clean SaaS — product timelines are better as numbered steps

pairs-well-with: [FeaturedTestimonial, StatsStrip, CaseStudyTeaser]
pairs-poorly-with: [NumberedSteps in the same section — both are sequential step patterns]
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

interface TimelineEntry {
  date: string;
  title: string;
  description: string;
  image?: string;
  imageAlt?: string;
}

interface VerticalTimelineProps {
  eyebrow?: string;
  headline: string;
  entries: TimelineEntry[];
}

function TimelineEntry({ entry, index }: { entry: TimelineEntry; index: number }) {
  const entryRef = useRef<HTMLDivElement>(null);
  const isLeft = index % 2 === 0;

  useGSAP(() => {
    if (!entryRef.current) return;
    gsap.set(entryRef.current, { x: isLeft ? -32 : 32, opacity: 0 });
    gsap.to(entryRef.current, {
      x: 0, opacity: 1,
      duration: DURATION.moderate,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: entryRef.current,
        start: "top 80%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: entryRef });

  return (
    <div
      ref={entryRef}
      className={`relative grid grid-cols-1 gap-6 pb-14 lg:grid-cols-2 lg:gap-12 ${
        !isLeft ? "lg:[&>div:first-child]:col-start-2" : ""
      }`}
    >
      {/* Content card */}
      <div className={`lg:col-span-1 ${!isLeft ? "lg:col-start-1 lg:row-start-1 lg:text-right" : ""}`}>
        <p className="text-caption font-mono font-semibold text-accent tracking-wider uppercase mb-3">
          {entry.date}
        </p>
        <h3 className="font-display font-semibold text-h3 leading-tight text-primary mb-3">
          {entry.title}
        </h3>
        <p className="text-body text-secondary leading-relaxed max-w-[50ch]">
          {entry.description}
        </p>
        {entry.image && (
          <div className={`mt-5 overflow-hidden rounded-xl ${!isLeft ? "lg:ml-auto" : ""}`}>
            <img
              src={entry.image}
              alt={entry.imageAlt ?? ""}
              className="w-full object-cover aspect-[16/9] max-w-sm"
              width={400}
              height={225}
            />
          </div>
        )}
      </div>

      {/* Dot on center line — desktop */}
      <div className="absolute left-4 top-1 lg:left-1/2 lg:-translate-x-1/2 h-4 w-4 rounded-full bg-accent ring-4 ring-surface-primary z-10" aria-hidden="true" />
    </div>
  );
}

export function VerticalTimeline({ eyebrow, headline, entries }: VerticalTimelineProps) {
  const ref = useRef<HTMLElement>(null);

  // Header entrance
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
  }, { scope: ref });

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-primary">
      <div className="mx-auto max-w-5xl px-6">
        {/* Header */}
        <div className="mb-16 max-w-[48ch]">
          {eyebrow && (
            <p data-header className="text-caption font-semibold text-accent tracking-widest uppercase mb-4">
              {eyebrow}
            </p>
          )}
          <h2 data-header className="font-display font-bold text-h1 leading-tight tracking-tight text-primary">
            {headline}
          </h2>
        </div>

        {/* Timeline */}
        <div className="relative">
          {/* Center vertical line — desktop */}
          <div
            className="absolute left-[1.125rem] top-0 bottom-0 w-px bg-border lg:left-1/2 lg:-translate-x-1/2"
            aria-hidden="true"
          />

          <div className="space-y-0 pl-10 lg:pl-0">
            {entries.map((entry, i) => (
              <TimelineEntry key={i} entry={entry} index={i} />
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
```
