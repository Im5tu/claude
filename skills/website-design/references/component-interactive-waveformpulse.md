# WaveformPulse

A row of thin vertical bars that draws itself in on scroll entry (bars scale up from zero height, rippling across the row), then breathes in a continuous pulse. Pure CSS, no JS.

## Dimensional fit

- surface-depth: dark (strongest), light possible with subtle stroke
- motion-register: moderate, expressive
- texture-appetite: low (clean vector)
- type-personality: geometric-sans, editorial-display
- notes: Ideal on stats / data / signal sections, or as an atmospheric detail above a CTA.

## Structure

- `.wave` wrapper, `aria-hidden="true"` (decorative); carries `--col` (bar color, default `var(--color-accent)`) and `--h` (row height, default 120px)
  - `.wave__bars` flex row filling the wrapper
    - one `.wave__bar` `<span>` per bar (default 48 bars); each carries `--i` (its index) and `--bh` (its height as a percentage)

Bar heights are pseudo-random but stable so the waveform has character. Generate at build time with a seeded formula, e.g. `seed(n) = fract(sin(n * 12.9898) * 43758.5453)` and `height = 25% + seed(i) * 75%`.

## CSS

```css
.wave {
  height: var(--h, 120px);
  display: flex;
  align-items: center;
}
.wave__bars {
  display: flex;
  align-items: center;
  gap: 3px;
  width: 100%;
  height: 100%;
}
.wave__bar {
  flex: 1 1 0;
  background: var(--col, currentColor);
  border-radius: 2px;
  height: var(--bh, 50%);
  transform-origin: center;
  /* continuous pulse; per-bar duration drift desynchronises the bars
     so the row shimmers instead of pumping in unison */
  animation: wave-pulse calc(2.4s + var(--i) * 20ms) ease-in-out infinite;
}
@supports (animation-timeline: view()) {
  .wave__bar {
    /* add the scroll-driven draw-in; stagger comes from per-bar
       animation-range offsets (time delays are ignored on view() timelines) */
    animation:
      wave-draw 900ms cubic-bezier(0.2, 0.8, 0.2, 1) both,
      wave-pulse calc(2.4s + var(--i) * 20ms) ease-in-out infinite;
    animation-timeline: view(), auto;
    animation-range: entry calc(var(--i) * 0.4%) cover calc(30% + var(--i) * 0.4%), normal;
  }
}
@keyframes wave-draw {
  from { scale: 1 0; opacity: 0; }
  to   { scale: 1 1; opacity: 1; }
}
@keyframes wave-pulse {
  0%, 100% { scale: 1 1; }
  50%      { scale: 1 0.72; }
}
@media (prefers-reduced-motion: reduce) {
  .wave__bar { animation: none; scale: 1 1; opacity: 1; }
}
```

## Notes

- The draw-in lives entirely inside the `@supports (animation-timeline: view())` block, so engines without scroll timelines show the bars fully drawn and pulsing.
- The draw stagger uses per-bar `animation-range` offsets, never a time delay: delay values are ignored on scroll-driven timelines.
- Typical host: a dark section with the component above a centered heading; pass `--col: var(--color-accent-light)` on dark surfaces.

## Dimensional adaptation

- Restrained: disable the continuous pulse (drop the second animation), keep draw-in only.
- Light surfaces: reduce bar opacity via `color-mix` of the accent with the surface color.
- Technical: use a cool accent and narrower bars (6px gap instead of 3px).
