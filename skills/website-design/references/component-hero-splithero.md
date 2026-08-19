# SplitHero — `.astro`

Text left, image/visual right. Classic B2B / advisory / service hero. Workhorse for establishment + restrained directions. Pure `.astro`.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, geometric-sans
- notes: Image should be real, not a generic stock laptop-on-desk. Use the direction's image mood keywords.

## File

### `src/components/sections/SplitHero.astro`

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
  image: { src: string; alt: string; };
}
const { eyebrow, headline, sub, primary, secondary, image } = Astro.props;
---
<section class="split">
  <div class="split__text">
    {eyebrow && <p class="split__eyebrow" data-i="0">{eyebrow}</p>}
    <h1 class="split__headline" data-i="1">{headline}</h1>
    <p class="split__sub" data-i="2">{sub}</p>
    <div class="split__cta" data-i="3">
      <HeroButton href={primary.href}>{primary.label}</HeroButton>
      {secondary && <Button variant="ghost" as="a" href={secondary.href}>{secondary.label}</Button>}
    </div>
  </div>
  <div class="split__visual" data-i="4">
    <img src={image.src} alt={image.alt} width="1200" height="1400" loading="eager" />
  </div>
</section>

<style>
  .split {
    display: grid;
    grid-template-columns: 1fr;
    gap: 3rem;
    max-width: 80rem;
    margin: 0 auto;
    padding: 6rem 1.5rem 3rem;
    min-height: 80vh;
    align-items: center;
  }
  @media (min-width: 1024px) {
    .split { grid-template-columns: 7fr 5fr; gap: 5rem; }
  }
  .split__eyebrow {
    font-family: var(--font-mono);
    font-size: 0.75rem;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: var(--color-accent);
  }
  .split__headline {
    font-family: var(--font-display);
    font-size: clamp(2.75rem, 6vw, 4.5rem);
    line-height: 1;
    letter-spacing: -0.03em;
    margin-top: 1.25rem;
    max-width: 18ch;
    text-wrap: balance;
  }
  .split__sub {
    max-width: 54ch;
    margin-top: 1.5rem;
    color: var(--color-secondary);
    font-size: clamp(1rem, 1.3vw, 1.125rem);
  }
  .split__cta { display: inline-flex; flex-wrap: wrap; gap: 0.75rem; margin-top: 2rem; }
  .split__visual img {
    width: 100%;
    height: auto;
    aspect-ratio: 4 / 5;
    object-fit: cover;
    border-radius: 1.5rem;
  }

  [data-i] {
    opacity: 0; translate: 0 16px;
    animation: split-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--d, 0) * 120ms);
  }
  [data-i="0"] { --d: 0; } [data-i="1"] { --d: 1; }
  [data-i="2"] { --d: 2; } [data-i="3"] { --d: 3; } [data-i="4"] { --d: 1; }
  @keyframes split-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    [data-i] { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<SplitHero
  eyebrow="Independent wealth advisory"
  headline="Quiet counsel for founders after exit."
  sub="We help technology founders and their families navigate concentrated wealth with discretion, long horizons, and zero commission."
  primary={{ label: "Request an introduction", href: "/contact" }}
  secondary={{ label: "How we work", href: "/approach" }}
  image={{
    src: "https://images.unsplash.com/photo-1508919801845-fc2ae1bc2a28?w=1200&q=80",
    alt: "Hands holding an open ledger in soft light",
  }}
/>
```

## Dimensional adaptation

- Establishment → use a square or 4:5 portrait. Softer tonal range.
- Technical → swap photo for a CLI/UI screenshot inside a subtle device frame.
- Texture-high → add a noise overlay layer atop the image.
