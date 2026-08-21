# TestimonialGrid

4–6 shorter testimonials laid out in a grid. Each card has a quote, a short attribution, optional company logo. Static markup and CSS only.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any

## Structure

- `<section class="tg">` centered container
  - optional `<header class="tg__header">` with kicker `<p class="tg__kicker">` and `<h2 class="tg__title">`
  - `<ul class="tg__grid">` (1 column, 2 at >=768px, 3 at >=1024px)
    - one `<li class="tg__card">` per testimonial:
      - `<blockquote class="tg__quote">` quote wrapped in typographic quote marks
      - `<figcaption class="tg__caption">` with name `<p class="tg__name">`, role `<p class="tg__role">` ("Role, Company"), and optional logo `<img>` (height 20, `loading="lazy"`)

## CSS

```css
.tg { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
.tg__header { max-width: 52rem; margin-bottom: 3rem; }
.tg__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
.tg__title { font-family: var(--font-display); font-size: clamp(1.75rem, 3.5vw, 2.5rem); letter-spacing: -0.02em; margin-top: 0.75rem; }

.tg__grid {
  list-style: none; padding: 0;
  display: grid; gap: 1.25rem;
  grid-template-columns: 1fr;
}
@media (min-width: 768px) { .tg__grid { grid-template-columns: repeat(2, 1fr); } }
@media (min-width: 1024px) { .tg__grid { grid-template-columns: repeat(3, 1fr); } }

.tg__card {
  padding: 1.75rem;
  background: var(--color-surface-secondary);
  border: 1px solid var(--color-border);
  border-radius: 1.25rem;
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}
.tg__quote { margin: 0; font-family: var(--font-display); font-size: 1.125rem; line-height: 1.45; letter-spacing: -0.01em; }
.tg__caption { display: flex; align-items: center; justify-content: space-between; gap: 1rem; }
.tg__name { font-weight: 500; font-size: 0.9375rem; }
.tg__role { font-size: 0.8125rem; color: var(--color-text-secondary); }

/* entrance: scroll-driven stagger via per-item animation-range offsets
   (never a time delay — those are ignored on scroll timelines) */
@keyframes tg-in { from { opacity: 0; translate: 0 12px; } to { opacity: 1; translate: 0 0; } }
@supports (animation-timeline: view()) {
  .tg__card {
    animation: tg-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .tg__card:nth-child(2) { animation-range: entry 6% cover 36%; }
  .tg__card:nth-child(3) { animation-range: entry 12% cover 42%; }
  .tg__card:nth-child(4) { animation-range: entry 18% cover 48%; }
  .tg__card:nth-child(5) { animation-range: entry 24% cover 54%; }
  .tg__card:nth-child(6) { animation-range: entry 30% cover 60%; }
}
@media (prefers-reduced-motion: reduce) {
  .tg__card { animation: none; }
}
```

## Notes

- 4-6 testimonials; at 3 or fewer, use FeaturedTestimonial or TestimonialSplit instead.
- Quotes should be a sentence or two; the 1.45 line-height and 1.125rem size assume short-to-medium quotes.
