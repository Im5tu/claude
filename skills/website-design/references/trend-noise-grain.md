# Trend: Noise and Grain Texture

## What It Is
SVG `feTurbulence` filter or CSS-layered noise overlays applied at 2–5% opacity over solid or gradient backgrounds to add tactile quality. Implementation: `background-image: url("data:image/svg+xml,<svg>...")` using a tiled noise SVG at `background-repeat: repeat`, layered with `mix-blend-mode: overlay` and `opacity: 0.03–0.05`. Standard practice on premium sites as of 2024 — its absence is more noticeable than its presence. The calibration: at 5%, noise should be perceptible when zoomed to 200% but not visible at normal viewing distance. At 10%, it makes the background look dirty.

## Implementation
```css
.noise-overlay {
  background-image: url("data:image/svg+xml,..."); /* tiled noise SVG */
  background-repeat: repeat;
  mix-blend-mode: overlay;
  opacity: 0.03; /* 3-5% range */
}
```

## Premium Signals
- Noise texture calibrated below perceptible motion — visible in isolation but transparent to casual attention

## Anti-Execution Warnings
- **Grain/noise at opacity above 7%** — at 7%+ opacity on light backgrounds, grain begins to read as dirt or compression artifact, not texture.

## Context Signals
Use when the brief signals: a brand that values tactile, analogue, or physical-world qualities; photography that references film grain (editorial, fashion, documentary); backgrounds that would otherwise feel flat and digital — solid colours, linear gradients, or colour fields that need subtle surface variation to feel material.
Avoid when: the noise would be applied at opacity above 5% on light backgrounds (reads as dirt or compression artifact); the design is intentionally clean and digital — noise adds an analogue patina that contradicts a brand built on precision, sterility, or futurism; the noise would layer over photographic content where it competes with the image's own texture.
Cross-aesthetic applications: A sleek, technology-focused brand can use noise at 2% opacity when the brief describes "depth" or "substance" — the barely perceptible grain prevents gradient backgrounds from feeling like flat CSS, adding the subliminal impression that the surface has physical weight. A bold, high-contrast brand can use noise at 4–5% when the brief references "screen printing," "risograph," or "poster art" — the visible grain becomes part of the graphic language, referencing physical reproduction processes.
Implementation threshold: At 5% opacity, noise should be perceptible when zoomed to 200% but invisible at normal viewing distance. SVG `feTurbulence` or tiled noise image layered with `mix-blend-mode: overlay`. The grain's frequency must match the surface — fine grain on smooth gradients, coarser grain on textured or photographic backgrounds.

## Longevity Signal
Mature — now expected on premium sites. Anti-pattern: absence on sites that claim premium positioning.
