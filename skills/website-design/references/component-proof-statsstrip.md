# StatsStrip

Full-bleed contrasting background with 3-4 large animated metrics. CounterTicker for all numbers. The highest-impact credibility signal on the page — it stops the scroll and lands a punch.

```
---
component: StatsStrip
category: proof
subtype: stats-counter-strip

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: high
visual-weight: heavy
content-density: sparse
trend-alignment: evergreen
motion-profile: moderate

use-when:
  - Brand has 3-4 real, impressive metrics to show
  - Between content sections as a visual color break
  - Any preset — StatsStrip adapts via background color choice
  - When the numbers themselves are a credibility signal

avoid-when:
  - You don't have real metrics (placeholder stats destroy trust)
  - Immediately after another dark/contrasting section (needs light section before it)

pairs-well-with: [AlternatingRows, NumberedSteps, LogoStrip]
pairs-poorly-with: [FeaturedTestimonial — both are "proof" moments, choose one for rhythm]
---
```

> **CounterTicker rules for StatsStrip:**
> - Each stat uses `<CounterTicker>` for the animated number
> - Initial HTML renders the real target value (if GSAP fails, the number still shows)
> - CounterTicker manages its own ScrollTrigger — do NOT wrap in `<ScrollReveal>`
> - Wrap the ENTIRE section in a scroll-aware container (see implementation below)

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION } from "@/lib/animations";
import { CounterTicker } from "@/components/animations/counter-ticker";

gsap.registerPlugin(ScrollTrigger);

interface Stat {
  value: number;
  /** e.g. "+" or "%" */
  suffix?: string;
  /** e.g. "$" or "£" */
  prefix?: string;
  label: string;
  /** Optional context line — e.g. "and growing" */
  sublabel?: string;
}

interface StatsStripProps {
  stats: Stat[];
  /** Section label above stats */
  eyebrow?: string;
  /** Background style — defaults to "dark" (bg-primary) */
  variant?: "dark" | "accent" | "surface";
}

const variantClasses = {
  dark: "bg-primary",
  accent: "bg-accent",
  surface: "bg-surface-secondary",
};

const textClasses = {
  dark: { headline: "text-white", label: "text-white/60", eyebrow: "text-white/40" },
  accent: { headline: "text-white", label: "text-white/70", eyebrow: "text-white/50" },
  surface: { headline: "text-primary", label: "text-secondary", eyebrow: "text-accent" },
};

export function StatsStrip({ stats, eyebrow, variant = "dark" }: StatsStripProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    // Eyebrow and stat labels fade in (CounterTicker handles its own animation)
    const labels = ref.current.querySelectorAll("[data-stat-label]");
    gsap.set(labels, { y: 16, opacity: 0 });
    gsap.to(labels, {
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

  const colors = textClasses[variant];

  return (
    <section ref={ref} className={`py-14 lg:py-20 ${variantClasses[variant]}`}>
      <div className="mx-auto max-w-7xl px-6">
        {eyebrow && (
          <p
            data-stat-label
            className={`text-center text-caption font-semibold tracking-widest uppercase mb-10 ${colors.eyebrow}`}
          >
            {eyebrow}
          </p>
        )}

        {/* Stats grid — CounterTicker is self-contained, do not nest in ScrollReveal */}
        <div
          className={`grid grid-cols-2 gap-10 lg:grid-cols-${Math.min(stats.length, 4)} lg:gap-0 lg:divide-x lg:divide-white/10`}
        >
          {stats.map((stat, i) => (
            <div key={i} className="text-center lg:px-12">
              {/* Animated number — CounterTicker manages its own ScrollTrigger */}
              <div
                className={`font-display font-bold leading-none tracking-tight ${colors.headline}`}
                style={{ fontSize: "clamp(2.5rem, 5vw, 5rem)" }}
              >
                <CounterTicker
                  target={stat.value}
                  prefix={stat.prefix}
                  suffix={stat.suffix}
                  duration={1.4}
                />
              </div>

              <p
                data-stat-label
                className={`mt-3 text-body-sm font-medium ${colors.label}`}
              >
                {stat.label}
              </p>
              {stat.sublabel && (
                <p
                  data-stat-label
                  className={`mt-1 text-caption ${colors.eyebrow}`}
                >
                  {stat.sublabel}
                </p>
              )}
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
```

**Usage:**
```tsx
<StatsStrip
  eyebrow="Trusted at scale"
  variant="dark"
  stats={[
    { value: 500, suffix: "+", label: "Clients served", sublabel: "across 18 countries" },
    { value: 98, suffix: "%", label: "Retention rate" },
    { value: 2, prefix: "$", suffix: "B+", label: "Assets managed" },
    { value: 15, label: "Years in practice" },
  ]}
/>
```
