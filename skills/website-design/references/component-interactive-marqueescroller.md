# MarqueeScroller — `.astro`

Continuously scrolling horizontal ticker. Pure CSS, no JS, no GSAP. Duplicates the inner track so the loop is seamless.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive (not restrained)
- texture-appetite: any
- type-personality: editorial-display for statement marquees; any for logo strips
- notes: Two common uses — display-type statement ("Independent · since 2015 · ") and logo strips.

## File

### `src/components/sections/MarqueeScroller.astro`

```astro
---
interface Props {
  direction?: "left" | "right";
  duration?: number;     // seconds for one full loop
  pauseOnHover?: boolean;
  class?: string;
}
const {
  direction = "left",
  duration = 40,
  pauseOnHover = false,
  class: className = "",
} = Astro.props;
---
<div class:list={["marquee", className]} style={`--dur: ${duration}s;`} data-dir={direction} data-pause-hover={pauseOnHover}>
  <div class="marquee__track">
    <div class="marquee__group"><slot /></div>
    <div class="marquee__group" aria-hidden="true"><slot /></div>
  </div>
</div>

<style>
  .marquee {
    overflow: hidden;
    mask-image: linear-gradient(90deg, transparent, black 10%, black 90%, transparent);
  }
  .marquee__track {
    display: flex;
    width: max-content;
    animation: marquee-left var(--dur, 40s) linear infinite;
  }
  .marquee[data-dir="right"] .marquee__track { animation-name: marquee-right; }
  .marquee[data-pause-hover="true"]:hover .marquee__track { animation-play-state: paused; }
  .marquee__group {
    display: flex;
    align-items: center;
    gap: 3rem;
    padding-right: 3rem;
    flex-shrink: 0;
  }

  @keyframes marquee-left {
    from { translate: 0 0; }
    to   { translate: -50% 0; }
  }
  @keyframes marquee-right {
    from { translate: -50% 0; }
    to   { translate: 0 0; }
  }

  @media (prefers-reduced-motion: reduce) {
    .marquee__track { animation: none; }
  }
</style>
```

## Usage

Statement marquee:

```astro
<MarqueeScroller duration={30}>
  <span class="text-8xl font-display tracking-tight">Independent · since 2015 ·</span>
</MarqueeScroller>
```

Logo strip:

```astro
<MarqueeScroller duration={50}>
  <img src="/logos/apex.svg" alt="Apex" height="32" />
  <img src="/logos/meridian.svg" alt="Meridian" height="32" />
  <img src="/logos/atlas.svg" alt="Atlas" height="32" />
  <img src="/logos/halcyon.svg" alt="Halcyon" height="32" />
</MarqueeScroller>
```

## Props

| Prop | Type | Default | Notes |
|---|---|---|---|
| `direction` | `"left" \| "right"` | `"left"` | |
| `duration` | `number` | `40` | Seconds per full loop |
| `pauseOnHover` | `boolean` | `false` | Respect mobile — pause doesn't apply on touch |

## Notes

- Group duplication is required for a seamless loop — never render just one group.
- The mask-image fade prevents harsh clipping at the edges.
- Logo images must be real SVG/PNG — plain text company names are banned by `core-anti-patterns.md`.
