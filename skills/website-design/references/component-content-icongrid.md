# IconGrid — `.astro`

Grid of icon + title + short body. Short feature lists at 3, 4, or 6 items. Icons from `astro-icon` (or inline SVG). Pure `.astro`; per-cell staggered entrance.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: low, medium
- type-personality: any
- notes: The most flexible content component. Drop in anywhere a short list of facets is needed.

## File

### `src/components/sections/IconGrid.astro`

```astro
---
interface Item {
  iconSvg: string;      // Inline SVG markup (path d) — kept simple to avoid dependency
  title: string;
  body: string;
}
interface Props {
  kicker?: string;
  title?: string;
  items: Item[];
  columns?: 3 | 4;
}
const { kicker, title, items, columns = 3 } = Astro.props;
---
<section class="ig">
  {(kicker || title) && (
    <header class="ig__header">
      {kicker && <p class="ig__kicker">{kicker}</p>}
      {title && <h2 class="ig__title">{title}</h2>}
    </header>
  )}
  <div class="ig__grid" style={`--cols: ${columns};`}>
    {items.map((it, i) => (
      <div class="ig__cell" style={`--i: ${i};`}>
        <span class="ig__icon" set:html={it.iconSvg}></span>
        <h3 class="ig__cell-title">{it.title}</h3>
        <p class="ig__cell-body">{it.body}</p>
      </div>
    ))}
  </div>
</section>

<style>
  .ig { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
  .ig__header { max-width: 52rem; margin-bottom: 3rem; }
  .ig__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
  .ig__title { font-family: var(--font-display); font-size: clamp(1.75rem, 3.5vw, 2.5rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 24ch; }

  .ig__grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 2.5rem 2rem;
  }
  @media (min-width: 640px) {
    .ig__grid { grid-template-columns: repeat(2, 1fr); }
  }
  @media (min-width: 1024px) {
    .ig__grid { grid-template-columns: repeat(var(--cols, 3), 1fr); }
  }

  .ig__cell {
    opacity: 0; translate: 0 14px;
    animation: ig-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i) * 70ms);
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ig__icon {
    display: inline-flex;
    width: 2.5rem; height: 2.5rem;
    color: var(--color-accent);
    margin-bottom: 1rem;
  }
  .ig__icon svg { width: 100%; height: 100%; }
  .ig__cell-title {
    font-family: var(--font-display);
    font-size: 1.125rem;
    letter-spacing: -0.01em;
  }
  .ig__cell-body { margin-top: 0.5rem; color: var(--color-secondary); max-width: 44ch; }

  @keyframes ig-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .ig__cell { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
---
const arrow = `<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M5 12h14M13 5l7 7-7 7"/></svg>`;
---
<IconGrid
  kicker="What's included"
  title="Everything you'd expect, nothing you wouldn't."
  items={[
    { iconSvg: arrow, title: "Passkey login", body: "One-tap sign-in on iOS, Android, and desktop." },
    { iconSvg: arrow, title: "Magic links", body: "Email fallback for devices that don't support passkeys." },
    { iconSvg: arrow, title: "Social sign-in", body: "Google and Apple out of the box." },
    { iconSvg: arrow, title: "Admin tools", body: "Impersonate, suspend, audit — built in." },
    { iconSvg: arrow, title: "Two-factor", body: "TOTP + backup codes. Configurable per tenant." },
    { iconSvg: arrow, title: "Session control", body: "Revoke any device, any time." },
  ]}
/>
```

## Rules

- No "icons inside coloured circles" — that's banned by `core-anti-patterns.md`. Use the icon inline at natural size.
- If you don't have real icons, use letterforms (A, B, C) or number decoration instead of generic pictograms.
