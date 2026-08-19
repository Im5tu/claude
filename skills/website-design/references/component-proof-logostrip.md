# LogoStrip

Horizontal strip of client logos. Logos are real image files (SVG preferred). Plain-text company names are banned by `core-anti-patterns.md`.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any
- notes: Grayscale + desaturate by default so the strip reads as proof, not a logo parade.

## Structure

- `<section class="ls">` centered container; add `data-gs="true"` for the default grayscale treatment
  - optional kicker `<p class="ls__kicker">` (e.g. "Trusted by")
  - `<ul class="ls__row">` grid: 3 columns, 4 at >=768px, 6 at >=1024px
    - one `<li>` per logo, each containing an `<img>` with real alt text, explicit width/height (defaults 140x40), `loading="lazy"`

## CSS

```css
.ls { max-width: 80rem; margin: 0 auto; padding: 3rem 1.5rem; }
.ls__kicker {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
  color: var(--color-text-secondary);
  text-align: center;
  margin-bottom: 1.5rem;
}
.ls__row {
  list-style: none;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2rem 3rem;
  align-items: center;
  justify-items: center;
  padding: 0;
}
@media (min-width: 768px) { .ls__row { grid-template-columns: repeat(4, 1fr); } }
@media (min-width: 1024px) { .ls__row { grid-template-columns: repeat(6, 1fr); } }
.ls__row img {
  max-height: 2rem;
  width: auto;
  opacity: 0.7;
  transition: opacity var(--motion-duration-fast) var(--ease-out-soft),
              filter var(--motion-duration-fast) var(--ease-out-soft);
}
.ls[data-gs="true"] .ls__row img { filter: grayscale(1); }
.ls__row li:hover img { opacity: 1; filter: grayscale(0); }

/* entrance: scroll-driven stagger via per-item animation-range offsets
   (never a time delay — those are ignored on scroll timelines) */
@keyframes ls-in { from { opacity: 0; translate: 0 10px; } to { opacity: 1; translate: 0 0; } }
@supports (animation-timeline: view()) {
  .ls__row li {
    animation: ls-in 500ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  /* stagger repeats every 6 items to match the widest grid row */
  .ls__row li:nth-child(6n+2) { animation-range: entry 4% cover 34%; }
  .ls__row li:nth-child(6n+3) { animation-range: entry 8% cover 38%; }
  .ls__row li:nth-child(6n+4) { animation-range: entry 12% cover 42%; }
  .ls__row li:nth-child(6n+5) { animation-range: entry 16% cover 46%; }
  .ls__row li:nth-child(6n)   { animation-range: entry 20% cover 50%; }
}
@media (prefers-reduced-motion: reduce) {
  .ls__row li { animation: none; }
  .ls__row img, .ls__row li:hover img { transition: none; }
}
```

## Notes

- 6-12 logos recommended; fewer looks sparse.
- Every logo must be a real file with a real alt — never a `<span>` with company text.
- If you do not have real logos, omit this section and use testimonials or case studies instead.
- Per-logo widths vary (110-150 works well); keep heights visually equal via the shared `max-height: 2rem`.
