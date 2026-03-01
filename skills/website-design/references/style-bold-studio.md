# Style: Bold Studio

---

## 1. Identity Narrative

> **Role:** Calibration anchor. This file is an optional reference — not a mandatory read. It represents the most fully-developed example of how its dimensional signals produce coherent output. When a generated direction shares significant territory with this aesthetic, reading the "why these bans exist" and "identity-defining — never override" sections provides invaluable calibration.

A warehouse gallery on opening night — raw concrete floors, oversized type blown up on the walls, a single neon tube cutting electric green through the shadow. The energy of creative collision. Nothing is timid, nothing is safe. Typography is used as architecture — headings fill the viewport, negative space is aggressive, and every interaction has snap. This is the aesthetic for people who want their website to make a statement before visitors read a single word.

---

## 2. Color System

```css
@import "tailwindcss";

@theme {
  /* ── Brand ── */
  --color-primary: #0A0A0A;
  --color-primary-light: #1A1A1A;
  --color-primary-dark: #000000;
  --color-secondary: #666666;
  --color-accent: #A3FF12;
  --color-accent-light: #B8FF4A;
  --color-accent-dark: #8AE000;

  /* ── Semantic ── */
  --color-success: #22C55E;
  --color-warning: #EAB308;
  --color-error: #EF4444;
  --color-info: #3B82F6;

  /* ── Surfaces (dark default) ── */
  --color-surface-primary: #0A0A0A;
  --color-surface-secondary: #141414;
  --color-surface-elevated: #1E1E1E;
  --color-surface-sunken: #050505;

  /* ── Text ── */
  --color-text-primary: #F5F5F5;
  --color-text-secondary: #888888;
  --color-text-disabled: #444444;

  /* ── Borders ── */
  --color-border: #222222;
  --color-border-strong: #333333;
}
```

### Dark mode overrides (`.dark` triggers light mode)

```css
.dark {
  --color-surface-primary: #FFFFFF;
  --color-surface-secondary: #F5F5F5;
  --color-surface-elevated: #FFFFFF;
  --color-surface-sunken: #EBEBEB;

  --color-text-primary: #0A0A0A;
  --color-text-secondary: #666666;
  --color-text-disabled: #AAAAAA;

  --color-border: #E0E0E0;
  --color-border-strong: #CCCCCC;

  --color-accent: #8AE000;
  --color-accent-light: #A3FF12;
}
```

> **Reference palette** — these values apply when no brand colors were provided in Phase 1. If the client supplied brand colors, substitute their primary and accent, then adapt surfaces to match. The dark base and the one-vivid-accent rule are non-negotiable for this aesthetic.

**Palette voice:** Pure neutrals with no undertone — the near-black and near-white are direct, cool, unambiguous. The palette jumps between extremes; mid-tones are used reluctantly. The accent is deliberately electric: #A3FF12 neon green should feel like a charge running through the page — almost too vivid, precisely the point. Alternatives (hot pink #FF2D78, electric violet #7C3AED, vivid orange #FF6B2B) follow the same rule: one vivid color, everything else monochrome.

---

## 3. Typography System

```tsx
import { Space_Grotesk, JetBrains_Mono } from "next/font/google";

const display = Space_Grotesk({
  subsets: ["latin"],
  variable: "--font-display",
  display: "swap",
  weight: ["500", "600", "700"],
});

const body = Space_Grotesk({
  subsets: ["latin"],
  variable: "--font-body",
  display: "swap",
  weight: ["300", "400"],
});

const mono = JetBrains_Mono({
  subsets: ["latin"],
  variable: "--font-mono",
  display: "swap",
  weight: ["400", "500"],
});
```

```css
@theme {
  --font-display: var(--font-display), system-ui, sans-serif;
  --font-body: var(--font-body), system-ui, sans-serif;
  --font-mono: var(--font-mono), monospace;
}
```

> **Why this pairing:** Space Grotesk's geometric construction and tight metrics encode industrial precision — it has no humanist warmth, which is exactly right. Avoid fonts described as "friendly," "rounded," or "approachable" (Nunito, Raleway, Poppins) — they undermine the aesthetic.
> **Alternative display fonts that preserve the register:** `Syne` (more experimental, wider tracking), `Outfit` (cleaner, less character but structurally compatible).

**Typographic voice:** Helvetica-proximate geometric sans at extreme sizes is the primary visual medium — not decoration, the design itself. Headlines fill the viewport at tight tracking (-0.04em) and near-touching line-height (0.95), lines almost colliding. In header heroes, use `flex flex-col justify-between`: the monospace label anchors the top, the oversized headline sits at 25–30% from the top (via `items-start pt-12 lg:pt-16` on the middle zone, not centered), and the subline pins to the bottom. Body copy at weight 300 exists to support headlines, never to compete with them. Mixed-weight within a single headline — 300 for filler words, 700 for the power word — is the signature move. When in doubt, make the headline bigger.

---

## 4. Motion Personality

Fast and assured. Motion signals confidence — it doesn't linger or perform. Entrance durations run 0.35–0.5 seconds per element. The entire hero sequence completes in under one second.

Clip-path reveals are the primary motion vocabulary: `inset(100% 0 0 0)` sweeping to `inset(0 0 0 0)` word by word, with 50–60ms stagger and `power4.out` easing — aggressive deceleration, like a punch landing. Everything snaps into place.

Spring is allowed in one specific context: the magnetic cursor's elastic return snap (`elastic.out(1, 0.5)`) — one overshoot, more like a punch than a bounce. Nowhere else. Smooth scrolling scrub-based animations are too slow and weighted for this style. Infinite-loop animations are banned except marquee scroll strips, which function as content rather than decoration.

Between dark and light sections, a scroll-linked background color shift (`scrub: true`) is allowed — used once per page maximum. It should feel like the page itself changing personality, not a gradual fade.

---

## 5. Interaction Vocabulary

**Allowed:**
- word-by-word clip-reveal on primary headlines (50–60ms stagger, `power4.out`) — the default treatment for major headings; apply to headlines where the reveal contributes to narrative weight, not mechanically to every h1/h2 on the page
- clip-path entrance on all below-fold content
- magnetic pull on primary CTAs (15% pull strength, elastic return)
- scroll-linked background color shift between dark and light sections (scrub, once per page maximum)
- hard-offset shadow on card hover (`4px 4px 0px rgba(163,255,18,0.2)`)
- accent border appearing on card hover (2px, bold, not subtle)
- card lift on hover (`translateY(-6px)`, 200ms)
- button scale and background shift on hover (150ms — fastest of all styles)
- marquee scroll strip for logos or quotes (continuous loop, content function)
- grayscale-to-color reveal on project images (`grayscale hover:grayscale-0`, 500ms)

**Banned:**
- slow luxury pacing (anything over 0.6s for primary elements)
- soft diffused shadows (hard offset or nothing)
- serif fonts
- warm-tinted surfaces
- bounce easing (spring with overshoot is allowed only on magnetic return)
- infinite-loop animations except marquee strips
- scrub-based parallax (too slow, too organic)
- opacity-only fades without clip or translate (feels passive)

**Interaction limit per page:** 6 distinct scroll-triggered interactions. This style can carry more motion than others — but still has a ceiling. More than 6 becomes noise.

**Why these bans exist:** These bans protect the fast, confident, snap-to-place motion register — the warehouse-gallery opening-night energy. Anything slower or softer shifts the aesthetic toward a different style entirely.

**Identity-defining — never override:** serif fonts; warm-tinted surfaces; soft diffused shadows

**Default-off, brief can unlock:**
- *Scrub-based parallax* → Brief explicitly describes "cinematic narrative," "film production," "documentary," or "sequence-driven story" (client language, not designer vocabulary) → Implementation: single section only, 40–60px travel max, `scrub: 1` (not 2), `power4.out` easing maintained, applied to one full-bleed section with rich background complexity only
- *Scroll-linked background color shift* → Brief describes a page with two fundamentally different brand phases ("before/after," "two worlds," "product that transforms") → Implementation: once per page only, between sections that genuinely represent contrast — not decorative

---

## 6. Texture and Surface Language

**Noise overlay:** 3.5% opacity (`opacity-[0.035]`). More grain than other styles — it adds grit to the dark surfaces, the warehouse gallery texture. Essential to prevent the near-black from reading as a flat digital void.

**Decorative typography:** Oversized outline text at 3–5% opacity as background decoration is a permitted (and encouraged) decorative layer. The brand name or a key word rendered at 12vw with `-webkit-text-stroke: 1px rgba(255,255,255,0.05)`, positioned behind content as a ghost. This is not clutter; it is architecture.

**Border behavior:** When borders appear, they are bold — 2–3px, accent or white. Default state on cards: no borders at all, rely on surface color contrast. Hover: accent border appears dramatically (2px `border-accent/50`). Corners are sharp — `rounded-none` or `rounded-sm` at most. No softness.

**Shadow behavior:** Hard shadows only — `4px 4px 0 rgba(163,255,18,0.2)` (offset, not diffused). Or no shadow at all; rely entirely on surface contrast. Soft layered box-shadows are forbidden here — they belong to softer aesthetics.

**Decorative layers:** Select one or two from this set — not all simultaneously. White dot grid at 5% opacity on dark surfaces (one section maximum). Thin accent-color horizontal rules between sections. Large section numbers ("01", "02") at 10% opacity in 200px+ size as background decoration. Choose based on what supports the content architecture without competing with headline dominance.

**Materials invoked:** Raw concrete, brushed steel, galvanized metal, black vinyl, neon tubing, spray-painted wall. Industrial, not refined.

---

## 7. Image Mood

**Search keywords:**
- `design studio workspace dark`
- `warehouse gallery exhibition`
- `brutalist architecture concrete`
- `neon sign urban night`
- `abstract geometric black white`

**Aspect preferences:** 16:9 cinematic for section breaks. 4:5 portrait for project cards in grids. 1:1 square for grid layouts. The hero typically carries no image — typography IS the visual. When images appear elsewhere, they should be wide and cinematic or tightly cropped and graphic.

**Filter/treatment:** `brightness(0.95) contrast(1.1)` — slightly more dramatic than source. Featured section imagery (cards in content grids, gallery sections, project showcases) defaults to grayscale with color revealed on hover (`grayscale hover:grayscale-0 transition-all duration-500`) — this gives monochrome discipline with a reveal moment. Sharp corners on all image containers — `rounded-none` or `rounded-sm`. No soft crop radius.

**Role:** Secondary to typography. Images appear in project grids, portfolio sections, about pages, and section breaks. They provide content richness and visual variety between type-dominant sections, but no section should depend on an image to carry its visual weight. Studio/workspace photography is documentary; project work is evidential; urban/architectural photography is atmospheric punctuation.

**What to avoid:** Warm or artisan photography. Soft natural light. Smiling people in professional settings. Any image that reads "friendly" or "approachable." Rounded-corner presentation of images. Photography that competes with the headline for dominance — images here support, not lead.
