# ContactGateway — `.astro`

Contact section with at least one non-form channel alongside the form. Split layout: left = form, right = supporting info (address, hours, direct email, response time SLA).

Form is a Solid island so submit/success/error states work without a page reload.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any

## Files

### `src/components/sections/ContactGateway.astro`

```astro
---
import ContactForm from "../islands/ContactForm.tsx";

interface Channel { label: string; value: string; href?: string; }
interface Props {
  kicker?: string;
  title: string;
  sub?: string;
  channels: Channel[];    // e.g. email, phone, address
  responseSla?: string;
  formEndpoint: string;   // POST URL — resend / netlify / custom
}
const { kicker, title, sub, channels, responseSla, formEndpoint } = Astro.props;
---
<section class="cg">
  <div class="cg__head">
    {kicker && <p class="cg__kicker">{kicker}</p>}
    <h2 class="cg__title">{title}</h2>
    {sub && <p class="cg__sub">{sub}</p>}
  </div>
  <div class="cg__grid">
    <div class="cg__form">
      <ContactForm endpoint={formEndpoint} client:visible />
    </div>
    <aside class="cg__side">
      <dl class="cg__channels">
        {channels.map((c) => (
          <>
            <dt>{c.label}</dt>
            <dd>
              {c.href ? <a href={c.href}>{c.value}</a> : c.value}
            </dd>
          </>
        ))}
      </dl>
      {responseSla && (
        <p class="cg__sla">{responseSla}</p>
      )}
    </aside>
  </div>
</section>

<style>
  .cg { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
  .cg__head { max-width: 52rem; margin-bottom: 3rem; }
  .cg__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
  .cg__title { font-family: var(--font-display); font-size: clamp(2rem, 4vw, 3rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 22ch; }
  .cg__sub { margin-top: 1rem; color: var(--color-secondary); max-width: 54ch; }

  .cg__grid {
    display: grid; grid-template-columns: 1fr; gap: 3rem;
  }
  @media (min-width: 1024px) { .cg__grid { grid-template-columns: 7fr 5fr; gap: 5rem; } }

  .cg__channels { display: grid; gap: 1.5rem; }
  .cg__channels dt { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.12em; text-transform: uppercase; color: var(--color-secondary); }
  .cg__channels dd { font-size: 1.125rem; margin-top: 0.25rem; }
  .cg__channels a { text-decoration: underline; text-decoration-color: var(--color-border); text-underline-offset: 3px; }
  .cg__channels a:hover { text-decoration-color: var(--color-accent); }

  .cg__sla {
    margin-top: 2.5rem; padding: 1rem 1.25rem;
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
    border-radius: 0.75rem;
    font-size: 0.875rem;
    color: var(--color-secondary);
  }
</style>
```

### `src/components/islands/ContactForm.tsx`

```tsx
import { createSignal } from "solid-js";

interface Props { endpoint: string; }

export default function ContactForm(props: Props) {
  const [state, setState] = createSignal<"idle" | "sending" | "sent" | "error">("idle");
  const [error, setError] = createSignal<string | null>(null);

  const onSubmit = async (e: SubmitEvent) => {
    e.preventDefault();
    const form = e.currentTarget as HTMLFormElement;
    const body = Object.fromEntries(new FormData(form));
    setState("sending");
    try {
      const res = await fetch(props.endpoint, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body),
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
    <form class="cf" onSubmit={onSubmit} aria-live="polite">
      <div class="cf__row">
        <label class="cf__field">
          <span>Name</span>
          <input name="name" type="text" required autocomplete="name" />
        </label>
        <label class="cf__field">
          <span>Email</span>
          <input name="email" type="email" required autocomplete="email" />
        </label>
      </div>
      <label class="cf__field">
        <span>Company</span>
        <input name="company" type="text" autocomplete="organization" />
      </label>
      <label class="cf__field">
        <span>How can we help?</span>
        <textarea name="message" required rows="5"></textarea>
      </label>
      <button type="submit" class="cf__submit" disabled={state() === "sending"}>
        {state() === "sending" ? "Sending…" : state() === "sent" ? "Thanks — we'll be in touch" : "Send message"}
      </button>
      {state() === "error" && <p class="cf__error" role="alert">Something went wrong: {error()}</p>}
      <style>{`
        .cf { display: grid; gap: 1rem; max-width: 36rem; }
        .cf__row { display: grid; gap: 1rem; grid-template-columns: 1fr; }
        @media (min-width: 640px) { .cf__row { grid-template-columns: 1fr 1fr; } }
        .cf__field { display: grid; gap: 0.35rem; }
        .cf__field > span {
          font-family: var(--font-mono);
          font-size: 0.75rem; letter-spacing: 0.1em; text-transform: uppercase;
          color: var(--color-secondary);
        }
        .cf__field input, .cf__field textarea {
          width: 100%;
          padding: 0.75rem 0.875rem;
          background: transparent;
          border: 1px solid var(--color-border);
          border-radius: 0.75rem;
          color: var(--color-primary);
          font-family: var(--font-body);
          transition: border-color 180ms cubic-bezier(0.2, 0.8, 0.2, 1);
        }
        .cf__field input:focus, .cf__field textarea:focus {
          outline: none; border-color: var(--color-accent);
        }
        .cf__submit {
          align-self: start;
          padding: 0.75rem 1.5rem; border-radius: 999px;
          background: var(--color-accent); color: var(--color-surface);
          transition: background 180ms cubic-bezier(0.2, 0.8, 0.2, 1);
        }
        .cf__submit:disabled { opacity: 0.7; cursor: wait; }
        .cf__submit:hover { background: var(--color-accent-dark); }
        .cf__error { color: #dc2626; font-size: 0.875rem; }
      `}</style>
    </form>
  );
}
```

## Usage

```astro
<ContactGateway
  kicker="Say hello"
  title="We reply within one working day."
  sub="We take on two new engagements each quarter. Tell us a little about what you're working on."
  channels={[
    { label: "Email", value: "studio@halcyon.co", href: "mailto:studio@halcyon.co" },
    { label: "Studio", value: "22 Constitution Street, Edinburgh EH6 7BS" },
    { label: "Hours", value: "Monday–Friday, 09:00–17:30 BST" },
  ]}
  responseSla="We reply to every message personally, usually within 4 hours during UK working days."
  formEndpoint="/api/contact"
/>
```
