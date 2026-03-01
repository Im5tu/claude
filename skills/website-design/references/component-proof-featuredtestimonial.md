# FeaturedTestimonial

Single large featured quote. Full-width section with large serif italic quote text, attribution, and optional client photo. More gravitas than a card grid. Use when you have one extraordinary testimonial.

```
---
component: FeaturedTestimonial
category: proof
subtype: featured-quote-full-width

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: medium
  energy-energetic: low
visual-weight: medium
content-density: sparse
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - One testimonial is dramatically better than the rest (marquee client, specific measurable outcome)
  - The brand's credibility rests on restraint — a single authoritative voice carries more weight than multiple voices
  - The design system prioritises whitespace and editorial weight — one quote framed generously becomes the proof section
  - The testimonial includes a specific, verifiable outcome that earns singular prominence

avoid-when:
  - Bold Studio — single centered quote reads as too conventional
  - When you have 3+ equally strong testimonials (use TestimonialGrid instead)
  - Immediately after TestimonialGrid (redundant proof pattern)

pairs-well-with: [CaseStudyTeaser, AlternatingRows, StatsStrip]
pairs-poorly-with: [TestimonialGrid — both are testimonial sections, choose one]
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

interface FeaturedTestimonialProps {
  quote: string;
  name: string;
  role: string;
  company?: string;
  /** Optional large client portrait or headshot */
  photo?: string;
  photoAlt?: string;
  /** Optional logo of the client's company */
  companyLogo?: string;
  companyLogoAlt?: string;
  /** Optional measurable outcome — displayed prominently */
  outcome?: string;
  /** Section background — "surface" (light) or "dark" */
  variant?: "surface" | "dark";
}

export function FeaturedTestimonial({
  quote,
  name,
  role,
  company,
  photo,
  photoAlt,
  companyLogo,
  companyLogoAlt,
  outcome,
  variant = "surface",
}: FeaturedTestimonialProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    const quoteEl = ref.current.querySelector(".featured-quote");
    const attrEl = ref.current.querySelector(".featured-attribution");
    const photoEl = ref.current.querySelector(".featured-photo");
    const outcomeEl = ref.current.querySelector(".featured-outcome");

    if (outcomeEl) {
      gsap.fromTo(outcomeEl, { opacity: 0, y: 16 }, {
        opacity: 1, y: 0,
        duration: DURATION.moderate,
        ease: EASE.enter,
        scrollTrigger: { trigger: ref.current, start: "top 80%", toggleActions: "play none none none" },
      });
    }

    if (quoteEl) {
      // Split quote into words for stagger reveal
      const words = quoteEl.querySelectorAll(".quote-word");
      gsap.fromTo(words,
        { opacity: 0, y: "60%", clipPath: "inset(0 0 100% 0)" },
        {
          opacity: 1, y: "0%", clipPath: "inset(0 0 0% 0)",
          duration: 0.55,
          stagger: 0.025,
          ease: "power3.out",
          delay: 0.1,
          scrollTrigger: { trigger: ref.current, start: "top 75%", toggleActions: "play none none none" },
        }
      );
    }

    if (attrEl) {
      gsap.fromTo(attrEl, { opacity: 0, y: 16 }, {
        opacity: 1, y: 0,
        duration: DURATION.moderate,
        ease: EASE.enter,
        delay: 0.5,
        scrollTrigger: { trigger: ref.current, start: "top 75%", toggleActions: "play none none none" },
      });
    }

    if (photoEl) {
      gsap.fromTo(photoEl,
        { opacity: 0, scale: 0.95 },
        {
          opacity: 1, scale: 1,
          duration: DURATION.moderate,
          ease: EASE.enter,
          delay: 0.3,
          scrollTrigger: { trigger: ref.current, start: "top 75%", toggleActions: "play none none none" },
        }
      );
    }
  }, { scope: ref });

  const isDark = variant === "dark";
  const bg = isDark ? "bg-primary" : "bg-surface-secondary";
  const quoteColor = isDark ? "text-white" : "text-primary";
  const attrColor = isDark ? "text-white/60" : "text-secondary";
  const outcomeColor = isDark ? "text-accent" : "text-accent";

  // Split quote for word-by-word reveal
  const quoteWords = quote.split(" ");

  return (
    <section ref={ref} className={`py-16 lg:py-24 ${bg}`}>
      <div className="mx-auto max-w-6xl px-6">
        <div
          className={`grid grid-cols-1 gap-12 items-center ${
            photo ? "lg:grid-cols-[1fr_auto]" : ""
          }`}
        >
          <div>
            {/* Opening quotation mark */}
            <span
              className={`block font-display font-bold leading-none mb-6 ${isDark ? "text-white/15" : "text-primary/12"} select-none`}
              style={{ fontSize: "clamp(5rem, 10vw, 10rem)" }}
              aria-hidden="true"
            >
              &ldquo;
            </span>

            {/* Outcome pill — if provided */}
            {outcome && (
              <p className={`featured-outcome text-body-sm font-semibold ${outcomeColor} mb-6`}>
                {outcome}
              </p>
            )}

            {/* Quote text — word by word reveal */}
            <blockquote
              className="featured-quote"
              style={{ fontSize: "clamp(1.5rem, 3vw, 2.5rem)" }}
            >
              <p
                className={`font-display font-medium leading-[1.3] tracking-tight italic ${quoteColor}`}
              >
                {quoteWords.map((word, i) => (
                  <span key={i} className="inline-block overflow-hidden">
                    <span className="quote-word inline-block">
                      {word}
                      {i < quoteWords.length - 1 && "\u00A0"}
                    </span>
                  </span>
                ))}
              </p>
            </blockquote>

            {/* Attribution */}
            <div className="featured-attribution mt-10 flex flex-wrap items-center gap-6">
              {/* Name + role */}
              <div>
                <p className={`text-body-sm font-semibold ${isDark ? "text-white" : "text-primary"}`}>
                  {name}
                </p>
                <p className={`text-caption ${attrColor}`}>
                  {role}
                  {company && `, ${company}`}
                </p>
              </div>

              {/* Company logo */}
              {companyLogo && (
                <>
                  <div className={`h-5 w-px ${isDark ? "bg-white/15" : "bg-border"}`} aria-hidden="true" />
                  <img
                    src={companyLogo}
                    alt={companyLogoAlt ?? (company ?? "")}
                    className={`h-6 object-contain ${isDark ? "brightness-0 invert opacity-60" : "grayscale opacity-60"}`}
                    height={24}
                  />
                </>
              )}
            </div>
          </div>

          {/* Client photo — optional */}
          {photo && (
            <div className="featured-photo hidden lg:block shrink-0">
              <div className="overflow-hidden rounded-2xl">
                <img
                  src={photo}
                  alt={photoAlt ?? name}
                  className="w-64 h-80 object-cover object-top"
                  width={256}
                  height={320}
                />
              </div>
            </div>
          )}
        </div>
      </div>
    </section>
  );
}
```
