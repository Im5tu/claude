# Component Interactive — Index

Interactive components are high-signal visual moments. Each one has an opinion and draws attention. Over-using them dilutes every one.

**Interaction budget:** the direction card sets a max count per page (from `core-aesthetic-vocabulary.md §5`). Do not exceed it.

All interactive components in this stack are either:
- **Static** — pure CSS (`animation-timeline: scroll()` / `view()`, keyframes), no scripting, or
- **Needs JS behavior** — small scripted state driving Web Animations API calls, only when state drives timing.

No GSAP, no ScrollTrigger, no Framer Motion.

## Components

| Component | Kind | Mechanism | Best for |
|---|---|---|---|
| ScrollColorShift | static | CSS `animation-timeline: scroll()` interpolating registered color custom properties | Chaptered storytelling; cinematic palette shifts |
| MarqueeScroller | static | CSS `@keyframes` translating a duplicated track | Editorial statement tickers, logo strips |
| GradientMesh | static | Layered radial gradients + slow `background-position` keyframes | Hero backgrounds; atmospheric moments |
| FloatingShapes | static | CSS `animation-timeline: scroll(root)` on blurred abstract shapes | Hero decoration, section breaks |
| WaveformPulse | static | Bar row with scroll-driven draw-in (`view()` + `animation-range` stagger) + pulse keyframes | Data/audio/signal-themed sections |
| StickyCardStack | static | CSS `position: sticky` + `animation-timeline: view()` for scale/opacity | Process steps, feature reveals |
| CardShuffler | needs JS behavior | FLIP reorder with Web Animations API + interval state | Testimonials, rotating props |
| TelemetryFeed | needs JS behavior | Timer-driven typewriter state + CSS enter animation | SaaS/data product moments |

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
- `StickyCardStack` should be preferred over `CardShuffler` when state isn't required — it's static.
- Every component in this list has its own `prefers-reduced-motion` guard. A site-wide reduced-motion override in the global stylesheet is a safety net, not a substitute.

## Component files

- [ScrollColorShift](component-interactive-scrollcolorshift.md)
- [MarqueeScroller](component-interactive-marqueescroller.md)
- [GradientMesh](component-interactive-gradientmesh.md)
- [FloatingShapes](component-interactive-floatingshapes.md)
- [WaveformPulse](component-interactive-waveformpulse.md)
- [StickyCardStack](component-interactive-stickycardstack.md)
- [CardShuffler](component-interactive-cardshuffler.md)
- [TelemetryFeed](component-interactive-telemetryfeed.md)
