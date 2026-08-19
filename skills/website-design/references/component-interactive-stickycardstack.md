# StickyCardStack — `.astro`

Full-height cards that pin and stack as the user scrolls. The underlying card scales down and blurs while the next one reveals, creating a layered cinematic reveal. Pure CSS — `position: sticky` for the pin + `animation-timeline: view()` for the scale/blur.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low / medium
- type-personality: any
- notes: Budget-heavy — counts as a high-motion technique. One per page max.

## File

### `src/components/sections/StickyCardStack.astro`

```astro
---
interface Card {
  eyebrow: string;
  heading: string;
  body: string;
  media?: string;     // image url
  accent?: string;
}
interface Props {
  cards: Card[];
  class?: string;
}
const { cards, class: className = "" } = Astro.props;
---
<section class:list={["scs-section", className]}>
  {cards.map((c, i) => (
    <article class="scs-card" style={`--i: ${i}; --total: ${cards.length};`}>
      <div class="scs-card__inner" style={c.accent ? `--accent: ${c.accent}` : undefined}>
        <p class="scs-card__eyebrow">{c.eyebrow}</p>
        <h3 class="scs-card__heading">{c.heading}</h3>
        <p class="scs-card__body">{c.body}</p>
        {c.media && <img src={c.media} alt="" width="1200" height="800" />}
      </div>
    </article>
  ))}
</section>

<style>
  .scs-section {
    display: grid;
    gap: 2rem;
    padding-bottom: 20vh;
  }
  .scs-card {
    position: sticky;
    top: calc(10vh + (var(--i) * 1.25rem));
    min-height: 70vh;
    display: grid;
    place-items: center;
    animation: scs-scale linear both;
    animation-timeline: view();
    animation-range: exit 0% exit 100%;
  }
  @keyframes scs-scale {
    to {
      scale: calc(1 - 0.04 * var(--total));
      filter: blur(4px);
      opacity: 0.4;
    }
  }
  .scs-card__inner {
    width: min(90%, 56rem);
    padding: 3rem;
    border-radius: 1.5rem;
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
    color: var(--color-primary);
    box-shadow: 0 40px 120px -40px rgb(0 0 0 / 0.25);
  }
  .scs-card__eyebrow {
    font-size: 0.75rem;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    color: var(--accent, var(--color-accent));
  }
  .scs-card__heading {
    font-family: var(--font-display);
    font-size: clamp(2rem, 4vw, 3.5rem);
    letter-spacing: -0.02em;
    margin-top: 0.75rem;
  }
  .scs-card__body {
    margin-top: 1rem;
    max-width: 58ch;
    color: var(--color-secondary);
  }
  .scs-card__inner img {
    margin-top: 2rem;
    width: 100%;
    border-radius: 1rem;
  }

  @media (prefers-reduced-motion: reduce) {
    .scs-card { position: static; animation: none; min-height: 0; }
  }
</style>
```

## Usage

```astro
<StickyCardStack cards={[
  { eyebrow: "01 · Discover", heading: "We start by listening.", body: "Half the project is understanding what you're really solving for. We interview, audit, and write a plain-language brief before pixel one." },
  { eyebrow: "02 · Shape", heading: "Structure before polish.", body: "Low-fidelity wireflow and prose. Only when the shape is agreed do we move to visual direction." },
  { eyebrow: "03 · Ship", heading: "Quiet launches, loud outcomes.", body: "We ship behind feature flags, measure, and iterate. Launch weeks are un-dramatic by design." },
]} />
```

## Props

| Prop | Type | Notes |
|---|---|---|
| `cards` | `Card[]` | Typically 3–4 cards. Each has eyebrow, heading, body, optional media and accent |

## Notes

- 3–4 cards is the sweet spot. Fewer than 3 wastes the mechanism; more than 4 overwhelms.
- If the direction's motion register is restrained, downgrade to a plain `AccordionProcess` or numbered list.
- Because the whole page scrolls within this stack, place it away from other sticky elements.
