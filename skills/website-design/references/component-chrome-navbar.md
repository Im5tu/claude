# Navbar

Fixed navbar that starts transparent and morphs to frosted glass as the page scrolls past a threshold. The morph is pure CSS via `animation-timeline: scroll(root)`; no IntersectionObserver, no scroll listener. Only the mobile menu open/close state needs a small amount of JS.

## Dimensional fit

- surface-depth: any (two variants: pill for light/expressive, full-width for dark/restrained)
- motion-register: any
- texture-appetite: any
- type-personality: any
- notes: The threshold (default 160px) can be raised for tall heroes. See `core-animation.md` §Navbar scroll morph.

## Structure

- `<header class="nav nav-pill">` or `<header class="nav nav-full-width">`, fixed to the top
  - `<div class="nav__inner">` flex row, space-between
    - `<a href="/" class="nav__brand">` wordmark
    - `<nav class="nav__links" aria-label="Primary">` of nav links (see the links spec), hidden below 768px
    - `<div class="nav__actions">`: optional theme toggle, optional `<a class="nav__cta">`, and the mobile menu toggle `<button aria-expanded aria-label="Toggle menu">` with menu/close icons (inline SVG), shown below 768px only
- Mobile menu panel: fixed full-screen sheet below the bar (`inset: 56px 0 0 0`), background `var(--color-surface-primary)`, `z-index: 40`, containing a `<ul>` of the same links at 1.25rem size plus the CTA as a pill button

## CSS

```css
.nav {
  position: fixed;
  inset: 0 0 auto 0;
  z-index: 50;
  /* Static fallback: engines without scroll-driven animations get the frosted
     state permanently rather than an unreadable transparent bar. */
  background: color-mix(in oklab, var(--color-surface-primary) 85%, transparent);
  backdrop-filter: blur(10px);
  border-bottom: 1px solid transparent;
}
@supports (animation-timeline: scroll(root)) {
  .nav {
    background: transparent;
    backdrop-filter: blur(0);
    animation: nav-morph linear both;
    animation-timeline: scroll(root);
    animation-range: 0 160px;
  }
}
@keyframes nav-morph {
  to {
    background: color-mix(in oklab, var(--color-surface-primary) 75%, transparent);
    backdrop-filter: blur(14px);
    border-bottom-color: color-mix(in oklab, currentColor 10%, transparent);
  }
}
@media (prefers-reduced-motion: reduce) {
  .nav { animation: none; background: color-mix(in oklab, var(--color-surface-primary) 85%, transparent); backdrop-filter: blur(10px); }
}

.nav__inner {
  max-width: 80rem;
  margin: 0 auto;
  padding: 0.75rem 1.5rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 2rem;
}

.nav-pill .nav__inner {
  max-width: 64rem;
  margin: 0.75rem auto 0;
  border-radius: 999px;
  border: 1px solid color-mix(in oklab, currentColor 8%, transparent);
}

.nav__brand { font-family: var(--font-display); font-size: 1.125rem; letter-spacing: -0.02em; }

.nav__links { display: none; gap: 1.5rem; }
@media (min-width: 768px) { .nav__links { display: flex; } }

.nav__actions { display: flex; align-items: center; gap: 1rem; }

.nav__cta {
  display: none;
  padding: 0.5rem 1.25rem;
  border-radius: 999px;
  background: var(--color-accent);
  color: var(--color-surface-primary);
  font-size: 0.875rem;
  transition: background var(--motion-duration-fast) var(--ease-out-soft);
}
.nav__cta:hover { background: var(--color-accent-dark); }
@media (min-width: 768px) { .nav__cta { display: inline-flex; } }
```

## Behavior

- Clicking the mobile toggle flips the panel open/closed and mirrors the state on the button's `aria-expanded`; the icon swaps between menu and close glyphs.
- Pressing Escape closes the panel (a document-level keydown listener, removed when the component is torn down).
- Clicking any link or the CTA inside the panel closes it before navigation.
- The panel and toggle exist only below the 768px breakpoint; desktop links are plain CSS.
- The scroll morph itself needs no JS at any width.

## Notes

- The theme toggle, when the site supports both themes, sits in `.nav__actions` before the CTA (see the theme toggle spec).
- Mobile menu link list: grid, `gap: 1rem`, font-size 1.25rem; CTA styled as an accent pill (`padding: 0.5rem 1.25rem; border-radius: 999px; background: var(--color-accent); color: var(--color-surface-primary);`) with `margin-top: 1rem`.

## Dimensional adaptation

- Pill variant: centered rounded bar at top, 0.75rem gutter from viewport top.
- Full-width variant: flush top, no pill inner border.
- Dark + restrained: `nav-morph` target becomes a near-opaque surface instead of translucent.
- Editorial: replace with the sidebar nav instead of this component.
