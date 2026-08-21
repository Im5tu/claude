# IconGrid

Grid of icon + title + short body. Short feature lists at 3, 4, or 6 items. Icons are inline SVG. Static markup with per-cell staggered entrance.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: low, medium
- type-personality: any
- notes: The most flexible content component. Drop in anywhere a short list of facets is needed.

## Structure

- `<section class="ig">`
  - optional `<header class="ig__header">`: `.ig__kicker` `<p>` and `.ig__title` `<h2>`
  - `.ig__grid` with inline `--cols` custom property set to 3 or 4
    - one `.ig__cell` per item
      - `.ig__icon` `<span>` containing inline SVG markup
      - `.ig__cell-title` `<h3>`
      - `.ig__cell-body` `<p>`

## CSS

```css
.ig { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
.ig__header { max-width: 52rem; margin-bottom: 3rem; }
.ig__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
.ig__title { font-family: var(--font-display); font-size: clamp(1.75rem, 3.5vw, 2.5rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 24ch; }

.ig__grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 2.5rem 2rem;
}
@media (min-width: 640px) {
  .ig__grid { grid-template-columns: repeat(2, 1fr); }
}
@media (min-width: 1024px) {
  .ig__grid { grid-template-columns: repeat(var(--cols, 3), 1fr); }
}

.ig__icon {
  display: inline-flex;
  width: 2.5rem; height: 2.5rem;
  color: var(--color-accent);
  margin-bottom: 1rem;
}
.ig__icon svg { width: 100%; height: 100%; }
.ig__cell-title {
  font-family: var(--font-display);
  font-size: 1.125rem;
  letter-spacing: -0.01em;
}
.ig__cell-body { margin-top: 0.5rem; color: var(--color-text-secondary); max-width: 44ch; }

/* Entrance. Stagger by column via animation-range offsets; a
   time-based delay would be ignored on scroll-driven timelines. Cells in
   the same row share a view position, so column offsets are what read
   as a stagger. */
@keyframes ig-in { from { opacity: 0; translate: 0 14px; } to { opacity: 1; translate: 0 0; } }
@supports (animation-timeline: view()) {
  .ig__cell {
    animation: ig-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ig__cell:nth-child(3n + 2) { animation-range: entry 7% cover 37%; }
  .ig__cell:nth-child(3n + 3) { animation-range: entry 14% cover 44%; }
}
@media (prefers-reduced-motion: reduce) {
  .ig__cell { animation: none; }
}
```

## Notes

- The `nth-child` stagger above assumes 3 columns. For `--cols: 4`, use `:nth-child(4n + 2)`, `:nth-child(4n + 3)` (7% and 14% offsets), and `:nth-child(4n + 4)` at `entry 21% cover 51%`.
- No "icons inside coloured circles"; that's banned by `core-anti-patterns.md`. Use the icon inline at natural size.
- If you don't have real icons, use letterforms (A, B, C) or number decoration instead of generic pictograms. Icon SVGs work well as simple 24px-viewBox strokes (`fill="none" stroke="currentColor" stroke-width="1.5"`).
- Body copy caps at 44ch; one sentence per cell.
