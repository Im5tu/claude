# GradientMeshHero — `.astro`

Hero layered over the `GradientMesh` background. The mesh carries atmosphere; the headline carries the message. Pure `.astro`.

## Dimensional fit

- surface-depth: dark (default), light (pale tints)
- motion-register: moderate, expressive (the mesh movement is the motion)
- texture-appetite: low
- type-personality: geometric-sans, editorial-display
- notes: Do NOT combine with FullBleedVideoHero or FullBleedImageHero — one atmospheric hero per page.

## File

### `src/components/sections/GradientMeshHero.astro`

```astro
---
import GradientMesh from "./GradientMesh.astro";
import HeroButton from "../ui/HeroButton.astro";
import Button from "../ui/Button.astro";

interface Props {
  eyebrow?: string;
  headline: string;
  sub: string;
  primary: { label: string; href: string };
  secondary?: { label: string; href: string };
  meshColors?: { a: string; b: string; c: string };
}
const { eyebrow, headline, sub, primary, secondary, meshColors } = Astro.props;
---
<section class="gmh">
  <GradientMesh
    colorA={meshColors?.a}
    colorB={meshColors?.b}
    colorC={meshColors?.c}
  />
  <div class="gmh__inner">
    {eyebrow && <p class="gmh__eyebrow" data-i="0">{eyebrow}</p>}
    <h1 class="gmh__headline" data-i="1">{headline}</h1>
    <p class="gmh__sub" data-i="2">{sub}</p>
    <div class="gmh__cta" data-i="3">
      <HeroButton href={primary.href}>{primary.label}</HeroButton>
      {secondary && <Button variant="ghost" as="a" href={secondary.href}>{secondary.label}</Button>}
    </div>
  </div>
</section>

<style>
  .gmh {
    position: relative;
    min-height: 88vh;
    display: grid;
    place-items: center;
    padding: 7rem 1.5rem 4rem;
    overflow: hidden;
    background: var(--color-surface-dark, #0A0A0A);
    color: var(--color-primary-on-dark, #F5F5F5);
  }
  .gmh__inner {
    position: relative; z-index: 2;
    max-width: 64rem; text-align: center;
  }
  .gmh__eyebrow {
    font-family: var(--font-mono);
    font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
    color: var(--color-accent);
  }
  .gmh__headline {
    font-family: var(--font-display);
    font-size: clamp(3rem, 7.5vw, 6rem);
    line-height: 0.96;
    letter-spacing: -0.03em;
    margin-top: 1.25rem;
    text-wrap: balance;
  }
  .gmh__sub {
    max-width: 52ch;
    margin: 1.5rem auto 0;
    opacity: 0.82;
  }
  .gmh__cta { display: inline-flex; flex-wrap: wrap; gap: 0.75rem; margin-top: 2rem; justify-content: center; }

  [data-i] {
    opacity: 0; translate: 0 16px;
    animation: gmh-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--d, 0) * 120ms);
  }
  [data-i="0"] { --d: 0; } [data-i="1"] { --d: 1; }
  [data-i="2"] { --d: 2; } [data-i="3"] { --d: 3; }
  @keyframes gmh-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    [data-i] { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<GradientMeshHero
  eyebrow="Halcyon · Infrastructure"
  headline="Boring, by engineering."
  sub="We operate the parts of your stack that you want to forget exist. No dashboards, no status pages, no drama."
  primary={{ label: "See the approach", href: "/how" }}
  secondary={{ label: "Talk to an engineer", href: "/contact" }}
/>
```
