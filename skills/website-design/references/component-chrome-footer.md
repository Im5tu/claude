# Footer

Full-featured dark footer: brand column, nav columns, newsletter signup, status indicator, legal bar. This is the required footer for every site. Simplified single-row footers are banned.

## Dimensional fit

- surface-depth: always dark — the footer is the site's dark anchor regardless of page palette
- motion-register: any
- texture-appetite: any
- type-personality: any
- notes: Uses `--color-surface-dark` and `--color-primary-on-dark`. Rounded top edge is intentional and constant.

## Structure

- `<footer class="footer">`
  - `<div class="footer__inner">` centered container, max-width 80rem
    - `<div class="footer__grid">` grid: brand column (1.4fr) plus one 1fr column per nav group
      - brand column: `footer__brand-name` wordmark, `footer__tagline` one-liner, optional `footer__status` line (`data-ok` attribute drives dot color) containing an `aria-hidden` `footer__dot`
      - one `<div>` per nav column: `footer__col-title` heading and `footer__col-list` `<ul>` of links
      - optional newsletter column: `footer__col-title` ("Stay in the loop"), `<form class="footer__form" method="post">` with a floating input (email, required) and a primary submit button
    - `<div class="footer__legal">`: legal text `<span>` (default "© {year} {brand}. All rights reserved.") and optional `<ul class="footer__social">` of social links with accessible labels

## CSS

```css
.footer {
  /* Always-dark anchor: these are fixed values, not theme tokens, so the footer
     stays dark on every palette. */
  background: #0A0A0A;
  color: #F5F5F5;
  border-top-left-radius: 2rem;
  border-top-right-radius: 2rem;
  margin-top: 6rem;
}
.footer__inner {
  max-width: 80rem;
  margin: 0 auto;
  padding: 4rem 1.5rem 2rem;
}
.footer__grid {
  display: grid;
  gap: 3rem;
  grid-template-columns: 1.4fr repeat(var(--cols, 3), 1fr);
}
@media (max-width: 768px) {
  .footer__grid { grid-template-columns: 1fr; gap: 2rem; }
}

.footer__brand-name { font-family: var(--font-display); font-size: 1.5rem; letter-spacing: -0.02em; }
.footer__tagline { max-width: 32ch; opacity: 0.7; margin-top: 0.5rem; }

.footer__status { display: inline-flex; align-items: center; gap: 0.5rem; margin-top: 1.5rem; font-size: 0.875rem; opacity: 0.7; }
.footer__dot {
  width: 0.5rem; height: 0.5rem; border-radius: 999px;
  background: #ef4444;
  animation: status-pulse 2s ease-in-out infinite;
}
.footer__status[data-ok="true"] .footer__dot { background: #22c55e; }
@keyframes status-pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}
@media (prefers-reduced-motion: reduce) { .footer__dot { animation: none; } }

.footer__col-title {
  font-size: 0.875rem;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  opacity: 0.6;
  margin-bottom: 1rem;
}
.footer__col-list { display: grid; gap: 0.5rem; }
.footer__col-list a { opacity: 0.85; transition: opacity var(--motion-duration-fast) var(--ease-out-soft); }
.footer__col-list a:hover { opacity: 1; }

.footer__form { display: grid; gap: 0.75rem; max-width: 22rem; }

.footer__legal {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  align-items: center;
  gap: 1rem;
  margin-top: 3rem;
  padding-top: 2rem;
  border-top: 1px solid color-mix(in oklab, currentColor 10%, transparent);
  font-size: 0.875rem;
  opacity: 0.6;
}
.footer__social { display: flex; gap: 1rem; list-style: none; }
```

## Notes

- Set `--cols` on `.footer__grid` to the number of non-brand columns (nav columns plus newsletter); default 3.
- `data-ok="true"` on the status line gives a green pulsing dot; anything else gives red.
- Social links need accessible labels (`aria-label` or visible text).
- The status pulse is decorative CSS keyframes only; no JS anywhere in this component.

## Dimensional adaptation

- Restrained register: remove the status pulse animation (replace with a static dot).
- Texture-high direction: add a noise overlay layer inside `.footer` via `background-image: url(noise-svg-data-uri)` at low opacity.
- Editorial register: drop the newsletter column; move masthead/credits into the brand column.
