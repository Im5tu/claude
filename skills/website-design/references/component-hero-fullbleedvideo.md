# FullBleedVideoHero

Full-viewport looping video with headline overlay. Native `<video>`, muted + autoplay + playsinline + loop, MP4 + WebM sources, with a mandatory `poster` image that serves as LCP and the reduced-motion fallback.

## Dimensional fit

- surface-depth: dark (default) — overlays read better on dark footage
- motion-register: moderate, expressive
- texture-appetite: low, medium
- type-personality: any
- notes: Never use for hospitality/property — a still photograph reads more considered. Good for agency showcase, product demo, studio reel.

## Structure

- `<section class="fb-video">` full-viewport, relative, overflow hidden; text pinned bottom-left via `place-items: end start`
  - `<video class="fb-video__bg">` absolutely positioned cover video with `autoplay muted loop playsinline preload="metadata"`, a mandatory `poster`, an `aria-label` describing the footage, and `<source>` children (WebM first when available, then MP4)
  - `.fb-video__scrim` absolutely positioned gradient overlay between video and text
  - `.fb-video__inner` text block (z-index 2), max-width 80rem
    - `<p class="fb-video__eyebrow">` optional eyebrow, `data-i="0"`
    - `<h1 class="fb-video__headline">` headline, `data-i="1"`
    - `<p class="fb-video__sub">` optional supporting paragraph, `data-i="2"`
    - `.fb-video__cta` single CTA, `data-i="3"`

The CTA uses the HeroButton variant of the Button spec from component-chrome-button.md.

## CSS

```css
.fb-video {
  position: relative;
  min-height: 92vh;
  display: grid;
  place-items: end start;
  overflow: hidden;
  color: white;
}
.fb-video__bg {
  position: absolute; inset: 0;
  width: 100%; height: 100%;
  object-fit: cover;
  z-index: 0;
}
.fb-video__scrim {
  position: absolute; inset: 0; z-index: 1;
  background: linear-gradient(180deg, rgb(0 0 0 / 0.15) 0%, rgb(0 0 0 / 0.55) 100%);
}
.fb-video__inner {
  position: relative; z-index: 2;
  max-width: 80rem; width: 100%;
  padding: 3rem 1.5rem; margin: 0 auto;
}
.fb-video__eyebrow {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
  opacity: 0.75;
}
.fb-video__headline {
  font-family: var(--font-display);
  font-size: clamp(3rem, 8vw, 6.5rem);
  line-height: 0.96;
  letter-spacing: -0.03em;
  margin-top: 1rem;
  max-width: 18ch;
  text-wrap: balance;
}
.fb-video__sub { max-width: 48ch; margin-top: 1.25rem; opacity: 0.85; }
.fb-video__cta { margin-top: 2rem; }

/* load-time entrance */
[data-i] {
  opacity: 0; translate: 0 16px;
  animation: fbv-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
  animation-delay: calc(var(--d, 0) * 120ms);
}
[data-i="0"] { --d: 0; } [data-i="1"] { --d: 1; }
[data-i="2"] { --d: 2; } [data-i="3"] { --d: 3; }
@keyframes fbv-in { to { opacity: 1; translate: 0 0; } }

@media (prefers-reduced-motion: reduce) {
  .fb-video__bg { display: none; }
  .fb-video::before {
    content: "";
    position: absolute; inset: 0; z-index: 0;
    background-image: var(--poster-fallback, none);
    background-size: cover; background-position: center;
  }
  [data-i] { animation: none; opacity: 1; translate: 0 0; }
}
```

## Notes

- Content slots: poster (src + alt), video sources (mp4 required, webm optional), optional eyebrow, headline, optional sub paragraph, one CTA (label + href).
- Video must be muted + playsinline for autoplay on iOS.
- Provide both MP4 and WebM where possible.
- Keep file size under 4MB; `preload="metadata"`, not `"auto"`.
- Reduced-motion users see only the poster image — set `--poster-fallback: url(…)` at the section level so it appears.
- Dimensional adaptation:
  - Editorial / restrained: don't use this component; pick FullBleedImageHero instead.
  - Technical: frame the video inside a laptop/device mockup rather than bleeding to edges.
