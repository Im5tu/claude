# FloatingShapes — `.astro`

Abstract blurred shapes that drift on scroll. Decorative-only. Maximum 3–5 per page — more and they become visual noise. Pure CSS; each shape is a positioned circle with `filter: blur(...)` and scroll-driven translate via `animation-timeline: scroll(root)`.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive (skip on strict restrained)
- texture-appetite: low / medium
- type-personality: any
- notes: Do NOT compete with hero typography. Keep opacity under 30%.

## File

### `src/components/sections/FloatingShapes.astro`

```astro
---
interface Shape {
  size: number;         // px
  x: number;            // % of container width
  y: number;            // % of container height
  color: string;        // CSS colour
  speed?: number;       // scroll parallax multiplier (default 0.3)
}
interface Props {
  shapes?: Shape[];
  class?: string;
}
const { shapes, class: className = "" } = Astro.props;
const defaultShapes: Shape[] = [
  { size: 320, x: 10, y: 20, color: "var(--color-accent)", speed: 0.4 },
  { size: 260, x: 80, y: 40, color: "var(--color-accent-light)", speed: 0.2 },
  { size: 200, x: 55, y: 75, color: "var(--color-accent-dark)", speed: 0.5 },
];
const list = shapes ?? defaultShapes;
---
<div class:list={["fs", className]} aria-hidden="true">
  {list.map((s, i) => (
    <span
      class="fs__dot"
      style={`--size: ${s.size}px; --x: ${s.x}%; --y: ${s.y}%; --c: ${s.color}; --speed: ${s.speed ?? 0.3}; --i: ${i};`}
    ></span>
  ))}
</div>

<style>
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
    animation: fs-drift linear both;
    animation-timeline: scroll(root);
    animation-range: 0 100vh;
  }
  @keyframes fs-drift {
    from { translate: calc(-50% + (var(--speed) * -30px)) calc(-50% + (var(--speed) * -40px)); }
    to   { translate: calc(-50% + (var(--speed) *  30px)) calc(-50% + (var(--speed) *  40px)); }
  }
  @media (prefers-reduced-motion: reduce) {
    .fs__dot { animation: none; }
  }
</style>
```

## Usage

```astro
<section class="relative overflow-hidden py-24 bg-[var(--color-surface)]">
  <FloatingShapes />
  <div class="relative z-10 max-w-4xl mx-auto px-6">
    <h2 class="text-6xl tracking-tight">Studio</h2>
    <p class="max-w-[55ch] mt-4">We design infrastructure that lives quietly in production.</p>
  </div>
</section>
```

## Dimensional adaptation

- Restrained → 2 shapes, opacity 15%, blur 80px. Motion range tighter (0 → 40vh).
- Expressive → 5 shapes, opacity 30%, varied sizes.
- Texture-high → shapes become less defined — skip in favour of a background photograph.
