# HorizontalTimeline

Horizontal scroll-snap timeline. 4 to 6 equal-weight phases presented edge-to-edge. CSS scroll-snap; no JS. Cards reveal on scroll with a per-card stagger.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low, medium
- type-personality: geometric-sans, editorial-display

## Structure

- `<section class="ht">`
  - optional `<header class="ht__header">`
    - kicker `<p class="ht__kicker">` (e.g. "Timeline")
    - `<h2 class="ht__title">`
  - `<div class="ht__rail" role="list" aria-label="Timeline phases">`, one `<article class="ht__card" role="listitem">` per phase
    - `<p class="ht__tag">` phase tag ("Phase 1" or "Week 1-2")
    - `<h3 class="ht__card-title">`
    - `<p class="ht__body">`
    - optional `<ul class="ht__bullets">`

## CSS

```css
.ht { max-width: 100vw; padding: 5rem 0; }
.ht__header { max-width: 52rem; padding: 0 1.5rem; margin-bottom: 2rem; }
.ht__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
.ht__title { font-family: var(--font-display); font-size: clamp(1.75rem, 3.5vw, 2.5rem); letter-spacing: -0.02em; margin-top: 0.75rem; }

.ht__rail {
  display: flex;
  gap: 1.5rem;
  padding: 0 1.5rem 2rem;
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  scroll-padding-inline: 1.5rem;
}
.ht__card {
  flex: 0 0 min(22rem, 80vw);
  scroll-snap-align: start;
  padding: 2rem;
  background: var(--color-surface-secondary);
  border: 1px solid var(--color-border);
  border-radius: 1.25rem;
}
.ht__tag { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.14em; color: var(--color-accent); }
.ht__card-title { font-family: var(--font-display); font-size: 1.25rem; letter-spacing: -0.01em; margin-top: 0.75rem; }
.ht__body { margin-top: 0.5rem; color: var(--color-text-secondary); max-width: 40ch; }
.ht__bullets { margin-top: 0.75rem; padding-left: 1rem; display: grid; gap: 0.25rem; color: var(--color-text-secondary); }

@keyframes ht-in {
  from { opacity: 0; translate: 0 14px; }
  to { opacity: 1; translate: 0 0; }
}
@supports (animation-timeline: view()) {
  .ht__card {
    animation: ht-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ht__card:nth-child(2) { animation-range: entry 8% cover 38%; }
  .ht__card:nth-child(3) { animation-range: entry 16% cover 46%; }
  .ht__card:nth-child(4) { animation-range: entry 24% cover 54%; }
  .ht__card:nth-child(5) { animation-range: entry 32% cover 62%; }
  .ht__card:nth-child(6) { animation-range: entry 40% cover 70%; }
}
@media (prefers-reduced-motion: reduce) {
  .ht__card { animation: none; }
}
```

## Notes

- 4 to 6 phases. Cards are fixed at `min(22rem, 80vw)` so at least a sliver of the next card stays visible, signaling horizontal scrollability.
- The reveal runs against the vertical page scroll (the cards share one row, so they enter the viewport together); the stagger comes from per-card `animation-range` offsets, not `animation-delay` (time delays are ignored on scroll-driven timelines). Base styles carry no `opacity: 0`, so engines without `animation-timeline` support show the cards statically.
- The rail itself scrolls horizontally with mandatory snap points and `scroll-padding-inline` matching the 1.5rem page gutter.
