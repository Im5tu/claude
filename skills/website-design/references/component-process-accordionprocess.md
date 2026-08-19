# AccordionProcess — Solid island

Expandable process steps. The default open state shows step 01; clicking another step transitions its body open while the previous closes. WAAPI for the height animation.

Hydrate `client:visible`.

## Dimensional fit

- surface-depth: any
- motion-register: any (animation is subtle)
- texture-appetite: any
- type-personality: any
- notes: 3–6 steps. Large step bodies benefit from this component more than small ones.

## File

### `src/components/islands/AccordionProcess.tsx`

```tsx
import { createSignal, onMount, onCleanup, For } from "solid-js";

interface Step { number: string; title: string; body: string; bullets?: string[]; }
interface Props { steps: Step[] }

const reduced = () => matchMedia("(prefers-reduced-motion: reduce)").matches;

export default function AccordionProcess(props: Props) {
  const [open, setOpen] = createSignal(0);
  return (
    <div class="ap">
      <For each={props.steps}>
        {(step, i) => (
          <Row
            step={step}
            isOpen={() => open() === i()}
            toggle={() => setOpen(o => (o === i() ? -1 : i()))}
            idx={i()}
          />
        )}
      </For>
      <style>{`
        .ap { display: grid; border-top: 1px solid var(--color-border); }
        .ap > div { border-bottom: 1px solid var(--color-border); }
        .ap__head {
          display: grid; grid-template-columns: auto 1fr auto;
          gap: 1.5rem; align-items: baseline;
          padding: 1.5rem 0; text-align: left; width: 100%;
        }
        .ap__num {
          font-family: var(--font-mono);
          font-size: 0.75rem; letter-spacing: 0.14em;
          color: var(--color-accent);
          min-width: 2ch;
        }
        .ap__title {
          font-family: var(--font-display);
          font-size: clamp(1.125rem, 1.8vw, 1.5rem);
          letter-spacing: -0.01em;
        }
        .ap__mark {
          width: 1.25rem; height: 1.25rem; position: relative;
        }
        .ap__mark::before, .ap__mark::after {
          content: ""; position: absolute; inset: 0; margin: auto;
          background: currentColor;
        }
        .ap__mark::before { width: 100%; height: 1.5px; }
        .ap__mark::after { width: 1.5px; height: 100%; transition: scale 200ms cubic-bezier(0.2, 0.8, 0.2, 1); }
        .ap__head[aria-expanded="true"] .ap__mark::after { scale: 0; }

        .ap__panel { height: 0; overflow: hidden; }
        .ap__body {
          padding: 0 0 1.5rem 3.5rem;
          max-width: 60ch;
          color: var(--color-secondary);
        }
        .ap__bullets { margin-top: 0.75rem; padding-left: 1rem; display: grid; gap: 0.25rem; }

        @media (prefers-reduced-motion: reduce) {
          .ap__mark::after { transition: none; }
        }
      `}</style>
    </div>
  );
}

function Row(props: { step: Step; isOpen: () => boolean; toggle: () => void; idx: number }) {
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
      { duration: 340, easing: "cubic-bezier(0.2, 0.8, 0.2, 1)", fill: "forwards" },
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

  onMount(() => {
    // First row default-open
    if (props.isOpen() && panel) panel.style.height = "auto";
    onCleanup(() => current?.cancel());
  });

  return (
    <div>
      <button
        class="ap__head"
        aria-expanded={props.isOpen()}
        aria-controls={`ap-p-${props.idx}`}
        onClick={onClick}
      >
        <span class="ap__num">{props.step.number}</span>
        <span class="ap__title">{props.step.title}</span>
        <span class="ap__mark" aria-hidden="true"></span>
      </button>
      <div id={`ap-p-${props.idx}`} class="ap__panel" ref={panel}>
        <div class="ap__body">
          <p>{props.step.body}</p>
          {props.step.bullets && (
            <ul class="ap__bullets">
              {props.step.bullets.map(b => <li>{b}</li>)}
            </ul>
          )}
        </div>
      </div>
    </div>
  );
}
```

## Usage

```astro
---
import AccordionProcess from "../components/islands/AccordionProcess.tsx";
const steps = [
  { number: "01", title: "Discover", body: "We interview the team, audit the code, and write a brief.", bullets: ["2 × 90-min interviews", "Written brief within 5 days"] },
  { number: "02", title: "Shape", body: "Low-fi wireflow and prose.", bullets: ["Reviewed in Loom", "Signed off in writing"] },
  { number: "03", title: "Build", body: "Small PRs, feature flags, daily demo.", bullets: ["Main branch only", "Daily 10-minute demo"] },
  { number: "04", title: "Hand-off", body: "Runbooks, docs, warranty." },
];
---
<AccordionProcess steps={steps} client:visible />
```
