# MarqueeScroller

Continuously scrolling horizontal ticker — CSS-only, no GSAP. Use for large display-type text scrolling left (editorial statement) or logo strips (social proof). The element set is duplicated so the loop is perfectly seamless.

```markdown
---
component: MarqueeScroller
category: interactive
subtype: css-marquee

dimension-fit:
  contrast-dark: high
  contrast-light: medium
  energy-restrained: medium
  energy-moderate: medium
  energy-energetic: high
visual-weight: medium
content-density: sparse
trend-alignment: trending
motion-profile: minimal

use-when:
  - Social proof logo strip (replaces static logo grid when motion budget allows)
  - Bold typographic statement repeated horizontally for editorial sections
  - Interstitial section break between two content sections

avoid-when:
  - refined-professional (BANNED — playful motion undermines authority)
  - Content must be read carefully (marquee speed makes sustained reading difficult)
  - More than 8 logos (visual density becomes overwhelming at scroll speed)

pairs-well-with: [StickyCardStack, Manifesto, WaveformPulse]
pairs-poorly-with: [TelemetryFeed, GradientMesh]
---
```

```tsx
// MarqueeScroller — CSS infinite scroll, no GSAP
// Text marquee: large display type, ideal as editorial section divider
// Logo marquee: grayscale logos, social proof treatment
// Items duplicated to create seamless infinite loop

interface MarqueeScrollerProps {
  items: string[] | { src: string; alt: string }[];
  speed?: "slow" | "medium" | "fast";
  direction?: "left" | "right";
  type?: "text" | "logos";
  className?: string;
}

const speedMap = {
  slow: "40s",
  medium: "25s",
  fast: "15s",
};

export function MarqueeScroller({
  items,
  speed = "medium",
  direction = "left",
  type = "text",
  className,
}: MarqueeScrollerProps) {
  const duration = speedMap[speed];
  const animationName = direction === "left" ? "marquee-left" : "marquee-right";

  // Duplicate items for seamless loop
  const doubled = [...items, ...items] as typeof items;

  return (
    <>
      {/* Keyframe injection — Tailwind v4 arbitrary keyframes */}
      <style>{`
        @keyframes marquee-left {
          from { transform: translateX(0); }
          to   { transform: translateX(-50%); }
        }
        @keyframes marquee-right {
          from { transform: translateX(-50%); }
          to   { transform: translateX(0); }
        }
      `}</style>

      <div
        className={`overflow-hidden ${className ?? ""}`}
        aria-label={type === "logos" ? "Trusted by these companies" : undefined}
        role={type === "logos" ? "region" : undefined}
      >
        <div
          className="flex whitespace-nowrap will-change-transform"
          style={{
            animation: `${animationName} ${duration} linear infinite`,
          }}
        >
          {doubled.map((item, i) => {
            const isLogo = typeof item === "object" && "src" in item;

            if (isLogo) {
              const logo = item as { src: string; alt: string };
              return (
                <div
                  key={i}
                  className="mx-8 flex shrink-0 items-center"
                  aria-hidden={i >= items.length}
                >
                  <img
                    src={logo.src}
                    alt={logo.alt}
                    className="h-7 object-contain grayscale opacity-50 transition-opacity hover:opacity-80"
                    height={28}
                  />
                </div>
              );
            }

            return (
              <span
                key={i}
                className="mx-6 shrink-0 font-display font-bold text-display-xl tracking-tight text-primary"
                aria-hidden={i >= items.length}
              >
                {item as string}
                <span className="mx-6 text-accent" aria-hidden="true">*</span>
              </span>
            );
          })}
        </div>
      </div>
    </>
  );
}
```

**Text marquee usage (editorial statement):**
```tsx
<div className="py-12 border-y border-border overflow-hidden">
  <MarqueeScroller
    type="text"
    items={["Brand Strategy", "Web Design", "Identity Systems", "Digital Products"]}
    speed="slow"
    direction="left"
  />
</div>
```

**Logo marquee usage (social proof):**
```tsx
<section className="py-12">
  <p className="text-center text-xs uppercase tracking-widest text-disabled mb-8">
    Trusted by leading teams
  </p>
  <MarqueeScroller
    type="logos"
    items={[
      { src: "/logos/acme.svg", alt: "Acme Corp" },
      { src: "/logos/globex.svg", alt: "Globex" },
    ]}
    speed="slow"
  />
</section>
```