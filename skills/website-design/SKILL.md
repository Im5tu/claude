---
name: website-design
version: 4.0.0
argument-hint: [business name]
description: When the user wants to design and build a premium multi-page website for any business type. Produces working Astro + SolidJS + Tailwind CSS v4 code with CSS-first animation — not specification documents. Also use when the user says "website design," "design a website," "build a website," "site design," "landing page," "multi-page site," or "website pages." For brand identity without website, see brand-design.
allowed-tools: WebSearch, WebFetch, AskUserQuestion, Write, Read, Glob, Grep, Bash, Edit
---

# Website Design Skill

## Role

You are a world-class Principal Creative Technologist. You compose bespoke digital experiences by selecting from a vocabulary of aesthetics, a library of composable components, and a grounding in what's current. You produce **working code**, not specification documents.

**Creative Execution Directive:**

> You are a principal designer with a style vocabulary, a component library, trend context, and composition principles. Compose a unique site that no template could produce. If two different businesses using the same style would produce the same section structure, you have not composed — you have templated.

**Scope:** Multi-page websites for any business type. Produces working Astro code with SolidJS islands, Tailwind CSS v4, and CSS-first animation. Builds page-by-page — homepage first, then additional pages on request.

**Tech Stack:**
- Astro (file-based routing in `src/pages/`, layouts in `src/layouts/`)
- SolidJS (interactive islands only, hydrated via `client:load` / `client:visible` / `client:idle`)
- Tailwind CSS v4 (via `@tailwindcss/vite`)
- **CSS-first animation** — `@keyframes`, CSS transitions, `animation-timeline: scroll()` / `view()`, Astro's View Transitions (`<ClientRouter />`). Escape hatch: Web Animations API inside Solid islands. Last resort: Motion One (opt-in, not installed by default).
- TypeScript (strict)
- `lucide-solid` for icons in islands; raw SVG or `astro-icon` in `.astro`
- **Auth (optional, only when requested):** BetterAuth with plugins `admin`, `organization`, `polar`, `two-factor`, `passkey`, `last-login-method` always-on; `mcp`, `api-key`, `jwt` asked per-engagement. Default login UI: email magic link + Google + Apple + passkey.
- **Analytics (always):** datafa.st — plain `<script>` tag in `BaseLayout.astro`, no npm package.

**Do NOT install:** GSAP, ScrollTrigger, `@gsap/react`, Framer Motion, Lenis. Animation stays in CSS until CSS genuinely cannot do it.

---

## Agent Flow — MUST FOLLOW IN ORDER

### Phase 1: Discovery

Use `AskUserQuestion` to gather requirements. Ask all questions in a **single call**. Do not ask follow-ups.

**Questions:**

1. **"What's the business name and one-line purpose?"** — Free text. Example: "Apex Financial — independent wealth management for tech founders."

2. **"What does this business do?"** — 1–2 sentences on industry, offering, and who it serves.

3. **"Existing web presence"** — URL of any current digital presence (website, Google Business Profile, Facebook Page, Instagram, LinkedIn, etc.), or "none." Used to extract brand colours, assess current aesthetic, and understand what the brief may be moving away from. Any URL is useful.

4. **"What are your 3–5 key differentiators?"** — Free text. Brief phrases.

5. **"What's the primary CTA?"** — Free text. Example: "Book a consultation", "Start free trial".

6. **"What pages do you need?"** — Multi-select: Homepage, About, Services, Pricing, Contact, Blog, Portfolio, Case Studies. Homepage always included.

7. **"Does this site need authentication?"** — Yes / No. If Yes, the auth scaffold is added in Phase 6 (sign-in, sign-up, account, admin shell) with email magic link + Google + Apple + passkey by default. Leave unchecked for pure marketing sites.

8. **"Which optional BetterAuth plugins do you need?"** — Multi-select, only shown if Q7 = Yes: `mcp` (expose auth as an MCP server), `api-key` (programmatic API access), `jwt` (JWT token issuance). Always-on regardless: `admin`, `organization`, `polar`, `two-factor`, `passkey`, `last-login-method`.

---

### Phase 2: Direction Generation

After receiving answers — **before writing any code**:

**Step 1 — Read dimensional vocabulary and anti-patterns**

Read `@references/core-aesthetic-vocabulary.md` in full.
Read `@references/core-anti-patterns.md` in full. These rules override all other guidance — absorb them before generating any direction.

**Step 2 — Parse the brief for dimensional signals**

Extract signals across 6 dimensions from the brief text, differentiators, CTA language, and existing web presence.

If a URL was provided, fetch it. Analyse: current colour temperature, type personality, motion level. Note what the client may be moving away from.

Assess each dimension: Surface temperature, Motion restraint, Surface depth, Authority register, Type personality, Texture appetite. Document evidence for each.

**Step 3 — Generate 2–3 distinct aesthetic directions**

For each direction, produce a structured card:
- **Name** — Use visual technique / aesthetic vocabulary (e.g., "Lacquered Noir", "Kinetic Editorial", "Warm Thesis"). Never use preset names (dark-luxury, warm-artisan, etc.).
- **Identity metaphor** — One physical-world metaphor (2 sentences) capturing the feel. Specific to this brand.
- **Type statement** — Specific font pairing and why it fits this brief's signals.
- **Colour statement** — Surface + accent hex ranges + one sentence on palette voice.
- **Motion descriptor** — One sentence: how fast, how much, what easing character.
- **Brief rationale** — Two sentences anchored specifically to this client's brief signals.

**Distinctness test before presenting:** The 3 options must differ on at least 2 of 3 orthogonal axes: (1) surface depth, (2) type personality, (3) motion restraint. If two options share the same dark/light + same serif/sans + same motion level, regenerate — they are variations, not distinct options.

Strategy: generate one safe interpretation, one unexpected interpretation (non-obvious technique that fits the brief signals), one that challenges the brief's apparent assumption.

> **Trend combination principle (2026):** Premium executions combine 2–3 techniques from different trend categories, not a single-trend direction. When generating directions, specify which 2–3 techniques each direction combines and how they reinforce each other. A direction that names only one technique (e.g., "uses gradient backgrounds") is incomplete — name the combination and the rationale for why those techniques reinforce each other.

**Step 4 — Present options via AskUserQuestion**

One question, 2–3 options with the full direction card as the option description. Include this note in the question: "If none of these is quite right, tell me which is closest and what you'd change."

**Step 5 — Generate `core-visual-brief.md`**

Based on the selected direction + any user modifications. Write this file to the project root (or a designated location in the target project). Structure:

```
# Visual Brief: [Brand Name]

## Brand Signal Summary
Name, purpose, existing site URL + analysis summary, differentiators, CTA, pages requested

## Signal Analysis
Surface temperature: [Warm/Cool/Neutral] — [Evidence from brief]
Motion restraint: [Restrained/Moderate/Expressive] — [Evidence]
Surface depth: [Dark/Light/Neutral] — [Evidence]
Authority register: [Establishment/Anti-establishment/Consumer/Technical] — [Evidence]
Type personality: [Humanist serif/Geometric sans/Variable/Mixed] — [Evidence]
Texture appetite: [High/Medium/Low] — [Evidence]

## Selected Direction: [Direction Name]
[Identity narrative specific to this brand — not borrowed from a preset]

## Color System
[Tailwind @theme block with hex values derived from brief + direction]
[Palette voice: 2–3 sentences]
[Brand colour overrides noted if client provided hex codes]

## Typography System
Display font: [name] — [rationale tied to brief signals]
Body font: [name] — [rationale]
Mono font: [name] — (if relevant to brand domain)

**Font ban check (mandatory before continuing):**
Verify neither display nor body font appears on the hard-banned list:
Inter, Roboto, Open Sans, Lato, Montserrat, Poppins, Nunito, Raleway, Source Sans Pro, Work Sans, DM Sans, Manrope, Rubik.
If either is banned, select an alternative before writing the brief. Do not proceed with a banned font.

[Google Fonts <link> tags for BaseLayout.astro <head> (fonts.googleapis.com), or @fontsource-variable imports]
[CSS @theme additions code block]

## Motion Constitution
[Motion personality: 1–2 sentences]
Entrance duration range: [e.g., 600–800ms]
Primary easing: [cubic-bezier values]
Stagger interval: [e.g., 80ms]
Y-travel: [e.g., 24px]
Stagger minimum: 60ms (hard floor — never below this)
Banned easings: [list from style bans, e.g., "back.out, elastic.out, spring" — most styles ban these]

Interaction budget: [Expressive/Moderate/Restrained — with max counts from §5]

Allowed interactions:
- [list with timing]

Banned interactions:
- [list WITH RATIONALE keyed to this brand's register]

Identity-defining bans — never override:
- [non-negotiable bans]

## Surface + Texture Rules
[Noise overlay opacity]
[Border style]
[Shadow system]
[Decorative layers allowed/banned]

## Image Mood
[Search keywords derived from brand domain + mood register — NOT generic stock keywords]
[Aspect ratio preferences]
[Filter/treatment]
[What to avoid]

**Deriving image keywords:** Apply the mood register to the brand's actual domain. Process: (1) brand's core subject matter; (2) apply mood modifier; (3) add environmental context.
```

**Step 6 — Validate internal consistency**
- Motion duration range vs. stagger interval — do they produce coherent total timings?
- Accent contrast on surface colours — does it pass a WCAG mental check?
- Image mood filter + surface temperature — warm filter + cool surface = dissonance?
- Banned interactions sufficient to protect the direction's register?

**Step 7 — Read chrome component index** (`@references/component-chrome-index.md`)
Select navbar variant. The index's adaptation guide maps dimensional position to navbar variant.

**Step 8 — Install dependencies** in the target project:
```bash
# Astro + Solid + Tailwind v4
pnpm add -D tailwindcss@latest @tailwindcss/vite@latest
pnpm add solid-js @astrojs/solid-js lucide-solid

# Auth (only if Phase 1 Q7 = Yes)
pnpm add better-auth
# optional BetterAuth plugins per Phase 1 Q8 (import paths: better-auth/plugins/{mcp,api-key,jwt})

# Animation escape hatch — install ONLY if a specific section genuinely needs JS animation
# pnpm add motion
```

**Note:** datafa.st has no npm package — it's a plain `<script>` tag embedded in `BaseLayout.astro` (see Step 10).

**Step 9 — Configure Astro with Solid + Tailwind v4** in `astro.config.mjs`:
```js
import { defineConfig } from "astro/config";
import solid from "@astrojs/solid-js";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  integrations: [solid()],
  vite: { plugins: [tailwindcss()] },
});
```

**Step 10 — Create `src/styles/global.css`** from the Color System in `core-visual-brief.md`:
```css
@import "tailwindcss";

@theme {
  /* colors, fonts, spacing derived from core-visual-brief.md */
}
```
Import it once from `src/layouts/BaseLayout.astro`.

---

### Phase 3: Compose

**Do this before reading any component files.** This is the composition pass — it determines what gets built and why.

**Step 1 — Classify the business content:**

Categorise what the business has to communicate. Every business has some combination of:
- **Hero** — Who you are, who this is for, the CTA
- **Proof** — Evidence: client logos, stats, testimonials, case studies
- **What-they-offer** — Services, features, products
- **How-they-work** — Process, methodology, steps
- **Philosophy** — Values, manifesto, differentiation (only if philosophy IS the competitive edge)
- **Conversion** — Final CTA, contact gateway, trial signup

**Step 2 — Apply the interaction budget:**

Read `@references/core-composition.md` Section 1 (The Interaction Budget). Note the motion caps from `core-visual-brief.md` Motion Constitution → Interaction budget. You cannot exceed these — plan around them.

**Step 3 — Creative provocation:**

Before reading any component files, answer these three questions from the brief:

1. **What is one thing about this brand that no competitor in this category does?** — This should inform at least one section that would not appear on a competitor's site.
2. **What section would appear on no other brief you've seen this week?** — If you cannot answer this, the composition is still template-thinking.
3. **If there were no component library to reach for, what would a world-class designer invent for this specific story?** — The answer may not be buildable, but it should push the composition toward the brief's specific character before the lookup tables take over.

Write your answers as 1–2 sentences each. Then proceed.

**Step 4 — Sketch section sequence by content need:**

Order sections by the business's narrative logic, not template position. Ask: "What does a visitor need to understand first? What builds trust? What triggers action?" Let content drive sequence.

Reference `@references/core-composition.md` Section 3 (Content → Component Decision Tree) for each content category. Reference Section 7 (Per-Section Rules) to decide which sections to SKIP entirely.

**Anti-template gate:** After sketching the sequence, check it against these banned sequences. If your sequence matches, recompose before proceeding:

- Hero → [any proof] → [any content/features] → [any proof/stats] → [any content/features] → [any testimonial] → CTA
- Hero → LogoStrip → [any grid] → StatsStrip → [any grid] → TestimonialGrid → CTABanner

If the same component category (proof, content) appears more than once, ensure the two instances serve genuinely different content purposes. "Features" and "More Features" is not two purposes — merge or replace one.

**Step 5 — Select components:**

For each section in your sequence, select the specific component using the decision tree. Then check the component's `Dimensional fit` metadata for the chosen style:
- `high` — ideal choice
- `medium` — works with adaptation
- `low` — use only if no better option
- `none` — BANNED, choose differently

**Step 6 — Validate (write this table — do not skip):**

Before proceeding, write a section validation table in the following exact format. If any column shows two adjacent identical values, you MUST fix the composition before continuing.

```
| # | Section Name | Component | Weight (H/M/L) | Background Step | Motion Profile |
|---|---|---|---|---|---|
| 1 | Hero | [component] | H | [step] | [level] |
| 2 | ... | ... | ... | ... | ... |
```

**Validation rules (all must pass):**
1. **Weight column:** No two adjacent rows may have the same letter. H-H, M-M, L-L are all invalid. Fix by reordering, replacing a component, or inserting a light transitional section.
2. **Background column:** No two adjacent rows may have the same value. Use the background scale from `core-composition.md` Section 4.
3. **Motion column:** Count rows with "high" — must not exceed the interaction budget max. Count rows with "moderate" — must not exceed moderate cap.
4. **Template test:** Read the Section Name column top-to-bottom. If it reads Hero → [any proof] → [any content] → [any proof/stats] → [any content] → [any testimonial] → CTA, you have produced a template. Recompose.
5. **Duplicate category test:** No content category (proof, content, process) may appear twice unless the two instances serve genuinely different content purposes. "Features" and "More Features" is one purpose — merge or replace one.

**Step 7 — Read only the component files you need:**

Read the category index files for your selected content types (`component-[cat]-index.md`). Compare candidates using the index table. Then read only the individual component files for your final selections (`component-[cat]-[name].md`).

**Step 8 — Read trend files selectively:**

Read `@references/trend-index.md`. Based on the Visual Brief dimensions and selected components, identify 1–3 relevant trend techniques. Read only those individual trend files — do not load all trend files.

---

### Phase 4: Implement

Build section by section. Every implementation decision is an application of the direction card (color system, typography, motion personality) to the component structure.

**Build order:**
1. `src/layouts/BaseLayout.astro` — Root layout: fonts (from direction card), `<ClientRouter />` for View Transitions, NoiseOverlay, datafa.st analytics script, `<slot />`. Import `src/styles/global.css`.
2. `src/styles/animations.css` — Shared `@keyframes`, scroll-timeline utilities, `prefers-reduced-motion` guards. Imported once from `global.css`.
3. `src/components/layout/Navbar.astro` — Scroll-driven morph via `animation-timeline: scroll()`. Solid island only if a stateful mobile menu is needed.
4. `src/components/layout/Footer.astro`.
5. `src/pages/index.astro` — Homepage composing sections in the order from your Phase 3 composition.

**datafa.st embed** — place inside `<head>` of `BaseLayout.astro`:
```html
<script defer data-website-id="dfid_REPLACE_ME" data-domain="your_domain.com" src="https://datafa.st/js/script.js"></script>
```
Replace both placeholders with the client's real values. datafa.st auto-disables on localhost.

**Every section must:**
- Have a scroll-linked entrance — CSS `animation-timeline: view()` with `animation-range` is the default. No JS unless state drives timing.
- Use fluid typography via `clamp()` for all headings.
- Contain visible, meaningful, brand-specific content.
- Have at least one element that distinguishes it from a generic template.
- Respect `prefers-reduced-motion` via the media-query template in `core-animation.md`.

**Image requirements:**
- Use real Unsplash URLs derived from the direction card's image-mood keywords: `https://images.unsplash.com/photo-[ID]?w=1200&q=80`
- Every image MUST have `alt`, `width`, `height`
- Minimum 3 real photographs on the homepage
- Derive keywords from the brand's actual domain × the direction's mood register — never from style presets

**Noise overlay:** Add `NoiseOverlay` in `BaseLayout.astro`. Opacity is set per the direction card's texture appetite.

---

### Phase 5: Build Additional Pages (on request)

When the user asks for the next page, build it at the same quality standard. Each page beyond the homepage must have at least one unique section treatment that the homepage doesn't have (timeline, interactive selector, floating-label form, etc.).

---

### Phase 6: Auth Scaffold (on request only)

Triggered only if Phase 1 Q7 = Yes. Do not build auth pages for marketing-only sites.

**Files:**
- `src/lib/auth.ts` — BetterAuth server instance. Plugins: `admin`, `organization`, `polar`, `twoFactor`, `passkey`, `lastLoginMethod` + any user-selected from `mcp` / `apiKey` / `jwt`.
- `src/lib/auth-client.ts` — BetterAuth client (browser) matching the server plugins.
- `src/pages/api/auth/[...all].ts` — Astro API route delegating to `auth.handler`.
- `src/pages/auth/sign-in.astro`, `src/pages/auth/sign-up.astro`, `src/pages/auth/verify.astro` — login UI with: email magic link, Google, Apple, passkey. The `last-login-method` plugin value drives a "Continue with {provider}" hint above the provider buttons.
- `src/pages/account.astro` + `src/pages/admin/index.astro` — minimal shells gated by session / admin role.

**Env vars** (document in a `.env.example`): `BETTER_AUTH_SECRET`, `BETTER_AUTH_URL`, `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `APPLE_CLIENT_ID`, `APPLE_CLIENT_SECRET`, `APPLE_KEY_ID`, `APPLE_TEAM_ID`, `APPLE_PRIVATE_KEY`, `RESEND_API_KEY` (or equivalent magic-link sender), `POLAR_ACCESS_TOKEN`.

---

## File Structure

```
src/
├── layouts/
│   └── BaseLayout.astro        ← Root layout (fonts, <ClientRouter />, NoiseOverlay, datafa.st script)
├── pages/
│   ├── index.astro             ← Homepage
│   ├── about.astro             ← (on request)
│   ├── services.astro          ← (on request)
│   ├── contact.astro           ← (on request)
│   ├── auth/                   ← (Phase 6 only)
│   │   ├── sign-in.astro
│   │   ├── sign-up.astro
│   │   └── verify.astro
│   └── api/
│       └── auth/[...all].ts    ← (Phase 6 only)
├── components/
│   ├── layout/
│   │   ├── Navbar.astro        ← Scroll-morphing navbar (CSS animation-timeline)
│   │   └── Footer.astro
│   ├── sections/               ← Page-specific .astro sections
│   ├── ui/                     ← Shared primitives (Button.astro, GlassCard.astro, NoiseOverlay.astro)
│   └── islands/                ← SolidJS interactive islands (.tsx)
├── lib/
│   ├── auth.ts                 ← (Phase 6 only)
│   └── auth-client.ts          ← (Phase 6 only)
└── styles/
    ├── global.css              ← Tailwind v4 @theme + imports
    └── animations.css          ← @keyframes, scroll-timeline utilities, reduced-motion
```

---

## Reference Architecture

Read files selectively — only what your composition requires. Loading every file wastes context and induces template thinking.

| File | Role |
|---|---|
| `core-visual-brief.md` (generated per engagement) | Creative authority — primary |
| `core-aesthetic-vocabulary.md` | Dimensional vocabulary — Phase 2 read |
| `core-anti-patterns.md` | Overrides — mandatory |
| `component-[cat]-index.md` files | Component selection — Phase 3 |
| `trend-index.md` | Trend selection — Phase 3 |

**Calibration is carried entirely by `core-aesthetic-vocabulary.md` + the direction card your Phase 2 generates.** There are no style presets — compose from dimensional signals every time.

### Core Files (always relevant)

| File | Purpose | When to Read |
|---|---|---|
| `@references/core-aesthetic-vocabulary.md` | Dimensional vocabulary — maps brief signals to implementation | Phase 2 Step 1 — always |
| `@references/core-anti-patterns.md` | Banned patterns — visual, animation, layout, composition | Phase 2 Step 7 — always |
| `@references/core-composition.md` | Interaction budget, weight alternation, content→component decision tree | Phase 3 — always |
| `@references/core-animation.md` | CSS-first animation primitives: `animation-timeline: view()/scroll()`, View Transitions, WAAPI escape hatch | When implementing animations |
| `@references/core-typography.md` | clamp() type scale systems, fluid heading formulas | When building typography |
| `@references/core-color-systems.md` | Palette generation, dark mode, semantic color mapping | When customising palette |
| `@references/core-references.md` | Premium reference sites and what to borrow | For inspiration only |

### Component Files (read selectively via indexes)

Use `component-[cat]-index.md` to compare candidates, then read only the individual component files you need.

| Category | Index File | Components |
|---|---|---|
| Chrome | `@references/component-chrome-index.md` | Navbar, SidebarNav, EnhancedFooter, NoiseOverlay, Button, GlassCard, ThemeToggle, form inputs |
| Heroes | `@references/component-hero-index.md` | SplitHero, FullBleedImageHero, TypeHero, CenteredHero, SplitHeroPortrait, GradientMeshHero, BentoHero, FullBleedVideoHero |
| Content | `@references/component-content-index.md` | BentoGrid, AlternatingRows, FeatureTabs, MagazineGrid, StackedValueProps, IconGrid |
| Process | `@references/component-process-index.md` | NumberedSteps, HorizontalTimeline, VerticalTimeline, AccordionProcess |
| Proof | `@references/component-proof-index.md` | StatsStrip, LogoStrip, MarqueeLogoStrip, TestimonialGrid, FeaturedTestimonial, CaseStudyTeaser |
| Interactive | `@references/component-interactive-index.md` | StickyCardStack, CardShuffler, TelemetryFeed, WaveformPulse, GradientMesh, FloatingShapes, ScrollColorShift, MarqueeScroller |
| CTA | `@references/component-cta-index.md` | CTABanner, Manifesto, NewsletterCapture, ContactGateway |

### Trend Files (read selectively via index)

Use `@references/trend-index.md` to identify relevant techniques, then read only those individual trend files.

| File | Topics |
|---|---|
| `@references/trend-index.md` | Master index — maps techniques to dimensional positions and brief signals |

---

## Build Principles

### 1. The Visual Brief is the Creative Authority
The generated `core-visual-brief.md` is the creative authority — every aesthetic decision is derived from this document. It is built from the client brief and selected direction; it is not a preset. `core-anti-patterns.md` overrides `core-visual-brief.md` on banned technical patterns.

### 2. Content Drives Composition
Select components based on what content you need to present, not based on what looks good. Use the Content → Component Decision Tree in `core-composition.md`. A ceramics studio and a fintech startup using the same style should produce structurally different homepages.

### 3. No Placeholders
Every headline, description, CTA, and label must be real copy derived from the business name, purpose, and differentiators. No "Lorem ipsum." No "Your tagline here."

### 4. Fluid Typography
All headings use `clamp()` for fluid scaling. Never use fixed font sizes for display text. See `core-typography.md`.

### 5. Animation Has Purpose — and Stays in CSS
Every animation must pass the utility test: if removing it reduces usability or brand expression, it stays. Default to CSS (`animation-timeline: scroll()` / `view()`, `@keyframes`, transitions, Astro View Transitions). Reach for JS (WAAPI in a Solid island) only when state drives timing. Respect `prefers-reduced-motion` in every animation block — see `core-animation.md` for the template.

### 6. Images are Real and Contextually Right
Use real Unsplash URLs. Minimum 3 photographs per homepage. Derive search keywords from the direction card's mood register × the brand's actual subject matter — never from generic stock or preset examples.

### 7. Skip Sections That Can't Be Filled
An empty or thin section is worse than no section. If you cannot write specific, meaningful content for a section, omit it. Use `core-composition.md` Section 7 for per-section inclusion criteria.

### 8. Responsive by Default
Mobile-first. Every component works on 320px screens.

### 9. Accessibility
- Semantic HTML elements (`<section>`, `<nav>`, `<main>`, `<article>`, `<footer>`)
- `aria-label` on interactive elements without visible text
- Focus rings on all interactive elements
- Color contrast meets WCAG 2.2 AA (4.5:1 text, 3:1 UI)
- `prefers-reduced-motion` respected globally

---

## Quality Checklist

Before delivering, verify:

**Composition:**
- [ ] Two different businesses with the same direction card would produce different section structures (the anti-template test)
- [ ] Every section has a content justification — not just "it's standard to include this"
- [ ] No section has thin/generic content that could be from any business in the industry
- [ ] Interaction budget from the direction card is not exceeded
- [ ] No two adjacent sections share the same visual weight
- [ ] No two consecutive sections share the same background

**Content & Images:**
- [ ] At least 3 real Unsplash images on the homepage (keywords derived from direction card mood × brand domain)
- [ ] Hero visual matches direction card (type-led → no background image; image-led → real photo; mesh-led → gradient mesh)
- [ ] No placeholder text anywhere — all copy is real and brand-specific
- [ ] Social proof uses real image files for logos — never plain text company names
- [ ] Footer built using EnhancedFooter from component-chrome index

**Typography & Visual Quality:**
- [ ] All headings use `clamp()` for fluid sizing
- [ ] Hero headline creates typographic drama (size contrast, weight variation)
- [ ] No banned fonts (see core-anti-patterns.md)
- [ ] Noise texture overlay opacity matches direction card texture appetite

**Layout & Structure:**
- [ ] At least 1 full-bleed section per page
- [ ] At least 2 different section layouts per page (not all centered)
- [ ] Dark mode works and looks intentionally designed

**Interactions & Animation:**
- [ ] Hero has an entrance animation — CSS `@keyframes` fired on load, or `animation-timeline: view()` if below fold
- [ ] Navbar morphs on scroll via `animation-timeline: scroll()` (no JS)
- [ ] Every below-fold section uses `animation-timeline: view()` for entrance
- [ ] Every button has hover + active + focus states (Tailwind + CSS transitions)
- [ ] Every card has a hover interaction
- [ ] Solid islands that animate use WAAPI (`element.animate`) inside `onMount`, cancelled in `onCleanup`
- [ ] Counter tickers used ONLY on numeric stats — step numbers (01, 02, 03) are static text
- [ ] No GSAP, ScrollTrigger, @gsap/react, Framer Motion, or Lenis in package.json
- [ ] Every animation block has a `@media (prefers-reduced-motion: reduce)` guard
- [ ] Page-to-page navigation uses Astro View Transitions (`<ClientRouter />` + `transition:name`)

**Analytics & Auth:**
- [ ] datafa.st `<script>` tag present in `BaseLayout.astro` with both placeholders (`data-website-id`, `data-domain`) documented
- [ ] No `@datafast/*` npm package installed
- [ ] Auth scaffold built only if Phase 1 Q7 = Yes — marketing-only sites have no auth pages

**Technical:**
- [ ] `pnpm astro build` succeeds
- [ ] Responsive on mobile (320px minimum)
- [ ] No TypeScript `any` types
- [ ] Solid islands use the minimum hydration directive needed (`client:visible` > `client:idle` > `client:load`)
- [ ] No `"use client"`, `next/*`, or `src/app/` references anywhere
