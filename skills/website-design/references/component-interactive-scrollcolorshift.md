# ScrollColorShift — `.astro`

Wraps multiple sections and shifts the page's root colour tokens as the user scrolls. Creates a cinematic chapter-to-chapter mood change. Pure CSS — no JS. Uses `animation-timeline: scroll(root)` to drive CSS custom property interpolation.

## Dimensional fit

- surface-depth: any (the whole point is to shift it)
- motion-register: moderate, expressive
- texture-appetite: any
- type-personality: any
- notes: Expect 3–4 chapters. More than 4 feels chaotic and hard to direct.

## Mechanism

CSS `@property` registers the tokens as interpolatable, and `animation-timeline: scroll(root)` drives a keyframe timeline that walks through colour stops.

## File

### `src/components/sections/ScrollColorShift.astro`

```astro
---
interface Stop { bg: string; fg: string; accent: string; }
interface Props {
  stops: Stop[];          // 3-4 colour stops for <body>
  class?: string;
}
const { stops, class: className = "" } = Astro.props;
const toFrames = stops.map((s, i) => `${(i / (stops.length - 1)) * 100}% { --c-bg: ${s.bg}; --c-fg: ${s.fg}; --c-accent: ${s.accent}; }`).join("\n");
---
<div class:list={["scs", className]}>
  <slot />
</div>

<style set:html={`
  @property --c-bg { syntax: "<color>"; inherits: true; initial-value: ${stops[0].bg}; }
  @property --c-fg { syntax: "<color>"; inherits: true; initial-value: ${stops[0].fg}; }
  @property --c-accent { syntax: "<color>"; inherits: true; initial-value: ${stops[0].accent}; }

  .scs {
    background: var(--c-bg);
    color: var(--c-fg);
    --color-accent: var(--c-accent);
    animation: scs-walk linear both;
    animation-timeline: scroll(nearest);
  }
  @keyframes scs-walk {
    ${toFrames}
  }
  @media (prefers-reduced-motion: reduce) {
    .scs { animation: none; background: ${stops[0].bg}; color: ${stops[0].fg}; --color-accent: ${stops[0].accent}; }
  }
`}></style>
```

## Usage

```astro
<ScrollColorShift stops={[
  { bg: "#0A0A0A", fg: "#F5F5F5", accent: "#E8B04A" },
  { bg: "#151B26", fg: "#E8ECF1", accent: "#7BA7D9" },
  { bg: "#2A1C14", fg: "#F5E6D6", accent: "#C88A5D" },
  { bg: "#0A0A0A", fg: "#F5F5F5", accent: "#E8B04A" },
]}>
  <section class="min-h-screen">Chapter one content</section>
  <section class="min-h-screen">Chapter two content</section>
  <section class="min-h-screen">Chapter three content</section>
  <section class="min-h-screen">Outro (back to opening colour)</section>
</ScrollColorShift>
```

## Props

| Prop | Type | Notes |
|---|---|---|
| `stops` | `{ bg; fg; accent }[]` | 3–4 colour stops. First colour is the initial state. |

## Notes

- `animation-timeline: scroll(nearest)` ties the animation to the nearest scrollable ancestor — usually the document. Use `scroll(root)` if the wrapper is the scroll container itself.
- `@property` registration is load-bearing: without it, colours would swap instead of interpolating.
- Keep the first and last stop related so the transition between the last section and whatever follows doesn't jar.
