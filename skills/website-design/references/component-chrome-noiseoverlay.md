# Noise overlay

SVG `feTurbulence` noise texture at fixed position over the entire viewport. Adds film-grain polish that separates a premium site from a generic template. Mandatory on every site. Opacity comes from the direction card's texture-appetite.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any (value tunes opacity — see index file)
- type-personality: any

## Structure

- `<div class="noise" aria-hidden="true">`, last child of `<body>`, with `--noise-opacity` set inline per the opacity recipe
  - full-bleed inline `<svg width="100%" height="100%" viewBox="0 0 200 200" preserveAspectRatio="none">`
    - `<filter id="noise-filter">` containing `<feTurbulence type="fractalNoise" baseFrequency="0.9" numOctaves="2" stitchTiles="stitch" />` and `<feColorMatrix type="saturate" values="0" />`
    - `<rect width="100%" height="100%" filter="url(#noise-filter)" />`

## CSS

```css
.noise {
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: 100;
  opacity: var(--noise-opacity, 0.03);
  mix-blend-mode: overlay;
}
/* Noise is static, so no reduced-motion handling is needed. */
```

## Tuning

- `--noise-opacity`: 0.01 to 0.08, default 0.03; set per the recipe below.
- `baseFrequency`: 0.6 to 1.2, default 0.9. Lower = coarser grain, higher = finer.

## Opacity recipe

- Light + restrained → `0.03`
- Light + restrained + texture-high → `0.04`
- Dark + expressive → `0.05`
- Dark + restrained → `0.025`
- Light + moderate + technical → `0.02`
- Light + restrained + editorial → `0.03`

## Notes

- SVG inline is intentional; it avoids a PNG asset and scales perfectly.
- `mix-blend-mode: overlay` gives the grain character on both dark and light backgrounds.
- For aggressive grain, increase opacity first; raise `baseFrequency` second.
- Place it once in the base page layout, after the main content, so it overlays every page.
