# StickyCardStack

Full-height cards that pin and stack as the user scrolls. The underlying card scales down, blurs, and fades while the next one reveals, creating a layered cinematic reveal. Pure CSS: `position: sticky` for the pin plus `animation-timeline: view()` for the scale/blur.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low / medium
- type-personality: any
- notes: Budget-heavy — counts as a high-motion technique. One per page max.

## Structure

- `.scs-section` `<section>` (grid, row gap 2rem, bottom padding 20vh)
  - one `.scs-card` `<article>` per card (typically 3–4); each carries `--i` (its index) and `--total` (card count) custom properties
    - `.scs-card__inner` panel; optional per-card `--accent` override
      - `.scs-card__eyebrow` (`<p>`, e.g. "01 · Discover")
      - `.scs-card__heading` (`<h3>`)
      - `.scs-card__body` (`<p>`)
      - optional `<img>` (media, intrinsic 1200×800)

## CSS

```css
.scs-section {
  display: grid;
  gap: 2rem;
  padding-bottom: 20vh;
}
.scs-card {
  position: sticky;
  top: calc(10vh + (var(--i) * 1.25rem));
  min-height: 70vh;
  display: grid;
  place-items: center;
}
@supports (animation-timeline: view()) {
  .scs-card {
    animation: scs-scale linear both;
    animation-timeline: view();
    animation-range: exit 0% exit 100%;
  }
}
@keyframes scs-scale {
  to {
    scale: calc(1 - 0.04 * var(--total));
    filter: blur(4px);
    opacity: 0.4;
  }
}
.scs-card__inner {
  width: min(90%, 56rem);
  padding: 3rem;
  border-radius: 1.5rem;
  background: var(--color-surface-secondary);
  border: 1px solid var(--color-border);
  color: var(--color-text-primary);
  box-shadow: 0 40px 120px -40px rgb(0 0 0 / 0.25);
}
.scs-card__eyebrow {
  font-size: 0.75rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--accent, var(--color-accent));
}
.scs-card__heading {
  font-family: var(--font-display);
  font-size: clamp(2rem, 4vw, 3.5rem);
  letter-spacing: -0.02em;
  margin-top: 0.75rem;
}
.scs-card__body {
  margin-top: 1rem;
  max-width: 58ch;
  color: var(--color-text-secondary);
}
.scs-card__inner img {
  margin-top: 2rem;
  width: 100%;
  border-radius: 1rem;
}

@media (prefers-reduced-motion: reduce) {
  .scs-card { position: static; animation: none; min-height: 0; }
}
```

## Notes

- The keyframes only define a `to` state; the resting layout is the `from` state, so unsupported engines simply show stacked sticky cards without the scale/blur, and no content is hidden.
- 3–4 cards is the sweet spot. Fewer than 3 wastes the mechanism; more than 4 overwhelms.
- If the direction's motion register is restrained, downgrade to a plain `AccordionProcess` or numbered list.
- Because the whole page scrolls within this stack, place it away from other sticky elements.
