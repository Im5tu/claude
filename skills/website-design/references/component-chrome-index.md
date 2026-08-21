# Component chrome index

Chrome components are the persistent, page-framing elements: navbar, footer, global overlays, and utility UI. Chrome is loaded first, before any page sections are composed. Chrome components adapt to the direction card via CSS custom properties declared in the global stylesheet.

Stack reminder: every chrome piece is static (HTML + CSS only) unless state drives timing; then it carries the minimum JS behavior described in its spec's Behavior section. No GSAP, no external animation libraries. See `core-animation.md` for the animation patterns used here.

## Component index

| Component | Kind | Required | Notes |
|---|---|---|---|
| Navbar | Static (+ small mobile-menu behavior) | Yes | Scroll morph via CSS `animation-timeline: scroll(root)` |
| SidebarNav | Needs JS behavior | Optional | Content-heavy/editorial layouts only |
| Footer | Static | Yes | Dark anchor, full grid |
| NoiseOverlay | Static | Yes | SVG feTurbulence; opacity from direction card |
| Button | Static | Yes | CSS transitions only |
| Links | Static | Yes | NavLink, SlideLink, HighlightLink — underline reveal via CSS |
| Cards | Static | Yes | LiftCard, GlowCard, ZoomCard — CSS hover |
| FloatingInput | Static | Contextual | Forms only |
| ThemeToggle | Needs JS behavior | Optional | When dark mode is supported; behavior must attach before paint concerns arise (see spec) |
| GlassCard | Static | Contextual | Only over rich backgrounds |

Note: the old `GSAPProvider` chrome component has been removed. Animation setup lives in the global animation stylesheet plus per-component styles. No global provider is needed.

## Navbar variant selection by dimensional position

| Dimensional position | Variant | Position | Scroll morph | Background on scroll |
|---|---|---|---|---|
| Dark + expressive | Pill | Floating centered | Yes | `color-mix(in oklab, var(--color-surface-primary) 80%, transparent)` + blur |
| Light + moderate + technical | Pill | Floating centered | Yes | `color-mix(in oklab, var(--color-surface-primary) 80%, transparent)` + blur |
| Dark + restrained | Full-width | Flush top | Yes | Near-opaque surface + subtle border |
| Light + restrained | Full-width | Flush top | Subtle | Near-opaque surface + border-bottom |
| Light + restrained + texture-high | Pill | Floating centered | Yes | Warm surface at 85% |
| Light + restrained + editorial | Sidebar | Fixed left rail | None | Solid surface-primary |

**Dark navbar (white text on transparent):** dark surface-depth with any motion register; texture-high over a photo hero; editorial sidebar (already on its own surface).
**Light navbar (colored text on transparent):** light surface-depth (all cases).
**Morphs on scroll:** all pill variants — transparent over hero, frosted once scrolled.

## Footer

The footer is always rendered on a deep dark surface with a rounded top edge, regardless of page palette. This is intentional — it provides a dark anchor that works across all dimensional positions. Do not make the footer match the page background.

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

Declared once in the global stylesheet:

```css
--color-primary          /* plus -light / -dark */
--color-secondary
--color-accent
--color-accent-light
--color-accent-dark
--color-surface-primary
--color-surface-secondary
--color-surface-elevated
--color-surface-sunken
--color-text-primary
--color-text-secondary
--color-text-disabled
--color-border
--color-border-strong
--font-display
--font-body
--font-mono
--ease-out-soft
--motion-duration-fast
--motion-duration-base
--motion-duration-slow
--motion-stagger
```

## Component specs

- [Navbar](component-chrome-navbar.md) — Scroll-morphing top bar (CSS `animation-timeline: scroll()`)
- [SidebarNav](component-chrome-sidebarnav.md) — Fixed left-rail nav for editorial sites
- [Footer](component-chrome-footer.md) — Full-featured dark footer
- [NoiseOverlay](component-chrome-noiseoverlay.md) — SVG feTurbulence texture overlay
- [Button](component-chrome-button.md) — Multi-variant button with CSS hover/focus
- [Links](component-chrome-links.md) — NavLink, SlideLink, HighlightLink
- [Cards](component-chrome-cards.md) — LiftCard, GlowCard, ZoomCard hover tiers
- [FloatingInput](component-chrome-floatinginput.md) — Floating-label input, pure CSS
- [ThemeToggle](component-chrome-themetoggle.md) — Dark mode toggle, localStorage + prefers-color-scheme
- [GlassCard](component-chrome-glasscard.md) — Frosted glass surface for overlays
