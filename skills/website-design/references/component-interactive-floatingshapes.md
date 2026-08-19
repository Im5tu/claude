# FloatingShapes

Abstract blurred shapes that drift on scroll. Decorative only. Maximum 3 to 5 per page; more and they become visual noise. Pure CSS: each shape is a positioned circle with `filter: blur(...)` and a scroll-driven translate via `animation-timeline: scroll(root)`.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive (skip on strict restrained)
- texture-appetite: low / medium
- type-personality: any
- notes: Do NOT compete with hero typography. Keep opacity under 30%.

## Structure

- `.fs` wrapper, `aria-hidden="true"`, absolutely filling its section (the section needs `position: relative; overflow: hidden`)
  - one `.fs__dot` `<span>` per shape, each carrying per-shape custom properties: `--size` (px), `--x` / `--y` (% position), `--c` (color), `--speed` (parallax multiplier, default 0.3)
- Section content sits in a sibling wrapper with `position: relative; z-index: 10` so it stays above the shapes.

Default shape set (used when no explicit shapes are given):

| size | x | y | color | speed |
|---|---|---|---|---|
| 320px | 10% | 20% | var(--color-accent) | 0.4 |
| 260px | 80% | 40% | var(--color-accent-light) | 0.2 |
| 200px | 55% | 75% | var(--color-accent-dark) | 0.5 |

## CSS

```css
.fs {
  position: absolute;
  inset: 0;
  pointer-events: none;
  overflow: hidden;
}
.fs__dot {
  position: absolute;
  left: var(--x);
  top: var(--y);
  width: var(--size);
  height: var(--size);
  border-radius: 999px;
  background: color-mix(in oklab, var(--c) 40%, transparent);
  filter: blur(60px);
  translate: -50% -50%;
}
@supports (animation-timeline: scroll()) {
  .fs__dot {
    animation: fs-drift linear both;
    animation-timeline: scroll(root);
    animation-range: 0 100vh;
  }
}
@keyframes fs-drift {
  from { translate: calc(-50% + (var(--speed) * -30px)) calc(-50% + (var(--speed) * -40px)); }
  to   { translate: calc(-50% + (var(--speed) *  30px)) calc(-50% + (var(--speed) *  40px)); }
}
@media (prefers-reduced-motion: reduce) {
  .fs__dot { animation: none; }
}
```

## Notes

- The host section supplies the page background (`var(--color-surface-primary)`), padding (typically 6rem vertical), and the stacking context.
- Shapes are purely decorative; without scroll-timeline support they render static, which is fine because the base `translate: -50% -50%` centers each dot on its anchor point.

## Dimensional adaptation

- Restrained: 2 shapes, opacity 15%, blur 80px. Motion range tighter (0 to 40vh).
- Expressive: 5 shapes, opacity 30%, varied sizes.
- Texture-high: shapes become less defined; skip in favour of a background photograph.
