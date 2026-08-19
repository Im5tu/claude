# Manifesto — `.astro`

A philosophy-led section: a short power statement (one to three sentences) revealed word-by-word as the reader scrolls to it. Uses the shared `TextReveal` primitive from `core-animation.md`.

## Dimensional fit

- surface-depth: dark (strongest), light possible
- motion-register: moderate, expressive (TextReveal animation IS the presence)
- texture-appetite: any
- type-personality: editorial-display, humanist-serif
- notes: Only include when philosophy IS the competitive edge. Every site does not need a manifesto — avoid the template marker.

## File

### `src/components/sections/Manifesto.astro`

```astro
---
import TextReveal from "../ui/TextReveal.astro";

interface Props {
  kicker?: string;
  statement: string;
  attribution?: string;
  tone?: "dark" | "light";
}
const { kicker, statement, attribution, tone = "dark" } = Astro.props;
---
<section class:list={["mf", `mf--${tone}`]}>
  <div class="mf__inner">
    {kicker && <p class="mf__kicker">{kicker}</p>}
    <p class="mf__statement">
      <TextReveal text={statement} stagger={70} />
    </p>
    {attribution && <p class="mf__attr">{attribution}</p>}
  </div>
</section>

<style>
  .mf {
    padding: 8rem 1.5rem;
  }
  .mf--dark {
    background: var(--color-surface-dark, #0A0A0A);
    color: var(--color-primary-on-dark, #F5F5F5);
  }
  .mf--light {
    background: var(--color-surface-secondary);
    color: var(--color-primary);
  }
  .mf__inner {
    max-width: 56rem;
    margin: 0 auto;
    text-align: center;
  }
  .mf__kicker {
    font-family: var(--font-mono);
    font-size: 0.75rem; letter-spacing: 0.2em; text-transform: uppercase;
    color: var(--color-accent);
    margin-bottom: 2rem;
  }
  .mf__statement {
    font-family: var(--font-display);
    font-size: clamp(2rem, 4.5vw, 3.5rem);
    line-height: 1.15;
    letter-spacing: -0.02em;
    margin: 0;
    text-wrap: balance;
  }
  .mf__attr {
    margin-top: 2.5rem;
    font-family: var(--font-mono);
    font-size: 0.75rem;
    letter-spacing: 0.14em;
    text-transform: uppercase;
    opacity: 0.6;
  }
</style>
```

## Usage

```astro
<Manifesto
  kicker="Our belief"
  statement="Quiet software, loud outcomes. We'd rather ship Tuesday than announce Monday."
  attribution="— The studio, since 2015"
  tone="dark"
/>
```

## Rules

- Statement must be short — one to three sentences. More reads as copy, not philosophy.
- TextReveal must be used (CSS per-word animation from `core-animation.md`). A static paragraph here is a banned pattern.
