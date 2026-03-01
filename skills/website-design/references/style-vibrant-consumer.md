# Style: Vibrant Consumer

---

## 1. Identity Narrative

> **Role:** Calibration anchor. This file is an optional reference — not a mandatory read. It represents the most fully-developed example of how its dimensional signals produce coherent output. When a generated direction shares significant territory with this aesthetic, reading the "why these bans exist" and "identity-defining — never override" sections provides invaluable calibration.

Walk into a brand-new juice bar on a sunny Saturday and you'll understand this aesthetic immediately. The counter is mango-lacquered. The menu boards use a typeface that has opinions. The product sits in packaging that shouts its personality from across the room. The staff know the product is good and they're not shy about it.

Vibrant Consumer is not polished corporate and not humble craft — it is confident joy. The brand has something to say and says it without apology. Color is the primary design medium: it arrives before the typography, before the photography, before the copy. The palette is warm and forward, either saturated primaries or bold pastels that glow. Nothing is muddy. Nothing retreats.

This aesthetic serves brands with distinct personality: direct-to-consumer products, consumer apps that make daily life better, food and beverage companies with a point of view, lifestyle services, and anything where the target customer is a real human who wants to feel something when they interact with the brand. The word "premium" is replaced by "worth it." Trust is built through delight, not authority.

Think: Oatly. Monzo. Innocent Drinks. Liquid Death (without the darkness). A farmers' market made digital and scalable.

---

## 2. Color System

```css
@theme {
  /* Surfaces */
  --color-surface-primary: #FAFAF5;
  --color-surface-secondary: #F3F3EB;
  --color-surface-sunken: #E8E8DE;

  /* Text */
  --color-primary: #1A1A15;
  --color-secondary: #5C5C56;
  --color-disabled: #ABABAA;

  /* Borders */
  --color-border: rgba(26, 26, 21, 0.10);
  --color-border-strong: rgba(26, 26, 21, 0.22);

  /* Accent — bold coral-orange */
  --color-accent: #FF5C35;
  --color-accent-light: #FF7A57;
  --color-accent-dark: #E04421;
  --color-accent-rgb: 255, 92, 53;

  /* Secondary accent — golden yellow */
  --color-accent-secondary: #FFD23F;

  /* Dark surfaces (for CTA and dark sections) */
  --color-dark: #1A1A15;
  --color-dark-surface: #232318;

  /* Typography */
  --font-display: 'Bricolage Grotesque', sans-serif;
  --font-body: 'Plus Jakarta Sans', sans-serif;
  --font-mono: 'JetBrains Mono', monospace;

  /* Type scale — slightly more generous than average */
  --text-display-xl: clamp(3.5rem, 10vw, 8rem);
  --text-display: clamp(2.5rem, 6vw, 5rem);
  --text-h1: clamp(2rem, 4vw, 3.5rem);
  --text-h2: clamp(1.5rem, 3vw, 2.25rem);
  --text-h3: clamp(1.25rem, 2vw, 1.75rem);
  --text-h4: 1.125rem;
  --text-body-lg: 1.125rem;
  --text-body: 1rem;
  --text-body-sm: 0.875rem;

  /* Spacing */
  --radius-card: 1.25rem;
  --radius-button: 9999px; /* pill buttons are on-brand here */
  --radius-input: 0.75rem;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  @theme {
    --color-surface-primary: #1A1A15;
    --color-surface-secondary: #232318;
    --color-surface-sunken: #2E2E22;
    --color-primary: #F5F5EE;
    --color-secondary: #A0A099;
    --color-border: rgba(245, 245, 238, 0.10);
    --color-border-strong: rgba(245, 245, 238, 0.18);
  }
}
```

> **Reference palette** — these values apply when no brand colors were provided in Phase 1. The coral accent is the default but the rule is more important than the specific color: one vivid, warm, confident accent on near-white surfaces.
> **Within-aesthetic accent alternatives:** Electric lime `#B5E61D` (health/energy brands), Hot magenta `#FF2D9C` (beauty/fashion DTC), Sunny yellow `#FFD23F` (food/beverage) — the accent should be the first thing visitors notice, not the second.

**Palette voice:** Color here is not decoration — it is the first thing the brand says. The coral accent appears liberally, not sparingly — it can fill buttons, appear as bold section backgrounds, and mark inline keywords. Its frequency signals confidence, not carelessness: the accent is the brand's primary communication tool, not a detail applied for polish. The golden secondary accent provides contrast relief. The background is not white but a warm near-white — the brand lives in natural light, not a sterile studio. When dark sections appear they use the brand's dark olive-charcoal, never generic black, to stay in the brand's warmth family.

---

## 3. Typography System

```tsx
// src/app/layout.tsx
import { Bricolage_Grotesque, Plus_Jakarta_Sans, JetBrains_Mono } from "next/font/google";

const display = Bricolage_Grotesque({
  subsets: ["latin"],
  axes: ["opsz", "wdth", "wght"],
  variable: "--font-display",
  display: "swap",
});

const body = Plus_Jakarta_Sans({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700"],
  variable: "--font-body",
  display: "swap",
});

const mono = JetBrains_Mono({
  subsets: ["latin"],
  weight: ["400", "500"],
  variable: "--font-mono",
  display: "swap",
});
```

```css
/* globals.css additions */
.font-display { font-family: var(--font-display); font-variation-settings: 'wght' 700, 'wdth' 100; }
h1, h2, h3 { font-family: var(--font-display); letter-spacing: -0.025em; }
p, li { font-family: var(--font-body); }

/* Bricolage Grotesque variable weight hover — use on CTAs and headlines */
.weight-on-hover { transition: font-variation-settings 0.2s ease; }
.weight-on-hover:hover { font-variation-settings: 'wght' 800, 'wdth' 110; }
```

> **Why this pairing:** Bricolage Grotesque is a variable grotesque with genuine personality — the width and weight axes let headlines shift expressively. Plus Jakarta Sans provides modern clarity for body. The pairing reads as confident and direct, not polished or academic.
> **Alternative display fonts that preserve the register:** `Archivo` (variable grotesque, slightly less expressive), `Unbounded` (more distinctive, wider proportions for brands with space to own).

**Typographic voice:** Bricolage Grotesque is an expressive variable grotesque — it has personality that Inter simply doesn't. Headlines should use it at bold-to-extra-bold weights. Display text can push toward the wide axis for emphasis. Body copy in Plus Jakarta Sans is clean and modern without feeling cold. Labels and category markers use tracking-[0.08em] uppercase with moderate weight — they are signs, not whispers. The typographic hierarchy should always be obvious: big, medium, small — never four similar sizes competing. The brand speaks in sizes, not subtlety.

---

## 4. Motion Personality

Quick and expressive. Vibrant Consumer sites move with the confidence of a brand that knows what it is. Entrances are fast — 0.35–0.5s — but they have weight: things arrive, they don't drift. Spring easing is permitted in very specific contexts (the bounce on a CTA button after click, a card "popping" to the foreground on hover) but one overshoot maximum — this is a confident spring, not a playful bounce.

Stagger between sibling elements: 60–80ms. Not 120ms. The brand moves fast because it has somewhere to be.

Scroll-linked scrub animations are wrong here. They feel laboured and contemplative — the opposite of this brand's tempo. ScrollTrigger triggers once, plays fast, done.

What is banned: bounce easing on text elements or section entrances. Infinite-loop animations other than marquee scrollers. Slow fade-in-only (always combine opacity with transform). Anything that makes the user wait.

The motion ceiling: a hero entrance animation plus two scroll-triggered sections is expressive. More starts to feel hyperactive. The brand is confident — it doesn't need to perform constantly.

---

## 5. Interaction Vocabulary

**Allowed:**
- clip-reveal on section entrances (0.5s, power3.inOut — fast and decisive)
- opacity + translateY(20px) for standard fade-up (0.4s, power2.out)
- scale(1.04) on card hover, back to scale(1) on leave
- background-color fill on button hover (accent → accent-dark, 0.15s)
- pill button scale(1.02) on hover, scale(0.97) on active
- variable font weight shift on hero headline hover (if using Bricolage Grotesque)
- marquee scrollers (CSS, not GSAP)
- color shift between sections using ScrollColorShift — use when sections have genuinely distinct tonal identities; do not use when all sections share the same brand energy

**Banned:**
- spring/bounce easing on entrance animations (only on click-response)
- scrub-based scroll animations (too slow for this tempo)
- rotation animations on content elements
- infinite-loop animations other than marquees
- opacity-only fades (always include transform)
- cursor-follower effects (too precious for this brand's directness)

**Interaction limit per page:** 2 ScrollTrigger-heavy sections maximum. This brand's energy comes from color and pace, not quantity of motion.

**Why these bans exist:** These bans protect the fast-and-direct brand tempo — scrub-based animations feel contemplative and slow when this brand is built on immediacy; opacity-only fades feel passive when the brand's personality is forward and expressive; rotation animations feel decorative and arbitrary when the brand communicates through purposeful action.

**Identity-defining — never override:** scrub-based scroll animations; opacity-only fades on content elements (always pair with transform); rotation animations on content elements

**Default-off, brief can unlock:**
- *Cursor-follower effects* → Brief describes an interactive product demo, a game-like onboarding experience, or a brand that positions itself as "playful technology" where cursor interaction is a brand expression → Implementation: cursor moves on a direct linear path (no trail), radius max 24px, the cursor element uses the brand's accent colour, disables on mobile
- *Spring easing on elements beyond CTA click-response* → Brief describes a brand personality explicitly centred on joy or playfulness at scale (the brand IS the bounce, not a brand that has bounce as a feature) → Implementation: single overshoot only (`elastic.out(1, 0.4)`), applies to one interaction type per page — not generalised across all interactive elements

---

## 6. Texture and Surface Language

**Noise overlay:** 0.03 opacity (3%) — enough to break digital flatness, not enough to muddy the vivid palette.

**Borders:** Visible and present (1px solid, rgba border color). Cards have border-radius at var(--radius-card) = 1.25rem — rounded, approachable. Buttons are pill-shaped (border-radius: 9999px). Inputs are moderately rounded (0.75rem).

**Shadows:** Used for elevation — cards lift with `shadow-md` normally and `shadow-xl` on hover. Shadows use the brand's warm dark color at low opacity rather than generic grey-black.

**Decorative layers:** Bold solid-color section backgrounds are core to this aesthetic — a full-bleed section in the primary accent colour, adjacent to a section in the secondary accent or a neutral warm surface, creates the colour rhythm that defines this style. The specific colours come from the brief's palette. Geometric shapes (circles, blobs) at large scale in the background at 8-15% opacity can add playfulness. Illustrated elements are welcome if on-brand.

**Materials invoked:** Mango packaging. A grocery store's signage. A well-designed water bottle label. Bright painted concrete. Warm paper bags. This is not digital glass or polished metal — it is physical, tactile, and sunny.

---

## 7. Image Mood

**Search keywords:** "vibrant lifestyle photography," "colorful food product," "joyful everyday moment," "natural light portrait candid," "street food market"

**Aspect preferences:**
- Hero: wide landscape (16:9 or 3:1 cinematic crop) for energy
- Product: square (1:1) or slight portrait (4:5)
- Lifestyle: portrait (4:5, 3:4) — people, real moments

**Filter/treatment:** Warm, slightly saturated. Images should feel like they were taken on a bright day, not in a studio. Subtle warmth filter (+10 temperature). Avoid flat/cool-toned photography. Full-color always — no desaturation or black-and-white. Subjects should be active or in motion, not static poses.

**Role:** Images are evidence of the brand's world. They show people *using* or *enjoying* the product, not just looking at it. Lifestyle > product-only. Authenticity > perfection.

**What to avoid:**
- Flat-lay product photography (too sterile)
- Stock photo "diverse team meeting" clichés
- Dark, moody, or dramatic photography (wrong emotional register)
- Images that read as "luxury" (wrong audience)
- Any photography with cool/blue color grading
