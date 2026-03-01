# Core Aesthetic Vocabulary

Read this file during Phase 2 Step 1 to map brief signals to implementation decisions. This replaces the style preset lookup — aesthetic decisions are derived from dimensional analysis, not preset names.

---

## §1 — Six Dimensions

### 1.1 Surface Temperature
**Definition:** The emotional warmth or coolness of the brand's material world.

**Brief signals:**
- Warm: earth, handmade, clay, linen, craft, natural, artisan, human, organic, tactile
- Cool: engineering, precision, chrome, data, technical, digital, systematic, efficient, measured
- Neutral: professional, modern, contemporary (no strong temperature pull)

**Implementation by position:**
- **Warm** → Surface palette pulled from earth (cream #FDFBF8, parchment #F5F1EB, terracotta accent #B8704A, sienna, olive). Type with humanist curves. Imagery with natural light and tactile surfaces. Noise overlay at medium opacity.
- **Cool** → Surface palette pulled from steel and paper (cool white #F8F9FA, fog #EEF0F2, slate accent #4A7AB5). Geometric type. Imagery with precision and clarity. No noise or very low.
- **Neutral** → Mid-tone surfaces, flexible type choice, imagery reads as "professional."

---

### 1.2 Motion Restraint
**Definition:** How much motion the brand's register can absorb without breaking character.

**Brief signals:**
- Restrained: "considered," "unhurried," "editorial," "refined," "measured," "quiet," "trusted," "heritage"
- Moderate: "modern," "professional," "clean," "clear," "effective," "reliable"
- Expressive: "bold," "kinetic," "energy," "dynamic," "exciting," "vibrant," "alive," "disruptive"

**Implementation by position:**
- **Restrained** → Entrance animations only (fade + upward drift). Long durations (600–900ms). `cubic-bezier(0.4, 0, 0.2, 1)` ease-out. No hover transforms beyond color/opacity. Stagger on text lines only.
- **Moderate** → Entrance + subtle hovers. Medium durations (400–600ms). Ease-in-out. Mild scale transforms (1.02–1.03). Stagger on grid items.
- **Expressive** → Entrance + hover + ambient + cursor effects. Short durations (200–400ms). Spring easing. Bold transforms. Kinetic type allowed.

---

### 1.3 Surface Depth
**Definition:** Whether the brand occupies dark or light surfaces as its primary register.

**Brief signals:**
- Dark-first: "exclusive," "immersive," "nocturnal," "premium," "cinematic," "dramatic," "private"
- Light-first: "open," "airy," "transparent," "honest," "clear," "approachable," "daylight," "fresh"
- Neutral: no explicit depth signal in brief

**Implementation by position:**
- **Dark-first** → Page surface near-black or deep dark (#0A0A0A–#1E1E1E or warm/cool variants). Text near-white. Accents luminous.
- **Light-first** → Page surface near-white or warm off-white (#FDFBF8–#F5F1EB). Text dark. Sections use `surface-secondary` for contrast rhythm.
- **RULE:** If the brief has no explicit dark-surface signal, default to light-first regardless of industry. Dark is a creative decision, not a default.

---

### 1.4 Authority Register
**Definition:** The brand's relationship to institutional authority.

**Brief signals:**
- Establishment: "trust," "decades," "expert," "certified," "heritage," "proven," "established," "advisors"
- Anti-establishment: "raw," "honest," "unapologetic," "no-BS," "direct," "independent," "challenger"
- Consumer: "fun," "delight," "everyone," "easy," "accessible," "friendly," "joyful"
- Technical: "precise," "engineered," "systematic," "data-driven," "API," "performance," "developers"

**Implementation by position:**
- **Establishment** → Serif display type. Measured spacing. Muted, material accents. Formal layouts. Minimal humor. Long-form credentialing.
- **Anti-establishment** → High contrast. Blunt copy. Limited decoration. Strong opinions encoded in interaction bans.
- **Consumer** → Playful type. Colorful palette. Rounded forms. Generous whitespace. Inviting CTAs. Celebration moments.
- **Technical** → Monospace accents. Data-forward layouts. Geometric type. Precision in spacing. Code blocks as decoration.

---

### 1.5 Type Personality
**Definition:** The emotional register of the primary display typeface.

**Brief signals:**
- Humanist serif: warmth, expertise, trust, story, literary, editorial, heritage
- Geometric sans: precision, modern, tech, systematic, clarity, efficiency, startup
- Editorial display: bold, kinetic, contrast, statement, unapologetic, agency
- Variable: progressive, flexible, technology-forward, editorial experimentation

**Implementation by position:**
- **Humanist serif display** → Fraunces, Playfair Display, Cormorant Garamond — for warmth and authority. Pair with humanist sans body (Plus Jakarta Sans, Source Sans 3).
- **Geometric sans display** → Space Grotesk, Geist, Outfit, Albert Sans — for precision and clarity. Pair with same family or neutral body.
- **Editorial display** → Bebas Neue, clash grotesques — for high contrast and kinetic energy. Pair with neutral body (Figtree, Plus Jakarta Sans).
- **Variable** → Recursive, Instrument Serif — when type IS the animation. Use sparingly.

**Default pairing by authority register:**
- Establishment → Humanist serif display + humanist sans body
- Anti-establishment → Editorial display + geometric sans body
- Consumer → Geometric sans display (rounded) + same family body
- Technical → Geometric sans display + monospace accent for code moments

---

### 1.6 Texture Appetite
**Definition:** How much physical material texture the brand can absorb.

**Brief signals:**
- High: "material," "tactile," "analogue," "handmade," "craft," "physical," "organic," "printed"
- Medium: "quality," "premium," "considered," "crafted" (but not explicitly handmade)
- Low: "clean," "precise," "minimal," "digital," "systematic," "pure," "sharp"

**Implementation by position:**
- **High** → Noise overlay at 3–5% opacity on hero. Visible grain on surfaces. Borders with soft diffusion. Shadows with spread. Background textures.
- **Medium** → Noise overlay at 1–2% opacity. Clean borders. Subtle shadow system (soft, not geometric).
- **Low** → No noise. Crisp 1px borders. Geometric shadows or no shadows. Pure surfaces. No grain.

---

## §2 — Motion Constraint Rules

### Why This Matters
Motion communicates energy level. A restrained brand using kinetic animations reads as inconsistent, not modern. An expressive brand using only fade-ins reads as flat, not refined.

### Congruent vs. Incongruent Techniques

| Technique | Restrained | Moderate | Expressive |
|---|---|---|---|
| Fade-in entrance (opacity 0→1) | Congruent | Congruent | Congruent |
| Upward drift (y: 24→0) | Congruent | Congruent | Congruent |
| Stagger on text lines | Congruent | Congruent | Congruent |
| Subtle card hover lift | Incongruent | Congruent | Congruent |
| Scale transform on hover (1.02–1.03) | Incongruent | Congruent | Congruent |
| Underline reveal on links | Incongruent | Congruent | Congruent |
| Rotation transforms | Incongruent | Incongruent | Congruent |
| Spring-bounce physics | Incongruent | Incongruent | Congruent |
| Magnetic cursor | Incongruent | Incongruent | Congruent |
| Ambient loops | Incongruent | Incongruent | Congruent |
| Parallax scroll | Incongruent | Incongruent | Congruent |
| Kinetic typography | Incongruent | Incongruent | Congruent |
| Page transitions with kinetic sweep | Incongruent | Incongruent | Congruent |

---

## §3 — Type Vocabulary

| Category | Examples | Brief Signals | Default Body Pairing |
|---|---|---|---|
| Humanist serif | Fraunces, Playfair Display, Cormorant Garamond | trust, warmth, expertise, editorial, literary | Plus Jakarta Sans, Source Sans 3 |
| Geometric sans | Space Grotesk, Geist, Outfit, Albert Sans | precision, tech, modern, systematic, clean | Same family or Figtree |
| Editorial display | Bebas Neue, clash grotesques | bold, kinetic, contrast, statement | Figtree, Plus Jakarta Sans |
| Transitional serif | Libre Baskerville, IBM Plex Serif | established, academic, trusted, long-form | Source Sans 3, humanist sans |
| Variable | Recursive, Instrument Serif | progressive, experimental, type-as-animation | Use sparingly |

---

## §4 — Colour Temperature Hex Ranges

### Warm Surface Families
- Near-white: #FDFBF8 → #F5F1EB (cream/parchment)
- Mid-warm: #EDE8E0 → #D4CDBC
- Warm accents: #B8704A (terracotta), #9A5C3A (burnt sienna), #8B7355 (brass), #7A8C3A (olive)
- Warm darks: #3D2B1F → #2A1C14 (rich warm brown)

### Cool Surface Families
- Near-white: #F8F9FA → #EEF0F2 (fog/steel white)
- Mid-cool: #DDE1E6 → #C8CDD5
- Cool accents: #4A7AB5 (slate blue), #3D6699 (deeper slate), #5A7A9A (steel blue)
- Cool darks: #1A2332 → #0F1520 (deep navy-black)

### Dark-First Families
- Warm dark: #0F0A08 → #1A140F → #241C16 (near-black with brown undertone)
- Cool dark: #0A0F14 → #141B22 → #1E2630 (near-black with blue undertone)
- Pure dark: #0A0A0A → #141414 → #1E1E1E (neutral near-black)

---

## §5 — Interaction Budget by Motion Level

The interaction budget controls how many high-demand motion techniques are allowed per page. Exceeding it breaks the brand's motion register.

| Motion Restraint | High-motion techniques (max) | Moderate techniques (max) | Minimal techniques |
|---|---|---|---|
| Expressive | 2 | 3 | Unlimited |
| Moderate | 1 | 2 | Unlimited |
| Restrained | 0 | 1 | Unlimited |

**High-motion techniques:** Ambient loops, cursor-following effects, kinetic typography, parallax, page transitions with sweep, 3D tilt
**Moderate techniques:** Card hover lifts with shadow, underline reveals, image zoom on hover, stagger on grid items, number counters
**Minimal techniques:** Fade-in entrance, upward drift entrance, opacity transitions on hover, color transitions on hover

---

## §6 — Vocabulary File Matching

The `style-*.md` files are calibration anchors — the most fully-developed examples of how dimensional signals produce coherent output. When a generated direction shares dimensional territory with one of these files, read its "identity-defining — never override" and "why these bans exist" sections.

| Style File | Surface Temp | Motion Restraint | Surface Depth | Authority | Type | Texture |
|---|---|---|---|---|---|---|
| style-refined-professional.md | Warm | Restrained | Light-first | Establishment | Humanist serif | Medium |
| style-warm-artisan.md | Warm | Restrained | Light-first | Anti-establishment (craft) | Humanist serif | High |
| style-bold-studio.md | Neutral | Expressive | Dark-first | Anti-establishment | Editorial display | Low |
| style-dark-luxury.md | Cool | Restrained | Dark-first | Establishment | Humanist serif | Low |
| style-clean-saas.md | Cool | Moderate | Light-first | Technical | Geometric sans | Low |
| style-editorial-minimal.md | Neutral | Restrained | Light-first | Anti-establishment | Mixed (editorial) | Low |
| style-vibrant-consumer.md | Warm | Expressive | Light-first | Consumer | Geometric sans | Low |
| style-modern-organic.md | Warm | Restrained | Light-first | Anti-establishment (sustainability) | Humanist serif | High |
