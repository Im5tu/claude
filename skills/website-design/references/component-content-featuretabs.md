# FeatureTabs

Tabbed section where each tab reveals a distinct product area. Horizontal tab selector on mobile, optional vertical on desktop. Content area: large label, description, feature list, and product screenshot. GSAP cross-fade between tabs.

```
---
component: FeatureTabs
category: content
subtype: interactive-tabs

dimension-fit:
  contrast-dark: medium
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: medium
visual-weight: medium
content-density: rich
trend-alignment: evergreen
motion-profile: moderate

use-when:
  - 3-5 distinct product areas or service categories
  - Each area has its own screenshot or visual
  - Clean SaaS where the product depth needs to be demonstrated without overwhelming
  - Refined Professional services with distinct practice areas

avoid-when:
  - Warm Artisan — tabs feel transactional and UI-like, not warm
  - Editorial Minimal — interaction disrupts the deliberate stillness
  - Fewer than 3 tabs (use BentoGrid or AlternatingRows instead)
  - More than 6 tabs (tab bar becomes unwieldy)

pairs-well-with: [BentoGrid, StatsStrip, LogoStrip]
pairs-poorly-with: [AccordionProcess — both are reveal-on-click interactions, sequential feels redundant]
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

interface TabFeature {
  text: string;
}

interface Tab {
  id: string;
  label: string;
  eyebrow: string;
  headline: string;
  description: string;
  features: TabFeature[];
  image: string;
  imageAlt: string;
}

interface FeatureTabsProps {
  sectionEyebrow?: string;
  sectionHeadline: string;
  tabs: Tab[];
}

export function FeatureTabs({ sectionEyebrow, sectionHeadline, tabs }: FeatureTabsProps) {
  const ref = useRef<HTMLElement>(null);
  const contentRef = useRef<HTMLDivElement>(null);
  const [activeTab, setActiveTab] = useState(0);

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
  }, { scope: ref });

  function handleTabChange(index: number) {
    if (index === activeTab || !contentRef.current) return;

    // Fade out current content
    gsap.to(contentRef.current, {
      opacity: 0,
      y: 8,
      duration: 0.2,
      ease: "power2.in",
      onComplete: () => {
        setActiveTab(index);
        // Fade in new content
        gsap.fromTo(
          contentRef.current!,
          { opacity: 0, y: 8 },
          { opacity: 1, y: 0, duration: 0.35, ease: EASE.enter }
        );
      },
    });
  }

  const active = tabs[activeTab];

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-secondary">
      <div className="mx-auto max-w-7xl px-6">
        {/* Section header */}
        <div className="mb-10 max-w-[48ch]">
          {sectionEyebrow && (
            <p data-header className="text-caption font-semibold text-accent tracking-widest uppercase mb-4">
              {sectionEyebrow}
            </p>
          )}
          <h2 data-header className="font-display font-bold text-h1 leading-tight tracking-tight text-primary">
            {sectionHeadline}
          </h2>
        </div>

        {/* Tab bar */}
        <div
          data-header
          className="flex gap-2 overflow-x-auto pb-1 mb-10 border-b border-border"
          role="tablist"
        >
          {tabs.map((tab, i) => (
            <button
              key={tab.id}
              role="tab"
              aria-selected={activeTab === i}
              aria-controls={`tab-panel-${tab.id}`}
              onClick={() => handleTabChange(i)}
              className={`shrink-0 rounded-md px-5 py-2.5 text-body-sm font-medium transition-all duration-200 ${
                activeTab === i
                  ? "bg-accent text-white"
                  : "text-secondary hover:text-primary hover:bg-surface-primary"
              }`}
            >
              {tab.label}
            </button>
          ))}
        </div>

        {/* Tab content */}
        <div
          ref={contentRef}
          id={`tab-panel-${active.id}`}
          role="tabpanel"
          className="grid grid-cols-1 gap-12 lg:grid-cols-2 lg:gap-16 items-center"
        >
          {/* Text side */}
          <div>
            <p className="text-caption font-semibold text-accent tracking-widest uppercase mb-4">
              {active.eyebrow}
            </p>
            <h3 className="font-display font-bold text-h2 leading-tight tracking-tight text-primary max-w-[26ch]">
              {active.headline}
            </h3>
            <p className="mt-5 text-body-lg text-secondary max-w-[50ch] leading-relaxed">
              {active.description}
            </p>
            <ul className="mt-6 space-y-3">
              {active.features.map((f, i) => (
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
          </div>

          {/* Visual side */}
          <div className="overflow-hidden rounded-2xl border border-border shadow-md">
            <img
              src={active.image}
              alt={active.imageAlt}
              className="w-full object-cover"
              width={800}
              height={560}
            />
          </div>
        </div>
      </div>
    </section>
  );
}
```
