# Trend: 3D Elements

## What It Is
Three-dimensional objects as primary design elements — distinct from card tilt effects (cursor-driven 2D perspective rotation). Patterns: scroll-linked 3D scene state changes (a 3D object transforms, rotates, or morphs as the user scrolls through content); glassmorphism combined with 3D elements (glass-effect logos or brand objects with mouse parallax layers); 3D carousels with scroll-triggered perspective; mixed 2D-and-3D layouts (flat type and line art alongside 3D background elements); brand metaphors rendered literally in 3D ("reach" = hand reaching outward). Homepage-heavy pattern — 3D effort concentrated on the hero and one feature section; inner pages remain clear and conventional. Design principle: connect every 3D element to scroll or cursor interaction — idle, non-responsive 3D feels decorative and gratuitous.

## Implementation
```tsx
// Spline embed (simplest approach for non-Three.js teams)
import Spline from "@splinetool/react-spline";

export function Hero3D() {
  return (
    <section className="relative min-h-screen overflow-hidden">
      <div className="absolute inset-0 z-0">
        <Spline scene="https://prod.spline.design/[scene-id]/scene.splinecode" />
      </div>
      <div className="relative z-10 flex min-h-screen items-center">
        {/* Hero text content */}
      </div>
    </section>
  );
}

// Three.js + GSAP ScrollTrigger for scroll-linked state
import * as THREE from "three";
import { ScrollTrigger } from "gsap/ScrollTrigger";

// In useEffect/useGSAP:
ScrollTrigger.create({
  trigger: ".scene-section",
  start: "top top",
  end: "bottom bottom",
  scrub: 1,
  onUpdate: (self) => {
    // Map scroll progress to object rotation
    mesh.rotation.y = self.progress * Math.PI * 2;
    mesh.position.y = self.progress * -2;
  },
});

// React Three Fiber (for Next.js integration)
import { Canvas, useFrame } from "@react-three/fiber";
import { useScroll } from "@react-three/drei";

function ScrollLinkedMesh() {
  const scroll = useScroll();
  const meshRef = useRef();
  useFrame(() => {
    meshRef.current.rotation.y = scroll.offset * Math.PI * 2;
  });
  return <mesh ref={meshRef}><boxGeometry /><meshStandardMaterial /></mesh>;
}
```

## Premium Signals
- 3D objects that animate their STATE per scroll section — not continuous rotation, but meaningful transformations (closed → open, simple → complex, whole → exploded) that reinforce the content
- Mix of 2D type and 3D scene that appears compositionally intentional — type and 3D object share a visual axis, not floating independently
- 3D page transition: entering the next page as if zooming into physical space — depth as navigation metaphor

## Anti-Execution Warnings
- **3D with no scroll or cursor link** — idle 3D objects with no interaction feel decorative and gratuitous. Every 3D element must respond to scroll position or cursor input to justify its rendering cost.
- **AI-generated or obviously low-poly 3D** — generic 3D shapes (spinning torus, default cube) read as placeholder content. 3D must be purpose-designed for the brand context.
- **No loading transition** — Three.js and Spline scenes can take 2–5 seconds to initialize. Always provide a meaningful loading state (poster image, skeleton, or branded loading animation) that covers the initialization period.
- **No mobile fallback** — 3D rendering is GPU-intensive. Always implement a device capability check and serve a 2D alternative for mobile or low-power devices.

## Context Signals
Use when: the brief describes a product, service, or concept that is inherently three-dimensional (physical product, architectural space, technical system, machinery); the brand describes itself as "technical," "innovative," "ahead," or "next-generation"; the homepage is the primary impression vehicle and the brand has budget for 3D asset production.
Avoid when: the business is service-led with no physical or spatial component (accounting, legal, therapy, writing); the target audience is on mobile-primary (3D performance degrades significantly); the brief describes a "clean," "minimal," or "text-first" direction where 3D would add unnecessary complexity.
Cross-aesthetic applications: A logistics company can use a scroll-linked 3D truck or warehouse element when the brief describes "state-of-the-art infrastructure" — the 3D signals technological sophistication without changing the brand's professional register. A financial planning tool can use a 3D data visualization (a rotating sphere of numbers or a physical bar chart) in a restrained, data-first context.
Implementation threshold: Spline is appropriate for teams without Three.js expertise. Three.js/React Three Fiber for teams needing full control. Always implement: progressive loading with poster, GPU capability check, mobile 2D fallback, and scroll/cursor linkage for every 3D element. 3D effort concentrated on homepage only — product pages and subpages use conventional layouts.

## Longevity Signal
Ascending — 3D is becoming an expected feature for technology and innovation brands; differentiation is now in the quality and intentionality of the 3D work, not the mere presence of it.
