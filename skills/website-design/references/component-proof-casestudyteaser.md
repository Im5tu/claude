# CaseStudyTeaser

A single case-study preview card. Big image, eyebrow, title, outcome stats, CTA to the full page. Static markup and CSS only.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: any

## Structure

- `<section class="cst">` centered container
  - `<article class="cst__inner">` card: single column, 7fr/5fr grid at >=1024px
    - `<figure class="cst__figure">` with `<img>` (1600x1000 intrinsic, `loading="lazy"`, 5/4 aspect, object-fit cover)
    - `<div class="cst__body">`
      - eyebrow `<p class="cst__eyebrow">` (e.g. "Case study — Meridian")
      - `<h3 class="cst__title">`
      - summary `<p class="cst__summary">`
      - optional `<ul class="cst__outcomes">`; each `<li>` holds a value `<p class="cst__outcome-value">` (the number; animate with the counter ticker mechanism specced in StatsStrip) and a label `<p class="cst__outcome-label">`
      - CTA wrapper `<div class="cst__cta">` with a ghost-variant button link (default text "Read the case study")

## CSS

```css
.cst { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
.cst__inner {
  display: grid;
  grid-template-columns: 1fr;
  gap: 2.5rem;
  background: var(--color-surface-secondary);
  border: 1px solid var(--color-border);
  border-radius: 1.5rem;
  overflow: hidden;
}
@media (min-width: 1024px) {
  .cst__inner { grid-template-columns: 7fr 5fr; gap: 0; }
}
.cst__figure { margin: 0; }
.cst__figure img { width: 100%; height: 100%; object-fit: cover; min-height: 20rem; aspect-ratio: 5 / 4; }
.cst__body { padding: 2.5rem; }
.cst__eyebrow { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.14em; text-transform: uppercase; color: var(--color-accent); }
.cst__title { font-family: var(--font-display); font-size: clamp(1.5rem, 2.75vw, 2.25rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 20ch; text-wrap: balance; }
.cst__summary { margin-top: 1rem; color: var(--color-text-secondary); max-width: 54ch; }
.cst__outcomes {
  list-style: none; padding: 0;
  display: grid; gap: 1.25rem;
  grid-template-columns: repeat(auto-fit, minmax(7rem, 1fr));
  margin-top: 1.75rem;
}
.cst__outcome-value { font-family: var(--font-display); font-size: clamp(1.5rem, 2.5vw, 2rem); color: var(--color-accent); letter-spacing: -0.02em; }
.cst__outcome-label { font-size: 0.75rem; letter-spacing: 0.06em; text-transform: uppercase; opacity: 0.7; margin-top: 0.25rem; }
.cst__cta { margin-top: 2rem; }

/* entrance: scroll-driven, static fallback for unsupported engines */
@keyframes cst-in { from { opacity: 0; translate: 0 16px; } to { opacity: 1; translate: 0 0; } }
@supports (animation-timeline: view()) {
  .cst__inner {
    animation: cst-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
}
@media (prefers-reduced-motion: reduce) {
  .cst__inner { animation: none; }
}
```

## Notes

- Outcome values read best animated with the counter ticker mechanism from StatsStrip; a static printed number is the correct fallback.
- Only ship with a real image and attributable outcomes. Keep the summary under ~54ch so the measure holds.
