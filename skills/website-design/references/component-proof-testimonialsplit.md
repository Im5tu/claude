# TestimonialSplit

Asymmetric split-layout testimonial section. One featured marquee quote on the left (60% width) paired with 2-3 compact supporting quotes stacked on the right (40% width). Breaks grid monotony with deliberate visual hierarchy — the featured voice dominates while supporting quotes reinforce credibility.

```
---
component: TestimonialSplit
category: proof
subtype: asymmetric-split-testimonial

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: medium
visual-weight: medium
content-density: moderate
trend-alignment: evergreen
motion-profile: minimal

style-fit:
  Refined Professional: high
  Warm Artisan: high
  Bold Studio: medium
  Dark Luxury: high
  Clean SaaS: high
  Editorial Minimal: high (perfect for editorial asymmetry)
  Vibrant Consumer: medium
  Modern Organic: high

use-when:
  - Have 1 strong marquee testimonial + 2-3 supporting quotes of lesser weight
  - Need an asymmetric layout to break 3-column grid monotony
  - Featured client is significantly more recognizable than others
  - Editorial Minimal or Refined Professional where visual hierarchy matters

avoid-when:
  - All testimonials are equally strong (use TestimonialGrid instead)
  - Only have 1 testimonial (use FeaturedTestimonial instead)
  - Bold Studio style as primary testimonial section (hover overlays conflict with asymmetry)
  - Immediately after another testimonial or proof section (redundant proof pattern)

pairs-well-with: [StatsStrip, LogoStrip, CaseStudyTeaser, AlternatingRows]
pairs-poorly-with: [TestimonialGrid — both are testimonial sections, choose one; FeaturedTestimonial — overlapping purpose]
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

interface SupportingTestimonial {
  quote: string;
  name: string;
  role: string;
  company?: string;
  avatar?: string;
}

interface TestimonialSplitProps {
  /** Optional eyebrow text above the section headline */
  eyebrow?: string;
  /** Optional section headline */
  headline?: string;
  /** Featured (left) testimonial — the marquee quote */
  featuredQuote: string;
  featuredName: string;
  featuredRole: string;
  featuredCompany?: string;
  featuredAvatar?: string;
  /** Optional measurable outcome for the featured quote — displayed as accent pill */
  featuredOutcome?: string;
  /** Optional company logo for the featured testimonial */
  featuredCompanyLogo?: string;
  featuredCompanyLogoAlt?: string;
  /** 2-3 supporting testimonials stacked on the right */
  supporting: SupportingTestimonial[];
  /** Section background — "surface" (light) or "dark" */
  variant?: "surface" | "dark";
}

function SupportingCard({
  testimonial,
  isDark,
}: {
  testimonial: SupportingTestimonial;
  isDark: boolean;
}) {
  return (
    <div
      className={`supporting-card rounded-xl border p-6 ${
        isDark
          ? "border-white/10 bg-white/5"
          : "border-border bg-surface-secondary"
      }`}
    >
      <blockquote
        className={`text-body-sm leading-relaxed ${
          isDark ? "text-white/80" : "text-primary"
        }`}
      >
        &ldquo;{testimonial.quote}&rdquo;
      </blockquote>

      <div className="mt-4 flex items-center gap-3">
        {testimonial.avatar ? (
          <img
            src={testimonial.avatar}
            alt={testimonial.name}
            className="h-8 w-8 rounded-full object-cover shrink-0"
            width={32}
            height={32}
          />
        ) : (
          <div
            className="h-8 w-8 shrink-0 rounded-full bg-accent/20 flex items-center justify-center text-accent font-semibold text-caption"
            aria-hidden="true"
          >
            {testimonial.name.charAt(0)}
          </div>
        )}
        <div>
          <p
            className={`text-caption font-semibold ${
              isDark ? "text-white" : "text-primary"
            }`}
          >
            {testimonial.name}
          </p>
          <p
            className={`text-caption ${
              isDark ? "text-white/50" : "text-secondary"
            }`}
          >
            {testimonial.role}
            {testimonial.company && `, ${testimonial.company}`}
          </p>
        </div>
      </div>
    </div>
  );
}

export function TestimonialSplit({
  eyebrow,
  headline,
  featuredQuote,
  featuredName,
  featuredRole,
  featuredCompany,
  featuredAvatar,
  featuredOutcome,
  featuredCompanyLogo,
  featuredCompanyLogoAlt,
  supporting,
  variant = "surface",
}: TestimonialSplitProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    // Header elements fade up
    const header = ref.current.querySelectorAll("[data-header]");
    if (header.length) {
      gsap.set(header, { y: 20, opacity: 0 });
      gsap.to(header, {
        y: 0,
        opacity: 1,
        duration: DURATION.moderate,
        stagger: 0.08,
        ease: EASE.enter,
        scrollTrigger: {
          trigger: ref.current,
          start: "top 80%",
          toggleActions: "play none none none",
        },
      });
    }

    // Featured quote — enters first
    const featured = ref.current.querySelector(".featured-block");
    if (featured) {
      gsap.set(featured, { y: 32, opacity: 0 });
      gsap.to(featured, {
        y: 0,
        opacity: 1,
        duration: DURATION.moderate,
        ease: EASE.enter,
        scrollTrigger: {
          trigger: ref.current,
          start: "top 75%",
          toggleActions: "play none none none",
        },
      });
    }

    // Supporting cards — stagger after featured (80ms gap)
    const cards = ref.current.querySelectorAll(".supporting-card");
    if (cards.length) {
      gsap.set(cards, { y: 24, opacity: 0 });
      gsap.to(cards, {
        y: 0,
        opacity: 1,
        duration: DURATION.moderate,
        stagger: 0.08,
        ease: EASE.enter,
        delay: 0.2,
        scrollTrigger: {
          trigger: ref.current,
          start: "top 75%",
          toggleActions: "play none none none",
        },
      });
    }
  }, { scope: ref });

  const isDark = variant === "dark";
  const bg = isDark ? "bg-primary" : "bg-surface-primary";
  const quoteColor = isDark ? "text-white" : "text-primary";
  const attrColor = isDark ? "text-white/60" : "text-secondary";
  const outcomeColor = "text-accent";

  return (
    <section ref={ref} className={`py-16 lg:py-24 ${bg}`}>
      <div className="mx-auto max-w-7xl px-6">
        {/* Optional header */}
        {(eyebrow || headline) && (
          <div className="mb-12 max-w-[48ch]">
            {eyebrow && (
              <p
                data-header
                className="text-caption font-semibold text-accent tracking-widest uppercase mb-4"
              >
                {eyebrow}
              </p>
            )}
            {headline && (
              <h2
                data-header
                className={`font-display font-bold text-h1 leading-tight tracking-tight ${quoteColor}`}
              >
                {headline}
              </h2>
            )}
          </div>
        )}

        {/* Split layout: 7-col featured + 5-col supporting */}
        <div className="grid grid-cols-1 gap-8 lg:grid-cols-12 lg:gap-12 items-start">
          {/* Featured quote — left 7 columns */}
          <div className="featured-block lg:col-span-7">
            {/* Opening quotation mark */}
            <span
              className={`block font-display font-bold leading-none mb-6 ${
                isDark ? "text-white/15" : "text-primary/12"
              } select-none`}
              style={{ fontSize: "clamp(4rem, 8vw, 8rem)" }}
              aria-hidden="true"
            >
              &ldquo;
            </span>

            {/* Outcome pill — if provided */}
            {featuredOutcome && (
              <p
                className={`text-body-sm font-semibold ${outcomeColor} mb-6`}
              >
                {featuredOutcome}
              </p>
            )}

            {/* Featured quote text — display font at h2 size */}
            <blockquote>
              <p
                className={`font-display font-medium leading-[1.3] tracking-tight italic ${quoteColor}`}
                style={{ fontSize: "clamp(1.5rem, 2.5vw, 2.25rem)" }}
              >
                &ldquo;{featuredQuote}&rdquo;
              </p>
            </blockquote>

            {/* Featured attribution */}
            <div className="mt-8 flex flex-wrap items-center gap-6">
              {featuredAvatar && (
                <img
                  src={featuredAvatar}
                  alt={featuredName}
                  className="h-12 w-12 rounded-full object-cover shrink-0"
                  width={48}
                  height={48}
                />
              )}
              <div>
                <p
                  className={`text-body-sm font-semibold ${
                    isDark ? "text-white" : "text-primary"
                  }`}
                >
                  {featuredName}
                </p>
                <p className={`text-caption ${attrColor}`}>
                  {featuredRole}
                  {featuredCompany && `, ${featuredCompany}`}
                </p>
              </div>

              {/* Company logo */}
              {featuredCompanyLogo && (
                <>
                  <div
                    className={`h-5 w-px ${
                      isDark ? "bg-white/15" : "bg-border"
                    }`}
                    aria-hidden="true"
                  />
                  <img
                    src={featuredCompanyLogo}
                    alt={featuredCompanyLogoAlt ?? (featuredCompany ?? "")}
                    className={`h-6 object-contain ${
                      isDark
                        ? "brightness-0 invert opacity-60"
                        : "grayscale opacity-60"
                    }`}
                    height={24}
                  />
                </>
              )}
            </div>
          </div>

          {/* Supporting quotes — right 5 columns */}
          <div className="lg:col-span-5 flex flex-col gap-4">
            {supporting.map((testimonial, i) => (
              <SupportingCard
                key={i}
                testimonial={testimonial}
                isDark={isDark}
              />
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
```
