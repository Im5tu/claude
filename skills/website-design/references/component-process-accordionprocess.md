# AccordionProcess

Expandable steps — click a step number to expand its full description and optional visual. When one step is open, others collapse. GSAP height animation. For complex multi-step processes where showing everything at once would overwhelm.

```
---
component: AccordionProcess
category: process
subtype: accordion-steps

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: low
visual-weight: light
content-density: rich
trend-alignment: evergreen
motion-profile: moderate

use-when:
  - 4-7 complex steps where each has substantial sub-detail
  - Clean SaaS onboarding that would be overwhelming as a full list
  - Dark Luxury service delivery with discreet expand-to-reveal interaction
  - Refined Professional engagement process with legal or compliance sub-content

avoid-when:
  - Bold Studio — static accordion conflicts with the kinetic personality
  - Fewer than 4 steps (use NumberedSteps — the simplicity is the message)
  - When each step needs a large image (the accordion content area is text-first)

pairs-well-with: [StatsStrip, TestimonialGrid, AlternatingRows]
pairs-poorly-with: [HorizontalTimeline — both are sequential reveals, redundant if adjacent]
---
```

> **CRITICAL — STEP NUMBER RULES:**
> - Step numbers (01, 02, 03...) in the accordion trigger are ALWAYS static text
> - NEVER wrap accordion step numbers in `<CounterTicker>`
> - GSAP animates the height of the content panel — not the number

```tsx
"use client";
import { useRef, useState, type ReactNode } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface AccordionStep {
  title: string;
  shortDescription: string;
  fullDescription: string;
  details: string[];
  /** Optional visual — image or TSX node */
  visual?: ReactNode;
}

interface AccordionProcessProps {
  eyebrow?: string;
  headline: string;
  subline?: string;
  steps: AccordionStep[];
  /** Open the first step by default */
  defaultOpen?: boolean;
}

function AccordionItem({
  step,
  index,
  isOpen,
  onToggle,
}: {
  step: AccordionStep;
  index: number;
  isOpen: boolean;
  onToggle: () => void;
}) {
  const panelRef = useRef<HTMLDivElement>(null);
  const innerRef = useRef<HTMLDivElement>(null);

  // Animate height open/close
  useGSAP(() => {
    if (!panelRef.current || !innerRef.current) return;

    if (isOpen) {
      gsap.set(panelRef.current, { height: 0, overflow: "hidden" });
      gsap.to(panelRef.current, {
        height: innerRef.current.offsetHeight,
        duration: 0.45,
        ease: "power3.out",
        onComplete: () => {
          if (panelRef.current) panelRef.current.style.height = "auto";
        },
      });
    } else {
      gsap.to(panelRef.current, {
        height: 0,
        duration: 0.35,
        ease: "power2.in",
      });
    }
  }, { dependencies: [isOpen] });

  return (
    <div className="border-b border-border last:border-0">
      {/* Trigger */}
      <button
        onClick={onToggle}
        aria-expanded={isOpen}
        className="flex w-full items-center gap-6 py-7 text-left transition-colors hover:text-accent group"
      >
        {/* Step number — static decorative text, NEVER CounterTicker */}
        <span
          className="shrink-0 font-display font-bold text-primary/20 leading-none select-none transition-colors duration-200 group-hover:text-accent/30"
          style={{ fontSize: "clamp(1.75rem, 3vw, 2.5rem)" }}
          aria-hidden="true"
        >
          {String(index + 1).padStart(2, "0")}
        </span>

        <div className="flex-1 min-w-0">
          <h3 className="font-display font-semibold text-h3 leading-tight text-primary group-hover:text-accent transition-colors duration-200">
            {step.title}
          </h3>
          {!isOpen && (
            <p className="mt-1 text-body-sm text-secondary truncate max-w-[60ch]">
              {step.shortDescription}
            </p>
          )}
        </div>

        {/* Chevron */}
        <span
          className="shrink-0 text-secondary transition-transform duration-300"
          style={{ transform: isOpen ? "rotate(180deg)" : "rotate(0deg)" }}
          aria-hidden="true"
        >
          <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path d="M5 7.5l5 5 5-5" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
          </svg>
        </span>
      </button>

      {/* Content panel — GSAP height animation */}
      <div ref={panelRef} style={{ height: 0, overflow: "hidden" }}>
        <div ref={innerRef} className="pb-8">
          <div className="grid grid-cols-1 gap-8 lg:grid-cols-2 lg:gap-12">
            <div>
              <p className="text-body-lg text-secondary leading-relaxed max-w-[55ch]">
                {step.fullDescription}
              </p>
              {step.details.length > 0 && (
                <ul className="mt-6 space-y-3">
                  {step.details.map((detail, i) => (
                    <li key={i} className="flex items-start gap-3">
                      <span className="mt-1.5 h-1.5 w-1.5 shrink-0 rounded-full bg-accent" aria-hidden="true" />
                      <span className="text-body text-secondary">{detail}</span>
                    </li>
                  ))}
                </ul>
              )}
            </div>

            {step.visual && (
              <div className="overflow-hidden rounded-xl border border-border">
                {step.visual}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

export function AccordionProcess({
  eyebrow,
  headline,
  subline,
  steps,
  defaultOpen = true,
}: AccordionProcessProps) {
  const ref = useRef<HTMLElement>(null);
  const [openIndex, setOpenIndex] = useState<number | null>(defaultOpen ? 0 : null);

  // Section entrance
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

    const items = ref.current.querySelectorAll(".accordion-item");
    gsap.set(items, { y: 20, opacity: 0 });
    gsap.to(items, {
      y: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: 0.07,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 72%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  function handleToggle(index: number) {
    setOpenIndex(openIndex === index ? null : index);
  }

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-primary">
      <div className="mx-auto max-w-5xl px-6">
        {/* Header */}
        <div className="mb-12">
          {eyebrow && (
            <p data-header className="text-caption font-semibold text-accent tracking-widest uppercase mb-4">
              {eyebrow}
            </p>
          )}
          <h2 data-header className="font-display font-bold text-h1 leading-tight tracking-tight text-primary max-w-[36ch]">
            {headline}
          </h2>
          {subline && (
            <p data-header className="mt-4 text-body-lg text-secondary max-w-[55ch] leading-relaxed">
              {subline}
            </p>
          )}
        </div>

        {/* Accordion steps */}
        <div>
          {steps.map((step, i) => (
            <div key={i} className="accordion-item">
              <AccordionItem
                step={step}
                index={i}
                isOpen={openIndex === i}
                onToggle={() => handleToggle(i)}
              />
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
```
