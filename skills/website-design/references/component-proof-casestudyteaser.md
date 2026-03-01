# CaseStudyTeaser

2-3 case study preview cards. Large image + client name + service category + one-line result. Hover reveals an overlay with more detail and a link. For brands with measurable, visual outcomes.

```
---
component: CaseStudyTeaser
category: proof
subtype: case-study-preview

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: medium
  energy-energetic: high
visual-weight: heavy
content-density: moderate
trend-alignment: evergreen
motion-profile: moderate

use-when:
  - Brand has 2-3 projects/clients with strong visual outcomes and measurable results
  - Refined Professional — work quality is the primary sales signal
  - Bold Studio — portfolio as proof, kinetic hover interaction
  - When client imagery is high quality

avoid-when:
  - Editorial Minimal — hover overlays conflict with the still, content-first aesthetic
  - When client results aren't measurable or outcomes are vague
  - When only 1 case study exists (use FeaturedTestimonial instead)

pairs-well-with: [StatsStrip, TestimonialGrid, AlternatingRows]
pairs-poorly-with: [LogoStrip immediately after — both reference clients, choose one or add a content section between them]
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

interface CaseStudy {
  image: string;
  imageAlt: string;
  client: string;
  category: string;
  /** One-line result — be specific: "42% revenue increase in 6 months" */
  result: string;
  /** Expanded overlay description — 1-2 sentences */
  description: string;
  href: string;
}

interface CaseStudyTeaserProps {
  eyebrow?: string;
  headline: string;
  cases: CaseStudy[];
  /** Link to full case studies index */
  allCasesHref?: string;
  allCasesLabel?: string;
}

function CaseCard({ study }: { study: CaseStudy }) {
  const cardRef = useRef<HTMLAnchorElement>(null);
  const overlayRef = useRef<HTMLDivElement>(null);

  function handleMouseEnter() {
    if (!overlayRef.current) return;
    gsap.to(overlayRef.current, {
      opacity: 1,
      y: 0,
      duration: 0.35,
      ease: EASE.enter,
    });
  }

  function handleMouseLeave() {
    if (!overlayRef.current) return;
    gsap.to(overlayRef.current, {
      opacity: 0,
      y: 12,
      duration: 0.25,
      ease: "power2.in",
    });
  }

  return (
    <a
      ref={cardRef}
      href={study.href}
      className="case-card group relative block overflow-hidden rounded-2xl bg-neutral-900"
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      {/* Image */}
      <div className="overflow-hidden aspect-[3/4] md:aspect-[4/5]">
        <img
          src={study.image}
          alt={study.imageAlt}
          className="h-full w-full object-cover transition-transform duration-700 ease-out group-hover:scale-[1.06]"
          width={600}
          height={750}
        />
        {/* Base gradient — always visible */}
        <div className="absolute inset-0 bg-gradient-to-t from-black/75 via-black/20 to-transparent" />
      </div>

      {/* Always-visible base info */}
      <div className="absolute bottom-0 left-0 right-0 p-7">
        <p className="text-caption font-semibold text-white/50 tracking-widest uppercase mb-2">
          {study.category}
        </p>
        <h3 className="font-display font-bold text-h3 text-white leading-tight">
          {study.client}
        </h3>
        <p className="mt-2 text-body-sm font-medium text-accent">
          {study.result}
        </p>
      </div>

      {/* Hover overlay — fades in with description */}
      <div
        ref={overlayRef}
        className="absolute inset-0 bg-gradient-to-t from-black/90 via-black/60 to-black/20 opacity-0 translate-y-3"
        style={{ translateY: "12px" }}
      >
        <div className="absolute bottom-0 left-0 right-0 p-7">
          <p className="text-caption font-semibold text-white/50 tracking-widest uppercase mb-2">
            {study.category}
          </p>
          <h3 className="font-display font-bold text-h3 text-white leading-tight mb-3">
            {study.client}
          </h3>
          <p className="text-body-sm font-medium text-accent mb-4">
            {study.result}
          </p>
          <p className="text-body-sm text-white/70 leading-relaxed max-w-[40ch] mb-5">
            {study.description}
          </p>
          <span className="inline-flex items-center gap-2 text-body-sm font-semibold text-white border-b border-white/30 pb-0.5 transition-colors hover:border-white">
            View case study
            <svg width="14" height="14" viewBox="0 0 14 14" fill="none" aria-hidden="true">
              <path d="M3 7h8M7 3l4 4-4 4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
            </svg>
          </span>
        </div>
      </div>
    </a>
  );
}

export function CaseStudyTeaser({
  eyebrow,
  headline,
  cases,
  allCasesHref,
  allCasesLabel = "View all case studies",
}: CaseStudyTeaserProps) {
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

    const cards = ref.current.querySelectorAll(".case-card");
    gsap.set(cards, { y: 40, opacity: 0 });
    gsap.to(cards, {
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

    // Initial overlay state
    const overlays = ref.current.querySelectorAll<HTMLDivElement>(".absolute.inset-0.bg-gradient-to-t.from-black\\/90");
    overlays.forEach((overlay) => {
      gsap.set(overlay, { opacity: 0, y: 12 });
    });
  }, { scope: ref });

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-secondary">
      <div className="mx-auto max-w-7xl px-6">
        {/* Header */}
        <div className="mb-12 flex flex-col gap-4 lg:flex-row lg:items-end lg:justify-between">
          <div className="max-w-[44ch]">
            {eyebrow && (
              <p data-header className="text-caption font-semibold text-accent tracking-widest uppercase mb-4">
                {eyebrow}
              </p>
            )}
            <h2 data-header className="font-display font-bold text-h1 leading-tight tracking-tight text-primary">
              {headline}
            </h2>
          </div>
          {allCasesHref && (
            <a
              data-header
              href={allCasesHref}
              className="shrink-0 text-body-sm font-medium text-accent underline underline-offset-4 decoration-accent/30 hover:decoration-accent transition-colors"
            >
              {allCasesLabel} &rarr;
            </a>
          )}
        </div>

        {/* Cards grid */}
        <div
          className={`grid grid-cols-1 gap-4 md:grid-cols-2 ${
            cases.length >= 3 ? "lg:grid-cols-3" : ""
          }`}
        >
          {cases.map((study, i) => (
            <CaseCard key={i} study={study} />
          ))}
        </div>
      </div>
    </section>
  );
}
```
