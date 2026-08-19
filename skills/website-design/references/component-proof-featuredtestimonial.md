# FeaturedTestimonial

One large, editorial-weight testimonial with portrait, pull-quote display treatment, and attribution. Static markup and CSS only.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, editorial-display

## Structure

- `<section class="ft">` centered container
  - `<figure class="ft__inner">` card
    - `<blockquote class="ft__quote">` the quote text, preceded by a decorative opening quote mark `<span aria-hidden="true" class="ft__mark">"</span>`
    - `<figcaption class="ft__caption">`
      - optional portrait `<img class="ft__portrait">` (96x96 intrinsic, `loading="lazy"`)
      - `<div>` with name `<p class="ft__name">` and role `<p class="ft__role">` ("Role, Company")
      - optional company logo `<img class="ft__logo">` (height 28, `loading="lazy"`), pushed to the right edge

## CSS

```css
.ft { max-width: 68rem; margin: 0 auto; padding: 5rem 1.5rem; }
.ft__inner {
  padding: 3rem;
  background: var(--color-surface-secondary);
  border-radius: 1.5rem;
  border: 1px solid var(--color-border);
}
.ft__quote {
  font-family: var(--font-display);
  font-size: clamp(1.5rem, 3vw, 2.5rem);
  line-height: 1.2;
  letter-spacing: -0.02em;
  margin: 0;
  position: relative;
  max-width: 58ch;
}
.ft__mark {
  position: absolute;
  top: -0.4em; left: -0.4em;
  font-size: 3em;
  line-height: 1;
  color: var(--color-accent);
  opacity: 0.4;
}
.ft__caption {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-top: 2rem;
  padding-top: 1.75rem;
  border-top: 1px solid var(--color-border);
}
.ft__portrait {
  width: 3rem; height: 3rem;
  border-radius: 999px;
  object-fit: cover;
}
.ft__name { font-weight: 500; }
.ft__role { font-size: 0.875rem; color: var(--color-text-secondary); }
.ft__logo { margin-left: auto; opacity: 0.75; }

/* entrance: scroll-driven, static fallback for unsupported engines */
@keyframes ft-in { from { opacity: 0; translate: 0 16px; } to { opacity: 1; translate: 0 0; } }
@supports (animation-timeline: view()) {
  .ft__inner {
    animation: ft-in 750ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
}
@media (prefers-reduced-motion: reduce) {
  .ft__inner { animation: none; }
}
```

## Notes

- Content shape: one quote, author (name, role, company, optional portrait), optional company logo. Example register: "They didn't rebuild our stack. They quietly made every single part of it 30% better." — Rachel Ashe, Head of Platform, Meridian Labs.
- The quote carries the section; keep it long-form and specific. Portrait and logo are optional but each adds credibility.
