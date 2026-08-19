# Manifesto

A philosophy-led section: a short power statement (one to three sentences) revealed word-by-word as the reader scrolls to it. Uses the shared word-by-word text reveal primitive from `core-animation.md`.

## Dimensional fit

- surface-depth: dark (strongest), light possible
- motion-register: moderate, expressive (TextReveal animation IS the presence)
- texture-appetite: any
- type-personality: editorial-display, humanist-serif
- notes: Only include when philosophy IS the competitive edge. Every site does not need a manifesto — avoid the template marker.

## Structure

- `<section class="mf">` with tone modifier class `mf--dark` or `mf--light`
  - `.mf__inner` centered container, max-width 56rem, centered text
    - optional `.mf__kicker` `<p>` (mono, uppercase, accent color)
    - `.mf__statement` `<p>` — statement text split into per-word spans by the TextReveal primitive (`core-animation.md`), 70ms stagger between words
    - optional `.mf__attr` `<p>` attribution line

## CSS

```css
.mf {
  padding: 8rem 1.5rem;
}
.mf--dark {
  background: #0A0A0A;
  color: #F5F5F5;
}
.mf--light {
  background: var(--color-surface-secondary);
  color: var(--color-text-primary);
}
.mf__inner {
  max-width: 56rem;
  margin: 0 auto;
  text-align: center;
}
.mf__kicker {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.2em; text-transform: uppercase;
  color: var(--color-accent);
  margin-bottom: 2rem;
}
.mf__statement {
  font-family: var(--font-display);
  font-size: clamp(2rem, 4.5vw, 3.5rem);
  line-height: 1.15;
  letter-spacing: -0.02em;
  margin: 0;
  text-wrap: balance;
}
.mf__attr {
  margin-top: 2.5rem;
  font-family: var(--font-mono);
  font-size: 0.75rem;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  opacity: 0.6;
}
```

## Notes

- Statement must be short — one to three sentences. More reads as copy, not philosophy.
- The word-by-word CSS reveal from `core-animation.md` is required, with a 70ms per-word stagger. A static paragraph here is a banned pattern. The reveal must follow the shared entrance rules: keyframes carry `from { opacity: 0 }`, scroll-driven variants sit inside `@supports (animation-timeline: view())`, and reduced-motion disables the animation.
- Dark tone uses literal `#0A0A0A` / `#F5F5F5` because the token set has no dedicated dark-surface pair; swap for the site's dark surface values if it defines them.
- Example content: kicker "Our belief", statement "Quiet software, loud outcomes. We'd rather ship Tuesday than announce Monday.", attribution "— The studio, since 2015", dark tone.
