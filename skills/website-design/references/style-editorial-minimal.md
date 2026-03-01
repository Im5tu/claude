# Style: Editorial Minimal

---

## 1. Identity Narrative

> **Role:** Calibration anchor. This file is an optional reference — not a mandatory read. It represents the most fully-developed example of how its dimensional signals produce coherent output. When a generated direction shares significant territory with this aesthetic, reading the "why these bans exist" and "identity-defining — never override" sections provides invaluable calibration.

A beautifully typeset magazine spread left open on a linen tablecloth — generous white space flowing around considered typography, the quiet drama of a single perfect image on an otherwise empty page. Content is the hero; design is the invisible frame. Every pixel of space is as deliberate as every letter. This is for people who understand that saying less, more beautifully, is harder than filling every corner.

---

## 2. Color System

```css
@import "tailwindcss";

@theme {
  /* ── Brand ── */
  --color-primary: #1A1A1A;
  --color-primary-light: #2A2A2A;
  --color-primary-dark: #0F0F0F;
  --color-secondary: #6B6B6B;
  --color-accent: #C17C5A;
  --color-accent-light: #D4936E;
  --color-accent-dark: #A86848;

  /* ── Semantic ── */
  --color-success: #5A8A6E;
  --color-warning: #B89A5A;
  --color-error: #A85A4A;
  --color-info: #5A7A8A;

  /* ── Surfaces ── */
  --color-surface-primary: #FAFAF8;
  --color-surface-secondary: #F4F3F0;
  --color-surface-elevated: #FFFFFF;
  --color-surface-sunken: #EEEDEA;

  /* ── Text ── */
  --color-text-primary: #1A1A1A;
  --color-text-secondary: #6B6B6B;
  --color-text-disabled: #A3A39B;

  /* ── Borders ── */
  --color-border: #E5E4E0;
  --color-border-strong: #D0CFC8;
}
```

### Dark mode overrides

```css
.dark {
  --color-surface-primary: #121210;
  --color-surface-secondary: #1A1A18;
  --color-surface-elevated: #222220;
  --color-surface-sunken: #0A0A09;

  --color-text-primary: #EAEAE5;
  --color-text-secondary: #7A7A72;
  --color-text-disabled: #3A3A35;

  --color-border: #2A2A28;
  --color-border-strong: #3A3A38;

  --color-accent: #D4936E;
  --color-accent-light: #E0A880;
}
```

> **Reference palette** — these values apply when no brand colors were provided in Phase 1. The near-monochrome nature of this style means any accent substitution has outsized visual impact — the accent is the only color on the page, so choose deliberately.
> **Within-aesthetic accent alternatives:** Slate ink `#4B6CB7` (academic, policy, technical publishing), Forest `#4A6741` (nature, sustainability, slow food), Aubergine `#5C3A6B` (arts, culture, theatre) — one accent, appearing almost nowhere, as the sole note of color on an otherwise achromatic page.

**Palette voice:** The palette is almost monochrome — warm white surfaces (#FAFAF8) with a barely-there warm undertone, near-black text, and the terracotta accent (#C17C5A) appearing only on links, hover states, and occasional emphasis. Color is not the tool here; tone, scale, and space are. The background family is warm but almost imperceptible — the difference between #FAFAF8 and #F4F3F0 reads as shadow, not color.

---

## 3. Typography System

```tsx
import { Newsreader, Instrument_Sans, JetBrains_Mono } from "next/font/google";

const display = Newsreader({
  subsets: ["latin"],
  variable: "--font-display",
  display: "swap",
  weight: ["400", "500", "600"],
  style: ["normal", "italic"],
});

const body = Instrument_Sans({
  subsets: ["latin"],
  variable: "--font-body",
  display: "swap",
  weight: ["400", "500"],
});

const mono = JetBrains_Mono({
  subsets: ["latin"],
  variable: "--font-mono",
  display: "swap",
  weight: ["400"],
});
```

```css
@theme {
  --font-display: var(--font-display), "Times New Roman", serif;
  --font-body: var(--font-body), system-ui, sans-serif;
  --font-mono: var(--font-mono), monospace;
}
```

> **Why this pairing:** Newsreader is designed for reading — its optical proportions work at both display and text sizes, and its italic is genuinely expressive (rare). Instrument Sans provides clean contrast without competing. Never substitute a geometric display sans — this pairing is about reading comfort, not personality.
> **Alternative display fonts that preserve the register:** `Libre Baskerville` (more traditional, less editorial), `Lora` (slightly more approachable, good for content sites).

**Typographic voice:** Text is given extreme generosity — wide tracking on uppercase labels, generous line-height (1.75–1.8) on body text, and long-form prose paragraphs are welcome here. The hierarchy is size and weight contrast, never color. Display serif at weight 400 (not 600) does the heavy lifting through sheer scale — `clamp(80px, 12vw, 180px)` at the extreme end — while body copy recedes at a comfortable reading size. Italic Newsreader carries emotional emphasis in pull quotes and captions. Every typographic decision should feel like it was made by a typesetter, not a template.

---

## 4. Motion Personality

Almost none. Restraint is the aesthetic — this is the least animated style in the vocabulary. The content simply appears, as if it was always there.

Hero entrances use opacity fade over 1.0 second with a subtle 20px translateY — unhurried, no drama. Full-bleed images use a top-to-bottom clip-reveal at 1.5 seconds with `power3.inOut` — the curtain lifts slowly, revealing the photograph as if turning a magazine page. Large images carry gentle parallax (30px maximum travel, `scrub: 2`), creating subtle depth without being perceptible as animation.

All other scroll-triggered content: opacity only, 0.8 seconds, `power2.out`. No translate, no scale, no clip. Content materializes.

Everything else is explicitly forbidden in this aesthetic — not because it would break it, but because adding it would transform it into something else entirely.

---

## 5. Interaction Vocabulary

**Allowed:**
- opacity-only fade on all scroll-triggered content (no translate, no clip, no scale)
- opacity + 20px translateY on hero heading only (1.0s, no word-by-word splitting)
- top-to-bottom clip-reveal on full-width images only (1.5s, `power3.inOut`)
- gentle parallax on full-width images (30px travel, `scrub: 2`)
- background-highlight underline on links (terracotta, expands from left, 300ms)
- subtle background tint on card hover (`hover:bg-surface-secondary`)
- color shift on link hover (accent darkens)
- opacity fade on the navbar appearing after scroll

**Banned:**
- word-by-word or character-by-character text reveals
- clip-path entrances on any element other than full-width images
- sticky card pinning
- counter tickers
- magnetic cursor effects
- scroll-linked background color shifts
- staggered card animations
- scale animations on any element
- spring or bounce easing
- any entrance faster than 0.6 seconds
- any motion that calls attention to itself

**Interaction limit per page:** 3 distinct scroll-triggered interaction types from the allowed list. The specific combination depends on which content types appear on the page — not every page will have full-width images, and the interaction set should reflect what is actually present, not a fixed enumeration.

**Why these bans exist:** Restraint is not a preference in this style — it is the competitive edge and the identity premise. The bans do not constrain the style; they define it. Adding banned elements does not relax the style; it replaces it with something else.

**Identity-defining — never override:** word-by-word or character-by-character reveals; scale animations on any element; sticky card pinning; spring or bounce easing; any entrance faster than 0.6 seconds

**Default-off, brief can unlock:** None. If the brief's content requirements exceed what this style's motion vocabulary can express, the correct response is to reconsider the style choice — not to override individual bans. This style cannot be partially applied. A brief that needs counter tickers, staggered cards, or kinetic hero animation is not an editorial-minimal brief.

---

## 6. Texture and Surface Language

**Noise overlay:** Optional. If used, 1–2% opacity maximum. This style is so clean that grain can detract from the typographic clarity — test before committing. The default assumption is no noise.

**No patterns:** No dot grids, no gradient meshes, no geometric patterns, no decorative elements. Typography itself is the texture.

**Border behavior:** Razor-thin 1px borders, used sparingly and mostly as horizontal rules (`<hr>` with `border-t border-border`). Borders separate content within pages, not between elements. Cards in this aesthetic have no border by default — they are defined by spacing and background, not boxes. `rounded-lg` at most for any bordered container; nothing sharp, nothing emphatic.

**Shadow behavior:** Almost none. Elevated elements receive `shadow-sm` at most. Cards carry no shadow — spacing and background differentiation communicate hierarchy. Elevation is expressed through white space, not depth cues.

**Decorative layers:** None. The interplay of serif display at various scales, italic versus regular, light versus medium weight, and the rhythm of heading → body → heading → pull quote creates all the visual interest this aesthetic requires. Adding decorative elements would be an admission that the typography was not doing its job.

**Materials invoked:** Linen tablecloth, uncoated book paper, vellum, warm-toned newsprint, gallery wall. Nothing synthetic, nothing reflective.

---

## 7. Image Mood

**Search keywords:**
- `editorial photography black white`
- `minimalist interior natural light`
- `architectural minimal clean lines`
- `portrait artistic film grain`
- `still life minimal composition`

**Aspect preferences:** 16:9 for full-bleed section breaks (occupying the full viewport width, `h-[60vh]`). 4:5 or 3:2 for portrait images used in split layouts — the right-column image fills the full column height with `object-fit: cover`, composing itself to show strong negative space. The specific split proportion and image placement should be determined by the brief's content hierarchy in the composition phase, not prescribed by the style file.

**Filter/treatment:** No filters, no overlays — just the photograph. Black-and-white or desaturated images are preferred so the terracotta accent retains its status as the only color on the page. Compositionally strong photography: rule of thirds, strong negative space, high editorial quality. Use `object-position: center 30%` to favor the upper compositional zone where light and subject typically sit.

**Role:** Visual punctuation between text sections. Full-bleed photographs serve as structural page-breakers — they create breath in what would otherwise be a wall of text. When images serve as editorial section-breaks within a text-heavy page, a serif-italic figcaption completes the publishing register — it transforms a content image from decoration into publishing. Omit captions when the image is explicitly atmospheric (a hero background, a full-bleed texture section) rather than a content element.

**What to avoid:** Bright, saturated color photography (it overwhelms the restrained palette). Stock-photo sterility. Images with busy backgrounds that compete with adjacent typography. Wide-angle establishing shots with no compositional anchor. Technology or product imagery — this is a human, analogue aesthetic.
