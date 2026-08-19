# BentoHero

Hero as a grid of tiles: one large headline tile plus several supporting tiles (stat, feature, quote, media). Pure CSS Grid; tiles stagger in with a per-tile `--i` index driving `animation-delay`.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low, medium
- type-personality: geometric-sans, editorial-display
- notes: Great for multi-product, platform, or technical sites where the hero needs to show breadth. Not for single-proposition brands — use CenteredHero or SplitHero instead.

## Structure

- `<section class="bento">` centered container, max-width 80rem
  - `.bento__grid` 6-column grid, auto rows minmax(12rem, auto), gap 1rem
    - `.bento__cell.bento__cell--hero` headline tile (`--i: 0`): optional eyebrow, `<h1>` headline, optional sub paragraph, one CTA
    - 3 to 6 supporting `.bento__cell` tiles, each with `--i` set to its 1-based position and a kind modifier:
      - `--stat`: `.bento__cell-value` large figure + `.bento__cell-label`
      - `--feature`: `.bento__cell-title` + `.bento__cell-body`
      - `--quote`: `<figure><blockquote>` + optional `<figcaption>` attribution
      - `--media`: `<img>` (800x600 intrinsic size)
    - optional `span-2` / `span-3` classes widen a tile to 4 or 6 columns

The CTA uses the HeroButton variant of the Button spec from component-chrome-button.md.

## CSS

```css
.bento {
  max-width: 80rem;
  margin: 0 auto;
  padding: 6rem 1.5rem 3rem;
}
.bento__grid {
  display: grid;
  gap: 1rem;
  grid-template-columns: repeat(6, 1fr);
  grid-auto-rows: minmax(12rem, auto);
}
.bento__cell {
  background: var(--color-surface-secondary);
  border: 1px solid var(--color-border);
  border-radius: 1.25rem;
  padding: 1.75rem;
  grid-column: span 2;
  opacity: 0;
  translate: 0 16px;
  animation: bento-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
  animation-delay: calc(var(--i, 0) * 80ms);
}
.bento__cell--hero {
  grid-column: span 6;
  grid-row: span 2;
  background: var(--color-surface-elevated);
  padding: 2.5rem;
}
@media (min-width: 1024px) {
  .bento__cell--hero { grid-column: span 4; }
}
.bento__cell.span-2 { grid-column: span 4; }
.bento__cell.span-3 { grid-column: span 6; }

.bento__eyebrow {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
  color: var(--color-accent);
}
.bento__headline {
  font-family: var(--font-display);
  font-size: clamp(2.25rem, 4.5vw, 3.5rem);
  letter-spacing: -0.03em; line-height: 1;
  margin-top: 1rem; max-width: 18ch; text-wrap: balance;
}
.bento__sub { margin-top: 1rem; color: var(--color-text-secondary); max-width: 48ch; }
.bento__cta { margin-top: 1.5rem; }

.bento__cell-value {
  font-family: var(--font-display);
  font-size: clamp(2rem, 3.5vw, 3rem);
  letter-spacing: -0.02em; line-height: 1;
  color: var(--color-accent);
}
.bento__cell-label { margin-top: 0.5rem; opacity: 0.7; font-size: 0.875rem; }
.bento__cell-title {
  font-family: var(--font-display);
  font-size: 1.25rem; letter-spacing: -0.01em;
}
.bento__cell-body { margin-top: 0.5rem; color: var(--color-text-secondary); }
.bento__cell--media img {
  width: 100%; height: 100%;
  object-fit: cover;
  border-radius: 0.75rem;
}

@keyframes bento-in { to { opacity: 1; translate: 0 0; } }
@media (prefers-reduced-motion: reduce) {
  .bento__cell { animation: none; opacity: 1; translate: 0 0; }
}
```

## Notes

- Keep supporting tiles to 3–6. Fewer feels sparse; more overwhelms.
- Tile content slots: stat (value + label), feature (title + body), quote (body + attribution), media (src + alt). Each tile takes an optional span of 1, 2, or 3 columns for rhythm.
- All tiles use the global `--color-border`/`--color-surface-secondary` tokens so palette changes propagate instantly; the headline tile sits on `--color-surface-elevated` to lift it above the supporting tiles.
