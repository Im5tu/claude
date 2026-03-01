# Style: Modern Organic

---

## 1. Identity Narrative

> **Role:** Calibration anchor. This file is an optional reference — not a mandatory read. It represents the most fully-developed example of how its dimensional signals produce coherent output. When a generated direction shares significant territory with this aesthetic, reading the "why these bans exist" and "identity-defining — never override" sections provides invaluable calibration.

There is a particular quality of light in a well-designed sustainability brand's world — warm, honest, slightly overexposed on the edges, like late-afternoon sun through linen. It is not rustic. It is not artisanal in the handmade sense. It is modern in its confidence and organic in its values, and the two are not in tension.

Modern Organic is the aesthetic of brands that believe what they make and are not performing it. The palette is drawn from the natural world — sage, clay, sand, forest — but the typography is clean and the layout is intentional. There is no folk art here, no distressed textures, no mason jars. The craft is in the restraint: choosing a specific earthy off-white over generic white; choosing a humanist serif for display over a geometric sans; choosing to leave space rather than fill it.

This aesthetic serves brands at the intersection of good design and genuine values: wellness technology (not supplement MLMs), sustainable product companies (not greenwashers), food and beverage with ingredients you can actually pronounce, outdoor lifestyle brands that take the outdoors seriously, and health companies that respect their customer's intelligence.

Think: Allbirds before the IPO. Patagonia's web presence. AG1 (Athletic Greens). Aesop. Oatly (the measured, typographic side). A permaculture farm with a world-class art director.

---

## 2. Color System

```css
@theme {
  /* Surfaces */
  --color-surface-primary: #F8F5EF;
  --color-surface-secondary: #EDE9E1;
  --color-surface-sunken: #E4DFD5;

  /* Text */
  --color-primary: #1E1C17;
  --color-secondary: #5C5849;
  --color-disabled: #A8A49A;

  /* Borders */
  --color-border: rgba(30, 28, 23, 0.10);
  --color-border-strong: rgba(30, 28, 23, 0.20);

  /* Accent — sage green */
  --color-accent: #4A7C59;
  --color-accent-light: #5D9470;
  --color-accent-dark: #366344;
  --color-accent-rgb: 74, 124, 89;

  /* Secondary accent — terracotta */
  --color-accent-secondary: #C4673A;

  /* Dark surfaces (forest deep) */
  --color-dark: #1A2018;
  --color-dark-surface: #222B20;

  /* Typography */
  --font-display: 'Cormorant Garamond', serif;
  --font-body: 'Jost', sans-serif;
  --font-mono: 'JetBrains Mono', monospace;

  /* Type scale */
  --text-display-xl: clamp(3.5rem, 9vw, 7.5rem);
  --text-display: clamp(2.5rem, 5.5vw, 4.5rem);
  --text-h1: clamp(2rem, 3.5vw, 3.25rem);
  --text-h2: clamp(1.5rem, 2.5vw, 2.125rem);
  --text-h3: clamp(1.25rem, 1.8vw, 1.625rem);
  --text-h4: 1.0625rem;
  --text-body-lg: 1.125rem;
  --text-body: 1rem;
  --text-body-sm: 0.875rem;

  /* Spacing */
  --radius-card: 0.75rem;
  --radius-button: 0.5rem;
  --radius-input: 0.5rem;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  @theme {
    --color-surface-primary: #1A2018;
    --color-surface-secondary: #222B20;
    --color-surface-sunken: #2A3428;
    --color-primary: #F0EDE6;
    --color-secondary: #A8A499;
    --color-border: rgba(240, 237, 230, 0.10);
    --color-border-strong: rgba(240, 237, 230, 0.18);
  }
}
```

> **Reference palette** — these values apply when no brand colors were provided in Phase 1. If the client supplied brand colors, substitute their accent for `--color-accent` while keeping the warm linen surfaces — the off-white background is non-negotiable.
> **Within-aesthetic accent alternatives:** Deep forest `#2D5A27` (wilder, more environmental), Warm olive `#6B6B35` (food, farm, agricultural), Muted teal `#3D7A7A` (water, coastal, marine sustainability) — all drawn from the natural world, all calm, none electric.

**Palette voice:** The background is not white — it is the specific off-white of unbleached linen or warm stone. The sage accent appears with intention, not frequency: it marks what matters without dominating. Terracotta provides warmth and contrast for secondary calls-to-action and category labels. Dark sections use the deep forest green rather than neutral black — the brand remains in its natural color family even in darkness. The palette should feel like it was drawn from a colour-swatch pulled from something found outdoors, not from a Pantone deck.

---

## 3. Typography System

```tsx
// src/app/layout.tsx
import { Cormorant_Garamond, Jost, JetBrains_Mono } from "next/font/google";

const display = Cormorant_Garamond({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700"],
  style: ["normal", "italic"],
  variable: "--font-display",
  display: "swap",
});

const body = Jost({
  subsets: ["latin"],
  weight: ["300", "400", "500", "600"],
  variable: "--font-body",
  display: "swap",
});

const mono = JetBrains_Mono({
  subsets: ["latin"],
  weight: ["400"],
  variable: "--font-mono",
  display: "swap",
});
```

```css
/* globals.css additions */
h1, h2, h3 { font-family: var(--font-display); letter-spacing: -0.01em; }
p, li, label { font-family: var(--font-body); font-weight: 300; line-height: 1.75; }
.caption { font-family: var(--font-body); font-weight: 500; letter-spacing: 0.06em; text-transform: uppercase; font-size: 0.75rem; }
```

> **Why this pairing:** Cormorant Garamond has refined serifs without stuffiness — at large display sizes on a warm background it reads like a perfectly typeset sustainability manifesto, not a luxury brochure. Jost at 300 weight is deliberately understated. Avoid stiff traditional serifs (Times, Georgia) — they read as institutional, not organic.
> **Alternative display fonts that preserve the register:** `EB Garamond` (slightly more classical, warmer at text sizes), `Spectral` (more editorial, works well for brands with a writing/publishing dimension).

**Typographic voice:** Cormorant Garamond at display sizes is confident and elegant without performing luxury. Its serifs are refined but not stiff — at large sizes on a warm background it feels like a perfectly typeset sustainability manifesto. Body copy in Jost at weight 300 (light) is deliberately understated — wide line-height (1.75), breathing room between paragraphs. The hierarchy reads: large serif headlines, lightweight body, small-caps Jost labels. Italics are used for emphasis and for genuine quotations (testimonials, pull-quotes). No headline should be set in all-caps here — this brand speaks clearly, not loudly.

---

## 4. Motion Personality

Slow and unhurried — like watching something grow. This is not sluggishness; it is the brand's way of saying it is not in a rush, it is sure of where it is going. Entrance durations: 0.65–0.85s. Stagger between siblings: 90–110ms. Y-travel: 24–30px (slightly more than most — the elements rise slowly, like bread).

Parallax on images is natural here — background images moving at 70% scroll speed, foreground content at 100%. This creates depth that mirrors the layered quality of natural environments. Scrub-based motion (tied to scroll position) is appropriate for image parallax only — not for text content.

Clip-path reveals on images are the signature entrance: a slow wipe from bottom, 0.8s, power2.inOut. It feels like the image is being uncovered, not appearing.

What is banned: spring or bounce easing on any element (jarring against this aesthetic's organic patience). Snap-into-place entrances. High-tempo anything. Cursor interactions (too clever). MarqueeScroller (wrong energy — this brand is not in a hurry). The interaction budget for this style is among the most conservative: quiet confidence over demonstrative animation.

The motion ceiling: one image parallax layer per page section, one scroll-triggered entrance per section. That is enough. More is noise.

---

## 5. Interaction Vocabulary

**Allowed:**
- clip-reveal on images (slow: 0.8s, power2.inOut, bottom-to-top)
- opacity + translateY(28px) fade-up on text blocks (0.7s, power2.out)
- image parallax on scroll (scrub: true, 0.3 speed differential — background slower than foreground)
- subtle scale(1.02) on image cards on hover — no further
- border-color shift on hover (border-border → border-accent, 0.3s)
- background-color fill on dark CTA buttons only (no fill on ghost/text links)
- slow staggered reveal on feature lists (120ms stagger, unhurried)

**Banned:**
- spring or bounce easing on any element, always
- snap/power4 fast entrances (wrong tempo)
- scale(1.04+) on anything (too aggressive)
- marquee scrollers (this brand does not hurry)
- cursor-follower effects
- CardShuffler, StickyCardStack — too kinetic for this aesthetic
- Any animation faster than 0.3s for element entrances
- Infinite loop animations of any kind

**Interaction limit per page:** 0 high-motion sections. Max 1 moderate-motion section (image parallax qualifies as moderate). Unlimited minimal (fade-up entrances). This is the most restrained style in the library — the restraint is the point.

**Why these bans exist:** These bans protect the "slow and unhurried, like watching something grow" quality. Fast or kinetic motion contradicts the brand's fundamental promise — that it is not in a rush.

**Identity-defining — never override:** spring or bounce easing on any element; entrances faster than 0.3s; marquee scrollers

**Default-off, brief can unlock:**
- *StickyCardStack* → Brief has exactly 3 genuinely parallel, equal-weight principles or values (not steps) where each requires sustained focus to absorb → Implementation: upgrades from 0 to 1 high-motion section (the absolute budget maximum — no other moderate or high-motion sections permitted on the same page); slow entry timing (1.0s), departing card scale (0.97), no clip-path — cards fade rather than snap
- *Image hover scale above 1.02* (up to 1.03 only) → Brief explicitly describes "zooming into materials," "getting closer," or "detail as differentiation" → 1.03 maximum, 500ms duration, `power2.inOut` easing only

---

## 6. Texture and Surface Language

**Noise overlay:** 0.04 opacity (4%) — slightly higher than clean digital styles. The grain suggests paper or natural material. It should be perceptible if you look for it, invisible if you are not.

**Borders:** Rarely visible on light surfaces — use transparent space to separate content rather than rules. When borders appear, they are `border-border` at 1px — hairlines, not frames. Cards have gentle rounding (0.75rem). Buttons are moderately rounded (0.5rem) — not pill-shaped, not perfectly square. Inputs match.

**Shadows:** Almost absent on light backgrounds. Use spacing and background color changes to create elevation rather than shadow. On dark sections, very subtle shadow-lg at the brand's dark palette may appear on cards.

**Decorative layers:** Subtle organic shapes — large blurred circles or leaf-like SVG shapes at 4-6% opacity behind hero content. These should be barely perceptible, like shadows cast by unseen objects. No geometric patterns (too digital). No illustrated elements unless the brand has a commissioned illustration system.

**Materials invoked:** Unbleached linen. Warm handmade paper. Stone with slight texture. Pressed botanicals. A quality cardboard box that feels good to hold. Nothing plastic. Nothing reflective or metallic.

---

## 7. Image Mood

**Search keywords (mood register — apply to the brand's actual subject matter):** "natural light [subject]," "earthy tones lifestyle," "outdoor slow living," "textured material close up," "hands working [craft or product]"

> These keywords describe the mood register and photographic approach — warm, natural light, slow, tactile. Search using the brand's actual subject matter in place of bracketed terms. A wellness tech brand photographs its product in the same warm light and textured environments as a food brand; the light quality and surface textures are what define this register, not the subject category.

**Aspect preferences:**
- Hero: tall portrait (3:4 or 4:5) if using SplitHeroPortrait — lets the image breathe. Landscape (16:9) for full-bleed, with object-position: center 35% (slightly above center)
- Product: square (1:1) with natural surface backgrounds (linen, stone, wood)
- Lifestyle: portrait (4:5) — people in natural environments, not studios

**Filter/treatment:** Warm. Slightly desaturated (not monochrome — just calm). Natural light, often slightly overexposed at the edges. No artifical studio lighting. The image gradient overlay on heroes: `linear-gradient(to top, rgba(26,32,24,0.70) 0%, rgba(26,32,24,0.25) 50%, transparent 80%)` using the brand's forest dark. `object-position: center 35%` on portrait images to frame subjects above center.

**Role:** Images are atmospheric evidence. They show the brand's world — materials, environments, the natural contexts where the product lives. A hand holding an ingredient. A landscape. A detail of texture. Documentary, not promotional. The goal is to make the viewer feel the brand's values, not see a product demo.

**What to avoid:**
- Bright, saturated, energetic photography (wrong register entirely)
- Studio product photography on white backgrounds (sterile, wrong material language)
- Any photography that reads as "tech" (screens, cables, offices)
- Images with many competing colors (undermines palette control)
- Posed corporate-style photography
- AI-generated imagery (undermines authenticity)
