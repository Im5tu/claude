# CenteredHero — `.astro`

Centred headline + supporting paragraph + CTAs, with optional visual element below the fold. Classic, flexible, works across most registers. Pure `.astro`, entrance via CSS staggered `@keyframes`.

## Dimensional fit

- surface-depth: any
- motion-register: moderate (default), restrained possible with shorter durations
- texture-appetite: low, medium
- type-personality: any
- notes: Safer than TypeHero. If you need to communicate quickly without pushing register, pick this.

## File

### `src/components/sections/CenteredHero.astro`

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
}
const { eyebrow, headline, sub, primary, secondary } = Astro.props;
---
<section class="ch">
  <div class="ch__inner">
    {eyebrow && <p class="ch__eyebrow" data-i="0">{eyebrow}</p>}
    <h1 class="ch__headline" data-i="1">{headline}</h1>
    <p class="ch__sub" data-i="2">{sub}</p>
    <div class="ch__cta" data-i="3">
      <HeroButton href={primary.href}>{primary.label}</HeroButton>
      {secondary && <Button variant="ghost" as="a" href={secondary.href}>{secondary.label}</Button>}
    </div>
  </div>
</section>

<style>
  .ch {
    min-height: 78vh;
    display: grid;
    place-items: center;
    padding: 7rem 1.5rem 4rem;
    text-align: center;
  }
  .ch__inner { max-width: 56rem; margin: 0 auto; }
  .ch__eyebrow {
    font-family: var(--font-mono);
    font-size: 0.75rem;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: var(--color-accent);
  }
  .ch__headline {
    font-family: var(--font-display);
    font-size: clamp(2.75rem, 6vw, 5rem);
    line-height: 1;
    letter-spacing: -0.03em;
    margin-top: 1.25rem;
  }
  .ch__sub {
    max-width: 52ch;
    margin: 1.5rem auto 0;
    color: var(--color-secondary);
    font-size: clamp(1rem, 1.3vw, 1.125rem);
  }
  .ch__cta {
    display: inline-flex;
    flex-wrap: wrap;
    gap: 0.75rem;
    margin-top: 2rem;
    justify-content: center;
  }

  [data-i] {
    opacity: 0;
    translate: 0 16px;
    animation: ch-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--d, 0) * 120ms);
  }
  [data-i="0"] { --d: 0; }
  [data-i="1"] { --d: 1; }
  [data-i="2"] { --d: 2; }
  [data-i="3"] { --d: 3; }
  @keyframes ch-in {
    to { opacity: 1; translate: 0 0; }
  }
  @media (prefers-reduced-motion: reduce) {
    [data-i] { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<CenteredHero
  eyebrow="For product-led teams"
  headline="Ship infrastructure that gets out of the way."
  sub="We design and run the parts of your stack that should be invisible — auth, billing, observability — so your team ships the parts that aren't."
  primary={{ label: "Book a consultation", href: "/contact" }}
  secondary={{ label: "See case studies", href: "/work" }}
/>
```

## Dimensional adaptation

- Restrained → drop stagger delays to 80ms, reduce translate to 12px.
- Expressive → raise `font-size` to 7vw, add a subtle `text-wrap: balance`.
- Technical → swap eyebrow to monospace status-line ("v2.0 · shipped Q1 2026").
