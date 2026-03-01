# StickyCardStack

Full-screen cards that pin and stack on scroll. As the next card scrolls up, the underlying card scales down and blurs — creating a satisfying layered reveal sequence.

```markdown
---
component: StickyCardStack
category: interactive
subtype: scroll-stack

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: medium
  energy-moderate: high
  energy-energetic: high
visual-weight: heavy
content-density: moderate
trend-alignment: trending
motion-profile: high

use-when:
  - 3–5 distinct features or steps to showcase sequentially
  - Content items are structurally parallel (same shape of information)
  - Interaction budget allows at least one high-motion component

avoid-when:
  - Page already contains another high-motion component (CardShuffler, heavy parallax)
  - Content items are not parallel in structure
  - editorial-minimal preset (BANNED — type-first design cannot support this)
  - Fewer than 3 cards (insufficient payoff for the scroll debt)

pairs-well-with: [WaveformPulse, GradientMesh, MarqueeScroller]
pairs-poorly-with: [CardShuffler, FloatingShapes]
---
```

**Dark Luxury note:** Use `scrub: 3` instead of `scrub: true` for deliberate, controlled pacing. Do not use the blur effect — scale only.

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

interface StackCard {
  title: string;
  description: string;
  content: React.ReactNode;
  /** Optional accent color override for the card border/indicator */
  accent?: string;
}

interface StickyCardStackProps {
  cards: StackCard[];
  /** scrub speed — use 1 for standard, 3 for dark-luxury pacing */
  scrubSpeed?: number | boolean;
  /** Set false for dark-luxury — disables blur, keeps scale only */
  enableBlur?: boolean;
}

export function StickyCardStack({
  cards,
  scrubSpeed = true,
  enableBlur = true,
}: StickyCardStackProps) {
  const containerRef = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    if (!containerRef.current) return;
    const cardEls = containerRef.current.querySelectorAll<HTMLElement>(".stack-card");

    cardEls.forEach((card, i) => {
      // Last card doesn't need to be scaled away
      if (i === cardEls.length - 1) return;

      ScrollTrigger.create({
        trigger: cardEls[i + 1],
        start: "top bottom",
        end: "top top",
        scrub: scrubSpeed,
        onUpdate: (self) => {
          const p = self.progress;
          gsap.set(card, {
            scale: 1 - p * 0.05,
            filter: enableBlur ? `blur(${p * 8}px)` : "none",
            opacity: 1 - p * 0.3,
          });
        },
      });
    });
  }, { scope: containerRef });

  return (
    <div ref={containerRef}>
      {cards.map((card, i) => (
        <section
          key={i}
          className="stack-card sticky top-0 min-h-screen flex items-center justify-center p-8"
          style={{ zIndex: i + 1 }}
        >
          <div className="w-full max-w-4xl rounded-2xl bg-surface-secondary border border-border p-12 shadow-xl">
            {/* Card index indicator */}
            <span className="text-xs font-mono text-disabled tracking-wider uppercase">
              {String(i + 1).padStart(2, "0")} / {String(cards.length).padStart(2, "0")}
            </span>
            <h3 className="mt-4 font-display font-bold text-h2 text-primary">{card.title}</h3>
            <p className="mt-4 text-body-lg text-secondary leading-relaxed max-w-[55ch]">
              {card.description}
            </p>
            <div className="mt-8">{card.content}</div>
          </div>
        </section>
      ))}
    </div>
  );
}
```

**Usage:**
```tsx
<StickyCardStack
  cards={[
    { title: "Discover", description: "We audit your current position...", content: <AuditDiagram /> },
    { title: "Design", description: "A bespoke strategy built around...", content: <StrategyMap /> },
    { title: "Deliver", description: "Implementation with weekly check-ins...", content: <TimelineView /> },
  ]}
  scrubSpeed={1}
  enableBlur={true}
/>
```