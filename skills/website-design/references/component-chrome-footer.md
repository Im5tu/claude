# Footer — `.astro`

Full-featured dark footer: brand column, nav columns, newsletter signup slot, status indicator, legal bar. This is the required footer for every site. Simplified single-row footers are banned.

## Dimensional fit

- surface-depth: always dark — the footer is the site's dark anchor regardless of page palette
- motion-register: any
- texture-appetite: any
- type-personality: any
- notes: Uses `--color-surface-dark` and `--color-primary-on-dark`. Rounded top edge is intentional and constant.

## File

### `src/components/layout/Footer.astro`

```astro
---
import FloatingInput from "../ui/FloatingInput.astro";
import Button from "../ui/Button.astro";

interface NavColumn {
  title: string;
  links: { label: string; href: string }[];
}
interface Props {
  brand: string;
  tagline: string;
  columns: NavColumn[];
  social?: { label: string; href: string; icon?: string }[];
  statusLabel?: string;      // e.g. "All systems operational"
  statusOk?: boolean;        // drives indicator colour
  showNewsletter?: boolean;
  legal?: string;
}

const {
  brand,
  tagline,
  columns,
  social = [],
  statusLabel,
  statusOk = true,
  showNewsletter = true,
  legal = `© ${new Date().getFullYear()} ${Astro.props.brand}. All rights reserved.`,
} = Astro.props;
---
<footer class="footer">
  <div class="footer__inner">
    <div class="footer__grid">
      <div class="footer__brand">
        <p class="footer__brand-name">{brand}</p>
        <p class="footer__tagline">{tagline}</p>
        {statusLabel && (
          <p class="footer__status" data-ok={statusOk}>
            <span class="footer__dot" aria-hidden="true"></span>
            {statusLabel}
          </p>
        )}
      </div>

      {columns.map((col) => (
        <div>
          <p class="footer__col-title">{col.title}</p>
          <ul class="footer__col-list">
            {col.links.map((l) => (
              <li><a href={l.href}>{l.label}</a></li>
            ))}
          </ul>
        </div>
      ))}

      {showNewsletter && (
        <div class="footer__newsletter">
          <p class="footer__col-title">Stay in the loop</p>
          <form action="/api/subscribe" method="post" class="footer__form">
            <FloatingInput id="footer-email" name="email" label="Email address" type="email" required />
            <Button type="submit" variant="primary">Subscribe</Button>
          </form>
        </div>
      )}
    </div>

    <div class="footer__legal">
      <span>{legal}</span>
      {social.length > 0 && (
        <ul class="footer__social">
          {social.map((s) => (
            <li><a href={s.href} aria-label={s.label}>{s.label}</a></li>
          ))}
        </ul>
      )}
    </div>
  </div>
</footer>

<style>
  .footer {
    background: var(--color-surface-dark, #0A0A0A);
    color: var(--color-primary-on-dark, #F5F5F5);
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
</style>
```

## Props

| Prop | Type | Notes |
|---|---|---|
| `brand` | `string` | Wordmark shown in the brand column |
| `tagline` | `string` | One-line brand summary |
| `columns` | `NavColumn[]` | Nav columns — title + link list |
| `social` | `{ label; href }[]` | Optional social row (accessible labels) |
| `statusLabel` | `string` | Optional status indicator text |
| `statusOk` | `boolean` | `true` = green pulse, `false` = red |
| `showNewsletter` | `boolean` | Toggle the newsletter capture column |
| `legal` | `string` | Overrides default "© {year} {brand}" |

## Dimensional adaptation

- Restrained register → remove the status pulse animation (replace with a static dot).
- Texture-high direction → add a noise overlay layer inside `.footer` via `background-image: url(noise-svg-data-uri)` at low opacity.
- Editorial register → drop the newsletter column; move masthead/credits into the brand column.
