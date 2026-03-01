# Production Specifications

> **Purpose:** Phase 4 (Brand Compass template) and Phase 5 (production methodology + all 6 file specifications) of the brand-design skill. Read by the skill during the Brand Compass and Production phases.

---

## Brand Compass Template

Before any production work begins, present a 1-page Brand Compass summary for user approval. This is the strategic contract between you and the user. Nothing gets built until this is approved.

Format it exactly like this:

```
## Brand Compass — [Product Name]

**Archetype:** [Name] — [One-sentence rationale]

**Color Direction:** [Described in words — NOT hex values]
Example: "Deep navy as authority base, warm amber as an activation accent —
avoiding the saturated blues that dominate your competitive space."

**Typography Direction:** [Classification only — NOT specific fonts yet]
Example: "Geometric sans-serif for headings (precision, modernity),
humanist sans-serif for body (warmth, readability)."

**Voice Personality:** [3-4 adjectives + one-sentence description]
Example: "Confident, precise, subtly warm. Speaks like a senior engineer
who also happens to be a great teacher."

**Competitive Positioning:** [Where this brand sits relative to competitors]
Example: "More premium than X, more approachable than Y, more opinionated than Z."

**Design Philosophy:** [Timeless / Trend-forward] — [What this means for this brand specifically]
```

Then ask: **"Does this Brand Compass feel right? I will not begin production until you approve. If anything feels off, tell me what to adjust."**

If the user requests changes, revise and re-present. Do NOT proceed to production until the user explicitly approves.

---

## Socratic Reasoning — Mandatory for Every File

This is NOT optional. Before writing each file, reason through three stages internally. Show this reasoning in your thinking, and embed the conclusions directly into the output file as rationale blocks.

**The three stages (from the Socratic prompting pattern):**

1. **Theory** — "What makes [this element] effective for SaaS brands? What does the research say?"
   - Consult `C:/Users/StuartBlackler/.claude/skills/brand-design/references/brand-psychology.md` for psychology principles
   - Consult `C:/Users/StuartBlackler/.claude/skills/brand-design/references/color-psychology.md` for color decisions
   - Consult `C:/Users/StuartBlackler/.claude/skills/brand-design/references/design-system-patterns.md` for structural patterns
   - Consult `C:/Users/StuartBlackler/.claude/skills/brand-design/references/design-trends.md` ONLY when user chose "trend-forward"

2. **Framework** — "What principles and archetype attributes apply to THIS brand specifically?"
   - Map the chosen archetype's attributes to concrete design implications
   - Cross-reference competitive white space findings from Phase 3
   - Apply the user's design philosophy (timeless vs. trend-forward)

3. **Application** — "Now generate [this element] for [this specific brand]."
   - Produce the actual deliverable content
   - Attach inline rationale to every decision

## Inline Rationale Format

Every significant design decision in every file MUST include a rationale block:

> **Why:** [Psychology principle] + [Archetype attribute] -> [Design decision]

Example:
> **Why:** Processing Fluency Theory (familiar forms are trusted faster) + Sage archetype (values clarity over flair) -> Clean geometric sans-serif with generous letter-spacing for headings.

---

## Production Order and File Specifications

Generate all 6 output files sequentially. Each file builds on the decisions and outputs of the previous files. Write all files to a `brand/` subdirectory in the current working directory.

Generate in this exact sequence. Each builds on the previous.

---

### File 1: `brand/brand-strategy.md`

**Socratic prompt:** "What makes brand strategy effective for SaaS? What principles apply to this archetype? Now build the strategy."

Contents:
- **Archetype deep-dive:** Full profile, core motivation, fear, strategy, shadow traits to avoid
- **Brand essence:** One sentence that captures everything
- **Positioning statement:** "For [audience] who [need], [product] is the [category] that [differentiation] because [reason to believe]"
- **Core values expanded:** Each of the 3-5 values with a definition and behavioral example (what this value looks like in practice)
- **Psychology strategy map:** Every relevant principle from `C:/Users/StuartBlackler/.claude/skills/brand-design/references/brand-psychology.md` mapped to a specific design or messaging decision for this brand
- **Brand personality spectrum:** Where the brand sits on 5 axes:
  - Formal <-----> Casual
  - Serious <-----> Playful
  - Established <-----> Emerging
  - Conventional <-----> Rebellious
  - Complex <-----> Simple

---

### File 2: `brand/color-system.md`

**Socratic prompt:** "What makes color systems effective? What color psychology applies to this archetype? Now build the palette."

Read `C:/Users/StuartBlackler/.claude/skills/brand-design/references/color-psychology.md` before generating.

Contents:
- **Color philosophy:** Rationale tied to archetype and competitive positioning
- **Full palette** (hex AND HSL for every value):
  - Primary (1-2 values)
  - Secondary (1-2 values)
  - Accent (1 value)
  - Semantic: success, warning, error, info
  - Neutral scale (8-10 steps, near-white to near-black)
- **Semantic token mapping:**
  - `surface-primary`, `surface-secondary`, `surface-elevated`
  - `text-primary`, `text-secondary`, `text-disabled`
  - `border-default`, `border-strong`
- **Contrast ratio table:** WCAG AA minimum, AAA where feasible, for all text/background pairings
- **Dark mode palette** (if requested): Properly transformed values — not inverted. Include surface hierarchy, adjusted saturations, and modified contrast targets for dark contexts.
- **Usage guidelines:** Primary color usage ratio, accent limits, combination dos/don'ts

---

### File 3: `brand/typography.md`

**Socratic prompt:** "What makes typography effective for SaaS? What type psychology applies to this archetype? Now select and scale the type system."

Read `C:/Users/StuartBlackler/.claude/skills/brand-design/references/design-system-patterns.md` for type scale ratios and archetype mappings.
Read `C:/Users/StuartBlackler/.claude/skills/brand-design/references/typography.md` before generating.

**CRITICAL CONSTRAINT:** Do NOT recommend any of the following overused fonts: Inter, Roboto, Open Sans, Lato, Montserrat, Poppins, Raleway, Source Sans Pro, Nunito, or Work Sans. These are the typographic equivalent of "no decision was made." Dig deeper into Google Fonts, Adobe Fonts, or independent foundries for distinctive choices that match the archetype.

Contents:
- **Typography philosophy:** Rationale tied to archetype (e.g., Sage = clarity and structure, Creator = expressive and distinctive)
- **Font pairing:**
  - Display/heading: name, classification, why it fits the archetype
  - Body: name, classification, why it fits
  - Monospace (if applicable): name, why it fits
  - For each font: 2 alternatives in case of licensing constraints
- **Complete type scale:**

  | Token | Size | Weight | Line Height | Letter Spacing |
  |-------|------|--------|-------------|----------------|
  | h1 | | | | |
  | h2 | | | | |
  | h3 | | | | |
  | h4 | | | | |
  | h5 | | | | |
  | h6 | | | | |
  | body-lg | | | | |
  | body | | | | |
  | body-sm | | | | |
  | caption | | | | |
  | overline | | | | |

- **Responsive scaling rules:** How the scale adapts at mobile, tablet, and desktop breakpoints
- **Font loading strategy:** Recommendation (font-display: swap / optional / block) with rationale

---

### File 4: `brand/voice-tone.md`

**Socratic prompt:** "What makes brand voice effective? What voice attributes map to this archetype? Now define the voice system."

Contents:
- **Voice attributes:** 3-4 core adjectives, each with:
  - What it means
  - What it does NOT mean (boundary)
- **Tone spectrum** — where the brand sits on each axis:
  - Formal <-----> Casual
  - Serious <-----> Playful
  - Technical <-----> Simple
  - Authoritative <-----> Collaborative
- **Example phrases** — 8 common SaaS scenarios rewritten in brand voice:
  1. Welcome message
  2. Error message
  3. Feature announcement
  4. Upgrade prompt
  5. Support response
  6. Empty state
  7. Success confirmation
  8. Onboarding step
- **Do / Don't list** — at least 8 pairs showing voice boundaries
- **Context-specific tone variations:**
  - Marketing / website copy
  - Product UI
  - Documentation
  - Support / help center
  - Social media
- **Word lists:**
  - Words the brand uses (with rationale)
  - Words the brand avoids (with rationale)

---

### File 5: `brand/motion.md`

**Socratic prompt:** "What makes motion design effective? What motion personality maps to this archetype? Now define the motion system."

Read `C:/Users/StuartBlackler/.claude/skills/brand-design/references/design-system-patterns.md` for motion pattern guidance.

Contents:
- **Motion philosophy:** Tied to archetype (e.g., Sage = deliberate and clear, Magician = delightful and surprising, Hero = bold and purposeful)
- **Easing curves** (cubic-bezier values for each):
  - Standard ease (most transitions)
  - Enter ease (elements appearing)
  - Exit ease (elements leaving)
  - Emphasis ease (attention-drawing)
- **Duration scale:**
  - Instant / micro-interactions: [value]ms
  - Fast / button feedback, toggles: [value]ms
  - Normal / panel transitions, reveals: [value]ms
  - Slow / page transitions, complex sequences: [value]ms
  - Rationale for the speed feel (archetype-driven)
- **Animation principles for this brand:**
  - Motion types that fit (slide, fade, scale, morph, etc.)
  - Motion types that do NOT fit
  - Signature motion pattern: one distinctive, recognizable animation behavior
- **Component animation specs:**
  - Button hover/active states
  - Modal enter/exit
  - Page transitions
  - Loading states
  - Notification enter/exit
  - List item stagger pattern

---

### File 6: `brand/logo-brief.md`

**Socratic prompt:** "What makes logos effective for SaaS? What shape psychology and symbolism apply to this archetype? Now write the creative brief."

This is a brief for a designer or AI tool — not a finished logo.

Contents:
- **Shape psychology rationale:** Why specific shapes fit (circles = community/wholeness, squares = stability/trust, triangles = ambition/progress, organic = approachability, geometric = precision)
- **Symbol direction:** 2-3 conceptual directions, each with:
  - Concept description
  - Visual sketch in words
  - Rationale (archetype + psychology)
- **Typography pairing rationale:** What kind of wordmark typography and why
- **Style references:** 3-5 existing logos (from any industry) that capture elements of the desired feel, with notes on what to take and what to avoid from each
- **Icon style direction:**
  - Style: line / filled / duotone
  - Stroke weight: light / regular / medium / bold
  - Corner style: sharp / slightly rounded / fully rounded
  - Feel (1 sentence)
- **Color application rules:** Single color, full color, reversed/knockout versions
- **SVG concept:** A simple SVG code attempt as a starting point, with a clear caveat that this is illustrative, not production-ready
