# NumberedSteps

3 to 5 steps in a clean numbered grid. Static markup, no JS. Each step reveals on scroll with a per-item stagger.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any

## Structure

- `<section class="ns">`
  - optional `<header class="ns__header">`
    - kicker `<p class="ns__kicker">` (e.g. "Engagement")
    - `<h2 class="ns__title">`
  - `<ol class="ns__grid">`, one `<li class="ns__step">` per step
    - `<p class="ns__num">` static number text ("01", "02", ...)
    - `<h3 class="ns__step-title">`
    - `<p class="ns__body">`

## CSS

```css
.ns { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
.ns__header { max-width: 52rem; margin-bottom: 3rem; }
.ns__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
.ns__title { font-family: var(--font-display); font-size: clamp(1.75rem, 3.5vw, 2.5rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 24ch; }

.ns__grid {
  list-style: none; padding: 0;
  display: grid; gap: 2rem;
  grid-template-columns: 1fr;
}
@media (min-width: 640px) { .ns__grid { grid-template-columns: repeat(2, 1fr); } }
@media (min-width: 1024px) { .ns__grid { grid-template-columns: repeat(4, 1fr); } }

.ns__step {
  padding: 1.75rem;
  background: var(--color-surface-secondary);
  border: 1px solid var(--color-border);
  border-radius: 1.25rem;
}
.ns__num {
  font-family: var(--font-mono);
  font-size: 0.75rem;
  letter-spacing: 0.14em;
  color: var(--color-accent);
}
.ns__step-title {
  font-family: var(--font-display);
  font-size: 1.125rem;
  letter-spacing: -0.01em;
  margin-top: 0.75rem;
}
.ns__body { margin-top: 0.5rem; color: var(--color-text-secondary); }

@keyframes ns-in {
  from { opacity: 0; translate: 0 14px; }
  to { opacity: 1; translate: 0 0; }
}
@supports (animation-timeline: view()) {
  .ns__step {
    animation: ns-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ns__step:nth-child(2) { animation-range: entry 8% cover 38%; }
  .ns__step:nth-child(3) { animation-range: entry 16% cover 46%; }
  .ns__step:nth-child(4) { animation-range: entry 24% cover 54%; }
  .ns__step:nth-child(5) { animation-range: entry 32% cover 62%; }
}
@media (prefers-reduced-motion: reduce) {
  .ns__step { animation: none; }
}
```

## Notes

- 3 to 5 steps. The grid runs 1 column, then 2 at 640px, then 4 at 1024px; with 3 or 5 steps use `repeat(3, 1fr)` or `repeat(5, 1fr)` at the widest breakpoint instead.
- Step numbers are static text, never animated counters.
- Stagger comes from per-item `animation-range` offsets, not `animation-delay` (time delays are ignored on scroll-driven timelines). Base styles carry no `opacity: 0`, so engines without `animation-timeline` support show the steps statically.
