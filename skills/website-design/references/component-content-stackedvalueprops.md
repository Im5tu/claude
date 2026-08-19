# StackedValueProps — `.astro`

Three large stacked value propositions, each a section-height block with number, title, body, optional visual. Restrained, considered pacing. Entrance via `animation-timeline: view()`.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, editorial-display
- notes: 3 props exactly. More becomes repetitive. Each prop should earn its section.

## File

### `src/components/sections/StackedValueProps.astro`

```astro
---
interface Prop {
  number: string;       // "01", "02", "03" — static text, never animated
  title: string;
  body: string;
  media?: { src: string; alt: string };
}
interface Props {
  items: Prop[];        // exactly 3
  kicker?: string;
}
const { items, kicker } = Astro.props;
---
<section class="svp">
  {kicker && <p class="svp__kicker">{kicker}</p>}
  <ol class="svp__list">
    {items.map((p, i) => (
      <li class="svp__item" style={`--i: ${i};`}>
        <div class="svp__text">
          <p class="svp__num">{p.number}</p>
          <h3 class="svp__title">{p.title}</h3>
          <p class="svp__body">{p.body}</p>
        </div>
        {p.media && (
          <figure class="svp__media">
            <img src={p.media.src} alt={p.media.alt} width="1200" height="900" loading="lazy" />
          </figure>
        )}
      </li>
    ))}
  </ol>
</section>

<style>
  .svp { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
  .svp__kicker {
    font-family: var(--font-mono);
    font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
    color: var(--color-accent); margin-bottom: 3rem;
  }
  .svp__list { display: grid; gap: 5rem; padding: 0; list-style: none; }

  .svp__item {
    display: grid;
    grid-template-columns: 1fr;
    gap: 2rem;
    align-items: center;
    opacity: 0; translate: 0 18px;
    animation: svp-in 750ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  @media (min-width: 1024px) {
    .svp__item { grid-template-columns: 6fr 5fr; gap: 4rem; }
    .svp__item:nth-child(even) .svp__text { order: 2; }
  }

  .svp__num {
    font-family: var(--font-mono);
    font-size: 0.75rem; letter-spacing: 0.12em;
    color: var(--color-accent);
  }
  .svp__title {
    font-family: var(--font-display);
    font-size: clamp(2rem, 4vw, 3rem);
    letter-spacing: -0.02em;
    line-height: 1.02;
    margin-top: 0.5rem;
    max-width: 18ch;
    text-wrap: balance;
  }
  .svp__body {
    margin-top: 1rem;
    max-width: 56ch;
    color: var(--color-secondary);
  }
  .svp__media img {
    width: 100%; aspect-ratio: 4 / 3; object-fit: cover;
    border-radius: 1.25rem;
  }

  @keyframes svp-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .svp__item { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<StackedValueProps
  kicker="What we believe"
  items={[
    { number: "01", title: "Ship small, often.", body: "One deployable change per day beats one launch per quarter. We prefer boring Fridays." },
    { number: "02", title: "Feature flags are the product.", body: "Every change hides behind one. That's how you keep moving without fear." },
    { number: "03", title: "Quiet is a feature.", body: "You'll hear from us weekly, not hourly. No Slack theatre." },
  ]}
/>
```

## Rules

- Numbers (`01`, `02`, `03`) are static text. Never wrap them in CounterTicker — that's for real stats.
