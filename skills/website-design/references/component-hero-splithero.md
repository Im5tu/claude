# SplitHero

Text left, image or visual right. Classic B2B, advisory, and service hero. Workhorse for establishment and restrained directions. Static markup, entrance via staggered CSS `@keyframes` on page load.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, geometric-sans
- notes: Image should be real, not a generic stock laptop-on-desk. Use the direction's image mood keywords.

## Structure

- `<section class="split">` two-column grid (stacks to one column below 1024px), max-width 80rem, vertically centered
  - `.split__text` left column
    - `<p class="split__eyebrow">` optional eyebrow, `data-i="0"`
    - `<h1 class="split__headline">` headline, `data-i="1"`
    - `<p class="split__sub">` supporting paragraph, `data-i="2"`
    - `.split__cta` CTA row, `data-i="3"`: primary CTA plus optional ghost secondary link
  - `.split__visual` right column, `data-i="4"`
    - `<img>` 1200x1400 intrinsic size, `loading="eager"`, meaningful alt text

Primary CTA uses the HeroButton variant and the secondary uses the ghost variant of the Button spec from component-chrome-button.md.

## CSS

```css
.split {
  display: grid;
  grid-template-columns: 1fr;
  gap: 3rem;
  max-width: 80rem;
  margin: 0 auto;
  padding: 6rem 1.5rem 3rem;
  min-height: 80vh;
  align-items: center;
}
@media (min-width: 1024px) {
  .split { grid-template-columns: 7fr 5fr; gap: 5rem; }
}
.split__eyebrow {
  font-family: var(--font-mono);
  font-size: 0.75rem;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--color-accent);
}
.split__headline {
  font-family: var(--font-display);
  font-size: clamp(2.75rem, 6vw, 4.5rem);
  line-height: 1;
  letter-spacing: -0.03em;
  margin-top: 1.25rem;
  max-width: 18ch;
  text-wrap: balance;
}
.split__sub {
  max-width: 54ch;
  margin-top: 1.5rem;
  color: var(--color-text-secondary);
  font-size: clamp(1rem, 1.3vw, 1.125rem);
}
.split__cta { display: inline-flex; flex-wrap: wrap; gap: 0.75rem; margin-top: 2rem; }
.split__visual img {
  width: 100%;
  height: auto;
  aspect-ratio: 4 / 5;
  object-fit: cover;
  border-radius: 1.5rem;
}

/* load-time entrance: text staggers, visual enters alongside the headline */
[data-i] {
  opacity: 0; translate: 0 16px;
  animation: split-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
  animation-delay: calc(var(--d, 0) * 120ms);
}
[data-i="0"] { --d: 0; } [data-i="1"] { --d: 1; }
[data-i="2"] { --d: 2; } [data-i="3"] { --d: 3; } [data-i="4"] { --d: 1; }
@keyframes split-in { to { opacity: 1; translate: 0 0; } }
@media (prefers-reduced-motion: reduce) {
  [data-i] { animation: none; opacity: 1; translate: 0 0; }
}
```

## Notes

- Content slots: optional eyebrow, headline, sub paragraph, primary CTA (label + href), optional secondary CTA (label + href), image (src + alt).
- Dimensional adaptation:
  - Establishment: use a square or 4:5 portrait. Softer tonal range.
  - Technical: swap photo for a CLI/UI screenshot inside a subtle device frame.
  - Texture-high: add a noise overlay layer atop the image.
