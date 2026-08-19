# FullBleedImageHero — `.astro`

Full-viewport photograph with headline overlay. Tall, imagery-forward, register-setting. Pure `.astro`; entrance on load via CSS.

## Dimensional fit

- surface-depth: any
- motion-register: any (imagery does most of the work)
- texture-appetite: medium, high
- type-personality: humanist-serif, editorial-display
- notes: Image must be real and intentional. Generic stock undermines everything. Keywords from direction card × brand domain.

## File

### `src/components/sections/FullBleedImageHero.astro`

```astro
---
import HeroButton from "../ui/HeroButton.astro";

interface Props {
  image: { src: string; alt: string; };
  eyebrow?: string;
  headline: string;
  sub?: string;
  cta: { label: string; href: string };
  overlay?: "dark" | "light" | "gradient";
}
const {
  image, eyebrow, headline, sub, cta, overlay = "gradient",
} = Astro.props;
---
<section class:list={["fb-image", `fb-image--${overlay}`]}>
  <img class="fb-image__bg" src={image.src} alt={image.alt} width="2400" height="1600" loading="eager" fetchpriority="high" />
  <div class="fb-image__scrim"></div>
  <div class="fb-image__inner">
    {eyebrow && <p class="fb-image__eyebrow" data-i="0">{eyebrow}</p>}
    <h1 class="fb-image__headline" data-i="1">{headline}</h1>
    {sub && <p class="fb-image__sub" data-i="2">{sub}</p>}
    <div class="fb-image__cta" data-i="3">
      <HeroButton href={cta.href}>{cta.label}</HeroButton>
    </div>
  </div>
</section>

<style>
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
</style>
```

## Usage

```astro
<FullBleedImageHero
  image={{
    src: "https://images.unsplash.com/photo-1505142468610-359e7d316be0?w=2400&q=80",
    alt: "A weathered fishing cabin in morning light on the west coast"
  }}
  eyebrow="Est. 1972"
  headline="Ardnamurchan — stays that stay with you."
  sub="Eight cabins on the loch. Booked direct. No keyboxes."
  cta={{ label: "Check availability", href: "/book" }}
  overlay="gradient"
/>
```

## Dimensional adaptation

- Restrained → use `overlay="dark"` at 30% opacity for uniform calm.
- Expressive → remove the scrim; rely on colour contrast in the photo.
- Technical → do NOT use this hero; imagery-forward hero is a poor fit for technical registers.
