# TestimonialGrid

2-3 testimonial cards in a grid. Each card: stars + quote + name + role + optional avatar. The standard testimonials section for most sites.

```
---
component: TestimonialGrid
category: proof
subtype: testimonial-card-grid

dimension-fit:
  contrast-dark: medium
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: medium
visual-weight: medium
content-density: moderate
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - 2-4 client testimonials of roughly equal quality
  - Standard homepage testimonials section
  - After a process section — proof that the process delivers
  - Clean SaaS or Refined Professional where multiple voices reinforce trust

avoid-when:
  - The design system prioritises extreme restraint and editorial weight — a card grid structure competes with the deliberate minimalism
  - When you have one exceptional testimonial that clearly outweighs the others (use FeaturedTestimonial instead)
  - Immediately after another testimonial or proof section (redundant proof pattern)

pairs-well-with: [StatsStrip, LogoStrip, CaseStudyTeaser]
pairs-poorly-with: [FeaturedTestimonial in same section — both are quote-based, choose one]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { Star } from "lucide-react";
import { EASE, DURATION } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface Testimonial {
  quote: string;
  name: string;
  role: string;
  company?: string;
  rating?: number;
  avatar?: string;
  /** Optional: highlights a specific result — shown as accent pill above quote */
  result?: string;
}

interface TestimonialGridProps {
  eyebrow?: string;
  headline: string;
  subline?: string;
  testimonials: Testimonial[];
  /** 2 or 3 columns */
  cols?: 2 | 3;
  /** Layout variant — grid-3 (default equal columns), grid-2-offset (2 cols, second offset 40px), masonry (natural card heights) */
  layout?: "grid-3" | "grid-2-offset" | "masonry";
}

function TestimonialCard({ testimonial }: { testimonial: Testimonial }) {
  const rating = testimonial.rating ?? 5;

  return (
    <div className="testimonial-card flex flex-col rounded-2xl border border-border bg-surface-secondary p-8 transition-all duration-300 hover:-translate-y-1 hover:shadow-md">
      {/* Result pill — if provided */}
      {testimonial.result && (
        <span className="mb-5 inline-block self-start rounded-full bg-accent/10 px-3.5 py-1 text-caption font-semibold text-accent">
          {testimonial.result}
        </span>
      )}

      {/* Stars */}
      <div className="flex gap-0.5 text-accent mb-4" aria-label={`${rating} out of 5 stars`}>
        {Array.from({ length: 5 }).map((_, i) => (
          <Star
            key={i}
            className={`h-4 w-4 ${i < rating ? "fill-current" : "fill-transparent opacity-30"}`}
          />
        ))}
      </div>

      {/* Quote */}
      <blockquote className="flex-1 text-body text-primary leading-relaxed">
        &ldquo;{testimonial.quote}&rdquo;
      </blockquote>

      {/* Attribution */}
      <div className="mt-6 flex items-center gap-3 border-t border-border pt-6">
        {testimonial.avatar ? (
          <img
            src={testimonial.avatar}
            alt={testimonial.name}
            className="h-10 w-10 rounded-full object-cover shrink-0"
            width={40}
            height={40}
          />
        ) : (
          <div
            className="h-10 w-10 shrink-0 rounded-full bg-accent/20 flex items-center justify-center text-accent font-semibold text-body-sm"
            aria-hidden="true"
          >
            {testimonial.name.charAt(0)}
          </div>
        )}
        <div>
          <p className="text-body-sm font-semibold text-primary">{testimonial.name}</p>
          <p className="text-caption text-secondary">
            {testimonial.role}
            {testimonial.company && `, ${testimonial.company}`}
          </p>
        </div>
      </div>
    </div>
  );
}

export function TestimonialGrid({
  eyebrow,
  headline,
  subline,
  testimonials,
  cols = 3,
  layout = "grid-3",
}: TestimonialGridProps) {
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

    const cards = ref.current.querySelectorAll(".testimonial-card");
    gsap.set(cards, { y: 32, opacity: 0, scale: 0.97 });
    gsap.to(cards, {
      y: 0, opacity: 1, scale: 1,
      duration: DURATION.moderate,
      stagger: 0.09,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 70%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-primary">
      <div className="mx-auto max-w-7xl px-6">
        {/* Header */}
        <div className="mb-12 max-w-[48ch]">
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

        {/* Grid */}
        <div
          className={[
            "grid grid-cols-1 gap-6",
            layout === "grid-3" && `md:grid-cols-2 ${cols === 3 ? "lg:grid-cols-3" : ""}`,
            layout === "grid-2-offset" && "md:grid-cols-2",
            layout === "masonry" && "md:columns-2 lg:columns-3 md:block md:space-y-6",
          ].filter(Boolean).join(" ")}
        >
          {testimonials.map((t, i) => (
            <div
              key={i}
              className={
                layout === "grid-2-offset" && i % 2 === 1
                  ? "md:translate-y-10"
                  : layout === "masonry"
                    ? "md:break-inside-avoid"
                    : undefined
              }
            >
              <TestimonialCard testimonial={t} />
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
```
