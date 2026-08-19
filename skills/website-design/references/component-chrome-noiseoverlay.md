# NoiseOverlay — `.astro`

SVG `feTurbulence` noise texture at fixed position over the entire viewport. Adds film-grain polish that separates a premium site from a generic template. Mandatory on every site. Opacity comes from the direction card's texture-appetite.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any (value tunes opacity — see index file)
- type-personality: any

## File

### `src/components/ui/NoiseOverlay.astro`

```astro
---
interface Props {
  opacity?: number;      // 0.01 – 0.08
  baseFrequency?: number; // 0.6 – 1.2 — higher = finer grain
  class?: string;
}
const {
  opacity = 0.03,
  baseFrequency = 0.9,
  class: className = "",
} = Astro.props;
---
<div class:list={["noise", className]} aria-hidden="true" style={`--noise-opacity: ${opacity};`}>
  <svg width="100%" height="100%" viewBox="0 0 200 200" preserveAspectRatio="none">
    <filter id="noise-filter">
      <feTurbulence type="fractalNoise" baseFrequency={baseFrequency} numOctaves="2" stitchTiles="stitch" />
      <feColorMatrix type="saturate" values="0" />
    </filter>
    <rect width="100%" height="100%" filter="url(#noise-filter)" />
  </svg>
</div>

<style>
  .noise {
    position: fixed;
    inset: 0;
    pointer-events: none;
    z-index: 100;
    opacity: var(--noise-opacity, 0.03);
    mix-blend-mode: overlay;
  }
  @media (prefers-reduced-motion: reduce) {
    /* Noise is static — no motion concern; retained as-is. */
  }
</style>
```

## Placement

In `src/layouts/BaseLayout.astro`:

```astro
---
import NoiseOverlay from "../components/ui/NoiseOverlay.astro";
---
<html lang="en">
  <head><!-- … --></head>
  <body>
    <slot />
    <NoiseOverlay opacity={0.03} />
  </body>
</html>
```

## Props

| Prop | Type | Default | Notes |
|---|---|---|---|
| `opacity` | `number` | `0.03` | Tune to direction's texture-appetite — see chrome index table |
| `baseFrequency` | `number` | `0.9` | Lower = coarser grain, higher = finer |

## Opacity recipe

- Light + restrained → `0.03`
- Light + restrained + texture-high → `0.04`
- Dark + expressive → `0.05`
- Dark + restrained → `0.025`
- Light + moderate + technical → `0.02`
- Light + restrained + editorial → `0.03`

## Notes

- SVG inline is intentional — avoids a PNG asset and scales perfectly.
- `mix-blend-mode: overlay` gives the grain character on both dark and light backgrounds.
- For aggressive grain, increase `opacity` first; raise `baseFrequency` second.
