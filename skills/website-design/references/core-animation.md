# Animation Choreography — GSAP Recipes & Scroll Patterns

Full TSX implementations for Next.js 15 + React 19 + GSAP 3 + Tailwind CSS v4.

---

## Global GSAP Setup

### Registration (do once in layout or provider)

```tsx
"use client";
import { useEffect } from "react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

export function GSAPProvider({ children }: { children: React.ReactNode }) {
  useEffect(() => {
    gsap.registerPlugin(ScrollTrigger);

    // Respect reduced motion globally
    const prefersReduced = window.matchMedia("(prefers-reduced-motion: reduce)");
    if (prefersReduced.matches) {
      gsap.globalTimeline.timeScale(1000); // effectively instant
      ScrollTrigger.defaults({ animation: undefined });
    }

    return () => {
      ScrollTrigger.getAll().forEach((t) => t.kill());
    };
  }, []);

  return <>{children}</>;
}
```

### Easing Library (`lib/animations.ts`)

```ts
export const EASE = {
  /** Standard smooth — most transitions */
  default: "power2.out",
  /** Entrance — elements appearing */
  enter: "power3.out",
  /** Exit — elements leaving */
  exit: "power2.in",
  /** Signature — overridden by preset. Default is smooth deceleration */
  signature: "power3.inOut",
  // Spring easing NOT included globally — most styles ban it.
  // If the Visual Brief explicitly permits spring, define it inline
  // in that specific component only: "back.out(1.2)"
  /** Smooth — for scroll-linked animations */
  smooth: "none",
} as const;

export const DURATION = {
  instant: 0.08,
  fast: 0.15,
  normal: 0.3,
  moderate: 0.5,
  slow: 0.8,
  deliberate: 1.0,
} as const;

export const STAGGER = {
  tight: 0.06,  // 60ms hard minimum — below this is sub-perceptual
  normal: 0.07,   // ↓ tighter — snappy stagger between siblings
  relaxed: 0.10,
  dramatic: 0.15,
} as const;

// ─── Animation Snappiness Philosophy ─────────────────────────────────────────
// Reference sites (Proctors Group, hm.la, BraveLittleBeast) feel fast and
// intentional — not floaty or slow. Target timings:
//   Entrance duration:  0.4–0.55s  (not 0.8s)
//   Clip reveals:       0.6–0.7s   (power4.inOut for crispness)
//   Stagger:            60–80ms    (not 120–150ms)
//   Y travel:           20–24px    (not 40px — subtle lift, not PowerPoint)
//   Counters:           1.2s       (intentionally dramatic — they're the payoff)
// ─────────────────────────────────────────────────────────────────────────────
```

---

## Core Animation Components

### ScrollReveal

Reusable wrapper that triggers entrance animations when elements scroll into view.

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION, STAGGER } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

type Animation = "fade-up" | "fade-scale" | "clip-reveal" | "slide-left" | "slide-right";

interface ScrollRevealProps {
  children: React.ReactNode;
  animation?: Animation;
  delay?: number;
  duration?: number;
  stagger?: number;
  threshold?: number;
  className?: string;
  tag?: keyof JSX.IntrinsicElements;
}

const animationMap: Record<Animation, gsap.TweenVars> = {
  "fade-up": { y: 20, opacity: 0 },
  "fade-scale": { scale: 0.95, opacity: 0, filter: "blur(4px)" },
  "clip-reveal": { clipPath: "inset(100% 0 0 0)", opacity: 0 },
  "slide-left": { x: -40, opacity: 0 },
  "slide-right": { x: 40, opacity: 0 },
};

export function ScrollReveal({
  children,
  animation = "fade-up",
  delay = 0,
  duration = 0.5,
  stagger: staggerAmount = 0,
  threshold = 0.2,
  className,
  tag: Tag = "div",
}: ScrollRevealProps) {
  const ref = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    const targets = staggerAmount > 0
      ? ref.current.children
      : ref.current;

    gsap.set(targets, animationMap[animation]);

    gsap.to(targets, {
      y: 0,
      x: 0,
      scale: 1,
      opacity: 1,
      filter: "blur(0px)",
      clipPath: "inset(0% 0 0 0)",
      duration,
      delay,
      stagger: staggerAmount,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: `top ${100 - threshold * 100}%`,
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  return (
    <Tag ref={ref as any} className={className}>
      {children}
    </Tag>
  );
}
```

### TextReveal

Word-by-word or line-by-line text reveal with clip mask.

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION, STAGGER } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface TextRevealProps {
  children: string;
  as?: "h1" | "h2" | "h3" | "h4" | "p" | "span";
  split?: "words" | "lines";
  stagger?: number;
  className?: string;
}

export function TextReveal({
  children,
  as: Tag = "h2",
  split = "words",
  stagger: staggerAmount = 0.06,
  className,
}: TextRevealProps) {
  const ref = useRef<HTMLElement>(null);

  const words = children.split(" ");

  useGSAP(() => {
    if (!ref.current) return;
    const spans = ref.current.querySelectorAll(".reveal-unit");

    gsap.set(spans, { y: "110%", opacity: 0 });
    gsap.to(spans, {
      y: "0%",
      opacity: 1,
      duration: 0.45,
      stagger: staggerAmount,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 85%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  return (
    <Tag ref={ref as any} className={className}>
      {words.map((word, i) => (
        <span key={i} className="inline-block overflow-hidden">
          <span className="reveal-unit inline-block">
            {word}
            {i < words.length - 1 && "\u00A0"}
          </span>
        </span>
      ))}
    </Tag>
  );
}
```

### StaggerGroup

Container that staggers children's entrance animations.

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION, STAGGER } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface StaggerGroupProps {
  children: React.ReactNode;
  stagger?: number;
  className?: string;
}

export function StaggerGroup({
  children,
  stagger: staggerAmount = 0.07,
  className,
}: StaggerGroupProps) {
  const ref = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    if (!ref.current) return;
    const items = ref.current.children;

    gsap.set(items, { y: 24, opacity: 0 });
    gsap.to(items, {
      y: 0,
      opacity: 1,
      duration: DURATION.moderate,
      stagger: staggerAmount,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 80%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  return (
    <div ref={ref} className={className}>
      {children}
    </div>
  );
}
```

---

## Named Interaction Patterns

### 1. Scroll-Linked Color Shift

Background color transitions as user scrolls through sections.

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

interface ColorSection {
  id: string;
  bgColor: string;
  textColor: string;
}

export function ScrollColorShift({
  sections,
  children,
}: {
  sections: ColorSection[];
  children: React.ReactNode;
}) {
  const containerRef = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    if (!containerRef.current) return;

    sections.forEach((section) => {
      const el = document.getElementById(section.id);
      if (!el) return;

      ScrollTrigger.create({
        trigger: el,
        start: "top 60%",
        end: "bottom 40%",
        onEnter: () => {
          gsap.to(containerRef.current, {
            backgroundColor: section.bgColor,
            color: section.textColor,
            duration: 0.6,
            ease: "power2.inOut",
          });
        },
        onEnterBack: () => {
          gsap.to(containerRef.current, {
            backgroundColor: section.bgColor,
            color: section.textColor,
            duration: 0.6,
            ease: "power2.inOut",
          });
        },
      });
    });
  }, { scope: containerRef });

  return (
    <div ref={containerRef} className="transition-colors">
      {children}
    </div>
  );
}
```

### 2. Sticky Card Stack

Full-screen cards that pin and stack on scroll. Underlying cards scale down and blur.

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
}

export function StickyCardStack({ cards }: { cards: StackCard[] }) {
  const containerRef = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    if (!containerRef.current) return;
    const cardEls = containerRef.current.querySelectorAll<HTMLElement>(".stack-card");

    cardEls.forEach((card, i) => {
      if (i === cardEls.length - 1) return; // last card doesn't scale

      ScrollTrigger.create({
        trigger: cardEls[i + 1],
        start: "top bottom",
        end: "top top",
        scrub: true,
        onUpdate: (self) => {
          const progress = self.progress;
          gsap.set(card, {
            scale: 1 - progress * 0.05,
            filter: `blur(${progress * 8}px)`,
            opacity: 1 - progress * 0.3,
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
          <div className="w-full max-w-4xl rounded-2xl bg-surface-secondary p-12 shadow-xl">
            <h3 className="text-h2 font-display font-bold">{card.title}</h3>
            <p className="mt-4 text-body-lg text-secondary">{card.description}</p>
            <div className="mt-8">{card.content}</div>
          </div>
        </section>
      ))}
    </div>
  );
}
```

### 3. Counter Ticker

Numbers count from 0 to target when scrolled into view.

```
// ─── COUNTER TICKER — USAGE RULES ────────────────────────────────────────────
// USE ONLY FOR: animated stat numbers (e.g., 150+ clients, 12 years, $4M saved)
// DO NOT USE FOR: process step labels (01, 02, 03), section numbering, decorative numbers
//
// CRITICAL — INITIAL HTML MUST SHOW THE REAL TARGET VALUE:
//   The span rendered in initial HTML MUST contain the real final number (e.g. "150+").
//   GSAP overwrites this value when ScrollTrigger fires. If GSAP fails or is blocked,
//   the real number still displays. NEVER initialise with "0" or an empty string.
//
// SELF-CONTAINED: CounterTicker manages its own ScrollTrigger. Do NOT wrap it in
//   a ScrollReveal component — that causes double-trigger conflicts and broken state.
//   The component fires when it scrolls into view independently.
// ─────────────────────────────────────────────────────────────────────────────
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

interface CounterProps {
  target: number;
  suffix?: string;
  prefix?: string;
  duration?: number;
  className?: string;
}

export function CounterTicker({
  target,
  suffix = "",
  prefix = "",
  duration = 1.2,  // Counters are intentionally dramatic — they're the payoff moment
  className,
}: CounterProps) {
  const containerRef = useRef<HTMLSpanElement>(null);
  const numberRef = useRef<HTMLSpanElement>(null);

  useGSAP(() => {
    if (!numberRef.current) return;
    const counter = { val: 0 };
    gsap.to(counter, {
      val: target,
      duration,
      ease: "power2.out",
      scrollTrigger: {
        trigger: numberRef.current,
        start: "top 85%",
        once: true,
      },
      onUpdate: () => {
        if (numberRef.current) {
          numberRef.current.textContent = prefix + Math.round(counter.val).toLocaleString() + suffix;
        }
      },
    });
  }, { scope: containerRef });

  return (
    <span ref={containerRef} className={className}>
      {/* Initial HTML renders the real target value — if GSAP fails, real number still shows */}
      <span ref={numberRef}>{prefix}{target.toLocaleString()}{suffix}</span>
    </span>
  );
}
```

### 4. Image Clip Reveal

Images reveal via expanding clip-path on scroll.

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface ClipRevealProps {
  children: React.ReactNode;
  direction?: "up" | "left" | "center";
  className?: string;
}

const clipStart = {
  up: "inset(100% 0 0 0)",
  left: "inset(0 100% 0 0)",
  center: "inset(50% 50% 50% 50%)",
};

export function ImageClipReveal({
  children,
  direction = "up",
  className,
}: ClipRevealProps) {
  const ref = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    gsap.set(ref.current, { clipPath: clipStart[direction] });
    gsap.to(ref.current, {
      clipPath: "inset(0% 0% 0% 0%)",
      duration: 0.65,
      ease: "power4.inOut",
      scrollTrigger: {
        trigger: ref.current,
        start: "top 80%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  return (
    <div ref={ref} className={className}>
      {children}
    </div>
  );
}
```

### 5. Parallax Depth Layer

Background element that moves at a different speed on scroll.

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

interface ParallaxProps {
  children: React.ReactNode;
  speed?: number; // 0.5 = half scroll speed, -0.5 = opposite direction
  className?: string;
}

export function ParallaxLayer({
  children,
  speed = 0.5,
  className,
}: ParallaxProps) {
  const ref = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    gsap.to(ref.current, {
      y: () => speed * ScrollTrigger.maxScroll(window) * 0.1,
      ease: "none",
      scrollTrigger: {
        trigger: ref.current,
        start: "top bottom",
        end: "bottom top",
        scrub: true,
        invalidateOnRefresh: true,
      },
    });
  }, { scope: ref });

  return (
    <div ref={ref} className={className}>
      {children}
    </div>
  );
}
```

---

## Performance Rules

1. **Max 3 simultaneous animations** visible in viewport at once
2. **GPU-only properties:** Only animate `transform`, `opacity`, `clipPath`, `filter`
3. **Never animate:** `width`, `height`, `margin`, `padding`, `top`, `left`, `font-size`
4. **will-change:** Apply only to elements about to animate, remove after completion
5. **Stagger groups:** Max 6-8 children per stagger group
6. **Parallax budget:** Max 2 parallax elements per viewport
7. **ScrollTrigger refresh:** Call `ScrollTrigger.refresh()` after dynamic content loads
8. **Cleanup:** Every `useGSAP` automatically cleans up. Never use raw `useEffect` for GSAP.

---

## Integration Notes

These are foundational animation primitives. They are style-agnostic — adapt timing, easing, and motion scale to the selected `style-*.md` motion personality.

- **core-animation.md** = primitives (ScrollReveal, TextReveal, GSAP setup)
- **component-*.md** = higher-level components that USE these primitives
- **Functional artifacts** (CardShuffler, TelemetryFeed, etc.) are in `component-interactive.md`

Do NOT import from this file in server components. All exports here are `"use client"`.
