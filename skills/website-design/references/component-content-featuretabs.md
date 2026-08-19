# FeatureTabs — Solid island

Tabbed feature comparison. State drives which panel is visible. Solid island. Hydrate `client:visible`.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low
- type-personality: geometric-sans, editorial-display
- notes: 2–4 tabs. Five tabs becomes a list.

## File

### `src/components/islands/FeatureTabs.tsx`

```tsx
import { createSignal, For, Show } from "solid-js";

interface Tab {
  id: string;
  label: string;
  title: string;
  body: string;
  media: { src: string; alt: string };
  bullets?: string[];
}
interface Props { tabs: Tab[] }

export default function FeatureTabs(props: Props) {
  const [active, setActive] = createSignal(props.tabs[0]?.id);

  return (
    <div class="ft">
      <div class="ft__rail" role="tablist">
        <For each={props.tabs}>
          {(t) => (
            <button
              role="tab"
              aria-selected={active() === t.id}
              aria-controls={`panel-${t.id}`}
              id={`tab-${t.id}`}
              classList={{ "ft__tab": true, "is-active": active() === t.id }}
              onClick={() => setActive(t.id)}
            >
              {t.label}
            </button>
          )}
        </For>
      </div>

      <For each={props.tabs}>
        {(t) => (
          <Show when={active() === t.id}>
            <div
              class="ft__panel"
              role="tabpanel"
              id={`panel-${t.id}`}
              aria-labelledby={`tab-${t.id}`}
            >
              <div class="ft__body">
                <h3 class="ft__title">{t.title}</h3>
                <p class="ft__text">{t.body}</p>
                <Show when={t.bullets?.length}>
                  <ul class="ft__bullets">
                    <For each={t.bullets}>{(b) => <li>{b}</li>}</For>
                  </ul>
                </Show>
              </div>
              <figure class="ft__media">
                <img src={t.media.src} alt={t.media.alt} width="1200" height="800" loading="lazy" />
              </figure>
            </div>
          </Show>
        )}
      </For>

      <style>{`
        .ft {
          max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem;
        }
        .ft__rail {
          display: inline-flex; gap: 0.25rem;
          padding: 0.25rem;
          background: var(--color-surface-secondary);
          border: 1px solid var(--color-border);
          border-radius: 999px;
          margin-bottom: 2.5rem;
        }
        .ft__tab {
          padding: 0.6rem 1.25rem;
          font-size: 0.875rem;
          color: var(--color-secondary);
          border-radius: 999px;
          transition: background 200ms cubic-bezier(0.2, 0.8, 0.2, 1),
                      color 200ms cubic-bezier(0.2, 0.8, 0.2, 1);
        }
        .ft__tab.is-active {
          background: var(--color-surface);
          color: var(--color-primary);
          box-shadow: 0 1px 2px rgb(0 0 0 / 0.08);
        }
        .ft__tab:focus-visible {
          outline: 2px solid var(--color-accent); outline-offset: 2px;
        }
        .ft__panel {
          display: grid;
          grid-template-columns: 1fr;
          gap: 3rem;
          align-items: center;
          animation: ft-in 380ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
        }
        @media (min-width: 1024px) {
          .ft__panel { grid-template-columns: 5fr 7fr; gap: 4rem; }
        }
        .ft__title {
          font-family: var(--font-display);
          font-size: clamp(1.5rem, 2.5vw, 2.25rem);
          letter-spacing: -0.02em;
        }
        .ft__text {
          margin-top: 0.75rem;
          max-width: 54ch;
          color: var(--color-secondary);
        }
        .ft__bullets {
          margin-top: 1rem; padding-left: 1.25rem;
          display: grid; gap: 0.25rem;
          color: var(--color-secondary);
        }
        .ft__media img { width: 100%; border-radius: 1.25rem; aspect-ratio: 3 / 2; object-fit: cover; }

        @keyframes ft-in {
          from { opacity: 0; translate: 0 8px; }
          to   { opacity: 1; translate: 0 0; }
        }
        @media (prefers-reduced-motion: reduce) {
          .ft__tab { transition: none; }
          .ft__panel { animation: none; }
        }
      `}</style>
    </div>
  );
}
```

## Usage

```astro
---
import FeatureTabs from "../components/islands/FeatureTabs.tsx";
const tabs = [
  { id: "auth", label: "Auth", title: "Passwordless by default.", body: "Passkeys + email magic link + social. MFA, session revocation, admin tools out of the box.", media: { src: "/auth.png", alt: "Passkey login screen" } },
  { id: "billing", label: "Billing", title: "Stripe + Polar, no glue.", body: "Subscriptions, metered, and one-off — unified.", media: { src: "/billing.png", alt: "Billing dashboard" } },
  { id: "obs", label: "Observability", title: "OpenTelemetry, your data.", body: "Logs, traces, metrics — exported to your destination.", media: { src: "/obs.png", alt: "Traces view" } },
];
---
<FeatureTabs tabs={tabs} client:visible />
```
