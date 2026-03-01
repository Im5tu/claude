# Fluid Typography — clamp() Systems & Font Rules

---

## The clamp() System

Formula: `clamp(min, preferred, max)`
- **min**: smallest the text will ever be (mobile)
- **preferred**: scales with viewport (`rem + vw` combination)
- **max**: largest the text will ever be (wide desktop)

The preferred value formula: `min + (max - min) * ((100vw - 320px) / (1440 - 320))`
Simplified to a `rem + vw` expression for each step.

---

## Standard Type Scale

Use these as CSS custom properties in every project. Define in `globals.css` inside `@theme` or `:root`.

```css
:root {
  /* ── Display — hero headlines, marketing impact ── */
  --text-display-xl: clamp(3rem, 1.8rem + 5vw, 5.5rem);
  --text-display-lg: clamp(2.5rem, 1.4rem + 4.2vw, 4.5rem);
  --text-display:    clamp(2rem, 1.2rem + 3.2vw, 3.5rem);

  /* ── Headings — section headers ── */
  --text-h1: clamp(2rem, 1.4rem + 2.4vw, 3rem);
  --text-h2: clamp(1.5rem, 1.1rem + 1.6vw, 2.25rem);
  --text-h3: clamp(1.25rem, 1rem + 1vw, 1.75rem);
  --text-h4: clamp(1.125rem, 1rem + 0.5vw, 1.375rem);

  /* ── Body — readable text (fixed, does not fluid-scale) ── */
  --text-body-lg: 1.125rem;   /* 18px */
  --text-body:    1rem;        /* 16px */
  --text-body-sm: 0.875rem;   /* 14px */

  /* ── Utility — labels, captions ── */
  --text-caption:  0.75rem;    /* 12px */
  --text-overline: 0.6875rem;  /* 11px — always uppercase + wide tracking */
}
```

### Using in Tailwind v4

Define in `@theme` block so Tailwind generates utility classes:

```css
@theme {
  --font-size-display-xl: clamp(3rem, 1.8rem + 5vw, 5.5rem);
  --font-size-display-lg: clamp(2.5rem, 1.4rem + 4.2vw, 4.5rem);
  --font-size-display:    clamp(2rem, 1.2rem + 3.2vw, 3.5rem);
  --font-size-h1: clamp(2rem, 1.4rem + 2.4vw, 3rem);
  --font-size-h2: clamp(1.5rem, 1.1rem + 1.6vw, 2.25rem);
  --font-size-h3: clamp(1.25rem, 1rem + 1vw, 1.75rem);
  --font-size-h4: clamp(1.125rem, 1rem + 0.5vw, 1.375rem);
}
```

Then use as: `text-display-xl`, `text-h1`, `text-h2`, etc.

---

## Line Height Rules

| Context | Line Height | Why |
|---------|------------|-----|
| Display/hero text | 1.0 – 1.1 | Tight for visual impact. Large text needs less leading. |
| Section headings (h1-h2) | 1.15 – 1.25 | Tight but readable. Creates strong visual blocks. |
| Sub-headings (h3-h4) | 1.25 – 1.35 | Slightly more open as sizes decrease. |
| Body text | 1.5 – 1.7 | Comfortable reading. 1.6 is the sweet spot for most fonts. |
| Captions/labels | 1.4 | Compact utility text. |
| Monospace/code | 1.6 | Needs more room due to fixed-width characters. |

---

## Letter Spacing Rules

| Context | Letter Spacing | Why |
|---------|---------------|-----|
| Display text (48px+) | -0.03em to -0.04em | Large text has too much natural spacing — tighten aggressively |
| Headings (24-48px) | -0.01em to -0.02em | Moderate tightening for cohesion |
| Body text | 0em (normal) | Default tracking is optimized for body sizes |
| Overlines/labels | 0.05em to 0.1em | Wide tracking for small uppercase text — aids legibility |
| Monospace | 0em | Fixed-width fonts have their own spacing — don't fight it |

---

## Font Weight Usage

| Purpose | Weight | Tailwind Class |
|---------|--------|----------------|
| Display headlines | 700 (Bold) or 800 (ExtraBold) | `font-bold` or `font-extrabold` |
| Section headings | 600 (SemiBold) or 700 | `font-semibold` or `font-bold` |
| Sub-headings | 500 (Medium) | `font-medium` |
| Body text | 400 (Regular) | `font-normal` |
| Emphasis in body | 500 (Medium) | `font-medium` — avoid bold in body |
| Labels/overlines | 500 or 600 | `font-medium` or `font-semibold` |
| Navigation links | 500 | `font-medium` |
| Buttons | 500 or 600 | `font-medium` or `font-semibold` |

---

## Max Line Length

Always constrain text width for readability:

| Text Type | Max Width | Tailwind |
|-----------|-----------|----------|
| Body/prose | 65 characters | `max-w-[65ch]` or `max-w-prose` |
| Headlines | 20-30 characters | `max-w-[20ch]` to `max-w-[30ch]` |
| Subheadlines | 40-50 characters | `max-w-[45ch]` |
| Pull quotes | 35-45 characters | `max-w-[40ch]` |

---

## Google Fonts Loading (Next.js)

Always use `next/font/google` for optimal loading. Never use CDN `<link>` tags.

```tsx
// app/layout.tsx
import { Space_Grotesk, Figtree, JetBrains_Mono } from "next/font/google";

const display = Space_Grotesk({
  subsets: ["latin"],
  variable: "--font-display",
  display: "swap",
  weight: ["500", "600", "700"],
});

const body = Figtree({
  subsets: ["latin"],
  variable: "--font-body",
  display: "swap",
  weight: ["400", "500", "600"],
});

const mono = JetBrains_Mono({
  subsets: ["latin"],
  variable: "--font-mono",
  display: "swap",
  weight: ["400", "500"],
});

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${display.variable} ${body.variable} ${mono.variable}`}>
      <body className="font-body antialiased">{children}</body>
    </html>
  );
}
```

Then in Tailwind v4 `@theme`:
```css
@theme {
  --font-display: var(--font-display), sans-serif;
  --font-body: var(--font-body), sans-serif;
  --font-mono: var(--font-mono), monospace;
}
```

---

## Hard-Banned Fonts

The following fonts are banned across all projects — they signal "template" regardless of context:

**Inter, Roboto, Open Sans, Lato, Montserrat, Poppins, Nunito, Raleway, Source Sans Pro, Work Sans, DM Sans, Manrope, Rubik**

If the font you selected appears on this list, choose an alternative immediately. See the Brand Mood table below for directional guidance. This list is also in `core-anti-patterns.md` — it appears here because font selection happens during direction generation, not during anti-pattern review.

---

## Font Selection Strategy

When a preset's default fonts don't fit, or when a user requests a custom font, follow this decision framework.

### The Three Roles

Every site needs exactly three font roles. No more, no fewer.

| Role | Purpose | Characteristics Needed |
|------|---------|----------------------|
| **Display** | Headlines, hero text, section titles | Distinctive character, works at 36px+, available in bold/semibold |
| **Body** | Paragraphs, descriptions, UI text | Highly readable at 16px, comfortable at 14-18px, regular + medium weights |
| **Mono** | Stats, badges, code, accent data | Fixed-width, clean numerals, available at 400-500 weight |

### How to Choose Fonts

**You are free to choose any Google Font that matches the brand's personality**, as long as it meets the criteria below and avoids the banned list in `anti-patterns.md`. The preset files suggest specific fonts as defaults, but these are starting points — not constraints. Pick fonts that feel right for the specific brand.

#### Selection Criteria

**For Display fonts, prioritize:**
- Distinctive character at large sizes (48px+) — it should have personality
- Available in the weights you need (typically 500-700 for sans, 400-600 for serif)
- Tight tracking looks good at display scale (-0.02em to -0.04em)
- Feels appropriate for the brand's industry and audience

**For Body fonts, prioritize:**
- Excellent readability at 16px — this is non-negotiable
- Comfortable at sustained reading (line-height 1.5-1.7 should feel natural)
- Available in regular (400) + medium (500) weights minimum
- Doesn't fight the display font — it should recede and let content lead

**For Mono fonts, prioritize:**
- Clean, consistent numerals (for stat counters and data)
- Works at small sizes (12-14px for badges/labels)
- Available at weight 400 minimum

#### Choosing by Brand Mood

| Brand Mood | Display Direction | Body Direction |
|------------|------------------|----------------|
| Authority, trust, tradition | Serif with moderate contrast — classical proportions, not extreme hairlines | Clean geometric or humanist sans that recedes behind the content |
| Warmth, craft, personal | Soft serif or humanist sans with organic, non-geometric quality | Rounded, friendly sans — something warm, not clinical |
| Bold, creative, statement | Heavy geometric or grotesk sans at bold/extrabold weights | Same family at lighter weight, or a clean contrasting neutral sans |
| Luxury, restraint, elegance | Light-weight classical serif — high stroke contrast, refined proportions | Lean, thin sans with minimal personality that recedes |
| Technical, precise, modern | Geometric sans with distinct character — not a generic system font | Clean neutral sans |
| Editorial, literary, content | Editorial serif with optical sizing intelligence, expressive at display sizes | Neutral sans that disappears into the text |

> The preset files suggest specific font pairings that implement these directions — treat them as starting points, not constraints. Any Google Font that satisfies the directional criteria above is a valid choice. The mood column correlates with brief language; it does not route to a fixed font list.

#### Pairing Principles

1. **Contrast in role, harmony in mood.** Display and body should differ in character (serif vs sans, or geometric vs humanist) but share the same era/mood.
2. **Serif display + sans body** is the safest premium pairing — it almost always works.
3. **Same family at different weights** works well for bold/confident brands.
4. **Never pair two serif fonts.** Never pair two geometric sans fonts of similar character.
5. **Match x-heights** — display and body fonts should have similar x-heights so they feel related when used together.
6. **Load only what you use** — fewer weights = faster page load. 3-4 weights per font is the maximum.

#### When Users Provide Custom Fonts

If the user specifies their own fonts:
1. Verify the font is on Google Fonts (required for `next/font/google` loading)
2. Check it's not on the banned list in `anti-patterns.md`
3. Load only the weights actually needed
4. If it's a body font, verify readability at 16px
5. If it's a display font, verify it has enough personality at 48px+
6. Fill any unspecified roles (display/body/mono) with fonts that complement the user's choice

---

## Typography Anti-Patterns

- **Never** use `px` values for headings — always `clamp()`
- **Never** use more than 3 font families (display + body + mono is the max)
- **Never** use font weights that weren't loaded (causes faux bold/italic)
- **Never** set line-height below 1.0 for any readable text
- **Never** use `text-transform: uppercase` on more than labels/overlines
- **Never** center body paragraphs (left-align for readability)
- **Never** use light font weights (300) for body text on screens (poor contrast)
- **Never** mix serif and sans-serif within the same hierarchy level
