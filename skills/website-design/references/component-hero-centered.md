# CenteredHero

Centred headline, supporting paragraph, and CTAs, with optional visual element below the fold. Classic and flexible; works across most registers. Static markup, entrance via staggered CSS `@keyframes` on page load.

## Dimensional fit

- surface-depth: any
- motion-register: moderate (default), restrained possible with shorter durations
- texture-appetite: low, medium
- type-personality: any
- notes: Safer than TypeHero. If you need to communicate quickly without pushing register, pick this.

## Structure

- `<section class="ch">` full-width, grid, place-items center
  - `.ch__inner` centered container, max-width 56rem, text centered
    - `<p class="ch__eyebrow">` optional eyebrow label, `data-i="0"`
    - `<h1 class="ch__headline">` headline, `data-i="1"`
    - `<p class="ch__sub">` supporting paragraph, `data-i="2"`
    - `.ch__cta` CTA row, `data-i="3"`: primary CTA plus optional ghost secondary link

Primary CTA uses the HeroButton variant and the secondary uses the ghost variant of the Button spec from component-chrome-button.md.

## CSS

```css
.ch {
  min-height: 78vh;
  display: grid;
  place-items: center;
  padding: 7rem 1.5rem 4rem;
  text-align: center;
}
.ch__inner { max-width: 56rem; margin: 0 auto; }
.ch__eyebrow {
  font-family: var(--font-mono);
  font-size: 0.75rem;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--color-accent);
}
.ch__headline {
  font-family: var(--font-display);
  font-size: clamp(2.75rem, 6vw, 5rem);
  line-height: 1;
  letter-spacing: -0.03em;
  margin-top: 1.25rem;
}
.ch__sub {
  max-width: 52ch;
  margin: 1.5rem auto 0;
  color: var(--color-text-secondary);
  font-size: clamp(1rem, 1.3vw, 1.125rem);
}
.ch__cta {
  display: inline-flex;
  flex-wrap: wrap;
  gap: 0.75rem;
  margin-top: 2rem;
  justify-content: center;
}

/* load-time entrance: elements stagger in top to bottom */
[data-i] {
  opacity: 0;
  translate: 0 16px;
  animation: ch-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
  animation-delay: calc(var(--d, 0) * 120ms);
}
[data-i="0"] { --d: 0; }
[data-i="1"] { --d: 1; }
[data-i="2"] { --d: 2; }
[data-i="3"] { --d: 3; }
@keyframes ch-in {
  to { opacity: 1; translate: 0 0; }
}
@media (prefers-reduced-motion: reduce) {
  [data-i] { animation: none; opacity: 1; translate: 0 0; }
}
```

## Notes

- Content slots: optional eyebrow, headline, sub paragraph, primary CTA (label + href), optional secondary CTA (label + href).
- Dimensional adaptation:
  - Restrained: drop stagger delays to 80ms, reduce translate to 12px.
  - Expressive: raise headline size to 7vw, add a subtle `text-wrap: balance`.
  - Technical: swap eyebrow to a monospace status line ("v2.0 · shipped Q1 2026").
