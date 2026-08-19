# HorizontalTimeline — `.astro`

Horizontal scroll-snap timeline. 4–6 equal-weight phases presented edge-to-edge. CSS scroll-snap; no JS.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low, medium
- type-personality: geometric-sans, editorial-display

## File

### `src/components/sections/HorizontalTimeline.astro`

```astro
---
interface Phase {
  tag: string;          // "Phase 1" or "Week 1-2"
  title: string;
  body: string;
  bullets?: string[];
}
interface Props {
  kicker?: string;
  title?: string;
  phases: Phase[];
}
const { kicker, title, phases } = Astro.props;
---
<section class="ht">
  {(kicker || title) && (
    <header class="ht__header">
      {kicker && <p class="ht__kicker">{kicker}</p>}
      {title && <h2 class="ht__title">{title}</h2>}
    </header>
  )}

  <div class="ht__rail" role="list" aria-label="Timeline phases">
    {phases.map((p, i) => (
      <article class="ht__card" role="listitem" style={`--i: ${i};`}>
        <p class="ht__tag">{p.tag}</p>
        <h3 class="ht__card-title">{p.title}</h3>
        <p class="ht__body">{p.body}</p>
        {p.bullets && (
          <ul class="ht__bullets">
            {p.bullets.map(b => <li>{b}</li>)}
          </ul>
        )}
      </article>
    ))}
  </div>
</section>

<style>
  .ht { max-width: 100vw; padding: 5rem 0; }
  .ht__header { max-width: 52rem; padding: 0 1.5rem; margin-bottom: 2rem; }
  .ht__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
  .ht__title { font-family: var(--font-display); font-size: clamp(1.75rem, 3.5vw, 2.5rem); letter-spacing: -0.02em; margin-top: 0.75rem; }

  .ht__rail {
    display: flex;
    gap: 1.5rem;
    padding: 0 1.5rem 2rem;
    overflow-x: auto;
    scroll-snap-type: x mandatory;
    scroll-padding-inline: 1.5rem;
  }
  .ht__card {
    flex: 0 0 min(22rem, 80vw);
    scroll-snap-align: start;
    padding: 2rem;
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
    border-radius: 1.25rem;
    opacity: 0; translate: 0 14px;
    animation: ht-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i) * 80ms);
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ht__tag { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.14em; color: var(--color-accent); }
  .ht__card-title { font-family: var(--font-display); font-size: 1.25rem; letter-spacing: -0.01em; margin-top: 0.75rem; }
  .ht__body { margin-top: 0.5rem; color: var(--color-secondary); max-width: 40ch; }
  .ht__bullets { margin-top: 0.75rem; padding-left: 1rem; display: grid; gap: 0.25rem; color: var(--color-secondary); }

  @keyframes ht-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .ht__card { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<HorizontalTimeline
  kicker="Timeline"
  title="Four phases, shipped monthly."
  phases={[
    { tag: "Phase 1 · Week 1-2", title: "Discover", body: "Audit, interviews, and a written brief." },
    { tag: "Phase 2 · Week 3-4", title: "Shape", body: "Prose wireframes and direction cards." },
    { tag: "Phase 3 · Week 5-8", title: "Build", body: "Small PRs behind flags." },
    { tag: "Phase 4 · Week 9", title: "Hand-off", body: "Runbooks and warranty period." },
  ]}
/>
```
