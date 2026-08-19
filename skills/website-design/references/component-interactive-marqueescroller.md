# MarqueeScroller

Continuously scrolling horizontal ticker. Pure CSS, no JS. The inner track holds two identical groups so the loop is seamless.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive (not restrained)
- texture-appetite: any
- type-personality: editorial-display for statement marquees; any for logo strips
- notes: Two common uses — display-type statement ("Independent · since 2015 · ") and logo strips.

## Structure

- `.marquee` wrapper (overflow hidden, edge fade mask); optional attributes `data-dir="left|right"` (default left) and `data-pause-hover="true|false"` (default false); loop duration set via `--dur` custom property (default 40s)
  - `.marquee__track` flex row, width max-content
    - `.marquee__group` with the real content (text span or logo `<img>` elements)
    - a second `.marquee__group` that duplicates the first, `aria-hidden="true"`

Content examples:

- Statement marquee: one large display-type span, e.g. font-size 6rem, tight tracking, `--dur: 30s`.
- Logo strip: 4+ logo images at a fixed height (32px), `--dur: 50s`.

## CSS

```css
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
```

## Notes

- Group duplication is required for a seamless loop — never render just one group.
- The mask-image fade prevents harsh clipping at the edges.
- Pause-on-hover does not apply on touch devices; keep the duration slow enough to read without it.
- Logo images must be real SVG/PNG — plain text company names are banned by `core-anti-patterns.md`.
