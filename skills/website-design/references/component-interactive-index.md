# Component Interactive — Index

Interactive components are high-signal visual moments. Each one has an opinion and draws attention. Over-using them dilutes every one.

**Interaction budget:** the direction card sets a max count per page (from `core-aesthetic-vocabulary.md §5`). Do not exceed it.

All interactive components in this stack are either:
- **Pure CSS** (`animation-timeline: scroll()` / `view()`, keyframes) in an `.astro` component, or
- **SolidJS island** (`.tsx`) with Web Animations API — only when state drives timing.

No GSAP, no ScrollTrigger, no Framer Motion.

## Components

| Component | File kind | Mechanism | Best for |
|---|---|---|---|
| ScrollColorShift | `.astro` | CSS `animation-timeline: scroll(root)` swapping CSS custom properties | Chaptered storytelling; cinematic palette shifts |
| MarqueeScroller | `.astro` | CSS `@keyframes` translating a duplicated track | Editorial statement tickers, logo strips |
| GradientMesh | `.astro` | Layered radial gradients + slow `background-position` keyframes | Hero backgrounds; atmospheric moments |
| FloatingShapes | `.astro` | CSS `animation-timeline: scroll(root)` on blurred abstract shapes | Hero decoration, section breaks |
| WaveformPulse | `.astro` | SVG path + CSS `stroke-dashoffset` + pulse keyframes | Data/audio/signal-themed sections |
| StickyCardStack | `.astro` | CSS `position: sticky` + `animation-timeline: view()` for scale/opacity | Process steps, feature reveals |
| CardShuffler | Solid island | WAAPI FLIP with `element.animate()` | Testimonials, rotating props |
| TelemetryFeed | Solid island | `createSignal` + `setInterval` + WAAPI enter animation | SaaS/data product moments |

## Selection by dimensional position

| Position | First pick | Second pick |
|---|---|---|
| Dark + expressive | ScrollColorShift | StickyCardStack |
| Dark + restrained | GradientMesh | WaveformPulse |
| Light + expressive | MarqueeScroller | CardShuffler |
| Light + moderate + technical | TelemetryFeed | StickyCardStack |
| Light + restrained | GradientMesh (very subtle) | — |
| Light + restrained + texture-high | FloatingShapes | — |
| Light + restrained + editorial | MarqueeScroller (display type) | — |

## Hard rules

- Never combine more than 2 interactive components on one page.
- Never place two interactive components in adjacent sections — interleave with content/proof.
- `StickyCardStack` should be preferred over `CardShuffler` when state isn't required — it's pure CSS.
- Every component in this list has its own `prefers-reduced-motion` guard. The global nuke in `src/styles/animations.css` is a safety net, not a substitute.

## Component files

- [ScrollColorShift](component-interactive-scrollcolorshift.md)
- [MarqueeScroller](component-interactive-marqueescroller.md)
- [GradientMesh](component-interactive-gradientmesh.md)
- [FloatingShapes](component-interactive-floatingshapes.md)
- [WaveformPulse](component-interactive-waveformpulse.md)
- [StickyCardStack](component-interactive-stickycardstack.md)
- [CardShuffler](component-interactive-cardshuffler.md)
- [TelemetryFeed](component-interactive-telemetryfeed.md)
