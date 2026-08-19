# TelemetryFeed — Solid island

A live-looking typewriter data stream. Pulsing cursor, character-by-character reveal, lines scroll in from below. Solid island because state drives timing.

Hydrate `client:visible` — typing animation starts when on screen.

## Dimensional fit

- surface-depth: dark (strongest), light possible on technical directions
- motion-register: moderate, expressive
- texture-appetite: low
- type-personality: geometric-sans + mono accent
- notes: Best for SaaS/data/tech products where a "live feed" metaphor supports the brand claim. Avoid on warm/editorial/consumer registers — feels incongruent.

## File

### `src/components/islands/TelemetryFeed.tsx`

```tsx
import { createSignal, onMount, onCleanup, For, Show } from "solid-js";

interface Line { prefix: string; body: string; tone?: "ok" | "warn" | "err" | "info"; }
interface Props { lines: Line[]; cycleMs?: number; }

const reduced = () => matchMedia("(prefers-reduced-motion: reduce)").matches;

export default function TelemetryFeed(props: Props) {
  const [visible, setVisible] = createSignal<Line[]>([]);
  const [typing, setTyping] = createSignal("");
  let lineIdx = 0;
  let charIdx = 0;
  let raf = 0;
  let timer: ReturnType<typeof setTimeout> | undefined;

  const tick = () => {
    const line = props.lines[lineIdx];
    if (!line) {
      lineIdx = 0;
      setVisible([]);
      charIdx = 0;
      timer = setTimeout(tick, props.cycleMs ?? 1500);
      return;
    }
    const full = `${line.prefix} ${line.body}`;
    if (charIdx < full.length) {
      setTyping(full.slice(0, charIdx + 1));
      charIdx++;
      timer = setTimeout(tick, 22 + Math.random() * 28);
    } else {
      setVisible(v => [...v, line].slice(-6));
      setTyping("");
      charIdx = 0;
      lineIdx++;
      timer = setTimeout(tick, 420);
    }
  };

  onMount(() => {
    if (reduced()) {
      setVisible(props.lines.slice(0, 5));
      return;
    }
    tick();
    onCleanup(() => {
      if (timer) clearTimeout(timer);
      cancelAnimationFrame(raf);
    });
  });

  return (
    <div class="feed" role="log" aria-live="off">
      <div class="feed__rail">
        <For each={visible()}>
          {(l) => (
            <div class="feed__line" data-tone={l.tone ?? "info"}>
              <span class="feed__prefix">{l.prefix}</span>
              <span>{l.body}</span>
            </div>
          )}
        </For>
        <Show when={typing().length > 0}>
          <div class="feed__line feed__line--typing">
            <span>{typing()}</span><span class="feed__cursor">▍</span>
          </div>
        </Show>
      </div>
      <style>{`
        .feed {
          font-family: var(--font-mono);
          background: var(--color-surface-dark, #0A0A0A);
          color: var(--color-primary-on-dark, #E6E6E6);
          border-radius: 1rem;
          padding: 1.25rem;
          border: 1px solid color-mix(in oklab, currentColor 10%, transparent);
          overflow: hidden;
          min-height: 18rem;
        }
        .feed__rail { display: grid; gap: 0.35rem; font-size: 0.875rem; }
        .feed__line {
          display: flex; gap: 0.75rem; align-items: baseline;
          opacity: 0;
          animation: line-in 300ms cubic-bezier(0.2, 0.8, 0.2, 1) forwards;
        }
        .feed__line[data-tone="ok"]   .feed__prefix { color: #4ade80; }
        .feed__line[data-tone="warn"] .feed__prefix { color: #fbbf24; }
        .feed__line[data-tone="err"]  .feed__prefix { color: #f87171; }
        .feed__line[data-tone="info"] .feed__prefix { color: #7dd3fc; }
        .feed__prefix { font-weight: 600; }
        .feed__line--typing { opacity: 1; }
        .feed__cursor { animation: cursor-blink 900ms steps(2) infinite; }
        @keyframes line-in { to { opacity: 1; } }
        @keyframes cursor-blink { to { opacity: 0; } }
        @media (prefers-reduced-motion: reduce) {
          .feed__line, .feed__cursor { animation: none; opacity: 1; }
        }
      `}</style>
    </div>
  );
}
```

## Usage

```astro
---
import TelemetryFeed from "../components/islands/TelemetryFeed.tsx";
const lines = [
  { prefix: "→", body: "query optimised (+64% throughput)", tone: "ok" as const },
  { prefix: "✓", body: "13 auth tokens rotated", tone: "ok" as const },
  { prefix: "Δ", body: "latency budget: 42ms / 200ms", tone: "info" as const },
  { prefix: "⚠", body: "retry queue drained in 0.8s", tone: "warn" as const },
  { prefix: "→", body: "nightly build shipped to 214 edges", tone: "ok" as const },
];
---
<TelemetryFeed lines={lines} client:visible />
```

## Props

| Prop | Type | Default | Notes |
|---|---|---|---|
| `lines` | `Line[]` | — | Each line has prefix, body, optional tone |
| `cycleMs` | `number` | `1500` | Pause before the loop restarts |

## Notes

- Mono font must be wired through `@theme --font-mono`.
- Keep body strings short — long lines wrap and ruin the tape feel.
- Never use for real-time PII. This is a static looping animation, not a data source.
