# Style: Dark Luxury

---

## 1. Identity Narrative

> **Role:** Calibration anchor. This file is an optional reference — not a mandatory read. It represents the most fully-developed example of how its dimensional signals produce coherent output. When a generated direction shares significant territory with this aesthetic, reading the "why these bans exist" and "identity-defining — never override" sections provides invaluable calibration.

A private members' club at midnight — velvet-draped corridors, brass fixtures catching candlelight, the quiet assurance of exclusivity. Every element whispers rather than shouts. Surfaces are deep and enveloping, gold accents appear with surgical precision, and the typography has the effortless elegance of a hand-engraved invitation. Speed is replaced by deliberation; density by space. This is the aesthetic for brands that understand restraint is the ultimate form of confidence.

---

## 2. Color System

```css
@import "tailwindcss";

@theme {
  /* ── Brand ── */
  --color-primary: #0A0A0F;
  --color-primary-light: #141420;
  --color-primary-dark: #060609;
  --color-secondary: #6B6B7A;
  --color-accent: #C9A96E;
  --color-accent-light: #D4BC88;
  --color-accent-dark: #B08A50;

  /* ── Semantic ── */
  --color-success: #4A8B6A;
  --color-warning: #B89A4A;
  --color-error: #A85A50;
  --color-info: #5A7AA0;

  /* ── Surfaces (dark default) ── */
  --color-surface-primary: #0A0A10;
  --color-surface-secondary: #12121A;
  --color-surface-elevated: #1A1A24;
  --color-surface-sunken: #060608;

  /* ── Text ── */
  --color-text-primary: #F0EDE8;
  --color-text-secondary: #8A8898;
  --color-text-disabled: #3A3A48;

  /* ── Borders ── */
  --color-border: #1E1E28;
  --color-border-strong: #C9A96E;
}
```

### Dark mode overrides (`.dark` triggers light)

```css
.dark {
  --color-surface-primary: #FAF8F5;
  --color-surface-secondary: #F0EDE8;
  --color-surface-elevated: #FFFFFF;
  --color-surface-sunken: #E8E4DE;

  --color-text-primary: #1A1A20;
  --color-text-secondary: #6B6B7A;
  --color-text-disabled: #A0A0AA;

  --color-border: #E0DDD8;
  --color-border-strong: #B08A50;

  --color-accent: #B08A50;
  --color-accent-light: #C9A96E;
}
```

> **Reference palette** — these values apply when no brand colors were provided in Phase 1. If the client supplied brand colors, substitute their accent for `--color-accent` while keeping the deep near-black surfaces — the darkness is non-negotiable.
> **Within-aesthetic accent alternatives:** Champagne `#D4C5A9` (softer, cream-gold), Platinum `#B8B8B8` (silver, jewellery/watch brands), Copper `#B87333` (warmer, interiors/architecture) — the accent must always read as a precious material, never a digital primary color.

**Palette voice:** Black is not a background color here — it is an atmosphere. Surfaces shift through near-blacks with subtle blue undertone (#0A0A10, #12121A, #1A1A24): depth emerges from variation within darkness, not from contrast with light. Gold appears in small doses, like gilt on a leather book spine — never garish, always earned, and always the muted brass of #C9A96E rather than bright yellow.

---

## 3. Typography System

```tsx
import { Cormorant_Garamond, Outfit, JetBrains_Mono } from "next/font/google";

const display = Cormorant_Garamond({
  subsets: ["latin"],
  variable: "--font-display",
  display: "swap",
  weight: ["400", "500", "600"],
  style: ["normal", "italic"],
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
  --font-display: var(--font-display), "Times New Roman", serif;
  --font-body: var(--font-body), system-ui, sans-serif;
  --font-mono: var(--font-mono), monospace;
}
```

> **Why this pairing:** Cormorant Garamond at light weights (400–500) is elegant without being stiff — it has the spaciousness of quality printing, not the rigidity of legal documents. Outfit at 300 weight recedes respectfully. Never substitute a heavy or modern serif — the weight restraint is the luxury signal.
> **Alternative display fonts that preserve the register:** `Playfair Display` (similar register, slightly more formal), `DM Serif Display` (more editorial, less classical).

**Typographic voice:** Cormorant Garamond at light weights (400–500) is the primary voice — elegant, spacious, classical. Luxury whispers; the serif never shouts, so weight 600 is a ceiling used sparingly. Body copy in Outfit at weight 300 provides a lean, modern counterpoint that recedes respectfully behind the display type. Italic serif appears for pull quotes and emotional emphasis; a single gold keyword within a headline headline is the only color intrusion permitted.

---

## 4. Motion Personality

Slow and inevitable. Animations here feel like a luxury car door closing — weighted, assured, and precise. Entrance durations run 0.8–1.2 seconds for primary elements, with the headline itself taking up to 1.2 seconds to arrive. Scrub-based scroll animations are strongly preferred over trigger-snap reveals; motion should respond to the user's scroll as if the content has physical mass. Parallax is appropriate for texture layers and large background elements.

Easing is `power2.out` exclusively for entrances — smooth deceleration, never mechanical snap. The gold divider element draws from center with `power2.inOut`.

Spring easing is strictly forbidden — it feels cheap against dark surfaces. Bounce easing is forbidden. Flip card animations are forbidden. High-energy or fast-cut transitions feel vulgar in this context. The upper limit is one animated element arriving per 0.3 seconds; if multiple elements enter simultaneously, the space feels cheap.

---

## 5. Interaction Vocabulary

**Allowed:**
- opacity-fade with subtle translateY (20–40px lift on entrance)
- clip-reveal on images (top-to-bottom curtain, 1.5s, `power3.inOut`)
- scrub-based parallax on background/decorative layers (40–80px travel, `scrub: 2`)
- scaleX draw on horizontal dividers (center origin)
- gold glow on card hover (shadow `0 0 20px rgba(201,169,110,0.08)`)
- border color shift from invisible to gold-tinted on card hover (400ms)
- underline expand from center on links (gold, 400ms)
- button fill on hover (gold outline fills with gold background, text inverts)
- counter tick on numeric stats (monospace, 2.2s — slowest of all styles)

**Banned:**
- spring or bounce easing on any element
- flip animations
- stagger intervals faster than 80ms between elements
- magnetic cursor effects
- scroll-linked background color shifts
- word-by-word text clip reveals (too aggressive for this register)
- scale-bounce on entrance (scale must settle smoothly)
- infinite-loop animations of any kind
- any hover interaction that moves content (translateY on hover is forbidden — luxury doesn't jump)

**Interaction limit per page:** 4 distinct scroll-triggered interactions maximum. More feels like a theme park.

**Why these bans exist:** These bans protect the restraint-as-confidence register — luxury communicates through stillness and precision, not kinetic demonstration.

**Identity-defining — never override:** infinite-loop animations; word-by-word text clip reveals (too aggressive for this register); hover `translateY` on content elements (luxury does not jump at cursor proximity)

**Default-off, brief can unlock:**
- *Scroll-linked background color shift* → Brief describes a single dramatic narrative transition or two distinct brand phases (heritage/future, day/night, two product lines) → Implementation: one transition only, very slow `scrub: 3–4`, between dark surfaces only (never light-to-dark — this style stays in the dark register) → Consumes one of the 4 interaction budget slots; identify which existing interaction it displaces
- *Stagger intervals below 80ms* → Brief describes a multi-item reveal where visual simultaneity is better than sequential reading (a logo grid reveal, a team photography grid) → Implementation: 60ms minimum stagger, applies to non-text elements only (logos, images) — never to paragraph or headline content

---

## 6. Texture and Surface Language

**Noise overlay:** 2.5% opacity (`opacity-[0.025]`). Adds the perception of depth on deep-dark surfaces — the visual equivalent of velvet grain. Essential; without it, dark surfaces read as flat digital voids.

**Border behavior:** 1px only, never thicker. Default borders are near-invisible (#1E1E28), almost indistinguishable from the surface — implied rather than stated. Gold borders (#C9A96E at 30% opacity) appear on hover as the accent signal. No rounded corners — `rounded-none` or `rounded-sm` maximum. Architecture over softness.

**Shadow behavior:** Shadows here are glows, not drops. No hard offset shadows. On hover: `shadow-[0_0_20px_rgba(201,169,110,0.08)]`. Elevated surfaces: `shadow-[0_0_30px_rgba(201,169,110,0.05)]`. Most elements carry no shadow at rest — they earn it on interaction.

**Decorative layers:** A single radial gold gradient glow in hero areas at 3% opacity maximum (`rgba(201,169,110,0.03)`). Section dividers: thin horizontal rules at `bg-accent/20`, maximum 80px wide. Large decorative letters from headlines at `opacity-[0.05]` as background elements are permitted. No dot grids, no geometric patterns, no gradient mesh.

**Materials invoked:** Obsidian, antiqued brass, aged leather, dark velvet, burnished gold leaf, lacquered wood. Every surface should feel like it has weight and warmth trapped beneath its darkness.

---

## 7. Image Mood

**Search keywords (mood register — apply to the brand's actual subject matter):**
- `dark moody [brand subject]`
- `architectural night photography`
- `material detail close-up low light`
- `elegant [brand subject] dark atmosphere`
- `texture close-up dark ambient`

> These keywords describe the mood register: dark surfaces, low light, material precision, atmosphere over energy. Substitute the brand's actual subject matter for bracketed terms — a jewellery brand searches "dark moody jewellery detail"; a hotel brand searches "architectural night photography interior"; a financial service uses "dark moody editorial portrait." The darkness and precision are the filter, not the content category.

**Aspect preferences:** Landscape 21:9 for full-bleed section breaks. Portrait 4:5 for detail cards. Square 1:1 for avatar/testimonial. Avoid tall portrait hero images — this aesthetic prefers wide cinematic framing.

**Filter/treatment:** `brightness(0.9) contrast(1.05)` on all images. Full-bleed atmospheric photos used at 20–30% opacity with a dark-to-black overlay gradient: `background-image: url('...'), linear-gradient(to bottom, rgba(10,10,16,0.5) 0%, rgba(10,10,16,0.95) 100%)`. Use `object-position: center 40%` to favor the compositionally rich middle. Warm lighting sources (candlelight, low tungsten) preferred.

**Role:** Structural and atmospheric — images carry the darkness and establish physical space. Full-bleed images function as atmosphere-setters; card-level images, when they appear for briefs that feature physical products or materials, should be tightly cropped detail shots that contribute to the tactile darkness of the section rather than decorative filler. If people appear, they are partially lit, in silhouette, or compositionally secondary to the space.

**What to avoid:** Bright airy photography with natural daylight. Stock-photo smiling professionals. Anything with a white or neutral background. Saturated colors. Images where light dominates rather than shadow.
