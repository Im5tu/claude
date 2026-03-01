# FAQAccordion

Expandable FAQ section using CSS `grid-template-rows: 0fr → 1fr` animation. 4-8 question/answer pairs with single-item-open accordion behavior. Weight-change on active question and rotating indicator icon. Purely functional — universal across all styles.

```
---
component: FAQAccordion
category: content
subtype: faq-accordion

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: high
visual-weight: light
content-density: moderate
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - Business has 4+ genuine FAQs with real answers that reduce support burden
  - Complex product needing objection handling — pricing, process, or compatibility questions
  - Regulated industry with compliance or legal questions visitors genuinely need answered
  - FAQ content addresses real visitor hesitations before conversion
  - Clean SaaS — technical questions about integrations, limits, data handling
  - Refined Professional — process and engagement questions that build trust

avoid-when:
  - Questions are generic marketing reframes ("What makes you different?" with vague answer)
  - Product is simple and self-evident — the FAQ would be padding
  - Page already addresses objections inline in other sections (redundant)
  - Fewer than 4 genuine questions (static text reads better)
  - Questions are actually feature descriptions disguised as FAQ

pairs-well-with: [CTABanner as follow-up, ContactGateway, LogoStrip as trust reinforcement]
pairs-poorly-with: [AccordionProcess — both are expand/collapse interactions, sequential feels redundant]
---
```

```tsx
"use client";
import { useRef, useState } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface FAQItem {
  question: string;
  answer: string;
}

interface FAQAccordionProps {
  eyebrow?: string;
  headline?: string;
  subline?: string;
  items: FAQItem[];
}

export function FAQAccordion({
  eyebrow,
  headline = "Frequently Asked Questions",
  subline,
  items,
}: FAQAccordionProps) {
  const ref = useRef<HTMLElement>(null);
  const [activeIndex, setActiveIndex] = useState<number | null>(null);

  // Section entrance animation
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

    const faqItems = ref.current.querySelectorAll("[data-faq-item]");
    gsap.set(faqItems, { y: 16, opacity: 0 });
    gsap.to(faqItems, {
      y: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: 0.05,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 70%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  function toggle(index: number) {
    setActiveIndex((prev) => (prev === index ? null : index));
  }

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-primary">
      <div className="mx-auto max-w-3xl px-6">
        {/* Header */}
        <div className="mb-12 text-center max-w-[52ch] mx-auto">
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

        {/* FAQ items */}
        <div className="divide-y divide-border">
          {items.map((item, i) => {
            const isOpen = activeIndex === i;
            const panelId = `faq-panel-${i}`;
            const triggerId = `faq-trigger-${i}`;

            return (
              <div key={i} data-faq-item className="group">
                {/* Question button */}
                <button
                  id={triggerId}
                  aria-expanded={isOpen}
                  aria-controls={panelId}
                  onClick={() => toggle(i)}
                  className="flex w-full items-center justify-between gap-4 py-5 text-left focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-accent focus-visible:ring-offset-2 rounded-sm"
                >
                  <span
                    className={`text-body-lg text-primary transition-[font-weight] duration-200 ${
                      isOpen ? "font-semibold" : "font-normal"
                    }`}
                  >
                    {item.question}
                  </span>

                  {/* Indicator — plus that rotates to × on open */}
                  <span
                    aria-hidden="true"
                    className={`shrink-0 inline-flex h-6 w-6 items-center justify-center text-secondary transition-transform duration-200 ${
                      isOpen ? "rotate-45" : "rotate-0"
                    }`}
                  >
                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                      <path
                        d="M8 2v12M2 8h12"
                        stroke="currentColor"
                        strokeWidth="1.5"
                        strokeLinecap="round"
                      />
                    </svg>
                  </span>
                </button>

                {/* Answer — CSS grid-template-rows animation */}
                <div
                  id={panelId}
                  role="region"
                  aria-labelledby={triggerId}
                  className="grid transition-[grid-template-rows] duration-300 ease-in-out"
                  style={{
                    gridTemplateRows: isOpen ? "1fr" : "0fr",
                  }}
                >
                  <div className="overflow-hidden min-h-0">
                    <p className="pb-5 text-body text-secondary leading-relaxed max-w-[60ch]">
                      {item.answer}
                    </p>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
```
