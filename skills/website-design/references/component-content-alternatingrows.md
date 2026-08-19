# AlternatingRows

3 to 5 rows alternating text-left/media-right and text-right/media-left. Narrative flow for features or process. Each row enters on a scroll-driven timeline.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, geometric-sans
- notes: The workhorse content component. Low risk, high flexibility. Use 3 rows for restrained, up to 5 for expressive.

## Structure

- `<section class="ar">`
  - optional `.ar__header`: `.ar__kicker` `<p>` and `.ar__title` `<h2>`
  - `.ar__rows` grid container
    - one `.ar__row` per row; every second row also gets `.ar__row--flip`
      - `.ar__text`: optional `.ar__eyebrow` `<p>`, `.ar__row-title` `<h3>`, `.ar__body` `<p>`, optional `.ar__bullets` `<ul>`
      - `.ar__media`: `<img width="1200" height="800" loading="lazy">` with meaningful alt text

## CSS

```css
.ar { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
.ar__header { max-width: 52rem; margin-bottom: 4rem; }
.ar__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
.ar__title { font-family: var(--font-display); font-size: clamp(2rem, 4vw, 3rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 22ch; text-wrap: balance; }

.ar__rows { display: grid; gap: 6rem; }

.ar__row {
  display: grid;
  grid-template-columns: 1fr;
  gap: 2rem;
  align-items: center;
}
@media (min-width: 1024px) {
  .ar__row { grid-template-columns: 1fr 1fr; gap: 5rem; }
  .ar__row--flip .ar__text { order: 2; }
}

.ar__media img { width: 100%; border-radius: 1.25rem; aspect-ratio: 3 / 2; object-fit: cover; }

.ar__eyebrow { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.14em; text-transform: uppercase; color: var(--color-accent); }
.ar__row-title { font-family: var(--font-display); font-size: clamp(1.5rem, 2.5vw, 2.25rem); letter-spacing: -0.02em; margin-top: 0.5rem; }
.ar__body { margin-top: 0.75rem; max-width: 54ch; color: var(--color-text-secondary); }
.ar__bullets { margin-top: 1rem; padding-left: 1.25rem; color: var(--color-text-secondary); display: grid; gap: 0.25rem; }

/* Entrance. Keyframes carry the from state so unsupported engines
   show content statically; the media lags the text via a later
   animation-range start, not a time delay (time delays are ignored
   on scroll-driven timelines). */
@keyframes ar-text-in { from { opacity: 0; translate: 0 16px; } to { opacity: 1; translate: 0 0; } }
@keyframes ar-media-in { from { opacity: 0; translate: 0 24px; } to { opacity: 1; translate: 0 0; } }
@supports (animation-timeline: view()) {
  .ar__text {
    animation: ar-text-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ar__media {
    animation: ar-media-in 800ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 6% cover 36%;
  }
}
@media (prefers-reduced-motion: reduce) {
  .ar__text, .ar__media { animation: none; }
}
```

## Notes

- Content per row: eyebrow (optional), title, body, media, bullets (optional). Alternation is structural (flip class on even rows), not content-driven.
- Row copy works best as a short narrative arc, for example discover / ship / operate, one row per phase.
- Body copy caps at 54ch; keep it to 1 or 2 sentences per row.
