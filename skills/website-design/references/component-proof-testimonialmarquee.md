# TestimonialMarquee

Horizontal CSS marquee strip of short testimonials. Text-only — no cards, no avatars. Each quote is a short 1-2 sentence snippet with em-dash attribution, separated by bullet or vertical-bar glyphs. Items are duplicated for a seamless infinite loop. CSS-only animation — no GSAP — so it carries zero motion budget cost. Visual weight is light, making it the perfect breath between two heavy sections.

```
---
component: TestimonialMarquee
category: proof
subtype: testimonial-marquee-strip

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: high
visual-weight: light
content-density: sparse
trend-alignment: evergreen
motion-profile: minimal

style-fit:
  refined-professional: high
  warm-artisan: high
  bold-studio: medium
  dark-luxury: high
  clean-saas: high
  editorial-minimal: high
  vibrant-consumer: high
  modern-organic: high

use-when:
  - Between two visually heavy sections — provides a light breathing break
  - After a hero or stats strip — ambient social proof without demanding attention
  - When you have 4-8 short, punchy testimonials (1-2 sentences max)
  - Any style preset — universal fit, like LogoStrip
  - When motion budget is tight — CSS animation does not count against GSAP interaction budget

avoid-when:
  - Testimonials are longer than 2 sentences (reading at scroll speed becomes impossible)
  - Fewer than 4 testimonials (the loop gap becomes visible)
  - More than 8 testimonials (the strip becomes too long for a single row)
  - Immediately after TestimonialGrid or FeaturedTestimonial (redundant proof pattern)

pairs-well-with: [StatsStrip, AlternatingRows, NumberedSteps, LogoStrip]
pairs-poorly-with: [TestimonialGrid — both are multi-voice testimonial sections, choose one]
---
```

> **RULES — Non-negotiable:**
> - Maximum 2 sentences per testimonial. If a quote is longer, trim it.
> - CSS-only animation — no GSAP, no JS timers.
> - Items MUST be duplicated in the DOM for seamless loop (`[...items, ...items]`).
> - `animation-play-state: paused` on hover for accessibility.
> - `prefers-reduced-motion: reduce` pauses the animation entirely.
> - No cards, no borders, no backgrounds on individual quotes — text only.

```tsx
"use client";

interface Testimonial {
  quote: string;
  name: string;
  role?: string;
}

interface TestimonialMarqueeProps {
  testimonials: Testimonial[];
  /** Scroll speed — defaults to "medium" */
  speed?: "slow" | "medium" | "fast";
  /** Separator glyph between quotes — defaults to "bar" */
  separator?: "bullet" | "bar";
  className?: string;
}

const speedMap = {
  slow: "50s",
  medium: "35s",
  fast: "20s",
};

export function TestimonialMarquee({
  testimonials,
  speed = "medium",
  separator = "bar",
  className,
}: TestimonialMarqueeProps) {
  const duration = speedMap[speed];
  const sep = separator === "bar" ? "|" : "\u2022";

  // Duplicate items for seamless infinite loop
  const doubled = [...testimonials, ...testimonials];

  return (
    <>
      <style>{`
        @keyframes testimonial-marquee {
          from { transform: translateX(0); }
          to   { transform: translateX(-50%); }
        }
        @media (prefers-reduced-motion: reduce) {
          .testimonial-marquee-track {
            animation-play-state: paused !important;
          }
        }
      `}</style>

      <section
        className={`py-6 lg:py-8 bg-surface-primary overflow-hidden ${className ?? ""}`}
        aria-label="Client testimonials"
      >
        {/* Edge fade mask */}
        <div
          className="relative"
          style={{
            maskImage:
              "linear-gradient(to right, transparent, black 8%, black 92%, transparent)",
            WebkitMaskImage:
              "linear-gradient(to right, transparent, black 8%, black 92%, transparent)",
          }}
        >
          <div
            className="testimonial-marquee-track flex items-center whitespace-nowrap will-change-transform hover:[animation-play-state:paused]"
            style={{
              animation: `testimonial-marquee ${duration} linear infinite`,
            }}
          >
            {doubled.map((t, i) => (
              <span
                key={i}
                className="inline-flex shrink-0 items-center"
                aria-hidden={i >= testimonials.length}
              >
                {/* Separator — skip before the very first visible item */}
                {i > 0 && (
                  <span
                    className="mx-5 text-body-sm text-disabled select-none"
                    aria-hidden="true"
                  >
                    {sep}
                  </span>
                )}

                {/* Quote + attribution */}
                <span className="text-body-sm text-secondary leading-normal">
                  &ldquo;{t.quote}&rdquo;
                </span>
                <span className="ml-2 text-body-sm font-medium text-primary">
                  &mdash;&nbsp;{t.name}
                  {t.role && (
                    <span className="text-secondary font-normal">
                      , {t.role}
                    </span>
                  )}
                </span>
              </span>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
```

**Usage:**
```tsx
<TestimonialMarquee
  speed="slow"
  separator="bar"
  testimonials={[
    { quote: "Completely transformed our online presence.", name: "Sarah Chen", role: "CEO, Luminary" },
    { quote: "The best agency we've ever worked with. Period.", name: "Marcus Webb", role: "VP Marketing, Arcline" },
    { quote: "They delivered in half the time we expected.", name: "Priya Sharma", role: "Founder, Kessel" },
    { quote: "Our conversion rate doubled within two months.", name: "James Okoro", role: "Head of Growth, Tideway" },
    { quote: "Finally a team that actually listens.", name: "Elena Ruiz", role: "COO, Meridian" },
  ]}
/>
```
