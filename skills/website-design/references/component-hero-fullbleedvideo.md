# FullBleedVideoHero — `.astro`

Full-viewport looping video with headline overlay. Native `<video>`, muted + autoplay + playsinline + loop, MP4 + WebM sources, with a mandatory `poster` image that serves as LCP and the reduced-motion fallback.

## Dimensional fit

- surface-depth: dark (default) — overlays read better on dark footage
- motion-register: moderate, expressive
- texture-appetite: low, medium
- type-personality: any
- notes: Never use for hospitality/property — a still photograph reads more considered. Good for agency showcase, product demo, studio reel.

## File

### `src/components/sections/FullBleedVideoHero.astro`

```astro
---
import HeroButton from "../ui/HeroButton.astro";

interface Props {
  poster: { src: string; alt: string };
  sources: { mp4: string; webm?: string };
  eyebrow?: string;
  headline: string;
  sub?: string;
  cta: { label: string; href: string };
}
const { poster, sources, eyebrow, headline, sub, cta } = Astro.props;
---
<section class="fb-video">
  <video
    class="fb-video__bg"
    autoplay
    muted
    loop
    playsinline
    preload="metadata"
    poster={poster.src}
    aria-label={poster.alt}
  >
    {sources.webm && <source src={sources.webm} type="video/webm" />}
    <source src={sources.mp4} type="video/mp4" />
  </video>

  <div class="fb-video__scrim"></div>

  <div class="fb-video__inner">
    {eyebrow && <p class="fb-video__eyebrow" data-i="0">{eyebrow}</p>}
    <h1 class="fb-video__headline" data-i="1">{headline}</h1>
    {sub && <p class="fb-video__sub" data-i="2">{sub}</p>}
    <div class="fb-video__cta" data-i="3">
      <HeroButton href={cta.href}>{cta.label}</HeroButton>
    </div>
  </div>
</section>

<style>
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
</style>
```

## Usage

```astro
<FullBleedVideoHero
  poster={{ src: "/reel-poster.jpg", alt: "Studio workshop in morning light" }}
  sources={{ mp4: "/reel.mp4", webm: "/reel.webm" }}
  eyebrow="Brook · Studio"
  headline="We make the things clients remember."
  sub="A small studio shipping identity, product, and film for founders."
  cta={{ label: "Start a project", href: "/contact" }}
/>
```

## Rules

- Video must be muted + playsinline for autoplay on iOS.
- Provide both MP4 and WebM where possible.
- Keep file size under 4MB; preload="metadata" not "auto".
- Reduced-motion users see only the poster image — set `--poster-fallback: url(…)` at the section level if you want it to appear.

## Dimensional adaptation

- Editorial / restrained → don't use this component; pick FullBleedImageHero instead.
- Technical → frame the video inside a laptop/device mockup rather than bleeding to edges.
