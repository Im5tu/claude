# Button — `.astro`

A pure-CSS button with hover, focus, and active states. No JS. Two variants: `primary` (filled with accent) and `ghost` (outline/text only). Also exports `HeroButton` — same mechanics, larger padding + display font for above-the-fold CTAs.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any
- notes: Primary uses `--color-accent`. Ghost uses `--color-primary` and `--color-border`. Active-state press-in is subtle; escalate via the `--scale-pressed` variable on expressive registers only.

## File

### `src/components/ui/Button.astro`

```astro
---
interface Props {
  variant?: "primary" | "ghost";
  as?: "a" | "button";
  href?: string;
  type?: "button" | "submit";
  class?: string;
}
const {
  variant = "primary",
  as = "button",
  href,
  type = "button",
  class: className = "",
  ...rest
} = Astro.props;
const Tag = as === "a" ? "a" : "button";
---
<Tag
  class:list={["btn", `btn-${variant}`, className]}
  href={as === "a" ? href : undefined}
  type={as === "button" ? type : undefined}
  {...rest}
>
  <slot />
</Tag>

<style>
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
    color: var(--color-surface);
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

  @media (prefers-reduced-motion: reduce) {
    .btn { transition: none; }
    .btn:active { scale: 1; }
  }
</style>
```

### `src/components/ui/HeroButton.astro`

```astro
---
interface Props { href?: string; class?: string; }
const { href, class: className = "" } = Astro.props;
---
<a href={href} class:list={["hero-btn", className]}><slot /></a>

<style>
  .hero-btn {
    display: inline-flex;
    align-items: center;
    gap: 0.6rem;
    padding: 1rem 2rem;
    border-radius: 999px;
    background: var(--color-accent);
    color: var(--color-surface);
    font-family: var(--font-display);
    font-size: clamp(1rem, 1.2vw, 1.125rem);
    letter-spacing: -0.01em;
    transition: translate var(--motion-duration-fast) var(--ease-out-soft),
                background-color var(--motion-duration-fast) var(--ease-out-soft);
  }
  .hero-btn:hover { background: var(--color-accent-dark); translate: 0 -2px; }
  .hero-btn:focus-visible { outline: 2px solid var(--color-accent); outline-offset: 4px; }
  @media (prefers-reduced-motion: reduce) {
    .hero-btn, .hero-btn:hover { transition: none; translate: 0 0; }
  }
</style>
```

## Props

| Prop | Type | Default | Notes |
|---|---|---|---|
| `variant` | `"primary" \| "ghost"` | `"primary"` | `HeroButton` is primary-only |
| `as` | `"a" \| "button"` | `"button"` | `"a"` renders as anchor (use `href`) |
| `href` | `string` | — | Required when `as="a"` |
| `type` | `"button" \| "submit"` | `"button"` | Only used when `as="button"` |

## Dimensional adaptation

- Restrained register → remove `translate: 0 -2px` on hero hover; keep color-only changes.
- Texture-high → add a subtle noise or grain `background-image` on primary, or pair with `backdrop-filter: blur(8px)` on ghost variant over imagery.
- Dark surface-depth → swap `color: var(--color-surface)` for `color: var(--color-surface-secondary)` if primary text reads too bright.
