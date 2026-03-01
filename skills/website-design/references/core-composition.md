# Core Composition — How to Build Pages, Not What They Look Like

This file teaches page-level decision-making: which sections to include, in what order, with what weight, and why. It replaces prescriptive section templates with principles that produce distinct, content-appropriate pages.

Read this BEFORE selecting components. Components are the vocabulary. Composition is the grammar.

---

## 1. The Interaction Budget

Every style preset has a cap on how many high-motion sections can appear on a single page. Exceeding these caps produces sensory overload — the animations compete for attention instead of directing it.

### Per-Motion-Restraint Caps

See `@references/core-aesthetic-vocabulary.md §5` for the authoritative interaction budget indexed by motion restraint level.

| Motion Restraint | High-motion techniques (max) | Moderate techniques (max) | Minimal techniques |
|---|---|---|---|
| Expressive | 2 | 3 | Unlimited |
| Moderate | 1 | 2 | Unlimited |
| Restrained | 0 | 1 | Unlimited |

**High-motion:** Ambient loops, cursor-following, kinetic typography, parallax, page transitions with sweep, 3D tilt
**Moderate:** Card hover lifts, underline reveals, image zoom, stagger on grid items, number counters
**Minimal:** Fade-in entrance, upward drift, opacity/color transitions on hover

### Motion Profile Definitions

**High-motion** — `motion-profile: high`
Components that demand full user attention and consume significant scroll depth. Examples: StickyCardStack, CardShuffler, TelemetryFeed, any full-viewport pinned section.

**Moderate** — `motion-profile: moderate`
Sections with pronounced scroll-linked behavior or clip-reveal-heavy layouts. Examples: ImageClipReveal sections spanning half the viewport, horizontal parallax, ScrollColorShift wrapping multiple sections, scrub-based timelines.

**Minimal** — `motion-profile: none or minimal`
Standard scroll-triggered entrances: fade-up on cards, text reveals, counter tickers, hover states. These are expected on every page and do not count against the budget.

### Why This Matters

A dark-luxury homepage with three StickyCardStack sections reads as a portfolio of animation demos, not a business. The constraint forces hierarchy: if only one section gets high motion, it becomes the signature moment the user remembers.

---

## 2. The Weight Alternation Rule

Adjacent sections cannot share the same visual-weight level. Weight is determined by the combination of section height, content density, animation intensity, and background drama.

### Weight Levels

**Heavy:** Full-viewport height, high motion or deep content, dark or accent background, maximum visual complexity. Examples: StickyCardStack section, Manifesto with TextReveal, hero with functional artifact.

**Medium:** Standard section height (600–900px), moderate motion or moderate content density, neutral or lightly tinted background. Examples: AlternatingRows features section, BentoGrid, featured testimonial.

**Light:** Short section (200–400px), minimal motion, simple layout. Examples: LogoStrip, StatsStrip, NewsletterCapture, divider CTA.

### Valid Sequences

```
heavy → medium → light → heavy ✓
medium → light → medium → heavy ✓
light → heavy → medium → light ✓
medium → heavy → light → medium ✓
```

### Invalid Sequences

```
heavy → heavy ✗          (overwhelming — two full-viewport pinned sections back to back)
light → light → light ✗  (underdeveloped — three short strips with no substance)
medium → medium → medium ✗  (monotonous — identical rhythm throughout)
heavy → heavy → light ✗  (front-loaded exhaustion)
```

### Applying the Rule

After selecting sections, write out the weight sequence and verify no two adjacent values match. If they do, either reorder sections, replace one section with a different-weight alternative, or insert a transitional light section between two mediums.

The Footer always counts as heavy. The section immediately before Footer should be light or medium.

---

## 3. Content → Component Decision Tree

Classify the business content FIRST. Then select the component that presents it best. Then apply style vocabulary.

Never start from "what component looks good for this preset." Start from "what content needs to be communicated."

```
Business Content Type → Component Category → Specific Component

─────────────────────────────────────────────────────────────────
HERO content (what is this business, who is it for, what's the CTA):
  → Single strong image? → component-heroes.md: FullBleedImageHero or SplitHero
  → No image, strong typography? → component-heroes.md: TypeHero or CenteredHero
  → Multiple products/features visible at once? → component-heroes.md: BentoHero
  → SaaS with product UI to show? → component-heroes.md: SplitHero with product mockup

─────────────────────────────────────────────────────────────────
PROOF content (social, numerical, testimonials):
  → Famous client logos? → component-proof.md: LogoStrip
  → Impressive numbers (>50 clients, >5 years, $1M+)? → component-proof.md: StatsStrip
  → Testimonials? → component-proof.md: TestimonialGrid or FeaturedTestimonial
  → Case studies? → component-proof.md: CaseStudyTeaser

─────────────────────────────────────────────────────────────────
WHAT-THEY-OFFER content (services/features/products):
  → 3–5 parallel items, feature showcase? → component-content.md: BentoGrid
  → 2–3 items with rich visuals? → component-content.md: AlternatingRows
  → 4+ items with tabbed detail? → component-content.md: FeatureTabs
  → Complex/irregular content? → component-content.md: MagazineGrid

─────────────────────────────────────────────────────────────────
HOW-THEY-WORK content (process, steps, methodology):
  → 3–6 sequential steps? → component-process.md: NumberedSteps or HorizontalTimeline
  → Before/after or transformation story? → component-process.md: VerticalTimeline

─────────────────────────────────────────────────────────────────
PHILOSOPHY content (values, differentiation, manifesto):
  → Values are the competitive edge? → component-cta.md: Manifesto
  → Otherwise: SKIP. Do not include a philosophy section.

─────────────────────────────────────────────────────────────────
CONVERSION content (final CTA, contact gateway):
  → Primary goal: consultation/contact? → component-cta.md: ContactGateway
  → Primary goal: trial/signup? → component-cta.md: CTABanner
  → Newsletter? → component-cta.md: NewsletterCapture (use sparingly — footer already has one)
```

### The Critical Check

After mapping content to components, ask: "Would a different kind of business with the same content need this section?" If yes, the section is generic and should be reconsidered. The goal is a page that could only belong to this specific business.

---

## 3a. Content-Structure Disambiguation — When the Decision Tree Produces Tied Candidates

The Decision Tree above maps content type to component category. When two or more components are equally valid for the content type, use the questions below to select between them. These questions are content-structural — they ask about the shape of the content, not the personality of the brand. Brief language is noted as correlation context only.

**Do not use this section as a primary router.** If the Decision Tree produced a clear single answer, skip §3a entirely.

---

### HERO — when FullBleedImageHero vs TypeHero vs SplitHero are tied

```
1. Does the brand's primary claim rest on a single statement that must be felt, not demonstrated?
   → TypeHero or FullBleedImageHero. The statement IS the design.
   (Frequent correlation: briefs that emphasise "philosophy," "manifesto," "conviction," or brands that describe themselves as a point of view)

2. Does the brand's value only become apparent when you see the product or service working?
   → SplitHero with product mockup or BentoHero. Demonstration > declaration.
   (Frequent correlation: SaaS, tools, platforms, anything with a UI to show)

3. Is the brand's authority established through a specific person, practitioner, or visible team?
   → SplitHeroPortrait. The person is the signal, not the product.
   (Frequent correlation: consultants, boutique agencies, solo practitioners, named founders)

4. Does the hero need to communicate multiple parallel things simultaneously (product range, service variety)?
   → BentoHero. Multiple entry points > single statement.
   (Frequent correlation: marketplace brands, product families, multi-service firms)
```

---

### WHAT-THEY-OFFER — when BentoGrid vs AlternatingRows vs MagazineGrid are tied

```
1. Do the 3–5 items have significantly unequal visual weight — one flagship, two supporting, or
   dramatically different content richness per item?
   → MagazineGrid. Asymmetric composition mirrors content asymmetry.
   (If items are roughly equal in depth, MagazineGrid is wrong — the asymmetry becomes arbitrary)

2. Are the items parallel and equal in depth, but is the reading experience naturally sequential
   (item 1 leads logically to item 2)?
   → AlternatingRows. Reading rhythm over grid structure.
   (Frequent correlation: services that build on each other, features that unlock other features)

3. Is this brand's primary offering singular, but the surrounding evidence complex?
   → Use one AlternatingRow for the offering; handle evidence in a separate section.
   (A common mistake: treating one product with many proof points as "multiple items")

4. Does the content involve direct visual comparison between what the brand does and what alternatives don't
   (before/after, with/without)?
   → AlternatingRows with visual contrast per row. BentoGrid buries comparison in a grid.
```

---

### HOW-THEY-WORK — the highest-frequency template-production node

This node produces the most template-identical output. Use these questions before defaulting to NumberedSteps.

```
1. Is the process primarily the brand's HISTORY — years, milestones, evolution as proof of longevity?
   → VerticalTimeline showing brand evolution. Not a 3-step explainer.
   (Explicit test: if removing dates from the steps loses meaning, it is a history — use VerticalTimeline)

2. Does each step have a MEASURABLE OUTPUT — a metric, a deliverable, a timeframe?
   → HorizontalTimeline with data at each node. The measurements are the point.
   (If steps only have names and descriptions, measurements are aspirational — use NumberedSteps instead)

3. Is the process about CLIENT TRANSFORMATION — the client's state changes meaningfully at each step?
   → VerticalTimeline with client voice at key moments (quote, outcome, evidence).
   (Explicit test: can you describe what the client feels at each step? If yes, VerticalTimeline)

4. Are there 3–4 equal-weight PRINCIPLES or PILLARS — genuinely parallel values, not sequential steps,
   where each deserves sustained, focused attention?
   → StickyCardStack (only if interaction budget has headroom for a high-motion section).
   (Explicit test: can you swap the order without losing meaning? Yes = pillars. No = steps → NumberedSteps)

5. Is the process a simple linear sequence where no step has meaningfully more weight than another?
   → NumberedSteps. Standard, appropriate. Do not over-engineer.
```

---

## 4. Background Rhythm Rule

Adjacent sections must differ by at least one step on the background scale. This is the visual equivalent of the weight alternation rule — it prevents the page from feeling like an undifferentiated wall of content.

### Background Steps (light to dark)

```
surface-primary (lightest/white)
  ↓
surface-secondary (off-white, very light grey)
  ↓
tinted/warm (brand-tinted surface, warm cream, stone)
  ↓
primary-color (mid-saturation brand color as background)
  ↓
dark-accent (deep brand color, near-black with hue)
  ↓
neutral-950 (darkest — near-black)
```

### Rules

- Never two consecutive sections at the same background step
- Full-bleed dark sections (Stats in dark-luxury, Manifesto) should appear maximum 2 times per page
- Hero and Footer anchor the extremes — do not let mid-page sections compete with their drama
- The transition between a dark section and a light section is intentional punctuation — use it deliberately, not randomly

### Valid Background Rhythm Examples

```
dark-hero (neutral-950)
  → surface-primary       ✓ (maximum contrast, breathes)
  → surface-secondary     ✓ (one step — gentle shift)
  → surface-primary       ✓ (back, creates breathing)
  → primary-color         ✓ (mid-page accent moment)
  → surface-secondary     ✓ (recovery)
  → neutral-950 footer    ✓ (bookend dark)

dark-hero (dark-accent)
  → surface-primary       ✓
  → tinted/warm           ✓ (one step — subtle warmth)
  → surface-primary       ✓
  → neutral-950 (Manifesto) ✓ (dramatic mid-page moment)
  → surface-primary       ✓ (recovery)
  → neutral-950 footer    ✓
```

### Invalid Background Rhythm Examples

```
surface-primary → surface-primary → surface-primary ✗  (three white sections)
dark-accent → neutral-950 → dark-accent ✗              (three dark sections, oppressive)
primary-color → primary-color ✗                        (same color repeated)
```

---

## 5. Section Count Heuristics

More sections is not more thorough. Sections without genuine content dilute the sections that do have it.

### Counts by Page Type

| Page | Minimum | Typical | Maximum |
|---|---|---|---|
| Homepage | 5 | 7–9 | 11 |
| Service/Product page | 4 | 5–7 | 9 |
| About page | 4 | 5–6 | 7 |
| Contact page | 3 | 3–4 | 5 |
| Case study | 4 | 6–8 | 10 |

**Minimum viable homepage (5 sections):** Hero, one content section, Proof, CTA, Footer. Everything else is additive only if content justifies it.

**The content test:** For every section beyond the minimum, ask: "Can I write specific, non-generic copy for this section?" If the answer is "I'll fill it with something later" or "it will say something like..." — cut the section.

### When to Add a Section

| Add when | Skip when |
|---|---|
| The content type is genuinely different from adjacent sections | The section would repeat content already covered nearby |
| The business has specific proof, process, or detail to show | The section exists to "fill out" the page |
| The narrative has a gap that needs bridging | The section is there because "all sites have one" |
| The section serves a distinct conversion micro-goal | The section's copy would be generic to any business |
| Adding it improves section weight alternation | Adding it creates two consecutive same-weight sections |

### When to Drop a Section

Drop without hesitation if:
- You cannot write a non-generic headline for it
- It duplicates the content purpose of an adjacent section
- Adding it violates the weight alternation rule and there is no good reordering
- The business is early-stage and has no real content for it (case studies, stats, logos)

---

## 6. Breaking Vertical Flow

Standard vertical scroll is the default. Deviate only when the content format genuinely benefits from a different format.

### Horizontal Scroll

**Use when:** Content items are parallel and benefit from side-by-side comparison without losing vertical scroll. Effective for: portfolio project grids (3–6 items), step-by-step product comparisons where simultaneous viewing matters, case study galleries with consistent visual weight per item.

**Do not use when:** Content is hierarchical (top-to-bottom reading order matters), there are fewer than 3 items, or the viewport is narrow enough that horizontal scroll becomes awkward on mobile.

**Implementation note:** Always provide a keyboard-accessible and mobile-swipeable alternative. Horizontal scroll that only works with a mouse wheel is an accessibility failure.

### Sticky Sections

**Use when:** You have 3 or more parallel features, benefits, or concepts that need sequential focused attention. StickyCardStack is the primary pattern. The stickiness communicates "these items deserve equal attention in sequence."

**Do not use when:** You have only 2 items (use SplitHero or AlternatingRows instead), items are not parallel (use a process timeline instead), or the preset's interaction budget is already at capacity.

**One sticky section per page.** Two sticky sections in sequence is not double impact — it is fatigue.

### Full-Viewport Mid-Page Sections

**Use when:** Manifesto content — a single declarative statement about the business's reason for existing that deserves cinematic weight. The TextReveal word animation is what earns the full-viewport treatment.

**Do not use for:** General features, testimonials, process steps, or any content that would be equally served by a standard section. Full-viewport is rare and powerful precisely because it is rare.

### Overlapping Sections

**Use sparingly.** Overlapping (negative margin or absolute positioning to let sections visually bleed into each other) is an editorial design technique that signals intentionality and craft. It works when sections are specifically designed to overlap — not applied uniformly for visual effect. Appropriate when the brief calls for an editorial sensibility where sections are designed to bleed into each other; the overlap must be intentional, not decorative.

**Never use overlapping sections with:** high-motion content (competing visual layers become chaotic), dark adjacent to dark (merges unreadably), or more than 2 overlapping pairs per page.

---

## 7. Per-Section Rules (What to Skip)

The most common mistake in AI-generated pages is including sections by convention rather than by content necessity. This table codifies when each common section type earns its place.

| Section | Include when | Skip when |
|---|---|---|
| Manifesto / Philosophy | Business philosophy is their actual competitive differentiator (B-Corp, ethical supply chain, decades of conviction-based practice) | Generic service business, e-commerce product, SaaS tool, early-stage startup without a formed identity |
| Stats Strip | Numbers are genuinely impressive AND verifiable: 50+ clients, 10+ years, $1M+ managed, 95%+ retention | Under 3 years old, fewer than 20 clients, no trackable metrics, numbers that only sound impressive with context ("100% of our clients recommend us" = 1 client) |
| Social Proof / Logo Strip | Real, recognizable logo assets exist for 5+ clients | Only text names available; fewer than 5 logos; logos are not recognizable to the target audience; business is B2C (wrong proof type) |
| Process / How It Works | Service business with a distinct methodology that differentiates them (3–6 clear steps that competitors don't follow) | Product/tool where usage is self-evident; business where the process is obvious and generic (e.g., "schedule a call → we do the work → you get results") |
| Newsletter Capture | Content-first business where newsletter is core product (blog, newsletter, media, thought leadership) | Service business where newsletter is an afterthought; product business where the primary CTA is a trial or purchase |
| Case Study Teasers | Agency, consultant, or product with 2+ documented, published results that include specific outcomes | Early-stage with no published case studies; businesses where confidentiality prevents specific disclosure; generic case studies that don't show specific results |
| Team Section | Small firm where the team IS the product (boutique agency, professional services, sole practitioner) | SaaS product where the team is not a buying factor; large company where team section would require 20+ photos; hiring-focused page where team section belongs |
| Pricing Section | SaaS, productized service, or anything with transparent, self-serve pricing | Bespoke service where pricing requires consultation; early stage where pricing is not established |
| FAQ Section | Complex product with common objections; regulated industry with compliance questions | Simple product where questions are self-evident; page that already addresses objections inline |
