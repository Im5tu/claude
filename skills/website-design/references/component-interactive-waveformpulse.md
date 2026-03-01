# WaveformPulse

Animated SVG waveform that draws itself on scroll entry using stroke-dashoffset, then pulses gently in a continuous breathing loop. Great as a decorative accent on dark sections, stats areas, or audio/signal-themed products.

```markdown
---
component: WaveformPulse
category: interactive
subtype: svg-draw-animation

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: medium
  energy-moderate: high
  energy-energetic: high
visual-weight: light
content-density: sparse
trend-alignment: evergreen
motion-profile: moderate

use-when:
  - Audio, signal, or data-processing product
  - Section divider or accent that needs motion without a full component
  - Stats sections on dark backgrounds

avoid-when:
  - Warm artisan (too digital/technical for organic brand)
  - Already have multiple other animated elements in the viewport

pairs-well-with: [TelemetryFeed, GradientMesh, CounterTicker]
pairs-poorly-with: [FloatingShapes]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

interface WaveformPulseProps {
  color?: string;
  width?: number;
  height?: number;
  /** Number of peaks — more peaks = denser waveform */
  peaks?: number;
  className?: string;
}

export function WaveformPulse({
  color = "var(--color-accent)",
  width = 400,
  height = 80,
  peaks = 40,
  className,
}: WaveformPulseProps) {
  const svgRef = useRef<SVGSVGElement>(null);

  // Deterministic waveform — avoid Math.random() in render so SSR matches client
  const step = width / peaks;
  const pathData = Array.from({ length: peaks }, (_, i) => {
    const x = i * step;
    const amplitude = Math.sin(i * 0.5) * (height * 0.35) + (Math.sin(i * 1.3) * height * 0.1);
    const y = height / 2 + (i % 2 === 0 ? amplitude : -amplitude);
    return `${i === 0 ? "M" : "L"} ${x.toFixed(1)} ${y.toFixed(1)}`;
  }).join(" ");

  useGSAP(() => {
    if (!svgRef.current) return;
    const path = svgRef.current.querySelector<SVGPathElement>(".waveform-path");
    if (!path) return;

    const length = path.getTotalLength();
    gsap.set(path, { strokeDasharray: length, strokeDashoffset: length });

    // Draw on scroll entry
    gsap.to(path, {
      strokeDashoffset: 0,
      duration: 2,
      ease: "power2.inOut",
      scrollTrigger: {
        trigger: svgRef.current,
        start: "top 80%",
        toggleActions: "play none none none",
      },
    });

    // Subtle pulse after draw completes — plays while in viewport
    gsap.to(path, {
      opacity: 0.6,
      duration: 1.5,
      repeat: 3,
      yoyo: true,
      ease: "sine.inOut",
      delay: 2,
      scrollTrigger: {
        trigger: svgRef.current,
        start: "top bottom",
        end: "bottom top",
        toggleActions: "play pause resume pause",
      },
    });
  }, { scope: svgRef });

  return (
    <svg
      ref={svgRef}
      viewBox={`0 0 ${width} ${height}`}
      className={className}
      width={width}
      height={height}
      aria-hidden="true"
    >
      <path
        className="waveform-path"
        d={pathData}
        fill="none"
        stroke={color}
        strokeWidth={2}
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  );
}
```