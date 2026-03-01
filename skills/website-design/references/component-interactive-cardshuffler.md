# CardShuffler

Cycling overlapping card stack with spring physics. Cards auto-rotate on a 4-second timer and can be manually clicked to advance. Creates delight without demanding active user engagement.

```markdown
---
component: CardShuffler
category: interactive
subtype: cycling-stack

dimension-fit:
  contrast-dark: high
  contrast-light: medium
  energy-restrained: low
  energy-moderate: medium
  energy-energetic: high
visual-weight: heavy
content-density: moderate
trend-alignment: trending
motion-profile: high

use-when:
  - Feature showcases or testimonials that benefit from progressive reveal
  - Interaction budget allows a high-motion element
  - Content items are brief enough to be understood in isolation

avoid-when:
  - Serious or authority-positioning brand (BANNED for refined-professional, warm-artisan)
  - Content requires careful, full reading before moving on
  - More than 6 cards (diminishing returns, becomes a carousel)

pairs-well-with: [GradientMesh, MarqueeScroller]
pairs-poorly-with: [StickyCardStack]
---
```

```tsx
"use client";
import { useRef, useState, useCallback } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";

interface ShuffleCard {
  title: string;
  description: string;
  accent?: string;
  icon?: React.ReactNode;
}

export function CardShuffler({ cards }: { cards: ShuffleCard[] }) {
  const containerRef = useRef<HTMLDivElement>(null);
  const [activeIndex, setActiveIndex] = useState(0);
  const isAnimating = useRef(false);

  const shuffle = useCallback(() => {
    if (isAnimating.current || !containerRef.current) return;
    isAnimating.current = true;

    const cardEls = containerRef.current.querySelectorAll<HTMLElement>(".shuffle-card");
    const frontCard = cardEls[activeIndex];

    // Animate front card out with spring physics
    gsap.to(frontCard, {
      y: -20,
      scale: 0.9,
      opacity: 0,
      rotateZ: gsap.utils.random(-8, 8),
      duration: 0.4,
      ease: "back.in(1.4)",
      onComplete: () => {
        gsap.set(frontCard, { y: 0, scale: 1, opacity: 1, rotateZ: 0, zIndex: 0 });

        const next = (activeIndex + 1) % cards.length;
        cardEls.forEach((card, i) => {
          const offset = (i - next + cards.length) % cards.length;
          gsap.to(card, {
            zIndex: cards.length - offset,
            y: offset * 8,
            scale: 1 - offset * 0.04,
            opacity: 1 - offset * 0.15,
            duration: 0.5,
            ease: "back.out(1.2)",
          });
        });

        setActiveIndex(next);
        isAnimating.current = false;
      },
    });
  }, [activeIndex, cards.length]);

  // Auto-shuffle on interval
  useGSAP(() => {
    const interval = setInterval(shuffle, 4000);
    return () => clearInterval(interval);
  }, { dependencies: [shuffle] });

  // Initial stack layout
  useGSAP(() => {
    if (!containerRef.current) return;
    const cardEls = containerRef.current.querySelectorAll<HTMLElement>(".shuffle-card");
    cardEls.forEach((card, i) => {
      gsap.set(card, {
        zIndex: cards.length - i,
        y: i * 8,
        scale: 1 - i * 0.04,
        opacity: 1 - i * 0.15,
      });
    });
  }, { scope: containerRef });

  return (
    <div
      ref={containerRef}
      className="relative h-[320px] w-full max-w-md mx-auto cursor-pointer select-none"
      onClick={shuffle}
      onKeyDown={(e) => e.key === "Enter" || e.key === " " ? shuffle() : undefined}
      role="button"
      tabIndex={0}
      aria-label={`Card stack — showing card ${activeIndex + 1} of ${cards.length}. Press to advance.`}
    >
      {cards.map((card, i) => (
        <div
          key={i}
          className="shuffle-card absolute inset-0 rounded-2xl border border-border bg-surface-secondary p-8 shadow-lg"
          aria-hidden={i !== activeIndex}
        >
          {card.icon && (
            <div className="mb-4 text-accent">{card.icon}</div>
          )}
          <h4 className="font-display font-bold text-h3 text-primary">{card.title}</h4>
          <p className="mt-3 text-body text-secondary leading-relaxed">{card.description}</p>
        </div>
      ))}
      <p className="absolute -bottom-8 left-0 right-0 text-center text-xs text-disabled" aria-hidden="true">
        Click to advance
      </p>
    </div>
  );
}
```