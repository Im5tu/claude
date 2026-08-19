# BentoHero — `.astro`

Hero as a grid of tiles. One large headline tile, several supporting tiles (stat, feature, quote, visual). Pure CSS Grid. Tiles stagger in with per-tile `--i` + `animation-delay`.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low, medium
- type-personality: geometric-sans, editorial-display
- notes: Great for multi-product, platform, or technical sites where the hero needs to show breadth. Not for single-proposition brands — use CenteredHero or SplitHero instead.

## File

### `src/components/sections/BentoHero.astro`

```astro
---
import HeroButton from "../ui/HeroButton.astro";

interface Tile {
  kind: "headline" | "stat" | "feature" | "quote" | "media";
  title?: string;
  body?: string;
  value?: string;        // for stat
  src?: string;          // for media
  alt?: string;
  span?: 1 | 2 | 3;
}

interface Props {
  eyebrow?: string;
  headline: string;
  sub?: string;
  cta: { label: string; href: string };
  tiles: Tile[];         // 3-6 supporting tiles
}
const { eyebrow, headline, sub, cta, tiles } = Astro.props;
---
<section class="bento">
  <div class="bento__grid">
    <div class="bento__cell bento__cell--hero" style="--i: 0;">
      {eyebrow && <p class="bento__eyebrow">{eyebrow}</p>}
      <h1 class="bento__headline">{headline}</h1>
      {sub && <p class="bento__sub">{sub}</p>}
      <div class="bento__cta"><HeroButton href={cta.href}>{cta.label}</HeroButton></div>
    </div>

    {tiles.map((t, idx) => (
      <div class:list={["bento__cell", `bento__cell--${t.kind}`, `span-${t.span ?? 1}`]} style={`--i: ${idx + 1};`}>
        {t.kind === "stat" && (
          <>
            <p class="bento__cell-value">{t.value}</p>
            <p class="bento__cell-label">{t.title}</p>
          </>
        )}
        {t.kind === "feature" && (
          <>
            <p class="bento__cell-title">{t.title}</p>
            <p class="bento__cell-body">{t.body}</p>
          </>
        )}
        {t.kind === "quote" && (
          <figure>
            <blockquote>“{t.body}”</blockquote>
            {t.title && <figcaption>{t.title}</figcaption>}
          </figure>
        )}
        {t.kind === "media" && t.src && (
          <img src={t.src} alt={t.alt ?? ""} width="800" height="600" />
        )}
      </div>
    ))}
  </div>
</section>

<style>
  .bento {
    max-width: 80rem;
    margin: 0 auto;
    padding: 6rem 1.5rem 3rem;
  }
  .bento__grid {
    display: grid;
    gap: 1rem;
    grid-template-columns: repeat(6, 1fr);
    grid-auto-rows: minmax(12rem, auto);
  }
  .bento__cell {
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
    border-radius: 1.25rem;
    padding: 1.75rem;
    grid-column: span 2;
    opacity: 0;
    translate: 0 16px;
    animation: bento-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i, 0) * 80ms);
  }
  .bento__cell--hero {
    grid-column: span 6;
    grid-row: span 2;
    background: var(--color-surface);
    padding: 2.5rem;
  }
  @media (min-width: 1024px) {
    .bento__cell--hero { grid-column: span 4; }
  }
  .bento__cell.span-2 { grid-column: span 4; }
  .bento__cell.span-3 { grid-column: span 6; }

  .bento__eyebrow {
    font-family: var(--font-mono);
    font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
    color: var(--color-accent);
  }
  .bento__headline {
    font-family: var(--font-display);
    font-size: clamp(2.25rem, 4.5vw, 3.5rem);
    letter-spacing: -0.03em; line-height: 1;
    margin-top: 1rem; max-width: 18ch; text-wrap: balance;
  }
  .bento__sub { margin-top: 1rem; color: var(--color-secondary); max-width: 48ch; }
  .bento__cta { margin-top: 1.5rem; }

  .bento__cell-value {
    font-family: var(--font-display);
    font-size: clamp(2rem, 3.5vw, 3rem);
    letter-spacing: -0.02em; line-height: 1;
    color: var(--color-accent);
  }
  .bento__cell-label { margin-top: 0.5rem; opacity: 0.7; font-size: 0.875rem; }
  .bento__cell-title {
    font-family: var(--font-display);
    font-size: 1.25rem; letter-spacing: -0.01em;
  }
  .bento__cell-body { margin-top: 0.5rem; color: var(--color-secondary); }
  .bento__cell--media img {
    width: 100%; height: 100%;
    object-fit: cover;
    border-radius: 0.75rem;
  }

  @keyframes bento-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .bento__cell { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<BentoHero
  eyebrow="Halcyon Platform"
  headline="The boring bits of your stack, handled."
  sub="Auth, billing, observability. One bill, one escalation path, zero pagers for your team."
  cta={{ label: "See the platform", href: "/platform" }}
  tiles={[
    { kind: "stat", value: "99.99%", title: "SLO across 14 regions" },
    { kind: "feature", title: "Zero-touch auth", body: "Passkeys, magic link, and MFA from day one." },
    { kind: "quote", title: "— Meridian, Head of Platform", body: "We got six engineering weeks back per quarter." },
    { kind: "stat", value: "8m", title: "Mean rollout window" },
  ]}
/>
```

## Notes

- Keep supporting tiles to 3–6. Fewer feels sparse; more overwhelms.
- `span` values allow a 1/2/3-column mix for rhythm.
- All tiles respect the global `--color-border`/`--color-surface-secondary` tokens so palette changes propagate instantly.
