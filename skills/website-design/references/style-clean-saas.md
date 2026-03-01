# Style: Clean SaaS

---

## 1. Identity Narrative

> **Role:** Calibration anchor. This file is an optional reference — not a mandatory read. It represents the most fully-developed example of how its dimensional signals produce coherent output. When a generated direction shares significant territory with this aesthetic, reading the "why these bans exist" and "identity-defining — never override" sections provides invaluable calibration.

A perfectly calibrated instrument — clean surfaces, precise alignment, the magnetic energy of software that just works. Every pixel is engineered, nothing is wasted. There's a developer's appreciation for elegant systems here: monospace accents whisper "we built this right," subtle gradients pulse with quiet energy, and the interactions feel responsive to the millisecond. This is for products where the interface IS the brand.

---

## 2. Color System

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

### Dark mode overrides

```css
.dark {
  --color-surface-primary: #0A0A14;
  --color-surface-secondary: #14141E;
  --color-surface-elevated: #1E1E2A;
  --color-surface-sunken: #060609;

  --color-text-primary: #F0F0F5;
  --color-text-secondary: #888899;
  --color-text-disabled: #4A4A5A;

  --color-border: #1E1E2E;
  --color-border-strong: #2E2E42;

  --color-accent: #818CF8;
  --color-accent-light: #A5B4FC;
}
```

> **Reference palette** — these values apply when no brand colors were provided in Phase 1. If the client supplied brand colors, substitute their accent for `--color-accent` while keeping the cool neutral slate surfaces.
> **Within-aesthetic accent alternatives:** Emerald `#10B981` (growth/revenue-focused products), Violet `#7C3AED` (AI/creative tools), Electric blue `#2563EB` (infrastructure/devtools) — one saturated accent on cool neutral surfaces is the rule, not the specific indigo.

**Palette voice:** White and near-white create the illusion of infinite space — the clean alternation between #FFFFFF and #F8FAFC is subtle enough to feel like the same canvas but structured enough to give rhythm. The indigo accent (#6366F1) is used like a laser pointer: sparingly, directing attention precisely to interactive elements and never decorating surfaces. The dot grid background pattern should be rendered at 8–10% opacity — at lower opacity it becomes invisible at typical monitor calibration and loses its engineering signal entirely.

---

## 3. Typography System

```tsx
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
  weight: ["400", "500"],
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

> **Why this pairing:** Space Grotesk's geometric precision reads as engineering competence; Figtree's clean neutrality supports without competing. JetBrains Mono as a first-class citizen (badges, labels, stat numbers) signals "we built this right" — treat it as a texture, not just code formatting.
> **Alternative display fonts that preserve the register:** `Geist` (Vercel-era precision, slightly more distinctive), `Outfit` (geometric with subtle warmth, maintains engineering register).

**Typographic voice:** Space Grotesk at bold weights with tight tracking (-0.02em) commands attention through geometric precision — headlines feel engineered, not expressive. Monospace is a first-class citizen here, appearing on version badges, stat numbers, technical labels, and category tags — not just for code, but as a recurring signal that communicates "we built this right." A gradient accent on one headline keyword (`bg-gradient-to-r from-accent to-accent-light bg-clip-text text-transparent`) introduces a moment of warmth in an otherwise cool typographic system — use once per page when the brief supports it, applied to the word that carries the most commercial weight in the primary headline.

---

## 4. Motion Personality

Precise and mechanical. Motion communicates that the product is fast and responsive — it mirrors the behavior of the software being sold. Entrance durations run 0.4–0.7 seconds for primary elements; total hero sequences complete in approximately 1.5 seconds. Elements enter from below with `power3.out` — controlled deceleration, no lingering.

The badge enters from above (`y: -10`) as an exception; everything else arrives from below. Product mockups scale up subtly (0.95 → 1) on entrance, implying the UI materializing.

Organic easing (spring, elastic) is banned — this aesthetic is engineering, not nature. Bounce is banned. Slow luxury pacing (over 0.8s for secondary elements) feels sluggish against what should read as a fast product. Scrub-based parallax is too slow and weighted for this style — use trigger-snap reveals instead.

---

## 5. Interaction Vocabulary

**Allowed:**
- opacity-fade with translateY entrance (badge drops from above, elements rise from below)
- scale-up on product mockup entrance (0.95 → 1, `power2.out`)
- card lift on hover (`translateY(-4px)` + shadow escalation)
- border tightening on card hover (`border → border-strong`)
- button scale on hover (`scale(1.02)`) with shadow escalation
- link underline expand from left (accent color, 250ms)
- active state scale-down (`scale(0.98)`)
- counter tick on stats (monospace, 1.5s)
- tab/toggle transitions with active indicator slide
- sticky card pinning with scale+blur on previous card (0.95 scale, 3px blur)

**Banned:**
- spring or bounce easing
- slow luxury pacing (anything over 0.7s for secondary elements)
- scrub-based parallax
- magnetic cursor effects
- scroll-linked background color shifts
- serif fonts anywhere
- warm-tinted surfaces or shadows
- noise overlay above 3%
- hard offset shadows (this aesthetic uses soft layered shadows only)

**Interaction limit per page:** 5 distinct scroll-triggered interactions. SaaS sites are information-dense; interactions should guide, not perform.

**Why these bans exist:** These bans protect the engineering-competence register — precision, calibration, nothing performative. Each banned pattern shifts the register toward expressiveness this style explicitly rejects.

**Identity-defining — never override:** serif fonts anywhere; warm-tinted surfaces or shadows; hard offset shadows (this style uses soft layered shadows only)

**Default-off, brief can unlock:**
- *Magnetic cursor effects* → Brief references specific competitors that use them ("feels like Linear," "feels like Raycast," "feels physical," "alive in the hand") or describes interaction as the product's core differentiator → Implementation: one primary CTA only, elastic return `elastic.out(1, 0.4)` (unlocks elastic easing for this element only), 15% pull strength max
- *Scroll-linked background color shift* → Brief describes a multi-stage narrative where the product evolves or the brand serves two distinct audiences → Implementation: one transition per page, between one light and one dark section only, `scrub: true`, minimal gradient (no dramatic color shift)

---

## 6. Texture and Surface Language

**Noise overlay:** 2% opacity (`opacity-[0.02]`). Barely present — just enough to prevent the flat digital feel of pure white surfaces. If removed entirely, the site risks looking unfinished.

**Dot grid pattern:** Accent-tinted radial dots at 8–10% opacity, 20px grid spacing. Applied to the hero section background or one content section — never more than one section per page. Render at 8–10% opacity minimum: below this threshold the pattern becomes invisible at typical monitor calibration and loses its engineering signal. Use the subtle gradient mesh alternative when the brief calls for less surface texture.

```css
background-image: radial-gradient(circle, rgba(99,102,241,0.09) 1px, transparent 1px);
background-size: 20px 20px;
```

**Border behavior:** Crisp, light, consistent — 1px everywhere. Cards, inputs, dividers all receive thin borders (#E2E8F0). Radius is `rounded-xl` on cards, `rounded-lg` on buttons and inputs, `rounded-full` on badges. Nothing is sharp-cornered; nothing is overly soft.

**Shadow behavior:** Layered, cool-tinted, soft-diffused. Three levels of escalation: sm → md → lg. Product mockups use `shadow-2xl` for depth — they should appear to float above the surface. No colored shadows; no hard-offset shadows.

**Decorative layers:** Optional subtle gradient mesh at 3% opacity using accent tones in hero areas. Monospace text used as visual accent throughout UI (badges, labels) — this is a texture decision as much as a typography one. No geometric patterns, no grain.

**Materials invoked:** Polished glass, cool aluminium, digital screen, precisely machined components. The surface language is technology, not nature.

---

## 7. Image Mood

**Search keywords:**
- `software interface clean minimal`
- `developer workspace setup`
- `dashboard UI design dark`
- `product mockup floating`
- `abstract gradient mesh purple blue`

**Aspect preferences:** 16:10 for product screenshots (matches common monitor ratio). 4:3 for feature detail cards. 1:1 for team avatars. The hero product mockup should be wide and dominant (`max-w-5xl`), not a thumbnail.

**Filter/treatment:** Product screenshots are presented as UI artifacts — `rounded-xl border border-border shadow-2xl` — not cropped photography. Abstract gradient backgrounds used at 5–10% opacity only. In dark mode, screenshots should use dark-mode variants where available.

**Role:** Evidential. Images prove the product exists and works. For products with a visible interface, the product mockup in the hero is the primary visual — it demonstrates before copy describes. For API-only tools, infrastructure, or services without a UI to show, replace the mockup with a code snippet, architecture diagram, or abstract gradient that communicates technical quality honestly rather than fabricating a visual that doesn't exist. Abstract gradients serve as atmospheric texture behind sections. Decorative accent images have no role here.

**What to avoid:** Warm or organic photography (no cafés, no hands, no artisan settings). Stock images of people smiling at laptops. Serif-heavy editorial photography. Any image with visible warmth in its color palette — cool, blue-shifted, or neutral tones only.
