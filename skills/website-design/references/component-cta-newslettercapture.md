# NewsletterCapture — `.astro` shell + Solid island form

Full-width newsletter capture. Headline + supporting line on the left, single-field signup form on the right. The form itself is a Solid island so submit/success/error states render without a reload.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: humanist-serif, editorial-display (warm); geometric-sans (technical)
- notes: Best for editorial, studio, and content-led brands. Skip for pure transactional products.

## Files

### `src/components/sections/NewsletterCapture.astro`

```astro
---
import NewsletterForm from "../islands/NewsletterForm.tsx";

interface Props {
  kicker?: string;
  headline: string;
  sub?: string;
  endpoint: string;              // POST URL
  tone?: "dark" | "light";
}
const { kicker, headline, sub, endpoint, tone = "light" } = Astro.props;
---
<section class:list={["nl", `nl--${tone}`]}>
  <div class="nl__inner">
    <div class="nl__text">
      {kicker && <p class="nl__kicker">{kicker}</p>}
      <h2 class="nl__headline">{headline}</h2>
      {sub && <p class="nl__sub">{sub}</p>}
    </div>
    <div class="nl__form">
      <NewsletterForm endpoint={endpoint} client:visible />
    </div>
  </div>
</section>

<style>
  .nl { padding: 5rem 1.5rem; }
  .nl--dark {
    background: var(--color-surface-dark, #0A0A0A);
    color: var(--color-primary-on-dark, #F5F5F5);
  }
  .nl--light {
    background: var(--color-surface-secondary);
  }
  .nl__inner {
    max-width: 72rem;
    margin: 0 auto;
    display: grid;
    grid-template-columns: 1fr;
    gap: 2.5rem;
    align-items: center;
  }
  @media (min-width: 1024px) {
    .nl__inner { grid-template-columns: 6fr 5fr; gap: 5rem; }
  }
  .nl__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
  .nl__headline {
    font-family: var(--font-display);
    font-size: clamp(1.75rem, 3.5vw, 2.5rem);
    letter-spacing: -0.02em;
    margin-top: 0.75rem;
    max-width: 22ch;
    text-wrap: balance;
  }
  .nl__sub { margin-top: 1rem; opacity: 0.75; max-width: 52ch; }
</style>
```

### `src/components/islands/NewsletterForm.tsx`

```tsx
import { createSignal } from "solid-js";

interface Props { endpoint: string; }

export default function NewsletterForm(props: Props) {
  const [state, setState] = createSignal<"idle" | "sending" | "sent" | "error">("idle");
  const [error, setError] = createSignal<string | null>(null);

  const onSubmit = async (e: SubmitEvent) => {
    e.preventDefault();
    const form = e.currentTarget as HTMLFormElement;
    const email = new FormData(form).get("email");
    setState("sending");
    try {
      const res = await fetch(props.endpoint, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email }),
      });
      if (!res.ok) throw new Error(String(res.status));
      setState("sent");
      form.reset();
    } catch (err) {
      setError(err instanceof Error ? err.message : "Unknown error");
      setState("error");
    }
  };

  return (
    <form class="nlf" onSubmit={onSubmit} aria-live="polite">
      <div class="nlf__row">
        <input
          name="email"
          type="email"
          placeholder="you@studio.co"
          autocomplete="email"
          required
          aria-label="Email address"
        />
        <button type="submit" disabled={state() === "sending" || state() === "sent"}>
          {state() === "sending" ? "Sending…" : state() === "sent" ? "Subscribed" : "Subscribe"}
        </button>
      </div>
      {state() === "error" && <p class="nlf__msg nlf__msg--err" role="alert">Something went wrong: {error()}</p>}
      {state() === "sent" && <p class="nlf__msg nlf__msg--ok">Thanks — watch for a confirmation email.</p>}

      <p class="nlf__tos">Monthly, no spam. Unsubscribe in one click.</p>

      <style>{`
        .nlf { display: grid; gap: 0.5rem; max-width: 28rem; }
        .nlf__row {
          display: flex; gap: 0.5rem;
          background: var(--color-surface);
          border: 1px solid var(--color-border);
          border-radius: 999px;
          padding: 0.35rem;
        }
        .nlf__row:focus-within { border-color: var(--color-accent); }
        .nlf__row input {
          flex: 1;
          padding: 0.6rem 0.9rem;
          background: transparent;
          color: var(--color-primary);
          font-family: var(--font-body);
        }
        .nlf__row input:focus { outline: none; }
        .nlf__row button {
          padding: 0.55rem 1.1rem;
          border-radius: 999px;
          background: var(--color-accent); color: var(--color-surface);
          font-size: 0.875rem;
          transition: background 180ms cubic-bezier(0.2, 0.8, 0.2, 1);
        }
        .nlf__row button:hover { background: var(--color-accent-dark); }
        .nlf__row button:disabled { opacity: 0.7; cursor: wait; }
        .nlf__msg { font-size: 0.875rem; }
        .nlf__msg--ok { color: #16a34a; }
        .nlf__msg--err { color: #dc2626; }
        .nlf__tos { font-size: 0.75rem; opacity: 0.55; margin-top: 0.35rem; }
      `}</style>
    </form>
  );
}
```

## Usage

```astro
<NewsletterCapture
  kicker="Studio journal"
  headline="A considered letter on process, once a month."
  sub="Short. Thoughtful. Written by humans. Previous issues archived."
  endpoint="/api/subscribe"
  tone="light"
/>
```
