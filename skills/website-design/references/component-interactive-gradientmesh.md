# GradientMesh

Animated gradient background with slowly shifting color orbs. Atmosphere, not animation — the motion should be nearly imperceptible. This is a **background layer**, not a standalone section. Always use it inside another section's `absolute inset-0` context.

```markdown
---
component: GradientMesh
category: interactive
subtype: atmospheric-background

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: high
visual-weight: light
content-density: sparse
trend-alignment: trending
motion-profile: minimal

use-when:
  - Hero section needs visual energy without a photograph
  - Dark section needs depth and atmosphere
  - Paired with GlassCard for a frosted-overlay treatment

avoid-when:
  - warm-artisan (too digital, undermines handcrafted feel — BANNED)
  - editorial-minimal (competes with typography as design system — BANNED)
  - On a flat white background section (orbs become muddy blobs)

pairs-well-with: [GlassCard, FloatingShapes, TelemetryFeed]
pairs-poorly-with: [Manifesto, MarqueeScroller]
---
```

**Note:** This is a background layer, not a standalone section. Always position it inside a `relative` parent with `absolute inset-0` overflow-hidden.

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";

interface GradientMeshProps {
  /** Three color stops for the orbs. Use preset palette colors. */
  colors: [string, string, string];
  className?: string;
}

export function GradientMesh({ colors, className }: GradientMeshProps) {
  const ref = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    if (!ref.current) return;
    const orbs = ref.current.querySelectorAll<HTMLDivElement>(".mesh-orb");

    orbs.forEach((orb, i) => {
      gsap.to(orb, {
        x: () => gsap.utils.random(-100, 100),
        y: () => gsap.utils.random(-80, 80),
        scale: gsap.utils.random(0.8, 1.3),
        duration: gsap.utils.random(8, 14),
        ease: "sine.inOut",
        yoyo: true,
        repeat: 3,
        delay: i * 1.5,
        scrollTrigger: {
          trigger: ref.current,
          start: "top bottom",
          end: "bottom top",
          toggleActions: "play pause resume pause",
        },
      });
    });
  }, { scope: ref });

  return (
    <div
      ref={ref}
      className={`absolute inset-0 overflow-hidden ${className ?? ""}`}
      aria-hidden="true"
    >
      <div
        className="mesh-orb absolute top-1/4 left-1/4 h-[50vh] w-[50vh] rounded-full opacity-30 blur-[120px]"
        style={{ backgroundColor: colors[0] }}
      />
      <div
        className="mesh-orb absolute top-1/3 right-1/4 h-[40vh] w-[40vh] rounded-full opacity-25 blur-[100px]"
        style={{ backgroundColor: colors[1] }}
      />
      <div
        className="mesh-orb absolute bottom-1/4 left-1/3 h-[45vh] w-[45vh] rounded-full opacity-20 blur-[110px]"
        style={{ backgroundColor: colors[2] }}
      />
    </div>
  );
}
```

**Usage:**
```tsx
<section className="relative min-h-screen flex items-center">
  <GradientMesh colors={["#6366F1", "#A78BFA", "#06B6D4"]} />
  <div className="relative z-10">
    {/* Hero content */}
  </div>
</section>
```