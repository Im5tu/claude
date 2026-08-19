# CardShuffler — Solid island

Cycling overlapping card stack. State drives the visible card; auto-rotates on a timer and advances on click. Solid island because state is required. Uses the Web Animations API FLIP pattern for reorder.

Hydrate `client:visible` — offscreen at mount saves work; onscreen it animates.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low / medium
- type-personality: any
- notes: Best when each card is a testimonial or a rotating value prop. Not for ordered content — order is not preserved visually beyond the front card.

## File

### `src/components/islands/CardShuffler.tsx`

```tsx
import { createSignal, onMount, onCleanup, For, createMemo } from "solid-js";

interface Card { id: string; eyebrow: string; heading: string; body: string; }
interface Props {
  cards: Card[];
  intervalMs?: number;
}

const reduced = () => matchMedia("(prefers-reduced-motion: reduce)").matches;

export default function CardShuffler(props: Props) {
  const [order, setOrder] = createSignal<Card[]>(props.cards);
  let root: HTMLDivElement | undefined;

  const advance = () => {
    if (!root) return;
    const nodes = Array.from(root.querySelectorAll<HTMLDivElement>("[data-card]"));
    const before = new Map(nodes.map(n => [n.dataset.id!, n.getBoundingClientRect()]));
    setOrder(prev => [...prev.slice(1), prev[0]]);
    queueMicrotask(() => {
      if (!root || reduced()) return;
      const after = Array.from(root.querySelectorAll<HTMLDivElement>("[data-card]"));
      for (const node of after) {
        const first = before.get(node.dataset.id!);
        if (!first) continue;
        const last = node.getBoundingClientRect();
        const dx = first.left - last.left;
        const dy = first.top - last.top;
        const ds = first.width / last.width;
        node.animate(
          [
            { transform: `translate(${dx}px, ${dy}px) scale(${ds})` },
            { transform: "translate(0, 0) scale(1)" },
          ],
          { duration: 500, easing: "cubic-bezier(0.2, 0.8, 0.2, 1)" },
        );
      }
    });
  };

  onMount(() => {
    if (reduced()) return;
    const id = setInterval(advance, props.intervalMs ?? 4000);
    onCleanup(() => clearInterval(id));
  });

  const stack = createMemo(() => order());

  return (
    <div ref={root} class="shuffler" onClick={advance}>
      <For each={stack()}>
        {(c, i) => (
          <div
            data-card
            data-id={c.id}
            classList={{ "shuffler__card": true, "is-front": i() === 0 }}
            style={`--i: ${i()};`}
          >
            <p class="shuffler__eyebrow">{c.eyebrow}</p>
            <h3 class="shuffler__heading">{c.heading}</h3>
            <p class="shuffler__body">{c.body}</p>
          </div>
        )}
      </For>
      <style>{`
        .shuffler {
          position: relative;
          height: 24rem;
          max-width: 34rem;
          margin: 0 auto;
          cursor: pointer;
        }
        .shuffler__card {
          position: absolute;
          inset: 0;
          background: var(--color-surface-secondary);
          border: 1px solid var(--color-border);
          border-radius: 1.5rem;
          padding: 2rem;
          translate: calc(var(--i) * 1.25rem) calc(var(--i) * 0.5rem);
          scale: calc(1 - var(--i) * 0.04);
          opacity: calc(1 - var(--i) * 0.18);
          z-index: calc(10 - var(--i));
          transition: translate 500ms cubic-bezier(0.2, 0.8, 0.2, 1),
                      scale 500ms cubic-bezier(0.2, 0.8, 0.2, 1),
                      opacity 500ms cubic-bezier(0.2, 0.8, 0.2, 1);
        }
        .shuffler__eyebrow {
          font-size: 0.75rem; letter-spacing: 0.1em; text-transform: uppercase;
          color: var(--color-accent); margin-bottom: 0.75rem;
        }
        .shuffler__heading {
          font-family: var(--font-display); font-size: 1.5rem;
          letter-spacing: -0.01em;
        }
        .shuffler__body {
          margin-top: 0.75rem; color: var(--color-secondary);
        }
        @media (prefers-reduced-motion: reduce) {
          .shuffler__card { transition: none; }
        }
      `}</style>
    </div>
  );
}
```

## Usage

```astro
---
import CardShuffler from "../components/islands/CardShuffler.tsx";
const testimonials = [
  { id: "a", eyebrow: "Apex, CTO", heading: "They shipped in half the time.", body: "No theatre. No status deck marathon. Just working software, shipped." },
  { id: "b", eyebrow: "Meridian, Head of Product", heading: "The team we wish we had in-house.", body: "Opinions backed by evidence, delivered with calm." },
  { id: "c", eyebrow: "Halcyon, Founder", heading: "Quiet and effective.", body: "Six months in, nothing has broken. That's the review." },
];
---
<CardShuffler cards={testimonials} client:visible />
```

## Props

| Prop | Type | Default | Notes |
|---|---|---|---|
| `cards` | `Card[]` | — | 3–5 cards recommended |
| `intervalMs` | `number` | `4000` | Auto-advance interval; reduced motion disables auto-advance |

## Notes

- Clicking anywhere on the stack advances it.
- Keyboard access: wrap the component in a `<button>` or add focus/keydown handling if primary interaction requires it.
- For ordered content (process steps, chaptered work), use `StickyCardStack` instead.
