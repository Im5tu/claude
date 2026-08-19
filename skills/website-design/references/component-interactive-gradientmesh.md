# GradientMesh

Animated gradient background: atmospheric, not attention-grabbing. Layered radial gradients drift slowly via `background-position` keyframes. Pure CSS. Use as a background layer inside another section (`position: absolute; inset: 0`).

## Dimensional fit

- surface-depth: dark (most effective), light (possible with pale tints)
- motion-register: any (motion is intentionally slow)
- texture-appetite: low / medium — texture-high directions can pair but watch for muddiness
- type-personality: any
- notes: Keep orb opacity below 40%. The mesh should recede, not compete.

## Structure

- `.mesh` `<div>`, `aria-hidden="true"`, absolutely filling its section (the section needs `position: relative; overflow: hidden`)
  - carries three color custom properties: `--a` (default `var(--color-accent)`), `--b` (default `var(--color-accent-light)`), `--c` (default `var(--color-accent-dark)`)
- Section content sits in a sibling wrapper with `position: relative; z-index: 10`.

## CSS

```css
.mesh {
  position: absolute;
  inset: 0;
  pointer-events: none;
  background-image:
    radial-gradient(600px at 20% 20%, color-mix(in oklab, var(--a) 35%, transparent), transparent 70%),
    radial-gradient(700px at 80% 30%, color-mix(in oklab, var(--b) 28%, transparent), transparent 70%),
    radial-gradient(500px at 60% 80%, color-mix(in oklab, var(--c) 30%, transparent), transparent 70%);
  background-size: 200% 200%;
  background-position: 0% 0%, 100% 0%, 50% 100%;
  animation: mesh-drift 24s ease-in-out infinite alternate;
  filter: blur(40px);
}
@keyframes mesh-drift {
  to {
    background-position: 30% 40%, 70% 60%, 40% 30%;
  }
}
@media (prefers-reduced-motion: reduce) {
  .mesh { animation: none; }
}
```

## Notes

- Typical host: a dark section (dark literal or dark-theme `var(--color-surface-primary)`) with generous vertical padding (about 6rem) and light text.
- The three colors accept any color token or literal; defaults are the accent trio.

## Dimensional adaptation

- Restrained: extend animation duration to 45–60s, drop opacity to 20%.
- Expressive: reduce blur to 28px, raise opacity to 45%.
- Dark + technical: use cool accent trios (slate, steel, teal).
