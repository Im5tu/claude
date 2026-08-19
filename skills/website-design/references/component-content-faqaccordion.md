# FAQAccordion — Solid island

FAQ list with expand/collapse rows. State drives timing → Solid island with Web Animations API (height animation uses measured `scrollHeight` because CSS `height: auto` interpolation isn't universal yet).

Hydrate `client:visible`.

## Dimensional fit

- surface-depth: any
- motion-register: any (height animation is subtle)
- texture-appetite: any
- type-personality: any
- notes: 5–8 items ideal. Fewer → AlternatingRows. More → split into category tabs.

## File

### `src/components/islands/FAQAccordion.tsx`

```tsx
import { createSignal, onCleanup, onMount, For } from "solid-js";

interface Item { q: string; a: string; }
interface Props { items: Item[] }

const reduced = () => matchMedia("(prefers-reduced-motion: reduce)").matches;

export default function FAQAccordion(props: Props) {
  const [open, setOpen] = createSignal<number | null>(null);
  return (
    <ul class="faq">
      <For each={props.items}>
        {(item, i) => (
          <Row
            item={item}
            isOpen={() => open() === i()}
            toggle={() => setOpen(o => (o === i() ? null : i()))}
            idx={i()}
          />
        )}
      </For>
      <style>{`
        .faq { display: grid; border-top: 1px solid var(--color-border); }
        .faq > li { border-bottom: 1px solid var(--color-border); }
        .faq__btn {
          display: flex; align-items: center; justify-content: space-between;
          width: 100%; padding: 1.5rem 0; text-align: left;
          font-family: var(--font-display);
          font-size: clamp(1.125rem, 1.6vw, 1.375rem);
          letter-spacing: -0.01em;
        }
        .faq__mark {
          width: 1.25rem; height: 1.25rem;
          position: relative; flex-shrink: 0;
          transition: transform 220ms cubic-bezier(0.2, 0.8, 0.2, 1);
        }
        .faq__mark::before, .faq__mark::after {
          content: ""; position: absolute; inset: 0; margin: auto;
          background: currentColor;
        }
        .faq__mark::before { width: 100%; height: 1.5px; }
        .faq__mark::after { width: 1.5px; height: 100%; transition: scale 220ms cubic-bezier(0.2, 0.8, 0.2, 1); }
        .faq__btn[aria-expanded="true"] .faq__mark::after { scale: 0; }
        .faq__panel { height: 0; overflow: hidden; }
        .faq__answer {
          padding: 0 0 1.5rem 0;
          color: var(--color-secondary);
          max-width: 64ch;
        }
        @media (prefers-reduced-motion: reduce) {
          .faq__mark { transition: none; }
          .faq__mark::after { transition: none; }
        }
      `}</style>
    </ul>
  );
}

function Row(props: { item: Item; isOpen: () => boolean; toggle: () => void; idx: number }) {
  let panel: HTMLDivElement | undefined;
  let current: Animation | undefined;

  const play = (to: "open" | "close") => {
    if (!panel) return;
    current?.cancel();
    const h = panel.scrollHeight;
    if (reduced()) { panel.style.height = to === "open" ? "auto" : "0px"; return; }
    const from = to === "open" ? 0 : h;
    const target = to === "open" ? h : 0;
    current = panel.animate(
      [{ height: `${from}px` }, { height: `${target}px` }],
      { duration: 320, easing: "cubic-bezier(0.2, 0.8, 0.2, 1)", fill: "forwards" },
    );
    current.finished.then(() => {
      if (to === "open") panel!.style.height = "auto";
    }).catch(() => {});
  };

  const onClick = () => {
    const next = !props.isOpen();
    props.toggle();
    play(next ? "open" : "close");
  };

  onMount(() => onCleanup(() => current?.cancel()));

  return (
    <li>
      <button
        class="faq__btn"
        aria-expanded={props.isOpen()}
        aria-controls={`faq-p-${props.idx}`}
        onClick={onClick}
      >
        <span>{props.item.q}</span>
        <span class="faq__mark" aria-hidden="true"></span>
      </button>
      <div id={`faq-p-${props.idx}`} class="faq__panel" ref={panel}>
        <p class="faq__answer">{props.item.a}</p>
      </div>
    </li>
  );
}
```

## Usage

```astro
---
import FAQAccordion from "../components/islands/FAQAccordion.tsx";
const items = [
  { q: "How do you scope a project?", a: "A one-week paid discovery. Output: written brief, budget, timeline, and a go / no-go decision." },
  { q: "Do you sign NDAs?", a: "Yes. Standard mutual NDA, countersigned within 24 hours." },
  { q: "Can you work inside our repo?", a: "Yes. We work directly against main with small pull requests and feature flags." },
  { q: "Do you keep running it after launch?", a: "Optional twelve-month retainer. Most clients take it." },
];
---
<section class="max-w-3xl mx-auto px-6 py-24">
  <h2 class="text-4xl tracking-tight mb-8">Frequently asked</h2>
  <FAQAccordion items={items} client:visible />
</section>
```
