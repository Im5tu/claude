# VerticalTimeline

Timeline of dated milestones down the page. Best for company history, release trail, or a slow editorial process. Static markup, no JS; each entry reveals on scroll.

## Dimensional fit

- surface-depth: light (default), dark possible
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, editorial-display

## Structure

- `<section class="vt">`
  - optional `<header class="vt__header">`
    - kicker `<p class="vt__kicker">` (e.g. "Our history")
    - `<h2 class="vt__title">`
  - `<ol class="vt__rail">` (a `::before` draws the vertical line), one `<li class="vt__entry">` per milestone
    - `<div class="vt__marker" aria-hidden="true">` dot on the rail
    - `<p class="vt__when">` date text ("2015" or "March 2023")
    - `<h3 class="vt__entry-title">`
    - `<p class="vt__body">`

## CSS

```css
.vt { max-width: 72rem; margin: 0 auto; padding: 5rem 1.5rem; }
.vt__header { max-width: 52rem; margin-bottom: 3rem; }
.vt__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
.vt__title { font-family: var(--font-display); font-size: clamp(1.75rem, 3.5vw, 2.5rem); letter-spacing: -0.02em; margin-top: 0.75rem; }

.vt__rail {
  list-style: none; padding: 0;
  position: relative;
  display: grid; gap: 3rem;
}
.vt__rail::before {
  content: "";
  position: absolute;
  left: 0.45rem; top: 0.5rem; bottom: 0.5rem;
  width: 1px;
  background: var(--color-border);
}
.vt__entry {
  padding-left: 2.5rem;
  position: relative;
}
.vt__marker {
  position: absolute;
  left: 0; top: 0.45rem;
  width: 1rem; height: 1rem;
  background: var(--color-surface-primary);
  border: 2px solid var(--color-accent);
  border-radius: 999px;
}
.vt__when {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.14em; text-transform: uppercase;
  color: var(--color-accent);
}
.vt__entry-title {
  font-family: var(--font-display);
  font-size: 1.25rem;
  letter-spacing: -0.01em;
  margin-top: 0.5rem;
}
.vt__body { margin-top: 0.5rem; color: var(--color-text-secondary); max-width: 58ch; }

@keyframes vt-in {
  from { opacity: 0; translate: 0 12px; }
  to { opacity: 1; translate: 0 0; }
}
@supports (animation-timeline: view()) {
  .vt__entry {
    animation: vt-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .vt__entry:nth-child(2) { animation-range: entry 8% cover 38%; }
  .vt__entry:nth-child(3) { animation-range: entry 16% cover 46%; }
  .vt__entry:nth-child(4) { animation-range: entry 24% cover 54%; }
}
@media (prefers-reduced-motion: reduce) {
  .vt__entry { animation: none; }
}
```

## Notes

- 4 to 7 entries. The marker background must match the page background so the dot masks the rail line; on a section with a different surface, change `--color-surface-primary` on the marker to that section's surface token.
- Stagger comes from per-item `animation-range` offsets, not `animation-delay` (time delays are ignored on scroll-driven timelines). Entries low on the page also stagger naturally because each has its own view() timeline; extend the nth-child pattern (+8% per entry) beyond four only if entries sit close together. Base styles carry no `opacity: 0`, so engines without `animation-timeline` support show the entries statically.
