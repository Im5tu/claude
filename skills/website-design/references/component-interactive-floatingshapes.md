# FloatingShapes

Abstract geometric shapes that drift slowly and respond to scroll parallax. Use sparingly as background decoration — 3 to 5 shapes maximum. Shapes should not compete with content.

```markdown
---
component: FloatingShapes
category: interactive
subtype: geometric-parallax

dimension-fit:
  contrast-dark: high
  contrast-light: medium
  energy-restrained: medium
  energy-moderate: medium
  energy-energetic: high
visual-weight: light
content-density: sparse
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - Hero section needs visual texture without photography
  - Bold or clean-saas section needs subtle kinetic depth
  - Maximum 5 shapes — any more creates visual noise

avoid-when:
  - refined-professional (BANNED — too abstract for measured authority)
  - warm-artisan (BANNED — geometric shapes conflict with organic feel)
  - editorial-minimal (BANNED — competes with typography-as-design)
  - Section already has GradientMesh (redundant layers)

pairs-well-with: [GradientMesh, WaveformPulse]
pairs-poorly-with: [CardShuffler, TelemetryFeed]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

interface Shape {
  type: "circle" | "square" | "triangle";
  size: number;
  x: string; // CSS left (e.g., "20%")
  y: string; // CSS top (e.g., "30%")
  color: string;
  opacity?: number;
  /** Parallax speed multiplier — positive moves with scroll, negative against */
  parallaxSpeed?: number;
}

export function FloatingShapes({
  shapes,
  className,
}: {
  shapes: Shape[];
  className?: string;
}) {
  const ref = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    if (!ref.current) return;
    const els = ref.current.querySelectorAll<HTMLDivElement>(".floating-shape");

    els.forEach((el, i) => {
      const shape = shapes[i];

      // Ambient drift — plays while in viewport, pauses when scrolled out
      gsap.to(el, {
        y: gsap.utils.random(-30, 30),
        x: gsap.utils.random(-20, 20),
        rotation: gsap.utils.random(-15, 15),
        duration: gsap.utils.random(6, 10),
        ease: "sine.inOut",
        repeat: 3,
        yoyo: true,
        delay: i * 0.8,
        scrollTrigger: {
          trigger: ref.current,
          start: "top bottom",
          end: "bottom top",
          toggleActions: "play pause resume pause",
        },
      });

      // Scroll parallax
      const speed = shape.parallaxSpeed ?? (i % 2 === 0 ? 0.3 : -0.3);
      gsap.to(el, {
        y: () => speed * 200,
        ease: "none",
        scrollTrigger: {
          trigger: ref.current,
          start: "top bottom",
          end: "bottom top",
          scrub: 1.5,
        },
      });
    });
  }, { scope: ref });

  const shapeClass = (type: Shape["type"]) => {
    switch (type) {
      case "circle": return "rounded-full";
      case "square": return "rounded-lg rotate-12";
      case "triangle": return "";
    }
  };

  return (
    <div
      ref={ref}
      className={`absolute inset-0 overflow-hidden pointer-events-none ${className ?? ""}`}
      aria-hidden="true"
    >
      {shapes.map((shape, i) => (
        <div
          key={i}
          className={`floating-shape absolute border-2 ${shapeClass(shape.type)}`}
          style={{
            left: shape.x,
            top: shape.y,
            width: shape.size,
            height: shape.size,
            borderColor: shape.color,
            opacity: shape.opacity ?? 0.15,
            clipPath:
              shape.type === "triangle"
                ? "polygon(50% 0%, 0% 100%, 100% 100%)"
                : undefined,
          }}
        />
      ))}
    </div>
  );
}
```

**Usage:**
```tsx
<section className="relative min-h-screen">
  <FloatingShapes
    shapes={[
      { type: "circle", size: 120, x: "10%", y: "20%", color: "var(--color-accent)", opacity: 0.12 },
      { type: "square", size: 80, x: "75%", y: "15%", color: "var(--color-accent)", opacity: 0.08 },
      { type: "triangle", size: 100, x: "60%", y: "60%", color: "var(--color-primary)", opacity: 0.06 },
      { type: "circle", size: 60, x: "85%", y: "70%", color: "var(--color-accent)", opacity: 0.10 },
    ]}
  />
  <div className="relative z-10">
    {/* Section content */}
  </div>
</section>
```