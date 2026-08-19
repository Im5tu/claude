# BentoGrid — `.astro`

Asymmetric grid of content tiles. Each tile represents a feature/product/facet. Pure CSS Grid with per-tile `--i` stagger on entrance (`animation-timeline: view()`).

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low, medium
- type-personality: geometric-sans, editorial-display
- notes: Great for multi-faceted product or service firms. Not for single-proposition brands.

## File

### `src/components/sections/BentoGrid.astro`

```astro
---
interface Tile {
  title: string;
  body: string;
  eyebrow?: string;
  media?: string;
  span?: 1 | 2 | 3;
  tall?: boolean;
}
interface Props {
  title?: string;
  kicker?: string;
  tiles: Tile[];
}
const { title, kicker, tiles } = Astro.props;
---
<section class="bg">
  {(title || kicker) && (
    <div class="bg__header">
      {kicker && <p class="bg__kicker">{kicker}</p>}
      {title && <h2 class="bg__title">{title}</h2>}
    </div>
  )}
  <div class="bg__grid">
    {tiles.map((t, i) => (
      <article
        class:list={["bg__tile", `span-${t.span ?? 1}`, t.tall && "bg__tile--tall"]}
        style={`--i: ${i};`}
      >
        {t.media && <img src={t.media} alt="" width="800" height="600" loading="lazy" />}
        <div class="bg__tile-body">
          {t.eyebrow && <p class="bg__tile-eyebrow">{t.eyebrow}</p>}
          <h3 class="bg__tile-title">{t.title}</h3>
          <p class="bg__tile-text">{t.body}</p>
        </div>
      </article>
    ))}
  </div>
</section>

<style>
  .bg {
    max-width: 80rem; margin: 0 auto;
    padding: 5rem 1.5rem;
  }
  .bg__header { max-width: 52rem; margin-bottom: 3rem; }
  .bg__kicker {
    font-family: var(--font-mono);
    font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
    color: var(--color-accent);
  }
  .bg__title {
    font-family: var(--font-display);
    font-size: clamp(2rem, 4vw, 3rem);
    letter-spacing: -0.02em; line-height: 1.05;
    margin-top: 0.75rem; max-width: 22ch; text-wrap: balance;
  }
  .bg__grid {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 1rem;
    grid-auto-rows: minmax(12rem, auto);
  }
  .bg__tile {
    grid-column: span 3;
    display: flex; flex-direction: column;
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
    border-radius: 1.25rem;
    overflow: hidden;
    transition: border-color var(--motion-duration-fast) var(--ease-out-soft);
    opacity: 0; translate: 0 14px;
    animation: bg-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i) * 80ms);
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .bg__tile.span-2 { grid-column: span 4; }
  .bg__tile.span-3 { grid-column: span 6; }
  .bg__tile--tall { grid-row: span 2; }
  .bg__tile:hover { border-color: var(--color-border-strong); }
  .bg__tile img {
    width: 100%; aspect-ratio: 4 / 3; object-fit: cover;
  }
  .bg__tile-body { padding: 1.5rem; }
  .bg__tile-eyebrow {
    font-size: 0.75rem; letter-spacing: 0.1em; text-transform: uppercase;
    color: var(--color-accent);
  }
  .bg__tile-title {
    font-family: var(--font-display);
    font-size: 1.25rem;
    letter-spacing: -0.01em;
    margin-top: 0.5rem;
  }
  .bg__tile-text { margin-top: 0.5rem; color: var(--color-secondary); max-width: 40ch; }

  @media (max-width: 768px) {
    .bg__grid { grid-template-columns: 1fr; }
    .bg__tile, .bg__tile.span-2, .bg__tile.span-3 { grid-column: auto; }
  }
  @keyframes bg-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .bg__tile { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<BentoGrid
  kicker="What we run"
  title="Six boring things, well-operated."
  tiles={[
    { title: "Auth", body: "Passkeys, social, and MFA as standard.", span: 2, tall: true, eyebrow: "01" },
    { title: "Billing", body: "Stripe + Polar, metered + subscription.", eyebrow: "02" },
    { title: "Observability", body: "OTel everywhere; you own the data.", eyebrow: "03" },
    { title: "Runbooks", body: "Plain-English SOPs, version controlled.", span: 2, eyebrow: "04" },
    { title: "Feature flags", body: "Gradual rollout + kill switch.", eyebrow: "05" },
    { title: "Secrets", body: "Short-lived tokens, rotated weekly.", eyebrow: "06" },
  ]}
/>
```
