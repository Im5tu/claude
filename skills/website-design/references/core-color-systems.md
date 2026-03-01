# Color Systems — Palette Structure, Dark Mode & Tailwind v4

---

## Tailwind CSS v4 @theme Pattern

Every project defines its color system in `globals.css` via Tailwind v4's `@theme` directive:

```css
@import "tailwindcss";

@theme {
  /* ── Brand ── */
  --color-primary: #0F172A;
  --color-primary-light: #1E293B;
  --color-primary-dark: #080E1A;
  --color-secondary: #475569;
  --color-accent: #6366F1;
  --color-accent-light: #818CF8;
  --color-accent-dark: #4F46E5;

  /* ── Semantic ── */
  --color-success: #10B981;
  --color-warning: #F59E0B;
  --color-error: #EF4444;
  --color-info: #3B82F6;

  /* ── Surfaces ── */
  --color-surface-primary: #FFFFFF;
  --color-surface-secondary: #F8FAFC;
  --color-surface-elevated: #FFFFFF;
  --color-surface-sunken: #F1F5F9;

  /* ── Text ── */
  --color-text-primary: #0F172A;
  --color-text-secondary: #64748B;
  --color-text-disabled: #94A3B8;

  /* ── Borders ── */
  --color-border: #E2E8F0;
  --color-border-strong: #CBD5E1;
}
```

This generates Tailwind utilities like `bg-primary`, `text-accent`, `border-border`, etc.

---

## Color Token Architecture

### Tier 1: Brand Tokens (the actual colors)

| Token | Purpose |
|-------|---------|
| `primary` | Brand's dominant color — text on light, large surfaces on dark |
| `primary-light` | Hover state for primary (+10% lightness) |
| `primary-dark` | Active/pressed state for primary (-10% lightness) |
| `secondary` | Supporting color — secondary text, subtle UI |
| `accent` | CTAs, links, interactive highlights — the "action" color |
| `accent-light` | Hover state for accent |
| `accent-dark` | Active state for accent |

### Tier 2: Semantic Tokens (what colors mean)

| Token | Color | Usage |
|-------|-------|-------|
| `success` | Green | Confirmation, positive states, check marks |
| `warning` | Amber | Caution, pending states |
| `error` | Red | Errors, destructive actions, validation failures |
| `info` | Blue | Informational, neutral status |

### Tier 3: Surface Tokens (where colors go)

| Token | Light Mode | Dark Mode | Usage |
|-------|-----------|-----------|-------|
| `surface-primary` | White | Deep dark (#0A-#12) | Page background |
| `surface-secondary` | Near-white (neutral-50) | Slightly lighter (#14-#1A) | Card backgrounds, section alternation |
| `surface-elevated` | White + shadow | Lighter (#1E-#24) + border | Modals, dropdowns, popovers |
| `surface-sunken` | Slightly darker (neutral-100) | Darker (#06-#0A) | Input backgrounds, inset areas |

---

## Dark Mode Strategy

### Principles

1. **Dark mode is independently designed** — never auto-invert light mode
2. **Use rich blacks, not pure black** — add subtle color tint (blue-black `#0A0A14`, warm-black `#0F0A08`)
3. **Text at 90-95% white** — pure #FFFFFF is too harsh on dark backgrounds. Use `#F0F0F5` or similar.
4. **Accent colors may need adjustment** — lighten 10-15% for sufficient contrast on dark surfaces
5. **Shadows become borders/glows** — dark surfaces absorb drop shadows. Use `border` + subtle glow instead.
6. **Reduce image brightness** — apply `brightness(0.9) contrast(1.05)` to images in dark mode

### Implementation with Tailwind v4

Use the `dark:` variant with class strategy:

```css
/* In globals.css — define dark overrides */
.dark {
  --color-surface-primary: #0A0A12;
  --color-surface-secondary: #14141E;
  --color-surface-elevated: #1E1E2A;
  --color-surface-sunken: #060609;

  --color-text-primary: #F0F0F5;
  --color-text-secondary: #888899;
  --color-text-disabled: #4A4A5A;

  --color-border: #1E1E2E;
  --color-border-strong: #2E2E42;

  --color-accent: #818CF8;        /* Lightened for contrast */
  --color-accent-light: #A5B4FC;
}
```

Toggle mechanism: add/remove `dark` class on `<html>` element. See `micro-interactions.md` for the ThemeToggle component.

### Dark Mode Shadow System

```css
/* Light mode shadows */
--shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.04);
--shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.08), 0 2px 4px -2px rgba(0, 0, 0, 0.04);
--shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.10), 0 4px 6px -4px rgba(0, 0, 0, 0.04);

/* Dark mode — border-based + optional glow */
.dark {
  --shadow-sm: 0 0 0 1px var(--color-border), 0 1px 3px rgba(0, 0, 0, 0.30);
  --shadow-md: 0 0 0 1px var(--color-border), 0 4px 8px rgba(0, 0, 0, 0.40);
  --shadow-lg: 0 0 0 1px var(--color-border), 0 8px 20px rgba(0, 0, 0, 0.50);
  --shadow-glow: 0 0 20px rgba(var(--color-accent-rgb), 0.15);
}
```

---

## Neutral Scale Generation

Neutrals should have a subtle color tint — not pure gray. Derive the undertone from the **brand's color palette**, not from the preset name:

- If the brand's primary colors are in the warm spectrum (reds, oranges, yellows, earth tones) → use warm neutrals (hue 30–45, amber/stone)
- If the brand's primary colors are cool (blues, greens, blue-violets) → use cool neutrals (hue 220–240, blue/slate)
- If the brand palette is deliberately neutral or achromatic (monochrome, black/white, minimal palette) → use balanced neutrals (hue 210–220, light blue-gray)

The preset is a correlation, not the signal — a Clean SaaS brand with an earth-tone palette should use warm neutrals, not blue-slate. A Warm Artisan brand with a deliberately cool palette should use cool neutrals, not amber/stone.

### Scale Structure

| Token | Lightness | Usage |
|-------|-----------|-------|
| `neutral-50` | 97-98% | Subtle backgrounds |
| `neutral-100` | 95-96% | Input backgrounds, hover states |
| `neutral-200` | 89-91% | Borders, dividers |
| `neutral-300` | 82-84% | Strong borders, disabled text bg |
| `neutral-400` | 62-65% | Placeholder text, disabled icons |
| `neutral-500` | 45-48% | Secondary text |
| `neutral-600` | 33-36% | Body text on light backgrounds |
| `neutral-700` | 25-28% | Headings, strong text |
| `neutral-800` | 15-18% | Primary text |
| `neutral-900` | 10-12% | Darkest text, near-black |
| `neutral-950` | 4-6% | True dark, dark mode surfaces |

---

## Contrast Requirements

### WCAG 2.2 AA Minimums

| Content | Ratio | How to Check |
|---------|-------|-------------|
| Normal text (< 18px) on background | 4.5:1 | Primary text on surface-primary |
| Large text (>= 24px bold or >= 18.67px) | 3:1 | Headings on any surface |
| UI components (borders, icons, inputs) | 3:1 | Borders, focus rings, icon buttons |
| Decorative/disabled elements | No requirement | Disabled states, dividers |

### Common Pitfalls

- Light gray text on white (`#94A3B8` on `#FFFFFF` = 3.0:1 — FAILS for body text)
- Accent on dark surface without adjustment (dark blue on near-black)
- Placeholder text that's too light to read

---

## Brand Color Override Rules

When the user provides their own hex codes:

1. **Use provided primary** as `--color-primary`
2. **Generate light/dark variants:**
   - `primary-light`: +10% lightness (HSL)
   - `primary-dark`: -10% lightness (HSL)
3. **Use provided accent** as `--color-accent`
4. **Generate accent variants** the same way
5. **Keep non-color decisions from the preset:** typography, spacing, motion, interactions. For neutrals, derive undertone from the provided primary color's temperature (warm primaries → warm neutrals; cool primaries → cool neutrals) rather than from the preset name.
6. **Verify contrast** — if the provided colors don't meet AA contrast on the preset's surfaces, adjust the surface colors slightly
7. **Generate dark mode variants** — accent may need to lighten further for dark surfaces

---

## Preset Color Palette Structure

Each preset file includes a complete color section in this format:

```
### Light Palette
- Brand colors (primary, secondary, accent with light/dark variants)
- Surface tokens (primary, secondary, elevated, sunken)
- Text tokens (primary, secondary, disabled)
- Border tokens (default, strong)

### Dark Palette
- All of the above, independently designed for dark surfaces
- Accent may be adjusted for contrast
- Shadows shift to border+glow based

### Tailwind @theme Block
- Complete copy-pasteable CSS block for globals.css
- Includes both light and dark definitions
```
