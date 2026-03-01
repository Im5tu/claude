# HorizontalTimeline

Steps connected by a horizontal timeline line. Pinned on desktop — as the user scrolls, timeline items reveal from left to right. Each step: dot on line + date or label + title + description. For orderly, time-anchored sequences.

```
---
component: HorizontalTimeline
category: process
subtype: horizontal-timeline-scroll

dimension-fit:
  contrast-dark: medium
  contrast-light: high
  energy-restrained: high
  energy-moderate: medium
  energy-energetic: medium
visual-weight: medium
content-density: moderate
trend-alignment: trending
motion-profile: moderate

use-when:
  - Phase-based project delivery or roadmap (Phase 1, 2, 3...)
  - Editorial brand with a clear chronological narrative
  - Refined Professional onboarding or engagement timeline
  - When the scroll interaction adds genuine meaning (time passing as you scroll)

avoid-when:
  - Warm Artisan — the pinning/scroll mechanism feels too tech-forward
  - More than 6 steps — horizontal scroll becomes hard to navigate
  - Mobile-heavy audiences (horizontal scroll pinning degrades gracefully but loses impact)

pairs-well-with: [FeaturedTestimonial, StatsStrip, AlternatingRows]
pairs-poorly-with: [AccordionProcess — both are interactive sequential reveals]
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

interface TimelineStep {
  /** Date, phase, or label — e.g. "Week 1" or "2019" */
  period: string;
  title: string;
  description: string;
}

interface HorizontalTimelineProps {
  eyebrow?: string;
  headline: string;
  steps: TimelineStep[];
}

export function HorizontalTimeline({ eyebrow, headline, steps }: HorizontalTimelineProps) {
  const ref = useRef<HTMLElement>(null);
  const trackRef = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    if (!ref.current || !trackRef.current) return;

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

    // On desktop: pin the section and scroll the track horizontally
    const isDesktop = window.matchMedia("(min-width: 1024px)").matches;
    if (isDesktop) {
      const totalScrollWidth = trackRef.current.scrollWidth - trackRef.current.clientWidth;

      ScrollTrigger.create({
        trigger: ref.current,
        start: "top top",
        end: () => `+=${totalScrollWidth + 200}`,
        pin: true,
        scrub: 1,
        animation: gsap.to(trackRef.current, {
          x: -totalScrollWidth,
          ease: "none",
        }),
      });
    }

    // Individual step reveals
    const stepEls = ref.current.querySelectorAll(".timeline-step");
    gsap.set(stepEls, { y: 24, opacity: 0 });
    gsap.to(stepEls, {
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

    // Timeline line draws
    const line = ref.current.querySelector<HTMLDivElement>(".timeline-line-fill");
    if (line) {
      gsap.set(line, { scaleX: 0, transformOrigin: "left center" });
      gsap.to(line, {
        scaleX: 1,
        duration: 1.0,
        ease: "power3.out",
        scrollTrigger: {
          trigger: ref.current,
          start: "top 75%",
          toggleActions: "play none none none",
        },
      });
    }
  }, { scope: ref });

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-primary overflow-hidden">
      <div className="mx-auto max-w-7xl px-6">
        {/* Header */}
        <div className="mb-16">
          {eyebrow && (
            <p data-header className="text-caption font-semibold text-accent tracking-widest uppercase mb-4">
              {eyebrow}
            </p>
          )}
          <h2 data-header className="font-display font-bold text-h1 leading-tight tracking-tight text-primary max-w-[36ch]">
            {headline}
          </h2>
        </div>
      </div>

      {/* Scrollable track */}
      <div ref={trackRef} className="px-6 lg:px-0 lg:pl-[calc((100vw-80rem)/2+1.5rem)]">
        {/* Horizontal line */}
        <div className="relative mb-10 hidden lg:block">
          <div className="h-px bg-border w-full" />
          <div className="timeline-line-fill absolute inset-0 h-px bg-accent" />
        </div>

        <div className="flex flex-col gap-12 lg:flex-row lg:gap-0 lg:items-start">
          {steps.map((step, i) => (
            <div
              key={i}
              className="timeline-step relative lg:min-w-[280px] lg:max-w-[320px] lg:mr-12 lg:pr-12 lg:border-r lg:border-border last:border-0"
            >
              {/* Dot on line — desktop only */}
              <div
                className="hidden lg:block absolute -top-[calc(2.5rem+2px)] left-0 h-4 w-4 rounded-full bg-accent ring-4 ring-surface-primary"
                aria-hidden="true"
              />

              {/* Mobile connector */}
              {i < steps.length - 1 && (
                <div className="lg:hidden absolute left-1.5 top-8 bottom-0 w-px bg-border" aria-hidden="true" />
              )}

              {/* Mobile dot */}
              <div className="lg:hidden absolute left-0 top-1 h-3 w-3 rounded-full bg-accent ring-2 ring-surface-primary" aria-hidden="true" />

              <div className="lg:pl-0 pl-7">
                <p className="text-caption font-mono font-semibold text-accent tracking-wider uppercase mb-3">
                  {step.period}
                </p>
                <h3 className="font-display font-semibold text-h3 leading-tight text-primary mb-3">
                  {step.title}
                </h3>
                <p className="text-body text-secondary leading-relaxed">
                  {step.description}
                </p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
```
