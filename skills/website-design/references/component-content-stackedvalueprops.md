# StackedValueProps

Three large stacked value propositions, each a section-height block with number, title, body, optional visual. Restrained, considered pacing. Entrance on a scroll-driven timeline.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, editorial-display
- notes: 3 props exactly. More becomes repetitive. Each prop should earn its section.

## Structure

- `<section class="svp">`
  - optional `.svp__kicker` `<p>`
  - `<ol class="svp__list">` of exactly 3 items
    - each `<li class="svp__item">`
      - `.svp__text`: `.svp__num` `<p>` ("01", "02", "03", static text, never animated), `.svp__title` `<h3>`, `.svp__body` `<p>`
      - optional `.svp__media` `<figure>` with `<img width="1200" height="900" loading="lazy">` and meaningful alt text

## CSS

```css
.svp { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
.svp__kicker {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
  color: var(--color-accent); margin-bottom: 3rem;
}
.svp__list { display: grid; gap: 5rem; padding: 0; list-style: none; }

.svp__item {
  display: grid;
  grid-template-columns: 1fr;
  gap: 2rem;
  align-items: center;
}
@media (min-width: 1024px) {
  .svp__item { grid-template-columns: 6fr 5fr; gap: 4rem; }
  .svp__item:nth-child(even) .svp__text { order: 2; }
}

.svp__num {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.12em;
  color: var(--color-accent);
}
.svp__title {
  font-family: var(--font-display);
  font-size: clamp(2rem, 4vw, 3rem);
  letter-spacing: -0.02em;
  line-height: 1.02;
  margin-top: 0.5rem;
  max-width: 18ch;
  text-wrap: balance;
}
.svp__body {
  margin-top: 1rem;
  max-width: 56ch;
  color: var(--color-text-secondary);
}
.svp__media img {
  width: 100%; aspect-ratio: 4 / 3; object-fit: cover;
  border-radius: 1.25rem;
}

/* Entrance. Items sit a full 5rem gap apart, so each enters on its own
   view() timeline; no per-item stagger offsets are needed. */
@keyframes svp-in { from { opacity: 0; translate: 0 18px; } to { opacity: 1; translate: 0 0; } }
@supports (animation-timeline: view()) {
  .svp__item {
    animation: svp-in 750ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
}
@media (prefers-reduced-motion: reduce) {
  .svp__item { animation: none; }
}
```

## Notes

- Numbers ("01", "02", "03") are static text. Never wrap them in CounterTicker; that's for real stats.
- Titles work best as short declarative sentences (e.g. "Ship small, often."), 18ch max.
- Even items flip text/media order on desktop; that alternation is structural, keep it.
