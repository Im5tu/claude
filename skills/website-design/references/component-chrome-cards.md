# Card Hover Tiers — `.astro`

Three hover-interaction tiers for cards. All are pure CSS — no JS. Pick the tier that matches the card's purpose and the direction's motion register.

## Tiers

| Tier | Transforms | Use when |
|---|---|---|
| `LiftCard` | shadow escalation + 2–4px rise | Standard content card (value prop, feature, article teaser) |
| `GlowCard` | outline glow via `box-shadow` in accent colour | Dark-surface sites; accent-forward directions |
| `ZoomCard` | inner image scales 1.0 → 1.04 with `overflow: hidden` | Media-forward cards (portfolio, case study teaser, article with hero image) |

## Dimensional fit

- LiftCard: any register; strongest on light + restrained/moderate.
- GlowCard: dark + moderate/expressive; incongruent on restrained.
- ZoomCard: any register with imagery.

## Files

### `src/components/ui/LiftCard.astro`

```astro
---
interface Props { href?: string; class?: string; }
const { href, class: className = "" } = Astro.props;
const Tag = href ? "a" : "div";
---
<Tag href={href} class:list={["lift-card", className]}>
  <slot />
</Tag>

<style>
  .lift-card {
    display: block;
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
    border-radius: 1.25rem;
    padding: 1.75rem;
    transition:
      translate var(--motion-duration-fast) var(--ease-out-soft),
      box-shadow var(--motion-duration-fast) var(--ease-out-soft),
      border-color var(--motion-duration-fast) var(--ease-out-soft);
  }
  .lift-card:hover {
    translate: 0 -3px;
    border-color: var(--color-border-strong);
    box-shadow: 0 18px 40px -20px rgb(0 0 0 / 0.18);
  }
  @media (prefers-reduced-motion: reduce) {
    .lift-card, .lift-card:hover { transition: none; translate: 0 0; box-shadow: none; }
  }
</style>
```

### `src/components/ui/GlowCard.astro`

```astro
---
interface Props { href?: string; class?: string; }
const { href, class: className = "" } = Astro.props;
const Tag = href ? "a" : "div";
---
<Tag href={href} class:list={["glow-card", className]}>
  <slot />
</Tag>

<style>
  .glow-card {
    display: block;
    background: var(--color-surface-secondary);
    border: 1px solid color-mix(in oklab, var(--color-accent) 30%, transparent);
    border-radius: 1.25rem;
    padding: 1.75rem;
    transition:
      box-shadow var(--motion-duration-base) var(--ease-out-soft),
      border-color var(--motion-duration-base) var(--ease-out-soft);
  }
  .glow-card:hover {
    border-color: var(--color-accent);
    box-shadow: 0 0 0 1px var(--color-accent), 0 20px 60px -30px color-mix(in oklab, var(--color-accent) 60%, transparent);
  }
  @media (prefers-reduced-motion: reduce) {
    .glow-card, .glow-card:hover { transition: none; box-shadow: none; }
  }
</style>
```

### `src/components/ui/ZoomCard.astro`

```astro
---
interface Props { href?: string; class?: string; }
const { href, class: className = "" } = Astro.props;
const Tag = href ? "a" : "div";
---
<Tag href={href} class:list={["zoom-card", className]}>
  <div class="zoom-card__media"><slot name="media" /></div>
  <div class="zoom-card__body"><slot /></div>
</Tag>

<style>
  .zoom-card {
    display: block;
    border-radius: 1.25rem;
    overflow: hidden;
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
  }
  .zoom-card__media {
    aspect-ratio: 4 / 3;
    overflow: hidden;
  }
  .zoom-card__media :global(img) {
    width: 100%; height: 100%; object-fit: cover;
    transition: scale var(--motion-duration-slow) var(--ease-out-soft);
  }
  .zoom-card:hover .zoom-card__media :global(img) { scale: 1.04; }
  .zoom-card__body { padding: 1.5rem; }
  @media (prefers-reduced-motion: reduce) {
    .zoom-card__media :global(img), .zoom-card:hover .zoom-card__media :global(img) {
      transition: none; scale: 1;
    }
  }
</style>
```

## Notes

- Pass `href` to render as an anchor for whole-card links.
- Use `<slot name="media">` for ZoomCard's image; standard `<slot />` for the body.
- All three inherit reduced-motion behaviour from `src/styles/animations.css` global nuke, but the per-component guard above is required as a belt-and-braces.
