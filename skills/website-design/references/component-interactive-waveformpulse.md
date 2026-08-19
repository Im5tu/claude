# WaveformPulse — `.astro`

SVG waveform that draws itself on scroll entry (via `stroke-dashoffset`), then breathes in a continuous pulse. Pure CSS; no JS.

## Dimensional fit

- surface-depth: dark (strongest), light possible with subtle stroke
- motion-register: moderate, expressive
- texture-appetite: low (clean vector)
- type-personality: geometric-sans, editorial-display
- notes: Ideal on stats / data / signal sections, or as an atmospheric detail above a CTA.

## File

### `src/components/sections/WaveformPulse.astro`

```astro
---
interface Props {
  height?: number;
  bars?: number;
  color?: string;
  class?: string;
}
const {
  height = 120,
  bars = 48,
  color = "var(--color-accent)",
  class: className = "",
} = Astro.props;

// Pseudo-random stable heights so bars have character
const seed = (n: number) => ((Math.sin(n * 12.9898) * 43758.5453) % 1 + 1) % 1;
const heights = Array.from({ length: bars }, (_, i) => 0.25 + seed(i) * 0.75);
---
<div class:list={["wave", className]} style={`--col: ${color}; --h: ${height}px;`} aria-hidden="true">
  <div class="wave__bars">
    {heights.map((h, i) => (
      <span class="wave__bar" style={`--i: ${i}; --bh: ${(h * 100).toFixed(0)}%;`}></span>
    ))}
  </div>
</div>

<style>
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
    animation:
      wave-draw 900ms cubic-bezier(0.2, 0.8, 0.2, 1) both,
      wave-pulse 2.4s ease-in-out infinite;
    animation-delay: calc(var(--i) * 12ms), calc(var(--i) * 60ms);
    animation-timeline: view(), auto;
    animation-range: entry 0% cover 30%, auto;
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
</style>
```

## Usage

```astro
<section class="bg-[var(--color-surface-dark)] py-24 px-6 text-center">
  <div class="max-w-4xl mx-auto">
    <WaveformPulse color="var(--color-accent-light)" />
    <h3 class="text-4xl mt-6">Signal-to-noise, engineered.</h3>
  </div>
</section>
```

## Props

| Prop | Type | Default | Notes |
|---|---|---|---|
| `height` | `number` | `120` | px |
| `bars` | `number` | `48` | More bars = denser waveform |
| `color` | `string` | `var(--color-accent)` | Stroke colour |

## Dimensional adaptation

- Restrained → disable the continuous pulse (drop the second animation), keep draw-in only.
- Light surfaces → reduce bar opacity via `color-mix` of the accent with surface.
- Technical → use a cool accent and narrower bars (6 gap instead of 3).
