# TypeHero — `.astro`

Typography IS the visual. Massive display headline, often spanning 2–3 lines, with a single CTA beneath. No background image, no mesh, no video. The type carries the entire hero.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: any
- type-personality: editorial-display (strongest), humanist-serif with dramatic weight contrast, geometric-sans at extreme size
- notes: The strongest choice for anti-establishment, editorial, and bold-expressive registers. Do NOT add a background image.

## File

### `src/components/sections/TypeHero.astro`

```astro
---
import TextReveal from "../ui/TextReveal.astro";
import HeroButton from "../ui/HeroButton.astro";

interface Props {
  eyebrow?: string;
  headline: string;        // use "/" or "\n" as a line break if desired
  sub?: string;
  cta: { label: string; href: string };
}
const { eyebrow, headline, sub, cta } = Astro.props;
---
<section class="type-hero">
  <div class="type-hero__inner">
    {eyebrow && <p class="type-hero__eyebrow">{eyebrow}</p>}
    <h1 class="type-hero__headline">
      <TextReveal text={headline} stagger={70} />
    </h1>
    {sub && <p class="type-hero__sub">{sub}</p>}
    <div class="type-hero__cta">
      <HeroButton href={cta.href}>{cta.label}</HeroButton>
    </div>
  </div>
</section>

<style>
  .type-hero {
    min-height: 88vh;
    display: grid;
    place-items: center;
    padding: 8rem 1.5rem 4rem;
  }
  .type-hero__inner { max-width: 72rem; margin: 0 auto; }
  .type-hero__eyebrow {
    font-family: var(--font-mono);
    font-size: 0.75rem;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: var(--color-accent);
    opacity: 0;
    animation: fade-in 500ms cubic-bezier(0.2, 0.8, 0.2, 1) 50ms forwards;
  }
  .type-hero__headline {
    font-family: var(--font-display);
    font-size: clamp(3.5rem, 10vw, 9rem);
    line-height: 0.92;
    letter-spacing: -0.03em;
    margin-top: 1.5rem;
  }
  .type-hero__sub {
    max-width: 46ch;
    margin-top: 2rem;
    font-size: clamp(1rem, 1.6vw, 1.25rem);
    color: var(--color-secondary);
    opacity: 0;
    animation: fade-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) 700ms forwards;
  }
  .type-hero__cta {
    margin-top: 2.5rem;
    opacity: 0;
    animation: fade-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) 900ms forwards;
  }
  @keyframes fade-in {
    to { opacity: 1; translate: 0 0; }
  }
  @media (prefers-reduced-motion: reduce) {
    .type-hero__eyebrow, .type-hero__sub, .type-hero__cta {
      animation: none; opacity: 1;
    }
  }
</style>
```

## Usage

```astro
<TypeHero
  eyebrow="Est. 2015"
  headline="We build the quiet part."
  sub="An independent product studio for teams that would rather ship than pitch."
  cta={{ label: "Start a project", href: "/contact" }}
/>
```

## Dimensional adaptation

- Restrained + editorial → use a humanist serif with heavy weight contrast (mix light italic + heavy upright).
- Expressive → push `font-size` to `11vw`, raise `letter-spacing` to `-0.04em`.
- Dark surface → invert colours; let the eyebrow accent glow against black.
