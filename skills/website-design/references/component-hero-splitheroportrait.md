# SplitHeroPortrait — `.astro`

Variant of SplitHero optimised for founder-led and personal-brand sites. Text left, 4:5 or 3:4 portrait photograph right. Identical structure to SplitHero with slightly different proportions and treatment.

## Dimensional fit

- surface-depth: light (default), dark possible with studio portrait
- motion-register: restrained, moderate
- texture-appetite: medium, high
- type-personality: humanist-serif, editorial-display
- notes: Portrait must be intentional — studio lighting, consistent with brand voice. A snapshot undercuts the rest of the site.

## File

### `src/components/sections/SplitHeroPortrait.astro`

```astro
---
import HeroButton from "../ui/HeroButton.astro";
import Button from "../ui/Button.astro";

interface Props {
  eyebrow?: string;
  headline: string;
  sub: string;
  primary: { label: string; href: string };
  secondary?: { label: string; href: string };
  portrait: { src: string; alt: string; };
  credit?: string;
}
const { eyebrow, headline, sub, primary, secondary, portrait, credit } = Astro.props;
---
<section class="shp">
  <div class="shp__text">
    {eyebrow && <p class="shp__eyebrow" data-i="0">{eyebrow}</p>}
    <h1 class="shp__headline" data-i="1">{headline}</h1>
    <p class="shp__sub" data-i="2">{sub}</p>
    <div class="shp__cta" data-i="3">
      <HeroButton href={primary.href}>{primary.label}</HeroButton>
      {secondary && <Button variant="ghost" as="a" href={secondary.href}>{secondary.label}</Button>}
    </div>
  </div>
  <figure class="shp__figure" data-i="4">
    <img src={portrait.src} alt={portrait.alt} width="900" height="1200" loading="eager" />
    {credit && <figcaption>{credit}</figcaption>}
  </figure>
</section>

<style>
  .shp {
    display: grid;
    grid-template-columns: 1fr;
    gap: 3rem;
    max-width: 80rem;
    margin: 0 auto;
    padding: 6rem 1.5rem 3rem;
    min-height: 82vh;
    align-items: center;
  }
  @media (min-width: 1024px) {
    .shp { grid-template-columns: 6fr 5fr; gap: 4rem; }
  }
  .shp__eyebrow {
    font-family: var(--font-mono);
    font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
    color: var(--color-accent);
  }
  .shp__headline {
    font-family: var(--font-display);
    font-size: clamp(2.5rem, 5.5vw, 4.25rem);
    line-height: 1.02;
    letter-spacing: -0.03em;
    margin-top: 1.25rem;
    max-width: 20ch;
    text-wrap: balance;
  }
  .shp__sub {
    max-width: 56ch;
    margin-top: 1.5rem;
    color: var(--color-secondary);
  }
  .shp__cta { display: inline-flex; flex-wrap: wrap; gap: 0.75rem; margin-top: 2rem; }

  .shp__figure { margin: 0; }
  .shp__figure img {
    width: 100%;
    aspect-ratio: 3 / 4;
    object-fit: cover;
    border-radius: 1rem;
    filter: saturate(0.95) contrast(1.03);
  }
  .shp__figure figcaption {
    margin-top: 0.75rem;
    font-size: 0.75rem;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    color: var(--color-secondary);
  }

  [data-i] {
    opacity: 0; translate: 0 16px;
    animation: shp-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--d, 0) * 120ms);
  }
  [data-i="0"] { --d: 0; } [data-i="1"] { --d: 1; }
  [data-i="2"] { --d: 2; } [data-i="3"] { --d: 3; } [data-i="4"] { --d: 1; }
  @keyframes shp-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    [data-i] { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<SplitHeroPortrait
  eyebrow="Principal"
  headline="Patricia Colenutt — advisor to independent founders."
  sub="Twenty years guiding founder-led companies through growth, recapitalisation, and succession. Based in Edinburgh. Work in small numbers."
  primary={{ label: "Request an introduction", href: "/contact" }}
  secondary={{ label: "Background", href: "/about" }}
  portrait={{ src: "/patricia.jpg", alt: "Patricia Colenutt in profile, natural light" }}
  credit="Photography — Anna Huix"
/>
```
