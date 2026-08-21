# ContactGateway

Contact section with at least one non-form channel alongside the form. Split layout: left = form, right = supporting info (address, hours, direct email, response time SLA). The form submits in place and renders sending/success/error states without a page reload.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any

## Structure

- `<section class="cg">` centered container, max-width 80rem
  - `.cg__head` intro block, max-width 52rem: optional `.cg__kicker` `<p>`, `.cg__title` `<h2>`, optional `.cg__sub` `<p>`
  - `.cg__grid` two-column grid at >=1024px (7fr form / 5fr aside), single column below
    - `.cg__form` — `<form class="cf" aria-live="polite">`
      - `.cf__row` two-up field row (name + email): each field is a `<label class="cf__field">` wrapping a `<span>` caption and the input
      - name: `<input type="text" name="name" required autocomplete="name">`
      - email: `<input type="email" name="email" required autocomplete="email">`
      - company (optional field): `<input type="text" name="company" autocomplete="organization">`
      - message: `<textarea name="message" required rows="5">` captioned "How can we help?"
      - `.cf__submit` `<button type="submit">`
      - error message `<p class="cf__error" role="alert">`, rendered only in the error state
    - `<aside class="cg__side">`
      - `<dl class="cg__channels">` — one `<dt>` label + `<dd>` value pair per channel (email, phone, address, hours); values with a target render as `<a>`
      - optional `.cg__sla` `<p>` response-time promise

## CSS

```css
.cg { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
.cg__head { max-width: 52rem; margin-bottom: 3rem; }
.cg__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
.cg__title { font-family: var(--font-display); font-size: clamp(2rem, 4vw, 3rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 22ch; }
.cg__sub { margin-top: 1rem; color: var(--color-text-secondary); max-width: 54ch; }

.cg__grid {
  display: grid; grid-template-columns: 1fr; gap: 3rem;
}
@media (min-width: 1024px) { .cg__grid { grid-template-columns: 7fr 5fr; gap: 5rem; } }

.cg__channels { display: grid; gap: 1.5rem; }
.cg__channels dt { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.12em; text-transform: uppercase; color: var(--color-text-secondary); }
.cg__channels dd { font-size: 1.125rem; margin-top: 0.25rem; }
.cg__channels a { text-decoration: underline; text-decoration-color: var(--color-border); text-underline-offset: 3px; }
.cg__channels a:hover { text-decoration-color: var(--color-accent); }

.cg__sla {
  margin-top: 2.5rem; padding: 1rem 1.25rem;
  background: var(--color-surface-secondary);
  border: 1px solid var(--color-border);
  border-radius: 0.75rem;
  font-size: 0.875rem;
  color: var(--color-text-secondary);
}

/* form */
.cf { display: grid; gap: 1rem; max-width: 36rem; }
.cf__row { display: grid; gap: 1rem; grid-template-columns: 1fr; }
@media (min-width: 640px) { .cf__row { grid-template-columns: 1fr 1fr; } }
.cf__field { display: grid; gap: 0.35rem; }
.cf__field > span {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.1em; text-transform: uppercase;
  color: var(--color-text-secondary);
}
.cf__field input, .cf__field textarea {
  width: 100%;
  padding: 0.75rem 0.875rem;
  background: transparent;
  border: 1px solid var(--color-border);
  border-radius: 0.75rem;
  color: var(--color-text-primary);
  font-family: var(--font-body);
  transition: border-color 180ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
.cf__field input:focus, .cf__field textarea:focus {
  outline: none; border-color: var(--color-accent);
}
.cf__submit {
  justify-self: start;
  padding: 0.75rem 1.5rem; border-radius: 999px;
  background: var(--color-accent); color: var(--color-surface-primary);
  transition: background 180ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
.cf__submit:disabled { opacity: 0.7; cursor: wait; }
.cf__submit:hover { background: var(--color-accent-dark); }
.cf__error { color: var(--color-error); font-size: 0.875rem; }
```

## Behavior

- The form intercepts submit (default navigation prevented). Native HTML validation gates submission: `required` on name, email, and message; `type="email"` on the email field.
- On submit, all fields are serialized to a JSON object and POSTed to the configured endpoint with `Content-Type: application/json`.
- The form tracks four states: idle, sending, sent, error. The submit button is disabled while sending and its label swaps: "Send message" (idle) → "Sending…" (sending) → "Thanks — we'll be in touch" (sent).
- A non-OK HTTP status or network failure enters the error state and renders "Something went wrong:" plus the error detail in a `role="alert"` paragraph. The form element carries `aria-live="polite"` so state changes are announced.
- On success, the form fields reset.
- The endpoint is configurable per site (e.g. a Resend, Netlify Forms, or custom POST URL).

## Notes

- Must show at least one non-form channel (email, phone, address) — never a form in isolation.
- Example content: kicker "Say hello", title "We reply within one working day.", sub "We take on two new engagements each quarter. Tell us a little about what you're working on.", channels Email `studio@halcyon.co` (mailto link), Studio "22 Constitution Street, Edinburgh EH6 7BS", Hours "Monday–Friday, 09:00–17:30 BST", SLA "We reply to every message personally, usually within 4 hours during UK working days.", endpoint `/api/contact`.
