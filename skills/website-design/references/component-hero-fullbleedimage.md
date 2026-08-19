# FullBleedImageHero

Full-viewport photograph with headline overlay. Tall, imagery-forward, register-setting. Entrance on load via CSS.

## Dimensional fit

- surface-depth: any
- motion-register: any (imagery does most of the work)
- texture-appetite: medium, high
- type-personality: humanist-serif, editorial-display
- notes: Image must be real and intentional. Generic stock undermines everything. Keywords from direction card × brand domain.

## Structure

- `<section class="fb-image fb-image--<overlay>">` full-viewport, relative, overflow hidden; text pinned bottom-left via `place-items: end start`; overlay variant is `dark`, `light`, or `gradient` (default gradient)
  - `<img class="fb-image__bg">` absolutely positioned cover image, 2400x1600 intrinsic size, `loading="eager"`, `fetchpriority="high"`, meaningful alt text
  - `.fb-image__scrim` absolutely positioned overlay layer between image and text
  - `.fb-image__inner` text block (z-index 2), max-width 80rem
    - `<p class="fb-image__eyebrow">` optional eyebrow, `data-i="0"`
    - `<h1 class="fb-image__headline">` headline, `data-i="1"`
    - `<p class="fb-image__sub">` optional supporting paragraph, `data-i="2"`
    - `.fb-image__cta` single CTA, `data-i="3"`

The CTA uses the HeroButton variant of the Button spec from component-chrome-button.md.

## CSS

```css
.fb-image {
  position: relative;
  min-height: 92vh;
  display: grid;
  place-items: end start;
  overflow: hidden;
  color: white;
}
.fb-image__bg {
  position: absolute;
  inset: 0;
  width: 100%; height: 100%;
  object-fit: cover;
  z-index: 0;
}
.fb-image__scrim {
  position: absolute; inset: 0; z-index: 1;
}
.fb-image--dark .fb-image__scrim { background: rgb(0 0 0 / 0.42); }
.fb-image--light .fb-image__scrim { background: rgb(255 255 255 / 0.35); }
.fb-image--gradient .fb-image__scrim {
  background: linear-gradient(180deg, transparent 30%, rgb(0 0 0 / 0.55) 85%);
}
.fb-image__inner {
  position: relative;
  z-index: 2;
  max-width: 80rem;
  width: 100%;
  padding: 3rem 1.5rem;
  margin: 0 auto;
}
.fb-image__eyebrow {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
  opacity: 0.75;
}
.fb-image__headline {
  font-family: var(--font-display);
  font-size: clamp(3rem, 8vw, 6.5rem);
  line-height: 0.96;
  letter-spacing: -0.03em;
  margin-top: 1rem;
  max-width: 18ch;
  text-wrap: balance;
}
.fb-image__sub {
  max-width: 48ch;
  margin-top: 1.25rem;
  opacity: 0.85;
}
.fb-image__cta { margin-top: 2rem; }

/* load-time entrance */
[data-i] {
  opacity: 0; translate: 0 16px;
  animation: fbi-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
  animation-delay: calc(var(--d, 0) * 120ms);
}
[data-i="0"] { --d: 0; } [data-i="1"] { --d: 1; }
[data-i="2"] { --d: 2; } [data-i="3"] { --d: 3; }
@keyframes fbi-in { to { opacity: 1; translate: 0 0; } }
@media (prefers-reduced-motion: reduce) {
  [data-i] { animation: none; opacity: 1; translate: 0 0; }
}
```

## Notes

- Content slots: image (src + alt), optional eyebrow, headline, optional sub paragraph, one CTA (label + href), overlay variant.
- Dimensional adaptation:
  - Restrained: use the `dark` overlay at 30% opacity for uniform calm.
  - Expressive: remove the scrim; rely on colour contrast in the photo.
  - Technical: do NOT use this hero; imagery-forward hero is a poor fit for technical registers.
