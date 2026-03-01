# Style: Refined Professional

---

## 1. Identity Narrative

> **Role:** Calibration anchor. This file is an optional reference — not a mandatory read. It represents the most fully-developed example of how warm-authority dimensional signals produce coherent output. When a generated direction shares significant territory with this aesthetic, reading the "why these bans exist" and "identity-defining — never override" sections provides invaluable calibration.

A senior partner's corner office at golden hour — floor-to-ceiling bookshelves in dark walnut, a leather Eames chair angled toward the window, the quiet authority of decades distilled into restraint. Every element earns its place. Nothing shouts; everything speaks with the measured confidence of someone who doesn't need to prove themselves. Warm materials, considered spacing, and the kind of typography that says "we've been doing this since before you were born."

---

## 2. Color System

```css
@import "tailwindcss";

@theme {
  /* ── Brand ── */
  --color-primary: #1B2A3D;
  --color-primary-light: #2A3D54;
  --color-primary-dark: #0F1A28;
  --color-secondary: #6B7A8D;
  --color-accent: #8B7355;
  --color-accent-light: #A08968;
  --color-accent-dark: #725E44;

  /* ── Semantic ── */
  --color-success: #3D8B6E;
  --color-warning: #C4923A;
  --color-error: #C45A4A;
  --color-info: #4A7AB5;

  /* ── Surfaces ── */
  --color-surface-primary: #FDFBF8;
  --color-surface-secondary: #F5F1EB;
  --color-surface-elevated: #FFFFFF;
  --color-surface-sunken: #EDE8E0;

  /* ── Text ── */
  --color-text-primary: #1B2A3D;
  --color-text-secondary: #6B7A8D;
  --color-text-disabled: #A3AEBB;

  /* ── Borders ── */
  --color-border: #E2DDD5;
  --color-border-strong: #CFC8BC;
}
```

### Dark mode overrides

```css
.dark {
  --color-surface-primary: #0F0E0C;
  --color-surface-secondary: #1A1816;
  --color-surface-elevated: #242220;
  --color-surface-sunken: #0A0908;

  --color-text-primary: #F0EDE8;
  --color-text-secondary: #8A8478;
  --color-text-disabled: #4A4740;

  --color-border: #2A2826;
  --color-border-strong: #3A3836;

  --color-accent: #A08968;
  --color-accent-light: #B8A07E;
}
```

> **Hero surface default:** This is a light-dominant aesthetic. Hero and page surfaces default to `--color-surface-primary` (#FDFBF8) unless the brief contains explicit dark-surface signals. Dark mode overrides are for section moments within a page, not a page-level default.

> **Reference palette** — these values apply when no brand colors were provided in Phase 1. If the client supplied brand colors, substitute their primary for `--color-primary` and their accent for `--color-accent` — but ensure the accent reads as a **material** (brass, aged stone, wood grain), not a digital primary color.
> **Within-aesthetic accent alternatives:** Forest `#2D5A27` (investment/sustainability firms), Slate blue `#3D5A80` (technology-adjacent professional services), Burgundy `#6B2D3E` (law, private equity, traditional finance) — the accent should feel like something in the room, not from a Pantone deck.

**Palette voice:** Everything here has warmth — never blue-gray, never pure gray. The surface family (warm off-white #FDFBF8, warm parchment #F5F1EB) feels like paper that has been touched, not a sterile screen. The deep navy-charcoal primary (#1B2A3D) provides authoritative contrast without coldness. The muted brass accent (#8B7355) reads as expertise — it is the brass of a well-used pen or a university crest, not of decoration or flash.

---

## 3. Typography System

```tsx
import { Fraunces, Plus_Jakarta_Sans, JetBrains_Mono } from "next/font/google";

const display = Fraunces({
  subsets: ["latin"],
  variable: "--font-display",
  display: "swap",
  weight: ["500", "600", "700"],
});

const body = Plus_Jakarta_Sans({
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
```

```css
@theme {
  --font-display: var(--font-display), Georgia, serif;
  --font-body: var(--font-body), system-ui, sans-serif;
  --font-mono: var(--font-mono), monospace;
}
```

> **Why this pairing:** Fraunces has optical-size quirks (the "wonky" characteristic) that give it handcrafted warmth without becoming casual — it reads as expertise distilled over time. Plus Jakarta Sans at 400 weight is modern and warm without displacing Fraunces's dominance. Never substitute a cold-axis or geometric serif.
> **Alternative display fonts that preserve the register:** `Lora` (more traditional, slightly less character), `Source Serif 4` (more neutral but optically sophisticated).

**Typographic voice:** Fraunces at semibold weights conveys expertise and permanence — it has the soft optical qualities of a classical serif without the stuffiness of Times New Roman. Headlines use tight tracking (-0.02em to -0.03em) at large display sizes; the size communicates confidence and the tight tracking communicates control. Body copy in Plus Jakarta Sans at weight 400 is modern and warm — readable without effort. The hero text column (`pt-40 justify-start`) descends from the top-left. When the brief supports a split layout and strong portrait photography exists, a tall portrait image occupies the right column at full hero height — authority grounded, not floating. When no suitable portrait photography is available or the brief calls for a different hero structure, the typographic column alone, supported by the decorative radial gradient (Section 6) and strong Fraunces headline scale, carries the authority.

---

## 4. Motion Personality

Measured and deliberate. Motion here communicates competence — it arrives on schedule, delivers, and settles without fuss. Entrance durations run 0.5–0.8 seconds per element. The hero sequence completes in approximately 1.3 seconds total. Easing is `power3.out` — confident deceleration.

The right-column portrait image reveals horizontally from the left edge (`inset(0 100% 0 0)`) simultaneously with the text entering — hero and image arrive together, not sequentially. Section headings reveal word-by-word with 60ms stagger at 85% scroll trigger — they land before the user reaches them, so they're never caught mid-reveal.

High-motion anything is incompatible with this aesthetic. No magnetic cursors. No scroll-linked color shifts. No dramatic or cinematic effects. The upper limit is a modest card lift on hover (2px) and the established word-reveal on headings. More than this reads as a firm that is trying too hard to seem current.

---

## 5. Interaction Vocabulary

**Allowed:**
- word-by-word opacity + translateY reveal on h2 headings (60ms stagger, `power2.out`, triggered at 85%)
- clip-path reveal on hero headline (`inset(100% 0 0 0)`, 0.8s)
- horizontal clip-reveal on hero portrait image (`inset(0 100% 0 0)`, 1.0s, `power2.inOut`)
- opacity-fade with translateY on below-fold content
- card lift on hover (`translateY(-2px)` + shadow escalation, 300ms)
- button scale on hover (`scale(1.02)`, 300ms) with shadow escalation
- link underline expand from left (brass accent, 300ms)
- sticky card pinning with scale+blur on previous card (0.95 scale, 4px blur)
- counter tick on stats (monospace, 1.8s, `power2.out`)
- active state scale-down (`scale(0.98)`)

**Banned:**
- magnetic cursor effects
- scroll-linked background color shifts
- spring or bounce easing
- word-by-word reveals at faster than 50ms stagger (frantic energy is wrong here)
- angular sharp corners (`rounded-none`)
- dot grids, gradient meshes, geometric patterns
- colored shadows
- thick borders (2px+)
- any animation over 1.0s duration for interactive elements

**Interaction limit per page:** 4 distinct scroll-triggered interactions. Authority is demonstrated through consistency, not variety.

**Why these bans exist:** These bans protect the measured authority register — the understated confidence of an established institution. Performative interactions undermine the premise that this brand does not need to try.

**Identity-defining — never override:** magnetic cursor effects; spring or bounce easing; colored shadows; animated decorative elements

**Default-off, brief can unlock:**
- *Angular sharp corners* (`rounded-none`) → Brief signals a deliberately austere institutional aesthetic ("government," "brutalist architecture," "Swiss precision," "radical simplicity") that rejects softness as a deliberate position → Implementation: applies to cards and containers only — buttons remain moderately rounded as a usability affordance
- *Scroll-linked background color shift* → Brief describes a narrative that genuinely shifts in register mid-page (two distinct practice areas, clear heritage/future division) → Implementation: one transition only, between neutral surfaces (never light-to-dark-luxury territory), `scrub: 2`, slow and barely perceptible → Consumes one of the 4 interaction budget slots; identify which existing interaction it displaces

---

## 6. Texture and Surface Language

**Noise overlay:** 2.5% opacity (`opacity-[0.025]`) with SVG feTurbulence (`baseFrequency="0.8" numOctaves="4"`). Applied as a fixed overlay, pointer-events-none. The grain gives the warm off-white surfaces a paper-like quality — imperceptible until absent.

**Border behavior:** 1px always — never thicker. Warm gray (#E2DDD5) as default. The radius hierarchy matters: `rounded-2xl` for cards and containers, `rounded-xl` for smaller cards, `rounded-lg` for buttons and inputs, `rounded-full` for badges and avatars. No sharp corners anywhere — this is not an aggressive aesthetic.

**Shadow behavior:** Warm-tinted shadows using the primary color at low opacity (`rgba(27,42,61,0.06)` base). Three levels: sm, md, lg. Shadows communicate elevation, not drama. On hover, shadows escalate by one level. No colored shadows. No hard-offset shadows.

**Decorative layers:** A single optional radial gradient in the hero area (`rgba(139,115,85,0.04)`, centered right) provides subtle warmth. No other decorative elements. No gradient mesh. No patterns.

**Materials invoked:** Dark walnut, warm parchment, aged leather, brushed brass, thick cotton paper, architectural stone. Every surface implies permanence and quality.

---

## 7. Image Mood

**Search keywords:**
- `modern office interior warm light`
- `architectural detail warm wood`
- `library books warm tones`
- `professional meeting boardroom`
- `city skyline golden hour`

**Deriving image keywords:** Apply the mood register modifiers to the brand's actual domain. Do NOT use the example keywords verbatim. Process: (1) brand's core subject matter — what do they do, make, or serve? (2) apply the mood modifier (warm, editorial, measured) to that subject. (3) add environmental context. Example for refined-professional applied to a tech consultancy: "warm editorial technology advisory office natural light" — not "leather books reading light."

**Aspect preferences:** Portrait 3:4 or 4:5 is the preferred aspect for a hero right-column image in a split layout — portrait orientation fills the tall column height naturally, `min-h-screen object-cover`. Landscape 16:9 for about/editorial sections. 4:3 for service cards. 1:1 for team avatars.

**Filter/treatment:** `rounded-xl overflow-hidden` on all image containers. Slight hover scale (`scale(1.03)`, 500ms) — restrained but present. In dark mode: `brightness(0.9) contrast(1.05)`. Warm tones are strongly preferred over cool; golden hour lighting over midday blue-white.

**Role:** Human presence builds credibility. When the brief supports a split hero with strong portrait photography, the right-column image provides the visual authority and warmth this style requires — it is the primary emotional signal. When portrait photography is not available or appropriate for the brief, a centered typographic hero supported by the decorative radial gradient and strong Fraunces headline scale carries the authority through type and scale alone. Documentary photography in service sections (real spaces, real materials, real environments) builds credibility. Testimonial avatars should be professional headshots, not illustrated icons.

**What to avoid:** Cold, blue-shifted photography. Abstract gradients as primary imagery. Technology close-ups or UI screenshots. Generic stock photography with obvious staging (shaking hands at awkward angles, groups of diverse professionals staring at a whiteboard). Anything that reads as corporate-clip-art rather than genuinely observed.
