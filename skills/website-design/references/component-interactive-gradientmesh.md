# GradientMesh — `.astro`

Animated gradient background — atmospheric, not attention-grabbing. Layered radial gradients drift slowly via `background-position` keyframes. Pure CSS. Use as a background layer inside another section (`position: absolute; inset: 0`).

## Dimensional fit

- surface-depth: dark (most effective), light (possible with pale tints)
- motion-register: any (motion is intentionally slow)
- texture-appetite: low / medium — texture-high directions can pair but watch for muddiness
- type-personality: any
- notes: Keep orb opacity below 40%. The mesh should recede, not compete.

## File

### `src/components/sections/GradientMesh.astro`

```astro
---
interface Props {
  colorA?: string;
  colorB?: string;
  colorC?: string;
  class?: string;
}
const {
  colorA = "var(--color-accent)",
  colorB = "var(--color-accent-light)",
  colorC = "var(--color-accent-dark)",
  class: className = "",
} = Astro.props;
---
<div
  class:list={["mesh", className]}
  style={`--a: ${colorA}; --b: ${colorB}; --c: ${colorC};`}
  aria-hidden="true"
></div>

<style>
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
</style>
```

## Usage

```astro
<section class="relative overflow-hidden bg-[var(--color-surface-dark)] text-[var(--color-primary-on-dark)] py-24">
  <GradientMesh />
  <div class="relative z-10 max-w-4xl mx-auto px-6">
    <h2 class="text-6xl tracking-tight">Quiet systems, loud outcomes.</h2>
  </div>
</section>
```

## Props

| Prop | Type | Default | Notes |
|---|---|---|---|
| `colorA` | `string` | `--color-accent` | Any colour token or literal |
| `colorB` | `string` | `--color-accent-light` | |
| `colorC` | `string` | `--color-accent-dark` | |

## Dimensional adaptation

- Restrained → extend animation duration to 45–60s, drop opacity to 20%.
- Expressive → reduce blur to 28px, raise opacity to 45%.
- Dark + technical → use cool accent trios (slate, steel, teal).
