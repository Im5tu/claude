# Component Interactive — Index

**Interaction budget rule:** Each dimensional signal has a maximum number of these components per page (see vocabulary files). Exceeding the budget dilutes the impact of each one.

**Critical rule: Every component in this file is self-contained with its own ScrollTrigger. Never wrap any of these in a ScrollReveal component — that causes double-trigger conflicts, broken state, and race conditions.**

Selection logic:
1. 3-5 features to stack and reveal on scroll? → StickyCardStack
2. Brief content items that cycle playfully? → CardShuffler
3. Live data / terminal aesthetic? → TelemetryFeed
4. Decorative SVG accent with motion? → WaveformPulse
5. Atmospheric background layer without photos? → GradientMesh
6. Abstract geometric parallax decoration? → FloatingShapes
7. Page sections with different color moods? → ScrollColorShift
8. Infinite text/logo ticker? → MarqueeScroller

## Comparison Table

| Component | Use When | Visual Weight | Motion Profile | Dimension Fit |
|---|---|---|---|---|
| StickyCardStack | 3-5 parallel features; scroll-to-reveal stack | heavy | high | contrast-dark: high, contrast-light: high, energy-energetic: high, energy-moderate: high |
| CardShuffler | Brief cycling cards; auto-rotate + click | heavy | high | contrast-dark: high, energy-energetic: high |
| TelemetryFeed | SaaS/tech live data stream aesthetic | medium | moderate | contrast-light + technical: high, contrast-dark: medium |
| WaveformPulse | SVG draw + breathing pulse accent | light | moderate | contrast-dark: high, contrast-light: high, energy-energetic: high, energy-moderate: high |
| GradientMesh | Atmospheric background layer; slow color orbs | light | minimal | contrast-dark: high, contrast-light: high, energy-moderate: high, energy-energetic: high |
| FloatingShapes | Abstract geometric parallax decoration | light | minimal | contrast-dark: high, energy-energetic: high, energy-moderate: medium |
| ScrollColorShift | Page sections shift background color on scroll | medium | moderate | contrast-dark: high, energy-energetic: high, contrast-light: medium |
| MarqueeScroller | CSS infinite horizontal ticker for text/logos | medium | minimal | energy-energetic: high, contrast-dark: high, energy-restrained + editorial: medium |

## Performance Notes
- Max 3 simultaneous animations visible in the viewport at any time
- GPU-only: All GSAP animates only transform, opacity, filter, clipPath
- MarqueeScroller is CSS-only — cheapest motion option
- GSAPProvider applies timeScale(1000) for prefers-reduced-motion

## Component Files
- [StickyCardStack](component-interactive-stickycardstack.md) — Scroll-pinned stacking cards with scale + blur
- [CardShuffler](component-interactive-cardshuffler.md) — Cycling card stack with spring physics
- [TelemetryFeed](component-interactive-telemetryfeed.md) — Typewriter terminal with pulsing cursor
- [WaveformPulse](component-interactive-waveformpulse.md) — SVG waveform draw + breathing animation
- [GradientMesh](component-interactive-gradientmesh.md) — Animated gradient orbs background layer
- [FloatingShapes](component-interactive-floatingshapes.md) — Geometric parallax decoration layer
- [ScrollColorShift](component-interactive-scrollcolorshift.md) — Scroll-linked background color transitions
- [MarqueeScroller](component-interactive-marqueescroller.md) — CSS infinite horizontal ticker
