# NumberedSteps

Vertical stack (mobile) / horizontal row (desktop) of 3-5 steps. Large decorative static number + title + description per step. Connector lines between steps on desktop. The default process section for almost every brand.

```
---
component: NumberedSteps
category: process
subtype: numbered-steps-horizontal

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: high
visual-weight: medium
content-density: moderate
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - 3-5 sequential steps with clear ordering
  - Standard homepage process section
  - Any preset — this is the universal process component
  - When the process is simple enough to show all at once

avoid-when:
  - More than 5 steps on desktop (step connectors become cramped — use VerticalTimeline)
  - When steps have complex sub-detail (use AccordionProcess instead)
  - NEVER animate step numbers (01, 02, 03) with CounterTicker

pairs-well-with: [AlternatingRows, FeatureTabs, StatsStrip]
pairs-poorly-with: [AccordionProcess in same section — redundant interaction patterns]
---
```

> **CRITICAL — STEP NUMBER RULES:**
> - Step numbers (01, 02, 03...) are ALWAYS static decorative text
> - NEVER wrap step numbers in `<CounterTicker>` — that is only for real metrics
> - Step numbers have no animation of their own — the cards/rows animate as a group
> - Numbers use `font-display font-bold text-primary/15` — large but recessive

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface Step {
  title: string;
  description: string;
}

interface NumberedStepsProps {
  eyebrow?: string;
  headline: string;
  subline?: string;
  steps: Step[];
  /** "horizontal" = side by side on desktop (default). "vertical" = always stacked */
  layout?: "horizontal" | "vertical";
}

export function NumberedSteps({
  eyebrow,
  headline,
  subline,
  steps,
  layout = "horizontal",
}: NumberedStepsProps) {
  const ref = useRef<HTMLElement>(null);

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

    // Steps cascade left to right (horizontal) or top to bottom (vertical)
    const stepEls = ref.current.querySelectorAll(".process-step");
    gsap.set(stepEls, { y: 28, opacity: 0 });
    gsap.to(stepEls, {
      y: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: 0.1,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 70%",
        toggleActions: "play none none none",
      },
    });

    // Connector lines draw across
    const connectors = ref.current.querySelectorAll(".step-connector");
    gsap.set(connectors, { scaleX: 0, transformOrigin: "left center" });
    gsap.to(connectors, {
      scaleX: 1,
      duration: 0.6,
      stagger: 0.15,
      ease: "power3.out",
      delay: 0.3,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 70%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  const isHorizontal = layout === "horizontal";

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-secondary">
      <div className="mx-auto max-w-7xl px-6">
        {/* Header */}
        <div className="mb-12 max-w-[52ch]">
          {eyebrow && (
            <p data-header className="text-caption font-semibold text-accent tracking-widest uppercase mb-4">
              {eyebrow}
            </p>
          )}
          <h2 data-header className="font-display font-bold text-h1 leading-tight tracking-tight text-primary">
            {headline}
          </h2>
          {subline && (
            <p data-header className="mt-4 text-body-lg text-secondary leading-relaxed">
              {subline}
            </p>
          )}
        </div>

        {/* Steps */}
        <div
          className={
            isHorizontal
              ? "grid grid-cols-1 gap-8 lg:grid-cols-[1fr_auto_1fr_auto_1fr] lg:gap-0 lg:items-start"
              : "flex flex-col gap-10"
          }
        >
          {steps.map((step, i) => (
            <>
              {/* Step */}
              <div key={`step-${i}`} className="process-step relative">
                {/* Decorative number — STATIC, never CounterTicker */}
                <span
                  className="block font-display font-bold text-primary/12 leading-none mb-4 select-none"
                  style={{ fontSize: "clamp(3rem, 5vw, 4.5rem)" }}
                  aria-hidden="true"
                >
                  {String(i + 1).padStart(2, "0")}
                </span>

                {/* Step dot */}
                <div className="mb-5 inline-flex h-2 w-2 rounded-full bg-accent" />

                <h3 className="font-display font-semibold text-h3 leading-tight text-primary mb-3">
                  {step.title}
                </h3>
                <p className="text-body text-secondary leading-relaxed max-w-[32ch]">
                  {step.description}
                </p>
              </div>

              {/* Connector line between steps — horizontal layout only, not after last step */}
              {isHorizontal && i < steps.length - 1 && (
                <div
                  key={`connector-${i}`}
                  className="step-connector hidden lg:block self-start mt-[4.5rem] h-px w-12 bg-border"
                  aria-hidden="true"
                />
              )}
            </>
          ))}
        </div>
      </div>
    </section>
  );
}
```
