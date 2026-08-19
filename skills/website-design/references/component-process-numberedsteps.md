# NumberedSteps — `.astro`

3–5 steps in a clean numbered grid. Pure `.astro`. Entrance staggers per step via `animation-timeline: view()`.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any

## File

### `src/components/sections/NumberedSteps.astro`

```astro
---
interface Step { number: string; title: string; body: string; }
interface Props {
  kicker?: string;
  title?: string;
  steps: Step[];
}
const { kicker, title, steps } = Astro.props;
---
<section class="ns">
  {(kicker || title) && (
    <header class="ns__header">
      {kicker && <p class="ns__kicker">{kicker}</p>}
      {title && <h2 class="ns__title">{title}</h2>}
    </header>
  )}
  <ol class="ns__grid">
    {steps.map((s, i) => (
      <li class="ns__step" style={`--i: ${i};`}>
        <p class="ns__num">{s.number}</p>
        <h3 class="ns__step-title">{s.title}</h3>
        <p class="ns__body">{s.body}</p>
      </li>
    ))}
  </ol>
</section>

<style>
  .ns { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
  .ns__header { max-width: 52rem; margin-bottom: 3rem; }
  .ns__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
  .ns__title { font-family: var(--font-display); font-size: clamp(1.75rem, 3.5vw, 2.5rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 24ch; }

  .ns__grid {
    list-style: none; padding: 0;
    display: grid; gap: 2rem;
    grid-template-columns: 1fr;
  }
  @media (min-width: 640px) { .ns__grid { grid-template-columns: repeat(2, 1fr); } }
  @media (min-width: 1024px) { .ns__grid { grid-template-columns: repeat(4, 1fr); } }

  .ns__step {
    padding: 1.75rem;
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
    border-radius: 1.25rem;
    opacity: 0; translate: 0 14px;
    animation: ns-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i) * 90ms);
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ns__num {
    font-family: var(--font-mono);
    font-size: 0.75rem;
    letter-spacing: 0.14em;
    color: var(--color-accent);
  }
  .ns__step-title {
    font-family: var(--font-display);
    font-size: 1.125rem;
    letter-spacing: -0.01em;
    margin-top: 0.75rem;
  }
  .ns__body { margin-top: 0.5rem; color: var(--color-secondary); }

  @keyframes ns-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .ns__step { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<NumberedSteps
  kicker="Engagement"
  title="Four weeks, four outputs."
  steps={[
    { number: "01", title: "Discover", body: "Interviews, audit, written brief." },
    { number: "02", title: "Shape", body: "Prose wireframes and direction cards." },
    { number: "03", title: "Build", body: "Small PRs, feature-flagged." },
    { number: "04", title: "Hand-off", body: "Runbooks, docs, 30-day warranty." },
  ]}
/>
```
