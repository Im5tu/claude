# Component Chrome — Index

Chrome components are the persistent, page-framing elements: navbar, footer, global overlays, and utility UI. Chrome is loaded first — before any page sections are composed. Chrome components adapt to the selected style vocabulary through CSS variables — they contain no style-specific conditional code.

## Component Index

| Component | Category | Required | Notes |
|-----------|---------|---------|-------|
| Navbar (Morphing) | Nav | Yes | Pill variant (default) |
| SidebarNav | Nav | Optional | Editorial sites only |
| EnhancedFooter | Footer | Yes | Always use this footer |
| NoiseOverlay | Global | Yes | Every site, opacity varies |
| GSAPProvider | Global | Yes | In layout.tsx |
| Button + HeroButton | UI | Yes | Core interactive element |
| Link Animations | UI | Yes | NavLink, SlideLink, HighlightLink |
| Card Hover Tiers | UI | Yes | LiftCard, GlowCard, ZoomCard |
| FloatingInput | UI | Contextual | Forms only |
| ThemeToggle | UI | Optional | When dark mode is supported |
| GlassCard | UI | Contextual | On rich/colored backgrounds only |

## Navbar Comparison

| Variant | Use When | Visual Weight | Motion Profile | Dimension Fit |
|---|---|---|---|---|
| Navbar (pill) | Default for most sites; floating centered pill morphs to glass on scroll | medium | minimal | contrast-light: high, contrast-dark: medium, energy-moderate: high |
| Navbar (full-width) | Dark-first or restrained sites; flush top, border-bottom on scroll | medium | minimal | contrast-dark: high, contrast-light: high, energy-restrained: high |
| SidebarNav | Editorial/content-heavy sites; fixed left rail on desktop | light | minimal | contrast-light: high, energy-restrained: high |

## Navbar Positioning by Dimensional Signal

| Dimensional Signal | Component | Position | Frosted Glass | Background on Scroll |
|--------|-----------|---------|--------------|---------------------|
| contrast-dark + energy-energetic | `Navbar` variant="pill" | Floating, centered pill | Yes | `bg-white/80` dark |
| contrast-light + energy-moderate + technical | `Navbar` variant="pill" | Floating, centered pill | Yes | `bg-white/80` dark |
| contrast-dark + energy-restrained | `Navbar` variant="full-width" | Flush top, full-width | Yes | `bg-neutral-950/95` |
| contrast-light + energy-restrained | `Navbar` variant="full-width" | Flush top, full-width | No | `bg-white/95`, border-b |
| contrast-light + energy-restrained + texture-high | `Navbar` variant="pill" | Floating, centered pill | Yes | `bg-white/85` |
| contrast-light + energy-restrained + editorial | `SidebarNav` | Fixed left rail | No | Solid `bg-surface-primary` |

## Dark vs Light Navbar Defaults

- **Dark navbar (text is white on transparent):** contrast-dark + energy-energetic, contrast-dark + energy-restrained, texture-high sites (over photo heroes), editorial sidebar (already on surface)
- **Light navbar (text is colored on transparent):** contrast-light + energy-moderate + technical (usually light hero), contrast-light + energy-restrained (always light backgrounds)
- **Both (adapts on scroll):** All pill-variant navbars start white on dark hero, transition to color-on-white when scrolled

## Footer

The `EnhancedFooter` is always `bg-neutral-950` with a `rounded-t-[2rem]` top radius. This is intentional — it provides a dark anchor that works across all dimensional signals. Do not make the footer match the page background.

## NoiseOverlay Opacity by Dimensional Signal

| Dimensional Signal | Opacity | Effect |
|--------|---------|--------|
| contrast-light + energy-restrained | `0.03` | Barely visible — like paper grain |
| contrast-light + energy-restrained + texture-high | `0.04` | Slightly stronger — handcrafted texture |
| contrast-dark + energy-energetic | `0.05` | Visible grain — adds edge and grit |
| contrast-dark + energy-restrained | `0.025` | Very subtle — don't compete with dark surfaces |
| contrast-light + energy-moderate + technical | `0.02` | Minimal — just enough to break flat digital |
| contrast-light + energy-restrained + editorial | `0.03` | Print-like texture |

## When Dark Mode Is Supported

Add `ThemeToggle` to the Navbar's right side when dark mode applies:
- contrast-dark + energy-energetic: Yes
- contrast-light + energy-moderate + technical: Yes
- contrast-dark + energy-restrained: No (always dark — toggle doesn't apply)
- contrast-light + energy-restrained: Optional (most are light-only)
- contrast-light + energy-restrained + texture-high: Optional
- contrast-light + energy-restrained + editorial: Yes

## CSS Variables All Chrome Components Consume

```css
--color-primary         /* Main text color */
--color-secondary       /* Secondary text */
--color-accent          /* Brand action color */
--color-accent-light    /* Hover accent */
--color-accent-dark     /* Active accent */
--color-surface-primary /* Page background */
--color-surface-secondary /* Card / elevated background */
--color-border          /* Default border */
--color-border-strong   /* Hover/active border */
--font-display          /* Heading typeface */
--font-body             /* Body typeface */
```

## Component Files
- [Navbar (Pill/Full-width)](component-chrome-navbar.md) — Morphing pill navbar with IntersectionObserver scroll detection
- [SidebarNav](component-chrome-sidebarnav.md) — Fixed left-rail navigation for editorial/content sites
- [EnhancedFooter](component-chrome-footer.md) — Full-featured footer with brand, nav, newsletter, status
- [NoiseOverlay](component-chrome-noiseoverlay.md) — SVG feTurbulence noise texture overlay
- [GSAPProvider](component-chrome-gsapprovider.md) — Global GSAP setup with ScrollTrigger and reduced-motion
- [Button + HeroButton](component-chrome-button.md) — Multi-variant button with scale-on-interaction physics
- [Link Animations](component-chrome-links.md) — NavLink, SlideLink, HighlightLink underline patterns
- [Card Hover Tiers](component-chrome-cards.md) — LiftCard, GlowCard, ZoomCard hover interaction tiers
- [FloatingInput](component-chrome-floatinginput.md) — Animated floating label form input
- [ThemeToggle](component-chrome-themetoggle.md) — Dark mode toggle with system preference detection
- [GlassCard](component-chrome-glasscard.md) — Frosted glass surface for overlaid UI elements
