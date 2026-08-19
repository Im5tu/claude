# MagazineGrid

Asymmetric editorial grid for article, work, or journal index pages. Mixed card sizes, varied aspect ratios, careful whitespace. Static markup with per-card staggered entrance on a scroll-driven timeline.

## Dimensional fit

- surface-depth: light (default), dark possible
- motion-register: restrained, moderate
- texture-appetite: medium, high
- type-personality: humanist-serif, editorial-display
- notes: Editorial-first directions only. On consumer or technical directions, use `BentoGrid` instead.

## Structure

- `<section class="mg">`
  - optional `<header class="mg__header">`: `.mg__kicker` `<p>` and `.mg__title` `<h2>`
  - `.mg__grid`: 12-column grid
    - one `<a class="mg__entry" href>` per entry, with a size class: `.is-sm`, `.is-md` (default), or `.is-lg`
      - `.mg__figure` `<figure>` with `<img width="1200" height="900" loading="lazy">` and meaningful alt text
      - `.mg__body`: optional `.mg__eyebrow` `<p>`, `.mg__entry-title` `<h3>`, optional `.mg__excerpt` `<p>`

## CSS

```css
.mg { max-width: 84rem; margin: 0 auto; padding: 5rem 1.5rem; }
.mg__header { max-width: 52rem; margin-bottom: 3.5rem; }
.mg__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
.mg__title { font-family: var(--font-display); font-size: clamp(2rem, 4vw, 3rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 22ch; }

.mg__grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 2rem 1.5rem;
}

.mg__entry { grid-column: span 12; }
@media (min-width: 768px) {
  .mg__entry.is-sm { grid-column: span 4; }
  .mg__entry.is-md { grid-column: span 6; }
  .mg__entry.is-lg { grid-column: span 12; }
}

.mg__figure { margin: 0; overflow: hidden; border-radius: 1rem; aspect-ratio: 3 / 2; }
.mg__entry.is-lg .mg__figure { aspect-ratio: 21 / 9; }
.mg__entry.is-sm .mg__figure { aspect-ratio: 4 / 5; }
.mg__figure img {
  width: 100%; height: 100%; object-fit: cover;
  transition: scale 700ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
.mg__entry:hover .mg__figure img { scale: 1.02; }

.mg__body { margin-top: 1.25rem; max-width: 56ch; }
.mg__eyebrow { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.12em; text-transform: uppercase; color: var(--color-text-secondary); }
.mg__entry-title {
  font-family: var(--font-display);
  font-size: clamp(1.25rem, 2vw, 1.75rem);
  letter-spacing: -0.01em;
  margin-top: 0.5rem;
}
.mg__excerpt { margin-top: 0.5rem; color: var(--color-text-secondary); }

/* Entrance. Stagger via per-entry animation-range offsets; a
   time-based delay would be ignored on scroll-driven timelines. */
@keyframes mg-in { from { opacity: 0; translate: 0 14px; } to { opacity: 1; translate: 0 0; } }
@supports (animation-timeline: view()) {
  .mg__entry {
    animation: mg-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .mg__entry:nth-child(2n) { animation-range: entry 8% cover 38%; }
  .mg__entry:nth-child(3n) { animation-range: entry 16% cover 46%; }
}
@media (prefers-reduced-motion: reduce) {
  .mg__entry { animation: none; }
  .mg__figure img, .mg__entry:hover .mg__figure img { transition: none; scale: 1; }
}
```

## Notes

- Whole card is one link; the image zoom on hover (`scale: 1.02`) is the only hover affordance needed.
- Vary sizes deliberately: lead with one `.is-lg`, then alternate `.is-md` and `.is-sm` pairs so rows total 12 columns.
