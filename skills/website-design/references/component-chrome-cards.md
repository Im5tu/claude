# Card hover tiers

Three hover-interaction tiers for cards. All are pure CSS, no JS. Pick the tier that matches the card's purpose and the direction's motion register.

## Tiers

| Tier | Transforms | Use when |
|---|---|---|
| Lift card | shadow escalation + 2–4px rise | Standard content card (value prop, feature, article teaser) |
| Glow card | outline glow via `box-shadow` in accent colour | Dark-surface sites; accent-forward directions |
| Zoom card | inner image scales 1.0 → 1.04 with `overflow: hidden` | Media-forward cards (portfolio, case study teaser, article with hero image) |

## Dimensional fit

- LiftCard: any register; strongest on light + restrained/moderate.
- GlowCard: dark + moderate/expressive; incongruent on restrained.
- ZoomCard: any register with imagery.

## Structure

- Lift card: `<a href>` (whole-card link) or `<div>` with class `lift-card`; content as children
- Glow card: same shape with class `glow-card`
- Zoom card: `<a href>` or `<div>` with class `zoom-card`
  - `<div class="zoom-card__media">` wrapping the `<img>`
  - `<div class="zoom-card__body">` wrapping the text content

## CSS

```css
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
.zoom-card__media img {
  width: 100%; height: 100%; object-fit: cover;
  transition: scale var(--motion-duration-slow) var(--ease-out-soft);
}
.zoom-card:hover .zoom-card__media img { scale: 1.04; }
.zoom-card__body { padding: 1.5rem; }

@media (prefers-reduced-motion: reduce) {
  .lift-card, .lift-card:hover { transition: none; translate: 0 0; box-shadow: none; }
  .glow-card, .glow-card:hover { transition: none; box-shadow: none; }
  .zoom-card__media img, .zoom-card:hover .zoom-card__media img { transition: none; scale: 1; }
}
```

## Notes

- Use an `<a>` root for whole-card links; a `<div>` otherwise.
- All three should also inherit the global reduced-motion nuke from the site stylesheet, but the per-component guard above is required as a belt-and-braces.
