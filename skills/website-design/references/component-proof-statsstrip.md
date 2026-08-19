# StatsStrip — `.astro`

3–4 large numbers with labels. Each number MUST use `CounterTicker` from `core-animation.md` — static "0+" on load is a banned pattern (the scroll timeline isn't firing).

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low, medium
- type-personality: geometric-sans, editorial-display
- notes: Only include if numbers are genuinely impressive AND attributable. "3 projects, 2 years, 100% satisfaction" is desperate — omit.

## File

### `src/components/sections/StatsStrip.astro`

```astro
---
import CounterTicker from "../ui/CounterTicker.astro";

interface Stat { to: number; suffix?: string; label: string; caption?: string; }
interface Props { stats: Stat[]; kicker?: string; }
const { stats, kicker } = Astro.props;
---
<section class="ss">
  {kicker && <p class="ss__kicker">{kicker}</p>}
  <ul class="ss__row">
    {stats.map((s, i) => (
      <li style={`--i: ${i};`}>
        <p class="ss__value">
          <CounterTicker to={s.to} suffix={s.suffix ?? ""} />
        </p>
        <p class="ss__label">{s.label}</p>
        {s.caption && <p class="ss__caption">{s.caption}</p>}
      </li>
    ))}
  </ul>
</section>

<style>
  .ss { max-width: 80rem; margin: 0 auto; padding: 4rem 1.5rem; }
  .ss__kicker {
    font-family: var(--font-mono);
    font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
    color: var(--color-secondary);
    text-align: center;
    margin-bottom: 2.5rem;
  }
  .ss__row {
    list-style: none; padding: 0;
    display: grid;
    grid-template-columns: 1fr;
    gap: 2rem;
    text-align: center;
  }
  @media (min-width: 640px) { .ss__row { grid-template-columns: repeat(2, 1fr); } }
  @media (min-width: 1024px) { .ss__row { grid-template-columns: repeat(var(--cols, 4), 1fr); } }

  .ss__row li {
    opacity: 0; translate: 0 12px;
    animation: ss-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i) * 100ms);
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ss__value {
    font-family: var(--font-display);
    font-size: clamp(3rem, 6vw, 5rem);
    line-height: 1;
    letter-spacing: -0.03em;
    color: var(--color-accent);
  }
  .ss__label {
    font-size: 0.875rem;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    opacity: 0.75;
    margin-top: 0.75rem;
  }
  .ss__caption {
    font-size: 0.75rem;
    opacity: 0.5;
    margin-top: 0.25rem;
    max-width: 22ch;
    margin-inline: auto;
  }

  @keyframes ss-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .ss__row li { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<StatsStrip
  kicker="By the numbers"
  stats={[
    { to: 47, suffix: "m", label: "Lines of code reviewed", caption: "since 2019" },
    { to: 99, suffix: ".99%", label: "Platform uptime", caption: "last 24 months" },
    { to: 312, label: "Pull requests shipped", caption: "this quarter" },
    { to: 8, label: "People in the studio" },
  ]}
/>
```

## Rules

- Every number must animate via `CounterTicker`. Static rendering is banned.
- Captions are optional but useful — they contextualise the number ("since 2019", "last 24 months").
