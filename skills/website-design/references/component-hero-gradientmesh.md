# GradientMeshHero

Hero layered over the GradientMesh background (see component-interactive-gradientmesh.md). The mesh carries atmosphere; the headline carries the message.

## Dimensional fit

- surface-depth: dark (default), light (pale tints)
- motion-register: moderate, expressive (the mesh movement is the motion)
- texture-appetite: low
- type-personality: geometric-sans, editorial-display
- notes: Do NOT combine with FullBleedVideoHero or FullBleedImageHero — one atmospheric hero per page.

## Structure

- `<section class="gmh">` full-width, relative, overflow hidden, grid, place-items center
  - GradientMesh background layer (component-interactive-gradientmesh.md), optionally themed with three mesh colors (a, b, c)
  - `.gmh__inner` centered text block above the mesh (z-index 2), max-width 64rem
    - `<p class="gmh__eyebrow">` optional eyebrow, `data-i="0"`
    - `<h1 class="gmh__headline">` headline, `data-i="1"`
    - `<p class="gmh__sub">` supporting paragraph, `data-i="2"`
    - `.gmh__cta` CTA row, `data-i="3"`: primary CTA plus optional ghost secondary link

Primary CTA uses the HeroButton variant and the secondary uses the ghost variant of the Button spec from component-chrome-button.md.

## CSS

```css
.gmh {
  position: relative;
  min-height: 88vh;
  display: grid;
  place-items: center;
  padding: 7rem 1.5rem 4rem;
  overflow: hidden;
  background: var(--color-surface-primary);
  color: var(--color-text-primary);
}
.gmh__inner {
  position: relative; z-index: 2;
  max-width: 64rem; text-align: center;
}
.gmh__eyebrow {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
  color: var(--color-accent);
}
.gmh__headline {
  font-family: var(--font-display);
  font-size: clamp(3rem, 7.5vw, 6rem);
  line-height: 0.96;
  letter-spacing: -0.03em;
  margin-top: 1.25rem;
  text-wrap: balance;
}
.gmh__sub {
  max-width: 52ch;
  margin: 1.5rem auto 0;
  opacity: 0.82;
}
.gmh__cta { display: inline-flex; flex-wrap: wrap; gap: 0.75rem; margin-top: 2rem; justify-content: center; }

/* load-time entrance */
[data-i] {
  opacity: 0; translate: 0 16px;
  animation: gmh-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
  animation-delay: calc(var(--d, 0) * 120ms);
}
[data-i="0"] { --d: 0; } [data-i="1"] { --d: 1; }
[data-i="2"] { --d: 2; } [data-i="3"] { --d: 3; }
@keyframes gmh-in { to { opacity: 1; translate: 0 0; } }
@media (prefers-reduced-motion: reduce) {
  [data-i] { animation: none; opacity: 1; translate: 0 0; }
}
```

## Notes

- Content slots: optional eyebrow, headline, sub paragraph, primary CTA (label + href), optional secondary CTA (label + href), optional mesh color triple (a, b, c) passed through to the GradientMesh layer.
- The dark default in the original design used a near-black surface (#0A0A0A) with near-white text (#F5F5F5); on a dark palette, map surface-primary and text-primary to those values rather than hard-coding them here.
