# Style: Warm Artisan

---

## 1. Identity Narrative

> **Role:** Calibration anchor. This file is an optional reference — not a mandatory read. It represents the most fully-developed example of how warm-craft dimensional signals produce coherent output. When a generated direction shares significant territory with this aesthetic, reading the "why these bans exist" and "identity-defining — never override" sections provides invaluable calibration.

A sun-drenched ceramics workshop at 10am — terracotta surfaces dusted with dry clay, linen aprons hanging from wooden pegs, the warmth of handmade things and morning light pouring through tall dusty windows. Everything feels touched by human hands. Corners are softened, colors are pulled from the earth, and the typography has the friendly confidence of someone who knows their craft intimately. This is the anti-corporate aesthetic — personal, textured, and genuinely warm.

---

## 2. Color System

```css
@import "tailwindcss";

@theme {
  /* ── Brand ── */
  --color-primary: #3D2B1F;
  --color-primary-light: #53392B;
  --color-primary-dark: #2A1C14;
  --color-secondary: #7A6A5E;
  --color-accent: #B8704A;
  --color-accent-light: #CC8A66;
  --color-accent-dark: #9A5C3A;

  /* ── Semantic ── */
  --color-success: #5A8A5C;
  --color-warning: #C49A3A;
  --color-error: #B85A4A;
  --color-info: #5A7A9A;

  /* ── Surfaces ── */
  --color-surface-primary: #FBF7F2;
  --color-surface-secondary: #F3EDE4;
  --color-surface-elevated: #FFFDF9;
  --color-surface-sunken: #EBE3D8;

  /* ── Text ── */
  --color-text-primary: #3D2B1F;
  --color-text-secondary: #7A6A5E;
  --color-text-disabled: #A89E94;

  /* ── Borders ── */
  --color-border: #E2D9CE;
  --color-border-strong: #CFC3B4;
}
```

### Dark mode overrides

```css
.dark {
  --color-surface-primary: #0F0A08;
  --color-surface-secondary: #1A140F;
  --color-surface-elevated: #241C16;
  --color-surface-sunken: #0A0706;

  --color-text-primary: #F0EAE2;
  --color-text-secondary: #8A7E72;
  --color-text-disabled: #4A443C;

  --color-border: #2A241E;
  --color-border-strong: #3A342C;

  --color-accent: #CC8A66;
  --color-accent-light: #DDA07C;
}
```

> **Hero surface default:** This is a light-dominant aesthetic. Hero and page surfaces default to `--color-surface-primary` (#FBF7F2) unless the brief contains explicit dark-surface signals. Dark mode overrides are for section moments within a page, not a page-level default.

> **Reference palette** — these values apply when no brand colors were provided in Phase 1. The warm surface family is non-negotiable — pure white breaks the handmade character of this aesthetic.
> **Within-aesthetic accent alternatives:** Olive `#7A8C3A` (farm-to-table, herbalism, olive oil brands), Warm sage `#6B8C6B` (wellness, plant-based, slow living), Deep rust `#9B4B23` (craft leather, ceramics, woodwork) — all earth tones, all plausible as a pigment found on a workshop floor.

**Palette voice:** Every color in this palette was pulled from the earth — warm cream (#FBF7F2), dry parchment (#F3EDE4), deep warm brown text (#3D2B1F), and a terracotta accent (#B8704A) that reads as burnt sienna, not orange. Pure white is never used as a page background; pure black is never used for text. The surfaces carry warmth you can almost feel. The darkest shade in the system (#2A1C14) feels like worn leather, not digital night.

---

## 3. Typography System

```tsx
import { Fraunces, Outfit, JetBrains_Mono } from "next/font/google";

const display = Fraunces({
  subsets: ["latin"],
  variable: "--font-display",
  display: "swap",
  weight: ["400", "500", "600"],
});

const body = Outfit({
  subsets: ["latin"],
  variable: "--font-body",
  display: "swap",
  weight: ["300", "400", "500"],
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
  --font-display: var(--font-display), Georgia, serif;
  --font-body: var(--font-body), system-ui, sans-serif;
  --font-mono: var(--font-mono), monospace;
}
```

> **Why this pairing:** Fraunces at 400–500 has optical idiosyncrasies that read as handcrafted — it belongs to a person, not a system. Outfit at 300 is open and readable without intruding. Avoid geometric sans (too engineered) or condensed display faces (too aggressive).
> **Alternative display fonts that preserve the register:** `Bitter` (more slab-like, slightly more rustic), `Zilla Slab` (editorial, slightly more neutral), `Merriweather` (warmer, good for long-form content).

**Typographic voice:** Fraunces at lighter weights (400–500) has the quality of handcrafted lettering — optical, slightly idiosyncratic, with curves that feel like they belong to a person rather than a system. Headlines use relaxed tracking (normal to +0.01em) and a generous line-height of 1.15–1.2 — they breathe rather than compress. Outfit at 300 weight for body text is open and readable, light without being insubstantial. Serif italic appears for emotional warmth in headlines and captions. The headline is never bold and never forceful; the accent color (terracotta) touches one keyword only. This aesthetic speaks like a warm greeting, not a marketing pitch.

---

## 4. Motion Personality

The gentlest allowed. Motion here feels like a quiet exhale — organic, unhurried, unperformative. Content blocks enter as units (not word-by-word or element-by-element), fading in with a soft 30px lift over 0.8 seconds using `power2.out`. The animation should feel like morning light gradually revealing a surface, not like software launching.

Images carry the most motion in this aesthetic: parallax on full-width editorial images (60px travel, `scrub: 1.5`) adds the only genuine sense of physical depth. Image clip-reveals run 1.2 seconds — slower than neutral, slower than the eye expects, which creates a sense of reverence for the subject matter.

Word-by-word text reveals are not appropriate — too mechanical, too aggressive for this register. Counter animations use the display serif (not monospace), running 2.0 seconds. Spring and bounce easing are incompatible with this warmth. The upper limit is motion you could describe as "gentle" to a non-designer without embarrassment.

---

## 5. Interaction Vocabulary

**Allowed:**
- opacity + 30px translateY fade on content blocks (0.8s, `power2.out`) — animate whole blocks, not individual elements
- bottom-to-top clip-reveal on process/story images (1.2s, `power3.inOut`)
- parallax on full-width images only (60px travel, `scrub: 1.5`)
- opacity-fade scroll reveal on all below-fold sections (0.5s, gentle)
- warm background-highlight underline on links (terracotta, expands from left, 300ms)
- card lift on hover (`translateY(-2px)`, warm shadow deepens, 300ms)
- button scale and background lighten on hover (`scale(1.02)`, 250ms)
- pill-shaped button shape (always `rounded-full`)
- serif counter tick on stats (2.0s, `power2.out` — use `font-display`, not `font-mono`)

**Banned:**
- word-by-word or character-by-character text reveals
- clip-path entrances on text elements
- magnetic cursor effects
- sticky card pinning
- scroll-linked background color shifts
- spring or bounce easing
- sharp corners anywhere (`rounded-none`, `rounded-sm`)
- cool-tinted surfaces, shadows, or borders
- monochrome color schemes
- geometric patterns or dot grids
- any animation faster than 0.5s for primary entrances
- cold-aesthetic technology imagery — UI screenshots, device mockups, dark office environments, abstract digital patterns, stock photography that reads as B2B SaaS. Human professional environments with warm light are allowed when that IS the brand's domain; the ban targets aesthetic coldness, not industry category.

**Interaction limit per page:** 3 distinct scroll-triggered interaction types from the allowed list. The specific combination depends on which content types appear on the page — not every page will have full-width images with parallax, and the interaction set should reflect what content is actually present, not a fixed enumeration.

**Why these bans exist:** These bans protect the handmade, unhurried, tactile aesthetic — the quality of something made slowly by someone who knows what they are doing. Mechanical or fast motion destroys this register because it signals industrial production rather than craft.

**Identity-defining — never override:** cool-tinted surfaces, shadows, or borders; cold-aesthetic technology imagery — UI screenshots, device mockups, dark office environments, abstract digital patterns, stock photography that reads as B2B SaaS (the ban targets aesthetic coldness, not industry category); spring or bounce easing; sharp corners (`rounded-none`, `rounded-sm`)

**Default-off, brief can unlock:**
- *Word-by-word opacity reveal at slow stagger* (opacity-only — clip-path remains banned) → Brief describes a founding manifesto, origin story, or singular mission statement that earns theatrical treatment → Implementation: opacity-only (no clip-path, no translateY), 150ms minimum stagger (2x slower than the standard), 0.8s per word, `power2.out` easing, one statement only, and this becomes the page's single moderate-motion section
- *Bottom-to-top clip-reveal on one non-image element* → Brief has a single physical product or material that benefits from a slow uncovering (peeling fabric, lifting a lid, opening a box) → Implementation: 1.2s duration, `power3.inOut` easing, one element maximum — never applied to text

---

## 6. Texture and Surface Language

**Noise overlay:** 3–5% opacity (`opacity-[0.04]`). This aesthetic embraces more grain than others — the texture is part of the handmade quality. It should be perceptible as warmth when present and missed as sterility when removed.

**Border behavior:** Warm gray (#E2D9CE), 1px. Soft corners throughout — `rounded-2xl` on cards and containers, `rounded-full` on buttons, badges, and avatars, `rounded-xl` on images. Nothing sharp. The softness of the corner radius is a primary signal of this aesthetic's personality — angular anything would break the character.

**Shadow behavior:** Warm-tinted, soft, and diffused. Base: `rgba(61,43,31,0.06)`. Three levels: sm, md, lg. No hard edges; no offset; no cool-tinted shadows. On hover, warm shadow deepens slightly — the card settles toward you rather than jumping away from the surface.

**Decorative layers:** Optional paper texture via SVG noise at 3% opacity for sites that need extra handcrafted depth. Terracotta accent sections (testimonials) provide the one moment of warm color break. The footer uses `rounded-t-3xl` — a soft transition into the dark footer area. No dot grids, no geometric patterns, no gradient mesh.

**Materials invoked:** Terracotta clay, linen cloth, warm pine wood, hand-thrown pottery, cream paper, cotton canvas, worn leather, morning sunlight on a dusty windowsill.

---

## 7. Image Mood

**Search keywords:**
- `artisan workshop morning light`
- `handmade pottery ceramics`
- `cafe interior warm natural`
- `bakery fresh bread golden`
- `natural materials close-up texture`

**Deriving image keywords:** Apply the mood register modifiers to the brand's actual domain. Do NOT use the example keywords verbatim. Process: (1) brand's core subject matter — what do they do, make, or serve? (2) apply the mood modifier (warm, artisan, handmade) to that subject. (3) add environmental context. Example for warm-artisan applied to a coaching agency: "warm editorial coaching session natural light" — not "artisan workshop morning light."

**Aspect preferences:** 3:2 landscape for editorial breaks. 4:5 portrait for split layouts. 1:1 for team avatars. The hero image (full-bleed or split) should be a lifestyle photograph from the brand's actual craft environment — apply `object-position: center 35%` to show the warmest zone of the image, typically where morning light falls and hands are at work.

**Filter/treatment:** Warm filter: `saturate(1.05) brightness(1.02)` for a gentle warmth boost. Full-bleed hero images receive a gradient overlay from the bottom: `linear-gradient(to top, rgba(61,43,31,0.75) 0%, rgba(61,43,31,0.3) 50%, transparent 80%)`. This ensures text legibility while preserving the image's atmosphere. All image containers use `rounded-2xl overflow-hidden`. Hover: gentle scale `1.03` over 600ms — slower than most styles, matching the unhurried personality.

**Role:** Atmospheric and structural. Images carry the emotional warmth that text cannot — they show hands at work, morning light, real materials. The hero image is essential: without it, the warm cream background reads as blank rather than inviting. Process section images are documentary — hands engaged with the brand's materials, work in progress, the craft environment at the moment of making; testimonial images are warm natural-light portraits. Images should feel observed, not staged.

**What to avoid:** Technology imagery of any kind. Paint tubes, art supplies, and abstract creative-work imagery — they read as craft-adjacent rather than genuinely artisan. Generic office interiors. Corporate settings. Cool-tinted photography (even if the subject is correct, cool light destroys the warmth). Stock photography where the subjects are visibly posing. Any image that could appear on a B2B SaaS site.
