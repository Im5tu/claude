# VerticalTimeline — `.astro`

Timeline of dated milestones down the page. Best for company history, release trail, or a slow editorial process. Each entry enters via `animation-timeline: view()`.

## Dimensional fit

- surface-depth: light (default), dark possible
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, editorial-display

## File

### `src/components/sections/VerticalTimeline.astro`

```astro
---
interface Entry {
  when: string;          // "2015" or "March 2023"
  title: string;
  body: string;
}
interface Props {
  kicker?: string;
  title?: string;
  entries: Entry[];
}
const { kicker, title, entries } = Astro.props;
---
<section class="vt">
  {(kicker || title) && (
    <header class="vt__header">
      {kicker && <p class="vt__kicker">{kicker}</p>}
      {title && <h2 class="vt__title">{title}</h2>}
    </header>
  )}

  <ol class="vt__rail">
    {entries.map((e, i) => (
      <li class="vt__entry" style={`--i: ${i};`}>
        <div class="vt__marker" aria-hidden="true"></div>
        <p class="vt__when">{e.when}</p>
        <h3 class="vt__entry-title">{e.title}</h3>
        <p class="vt__body">{e.body}</p>
      </li>
    ))}
  </ol>
</section>

<style>
  .vt { max-width: 72rem; margin: 0 auto; padding: 5rem 1.5rem; }
  .vt__header { max-width: 52rem; margin-bottom: 3rem; }
  .vt__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
  .vt__title { font-family: var(--font-display); font-size: clamp(1.75rem, 3.5vw, 2.5rem); letter-spacing: -0.02em; margin-top: 0.75rem; }

  .vt__rail {
    list-style: none; padding: 0;
    position: relative;
    display: grid; gap: 3rem;
  }
  .vt__rail::before {
    content: "";
    position: absolute;
    left: 0.45rem; top: 0.5rem; bottom: 0.5rem;
    width: 1px;
    background: var(--color-border);
  }
  .vt__entry {
    padding-left: 2.5rem;
    position: relative;
    opacity: 0; translate: 0 12px;
    animation: vt-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i) * 80ms);
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .vt__marker {
    position: absolute;
    left: 0; top: 0.45rem;
    width: 1rem; height: 1rem;
    background: var(--color-surface);
    border: 2px solid var(--color-accent);
    border-radius: 999px;
  }
  .vt__when {
    font-family: var(--font-mono);
    font-size: 0.75rem; letter-spacing: 0.14em; text-transform: uppercase;
    color: var(--color-accent);
  }
  .vt__entry-title {
    font-family: var(--font-display);
    font-size: 1.25rem;
    letter-spacing: -0.01em;
    margin-top: 0.5rem;
  }
  .vt__body { margin-top: 0.5rem; color: var(--color-secondary); max-width: 58ch; }

  @keyframes vt-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .vt__entry { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<VerticalTimeline
  kicker="Our history"
  title="Seventeen years, nine clients still on the books."
  entries={[
    { when: "2008", title: "Founded in Edinburgh", body: "Two people above a cafe on Broughton Street." },
    { when: "2012", title: "First retainer", body: "An engineering team in London; still with us today." },
    { when: "2019", title: "Moved to a studio in Leith", body: "Space for print proofs and the occasional dog." },
    { when: "2024", title: "Twelve people, no agencies-of-record", body: "We stayed small on purpose." },
  ]}
/>
```
