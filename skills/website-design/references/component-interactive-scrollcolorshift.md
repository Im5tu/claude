# ScrollColorShift

Wraps multiple sections and shifts the wrapper's color tokens as the user scrolls, creating a cinematic chapter-to-chapter mood change. Pure CSS, no JS: `animation-timeline: scroll()` drives a keyframe timeline that walks through registered custom-property color stops.

## Dimensional fit

- surface-depth: any (the whole point is to shift it)
- motion-register: moderate, expressive
- texture-appetite: any
- type-personality: any
- notes: Expect 3–4 chapters. More than 4 feels chaotic and hard to direct.

## Structure

- `.scs` wrapper `<div>` around the chapter sections
  - one full-height `<section>` (min-height 100vh) per chapter; the last chapter usually returns to the opening color

Each color stop is a trio: `bg`, `fg`, `accent`. Keyframe offsets are evenly spaced: stop i of n sits at `(i / (n - 1)) * 100%`.

## CSS

`@property` registration is load-bearing: without it, colors would swap at keyframe boundaries instead of interpolating. Initial values are the first stop's colors.

```css
@property --c-bg { syntax: "<color>"; inherits: true; initial-value: #0A0A0A; }
@property --c-fg { syntax: "<color>"; inherits: true; initial-value: #F5F5F5; }
@property --c-accent { syntax: "<color>"; inherits: true; initial-value: #E8B04A; }

.scs {
  background: var(--c-bg);
  color: var(--c-fg);
  --color-accent: var(--c-accent);
}
@supports (animation-timeline: scroll()) {
  .scs {
    animation: scs-walk linear both;
    animation-timeline: scroll(nearest);
  }
}
/* Keyframes are generated from the stop list; evenly spaced.
   Example with 4 stops (dark gold, blue night, warm ember, back to dark gold): */
@keyframes scs-walk {
  0%   { --c-bg: #0A0A0A; --c-fg: #F5F5F5; --c-accent: #E8B04A; }
  33.3%  { --c-bg: #151B26; --c-fg: #E8ECF1; --c-accent: #7BA7D9; }
  66.7%  { --c-bg: #2A1C14; --c-fg: #F5E6D6; --c-accent: #C88A5D; }
  100% { --c-bg: #0A0A0A; --c-fg: #F5F5F5; --c-accent: #E8B04A; }
}
@media (prefers-reduced-motion: reduce) {
  .scs { animation: none; }
  /* the @property initial values (first stop) then apply statically */
}
```

## Notes

- `animation-timeline: scroll(nearest)` ties the animation to the nearest scrollable ancestor — usually the document. Use `scroll(root)` if the wrapper is the scroll container itself.
- Without scroll-timeline support the wrapper holds the first stop's colors statically; content stays fully readable.
- Keep the first and last stop related so the transition between the last section and whatever follows doesn't jar.
- The wrapper overrides `--color-accent` for everything inside it, so accents ride the chapter shift automatically.
