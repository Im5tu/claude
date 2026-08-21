# Button

A pure-CSS button with hover, focus, and active states. No JS. Two variants: `primary` (filled with accent) and `ghost` (outline/text only). A hero variant (`hero-btn`) uses the same mechanics with larger padding and the display font for above-the-fold CTAs.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any
- notes: Primary uses `--color-accent`. Ghost uses `--color-primary` and `--color-border`. Active-state press-in is subtle; escalate via the `--scale-pressed` variable on expressive registers only.

## Structure

- `<button type="button|submit">` or `<a href>` with class `btn btn-primary` or `btn btn-ghost`; label (plus optional inline icon) as children
  - Render as `<a>` when the action navigates; render as `<button>` with an explicit `type` for form submits or in-page actions
- Hero CTA: `<a href class="hero-btn">` (primary-only)

## CSS

```css
.btn {
  --scale-pressed: 0.98;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1.5rem;
  border-radius: 999px;
  font-weight: 500;
  letter-spacing: -0.01em;
  border: 1px solid transparent;
  cursor: pointer;
  transition:
    background-color var(--motion-duration-fast) var(--ease-out-soft),
    color var(--motion-duration-fast) var(--ease-out-soft),
    border-color var(--motion-duration-fast) var(--ease-out-soft),
    scale var(--motion-duration-fast) var(--ease-out-soft);
}
.btn:focus-visible {
  outline: 2px solid var(--color-accent);
  outline-offset: 3px;
}
.btn:active { scale: var(--scale-pressed); }

.btn-primary {
  background: var(--color-accent);
  color: var(--color-surface-primary); /* page-background color as text on the accent fill */
}
.btn-primary:hover { background: var(--color-accent-dark); }

.btn-ghost {
  background: transparent;
  color: var(--color-primary);
  border-color: var(--color-border);
}
.btn-ghost:hover {
  border-color: var(--color-border-strong);
  background: color-mix(in oklab, var(--color-primary) 4%, transparent);
}

.hero-btn {
  display: inline-flex;
  align-items: center;
  gap: 0.6rem;
  padding: 1rem 2rem;
  border-radius: 999px;
  background: var(--color-accent);
  color: var(--color-surface-primary);
  font-family: var(--font-display);
  font-size: clamp(1rem, 1.2vw, 1.125rem);
  letter-spacing: -0.01em;
  transition: translate var(--motion-duration-fast) var(--ease-out-soft),
              background-color var(--motion-duration-fast) var(--ease-out-soft);
}
.hero-btn:hover { background: var(--color-accent-dark); translate: 0 -2px; }
.hero-btn:focus-visible { outline: 2px solid var(--color-accent); outline-offset: 4px; }

@media (prefers-reduced-motion: reduce) {
  .btn { transition: none; }
  .btn:active { scale: 1; }
  .hero-btn, .hero-btn:hover { transition: none; translate: 0 0; }
}
```

## Notes

- The hero variant is primary-only; use `.btn-ghost` for secondary hero actions.
- When rendering as `<a>`, an `href` is required; when rendering as `<button>`, set `type` explicitly (`button` or `submit`).

## Dimensional adaptation

- Restrained register: remove `translate: 0 -2px` on hero hover; keep color-only changes.
- Texture-high: add a subtle noise or grain `background-image` on primary, or pair with `backdrop-filter: blur(8px)` on the ghost variant over imagery.
- Dark surface-depth: swap `color: var(--color-surface-primary)` for `color: var(--color-surface-secondary)` if primary text reads too bright.
