# NewsletterCapture

Full-width newsletter capture. Headline + supporting line on the left, single-field signup form on the right. The form submits in place and renders sending/success/error states without a page reload.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: humanist-serif, editorial-display (warm); geometric-sans (technical)
- notes: Best for editorial, studio, and content-led brands. Skip for pure transactional products.

## Structure

- `<section class="nl">` with tone modifier class `nl--dark` or `nl--light`
  - `.nl__inner` centered container, max-width 72rem; grid, single column below 1024px, 6fr/5fr two-column above
    - `.nl__text`: optional `.nl__kicker` `<p>`, `.nl__headline` `<h2>`, optional `.nl__sub` `<p>`
    - `.nl__form` — `<form class="nlf" aria-live="polite">`
      - `.nlf__row` pill wrapper: `<input type="email" name="email" required autocomplete="email" aria-label="Email address" placeholder="you@studio.co">` + `<button type="submit">`
      - status messages, rendered per state: `<p class="nlf__msg nlf__msg--err" role="alert">` on error, `<p class="nlf__msg nlf__msg--ok">` on success
      - `.nlf__tos` `<p>` small print, e.g. "Monthly, no spam. Unsubscribe in one click."

## CSS

```css
.nl { padding: 5rem 1.5rem; }
.nl--dark {
  background: #0A0A0A;
  color: #F5F5F5;
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

/* form */
.nlf { display: grid; gap: 0.5rem; max-width: 28rem; }
.nlf__row {
  display: flex; gap: 0.5rem;
  background: var(--color-surface-elevated);
  border: 1px solid var(--color-border);
  border-radius: 999px;
  padding: 0.35rem;
}
.nlf__row:focus-within { border-color: var(--color-accent); }
.nlf__row input {
  flex: 1;
  padding: 0.6rem 0.9rem;
  background: transparent;
  color: var(--color-text-primary);
  font-family: var(--font-body);
}
.nlf__row input:focus { outline: none; }
.nlf__row button {
  padding: 0.55rem 1.1rem;
  border-radius: 999px;
  background: var(--color-accent); color: var(--color-surface-primary);
  font-size: 0.875rem;
  transition: background 180ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
.nlf__row button:hover { background: var(--color-accent-dark); }
.nlf__row button:disabled { opacity: 0.7; cursor: wait; }
.nlf__msg { font-size: 0.875rem; }
.nlf__msg--ok { color: var(--color-success); }
.nlf__msg--err { color: var(--color-error); }
.nlf__tos { font-size: 0.75rem; opacity: 0.55; margin-top: 0.35rem; }
```

## Behavior

- The form intercepts submit (default navigation prevented). Native HTML validation gates submission: the email input is `required` with `type="email"`.
- On submit, the email value is POSTed as JSON (`{ "email": ... }`) to the configured endpoint with `Content-Type: application/json`.
- The form tracks four states: idle, sending, sent, error. The submit button is disabled while sending and after success, and its label swaps: "Subscribe" (idle) → "Sending…" (sending) → "Subscribed" (sent).
- On success, the input resets and a confirmation line renders: "Thanks — watch for a confirmation email."
- A non-OK HTTP status or network failure enters the error state and renders "Something went wrong:" plus the error detail in a `role="alert"` paragraph. The form element carries `aria-live="polite"` so state changes are announced.
- The endpoint is configurable per site (POST URL, e.g. `/api/subscribe`).

## Notes

- Dark tone uses literal `#0A0A0A` / `#F5F5F5` because the token set has no dedicated dark-surface pair; swap for the site's dark surface values if it defines them.
- Example content: kicker "Studio journal", headline "A considered letter on process, once a month.", sub "Short. Thoughtful. Written by humans. Previous issues archived.", light tone.
