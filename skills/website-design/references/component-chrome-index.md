# Component Chrome — Index

Chrome components are the persistent, page-framing elements: navbar, footer, global overlays, and utility UI. Chrome is loaded first — before any page sections are composed. Chrome components adapt to the direction card via CSS custom properties declared in `src/styles/global.css` (`@theme` block).

Stack reminder: every chrome piece is an `.astro` component unless state drives timing — then it's a SolidJS island `.tsx` hydrated with the minimum `client:*` directive needed. No GSAP, no React. See `core-animation.md` for the animation patterns used here.

## Component Index

| Component | File kind | Required | Notes |
|---|---|---|---|
| Navbar | `.astro` (+ optional mobile-menu island) | Yes | Scroll morph via CSS `animation-timeline: scroll(root)` |
| SidebarNav | Solid island | Optional | Content-heavy/editorial layouts only |
| Footer | `.astro` | Yes | Dark anchor, full grid |
| NoiseOverlay | `.astro` | Yes | SVG feTurbulence; opacity from direction card |
| Button | `.astro` (slot) | Yes | CSS transitions only |
| Links | `.astro` | Yes | NavLink, SlideLink, HighlightLink — underline reveal via CSS |
| Cards | `.astro` | Yes | LiftCard, GlowCard, ZoomCard — CSS hover |
| FloatingInput | `.astro` | Contextual | Forms only |
| ThemeToggle | Solid island | Optional | When dark mode is supported; `client:load` |
| GlassCard | `.astro` | Contextual | Only over rich backgrounds |

Note: the old `GSAPProvider` chrome component has been removed. Animation setup lives in CSS (`src/styles/animations.css`) plus per-component scoped styles. No global provider is needed.

## Navbar Variant Selection by Dimensional Position

| Dimensional position | Variant | Position | Scroll morph | Background on scroll |
|---|---|---|---|---|
| Dark + expressive | Pill | Floating centered | Yes | `color-mix(var(--color-surface), 80%, transparent)` + blur |
| Light + moderate + technical | Pill | Floating centered | Yes | `color-mix(var(--color-surface), 80%, transparent)` + blur |
| Dark + restrained | Full-width | Flush top | Yes | Near-opaque surface + subtle border |
| Light + restrained | Full-width | Flush top | Subtle | Near-opaque surface + border-bottom |
| Light + restrained + texture-high | Pill | Floating centered | Yes | Warm surface at 85% |
| Light + restrained + editorial | Sidebar | Fixed left rail | None | Solid surface-primary |

**Dark navbar (white text on transparent):** dark surface-depth with any motion register; texture-high over a photo hero; editorial sidebar (already on its own surface).
**Light navbar (colored text on transparent):** light surface-depth (all cases).
**Morphs on scroll:** all pill variants — transparent over hero, frosted once scrolled.

## Footer

`Footer.astro` is always rendered on a deep dark surface with a rounded top edge, regardless of page palette. This is intentional — it provides a dark anchor that works across all dimensional positions. Do not make the footer match the page background.

## NoiseOverlay opacity by dimensional position

| Dimensional position | Opacity | Effect |
|---|---|---|
| Light + restrained | 0.03 | Barely visible paper grain |
| Light + restrained + texture-high | 0.04 | Stronger — handcrafted feel |
| Dark + expressive | 0.05 | Visible grain — edge and grit |
| Dark + restrained | 0.025 | Very subtle — don't compete with dark surfaces |
| Light + moderate + technical | 0.02 | Minimal — breaks flat digital |
| Light + restrained + editorial | 0.03 | Print-like texture |

## When to include ThemeToggle

Only include if the site actually supports both light and dark themes. Always-dark or always-light sites do not need a toggle.

## CSS variables every chrome component consumes

Declared once in `src/styles/global.css` inside `@theme`:

```css
--color-primary
--color-secondary
--color-accent
--color-accent-light
--color-accent-dark
--color-surface
--color-surface-secondary
--color-border
--color-border-strong
--font-display
--font-body
--font-mono
--ease-out-soft
--motion-duration-base
--motion-stagger
```

## Component Files

- [Navbar](component-chrome-navbar.md) — Scroll-morphing top bar (CSS `animation-timeline: scroll()`)
- [SidebarNav](component-chrome-sidebarnav.md) — Fixed left-rail nav for editorial sites
- [Footer](component-chrome-footer.md) — Full-featured dark footer
- [NoiseOverlay](component-chrome-noiseoverlay.md) — SVG feTurbulence texture overlay
- [Button](component-chrome-button.md) — Multi-variant button with CSS hover/focus
- [Links](component-chrome-links.md) — NavLink, SlideLink, HighlightLink
- [Cards](component-chrome-cards.md) — LiftCard, GlowCard, ZoomCard hover tiers
- [FloatingInput](component-chrome-floatinginput.md) — Floating-label input, pure CSS
- [ThemeToggle](component-chrome-themetoggle.md) — Solid island, localStorage + prefers-color-scheme
- [GlassCard](component-chrome-glasscard.md) — Frosted glass surface for overlays
