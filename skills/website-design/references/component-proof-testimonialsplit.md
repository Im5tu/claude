# TestimonialSplit

Split layout: testimonial quote on one side, case-study summary + outcome stats on the other. Links through to the full case study. Static markup and CSS only.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, geometric-sans

## Structure

- `<section class="ts">` centered grid: single column, 5fr/7fr at >=1024px
  - `<div class="ts__quote">`
    - `<blockquote>` quote wrapped in typographic quote marks
    - `<figcaption>` with optional portrait `<img>` (96x96 intrinsic, `loading="lazy"`) and a `<div>` holding name `<p class="ts__name">` and role `<p class="ts__role">` ("Role, Company")
  - `<div class="ts__study">` card
    - `<h3 class="ts__study-title">`
    - summary `<p class="ts__study-body">`
    - optional `<ul class="ts__outcomes">`; each `<li>` holds a value `<p class="ts__outcome-value">` (the number; animate with the counter ticker mechanism specced in StatsStrip) and a label `<p class="ts__outcome-label">`
    - CTA wrapper `<div class="ts__cta">` with a ghost-variant button link (default text "Read the case study")

## CSS

```css
.ts {
  max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem;
  display: grid;
  grid-template-columns: 1fr;
  gap: 3rem;
}
@media (min-width: 1024px) {
  .ts { grid-template-columns: 5fr 7fr; gap: 4rem; }
}

.ts__quote blockquote {
  font-family: var(--font-display);
  font-size: clamp(1.5rem, 2.5vw, 2rem);
  line-height: 1.25;
  letter-spacing: -0.02em;
  margin: 0;
}
.ts__quote figcaption {
  display: flex; align-items: center; gap: 1rem;
  margin-top: 1.5rem;
  padding-top: 1.5rem;
  border-top: 1px solid var(--color-border);
}
.ts__quote figcaption img {
  width: 3rem; height: 3rem; border-radius: 999px; object-fit: cover;
}
.ts__name { font-weight: 500; }
.ts__role { font-size: 0.875rem; color: var(--color-text-secondary); }

.ts__study {
  padding: 2rem;
  background: var(--color-surface-secondary);
  border: 1px solid var(--color-border);
  border-radius: 1.25rem;
}
.ts__study-title {
  font-family: var(--font-display);
  font-size: clamp(1.25rem, 2vw, 1.75rem);
  letter-spacing: -0.01em;
}
.ts__study-body { margin-top: 0.75rem; color: var(--color-text-secondary); max-width: 58ch; }
.ts__outcomes {
  list-style: none; padding: 0;
  display: grid; gap: 1.25rem;
  grid-template-columns: repeat(auto-fit, minmax(8rem, 1fr));
  margin-top: 1.75rem;
}
.ts__outcome-value {
  font-family: var(--font-display);
  font-size: clamp(1.5rem, 2.5vw, 2.25rem);
  color: var(--color-accent);
  letter-spacing: -0.02em;
}
.ts__outcome-label { font-size: 0.75rem; letter-spacing: 0.06em; text-transform: uppercase; opacity: 0.7; margin-top: 0.25rem; }
.ts__cta { margin-top: 2rem; }

/* entrance: scroll-driven; the study card lags the quote via a later
   animation-range, not a time delay (time delays are ignored on scroll timelines) */
@keyframes ts-in { from { opacity: 0; translate: 0 14px; } to { opacity: 1; translate: 0 0; } }
@supports (animation-timeline: view()) {
  .ts__quote, .ts__study {
    animation: ts-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ts__study { animation-range: entry 8% cover 38%; }
}
@media (prefers-reduced-motion: reduce) {
  .ts__quote, .ts__study { animation: none; }
}
```

## Notes

- The quote and the study must describe the same engagement; a mismatched pairing reads as filler.
- Outcome values read best animated with the counter ticker mechanism from StatsStrip; a static printed number is the correct fallback.
