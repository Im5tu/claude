# BentoGrid

Asymmetric grid of content tiles. Each tile represents a feature, product, or facet. CSS Grid layout with per-tile staggered entrance on a scroll-driven timeline.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low, medium
- type-personality: geometric-sans, editorial-display
- notes: Great for multi-faceted product or service firms. Not for single-proposition brands.

## Structure

- `<section class="bg">`
  - optional `.bg__header`: `.bg__kicker` `<p>` and `.bg__title` `<h2>`
  - `.bg__grid`: 6-column grid
    - one `<article class="bg__tile">` per tile
      - width variants: default spans 3 columns; add `.span-2` (4 columns) or `.span-3` (6 columns); add `.bg__tile--tall` to span 2 rows
      - optional `<img width="800" height="600" loading="lazy" alt="">` (decorative)
      - `.bg__tile-body`: optional `.bg__tile-eyebrow` `<p>` (e.g. "01"), `.bg__tile-title` `<h3>`, `.bg__tile-text` `<p>`

## CSS

```css
.bg {
  max-width: 80rem; margin: 0 auto;
  padding: 5rem 1.5rem;
}
.bg__header { max-width: 52rem; margin-bottom: 3rem; }
.bg__kicker {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
  color: var(--color-accent);
}
.bg__title {
  font-family: var(--font-display);
  font-size: clamp(2rem, 4vw, 3rem);
  letter-spacing: -0.02em; line-height: 1.05;
  margin-top: 0.75rem; max-width: 22ch; text-wrap: balance;
}
.bg__grid {
  display: grid;
  grid-template-columns: repeat(6, 1fr);
  gap: 1rem;
  grid-auto-rows: minmax(12rem, auto);
}
.bg__tile {
  grid-column: span 3;
  display: flex; flex-direction: column;
  background: var(--color-surface-secondary);
  border: 1px solid var(--color-border);
  border-radius: 1.25rem;
  overflow: hidden;
  transition: border-color var(--motion-duration-fast) var(--ease-out-soft);
}
.bg__tile.span-2 { grid-column: span 4; }
.bg__tile.span-3 { grid-column: span 6; }
.bg__tile--tall { grid-row: span 2; }
.bg__tile:hover { border-color: var(--color-border-strong); }
.bg__tile img {
  width: 100%; aspect-ratio: 4 / 3; object-fit: cover;
}
.bg__tile-body { padding: 1.5rem; }
.bg__tile-eyebrow {
  font-size: 0.75rem; letter-spacing: 0.1em; text-transform: uppercase;
  color: var(--color-accent);
}
.bg__tile-title {
  font-family: var(--font-display);
  font-size: 1.25rem;
  letter-spacing: -0.01em;
  margin-top: 0.5rem;
}
.bg__tile-text { margin-top: 0.5rem; color: var(--color-text-secondary); max-width: 40ch; }

@media (max-width: 768px) {
  .bg__grid { grid-template-columns: 1fr; }
  .bg__tile, .bg__tile.span-2, .bg__tile.span-3 { grid-column: auto; }
}

/* Entrance. Stagger comes from per-tile animation-range offsets;
   time-based delays are ignored on scroll-driven timelines. */
@keyframes bg-in { from { opacity: 0; translate: 0 14px; } to { opacity: 1; translate: 0 0; } }
@supports (animation-timeline: view()) {
  .bg__tile {
    animation: bg-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .bg__tile:nth-child(2) { animation-range: entry 6% cover 36%; }
  .bg__tile:nth-child(3) { animation-range: entry 12% cover 42%; }
  .bg__tile:nth-child(4) { animation-range: entry 18% cover 48%; }
  .bg__tile:nth-child(5) { animation-range: entry 24% cover 54%; }
  .bg__tile:nth-child(n + 6) { animation-range: entry 30% cover 60%; }
}
@media (prefers-reduced-motion: reduce) {
  .bg__tile { animation: none; }
}
```

## Notes

- 4 to 9 tiles. Mix widths and one tall tile so the grid reads as composed, not templated.
- Eyebrows as zero-padded counters ("01", "02") give the grid an index-like rhythm.
- Tile copy stays short: title plus one sentence, 40ch max.
