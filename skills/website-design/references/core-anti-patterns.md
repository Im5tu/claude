# Anti-Patterns — Banned Patterns & Required Quality Markers

Read this file FIRST before building anything. These rules override all other guidance.

---

## Banned Fonts

Never use these fonts anywhere. They are overused to the point of being invisible — they signal "template" to anyone who has seen more than five websites.

**Hard-banned:** Inter, Roboto, Open Sans, Lato, Montserrat, Poppins, Nunito, Raleway, Source Sans Pro, Work Sans, DM Sans, Manrope, Rubik

**Why:** Ubiquity destroys distinctiveness. When 60% of template sites use these fonts, choosing them guarantees your site looks like every other template. Premium sites use curated, less common fonts — your direction card names the specific pairing.

---

## Banned Visual Patterns

| Pattern | Why It's Banned | What To Do Instead |
|---------|----------------|-------------------|
| Generic `linear-gradient` background without texture | Flat, digital, cheap | Add noise overlay, use radial gradients, or combine gradient with subtle pattern |
| Stock photo hero with white text overlay | The #1 template marker | Use gradient overlays, color treatments, image with intentional crop, or abstract visuals |
| Symmetrical 3-column feature grid with identical card heights | Every SaaS template ever | Use bento grid (mixed sizes), alternating rows, or cards with varied content |
| Everything centered on every section | Monotonous, no visual tension | Mix left-aligned text with right visuals, use asymmetric grids, vary alignment per section |
| Drop shadows that never change | Static, lifeless | Escalate shadow on hover (`shadow-sm` → `shadow-lg`), or use border-glow in dark mode |
| Icons inside colored circles | "2019 SaaS landing page" look | Use icons inline at natural size, or in subtle containers with border only |
| Placeholder text ("Lorem ipsum", "Your tagline here") | Unprofessional, lazy | Write real copy from brand name + purpose + differentiators |
| Unstyled default HTML forms | Screams "developer built this" | Custom-styled inputs with focus glow, floating labels, validation feedback |
| Footer with only copyright text | Wasted space, dead end | Full grid footer: brand, nav columns, social links, newsletter signup |
| Gradient on entire headline or body text | Rainbow gradients, AI-startup purple-to-blue gradient across full headlines — overused, signals template | Apply gradient to **one accent word** within a headline using brand-palette colours at 90–135°. Full-headline gradient = banned. Single word = premium technique when used once per page. |
| Purple-to-blue gradient backgrounds | The "AI company" cliche | Use the direction card's palette. If accent is purple, pair with dark surfaces, not blue gradients |
| Perfectly round avatars in a row | Generic team section | Use rectangular photos with consistent aspect ratio, or varied sizes |
| Wave SVG section dividers | Template marker, adds no value | Use color transitions, angled clips, or clean hard edges between sections |
| Hero badge that says "NEW" or "AI-Powered" | Generic startup pattern | Use specific, meaningful badges ("Est. 2015", "ISO 27001", version numbers) |

---

## Banned Animation Patterns

| Pattern | Why It's Banned | What To Do Instead |
|---------|----------------|-------------------|
| Reaching for GSAP before CSS was tried | CSS `animation-timeline: scroll()` / `view()`, `@keyframes`, and transitions handle ~90% of scroll and entrance animations with zero runtime cost. GSAP adds ~70KB for capabilities you usually don't need. | Default to CSS. Only escalate to WAAPI (inside a Solid island) when state drives timing. Motion One is the last resort and never installed by default. |
| Installing Framer Motion, Motion One, or `@gsap/react` for single fade-ins | A 6-line `@keyframes` + `animation-timeline: view()` block does the same job with no dependency. | Use the CSS ScrollReveal pattern from `core-animation.md`. |
| Manual `requestAnimationFrame` scroll listeners (or `window.addEventListener("scroll", …)` driving visual changes) | Jank-prone, runs on main thread, reimplements what the browser already provides. | Use `animation-timeline: scroll()` (or `scroll(root)`) — the compositor drives it off-main-thread. |
| Hydrating a Solid island that has no state or interaction | Wasted hydration cost; the island didn't need to be an island. | Use `.astro` + `<slot />`. Reserve Solid components for genuine interactivity. |
| Using `client:load` when `client:visible` or `client:idle` would suffice | Delays First Input Delay, blocks the main thread at startup. | Default to `client:visible`. Use `client:idle` for non-critical interactivity, `client:load` only when the island is above-the-fold and immediately interactive. |
| Bounce / elastic easing on entrances for restrained or establishment registers | Feels cheap and playful — incongruent with the dimensional position. | Use `cubic-bezier(0.2, 0.8, 0.2, 1)` or `cubic-bezier(0.4, 0, 0.2, 1)` for weighted entrances. |
| Animations longer than 1.2s | Feels sluggish, blocks user progress | Keep entrances 300–600ms. Only scroll-linked parallax or ambient loops can be slow. |
| All elements animating at once | Overwhelming, no hierarchy | Stagger children (80–150ms gap) via per-child `animation-delay: calc(var(--i) * 80ms)`. Headline first, then subtext, then CTA. |
| Below-fold content animating on page load | Wastes performance, invisible animation | Use `animation-timeline: view()` with `animation-range` — only animates when element enters viewport. |
| Infinite loop animations | Distracting, increases power consumption | Only allowed for loading spinners or subtle ambient loops on expressive registers. Everything else: trigger once, done. |
| Opacity-only fade (no transform) | Flat, lifeless entrance | Combine opacity with `translate: 0 20-30px` or `scale(0.95)` in the starting keyframe. |
| AOS library with default settings | Everyone uses `data-aos="fade-up"` with identical timing | Use CSS `animation-timeline: view()` with custom easing and duration from your direction card. |
| Slide-in from far off-screen | Feels like a PowerPoint transition | Keep translate distances subtle: 20–40px for fade-up, 40–60px max for slides. |
| Animation on elements that are already visible | Confusing, elements "jump" | Only animate elements that start from an off-state (opacity 0, transform, etc.). |
| Floaty animations — entrance duration over 0.6s, stagger over 100ms between siblings, y-travel over 30px | Sluggish, lacks intent. | Keep entrances 0.4–0.55s, stagger 60–80ms, y-travel 20–24px. |
| Stagger interval below 60ms | Sub-perceptual — elements appear to animate simultaneously. | Minimum 60ms between siblings. Standard: 80ms. Maximum for non-text elements: 150ms. |
| Missing `prefers-reduced-motion` guard on any animation block | Accessibility violation. | Every `@keyframes` block must be paired with a `@media (prefers-reduced-motion: reduce)` override that disables the animation. WAAPI islands must check `matchMedia("(prefers-reduced-motion: reduce)").matches` before animating. |

---

## Banned Layout Patterns

| Pattern | Why It's Banned | What To Do Instead |
|---------|----------------|-------------------|
| Every section same height | Monotonous rhythm | Vary section heights — hero is tall, social proof strip is short, features breathe |
| Consecutive sections with same background | No visual rhythm, feels like one blob | Alternate: white → tinted → white → dark → white |
| No hierarchy within sections | Everything same size, nothing stands out | Use size contrast: large headline + smaller body + even smaller caption |
| More than 2 CTAs visible at once | Choice paralysis, dilutes conversion | One primary CTA per viewport. Secondary CTAs are ghost/outline style. |
| Full-width text without max-width | Lines over 75ch are unreadable | `max-w-[65ch]` for body text, `max-w-prose` as fallback |
| Identical padding on every section | Mechanical, lifeless rhythm | Vary: hero `py-24 lg:py-32`, features `py-16 lg:py-24`, CTA `py-12 lg:py-16` |
| Single-column everything | No visual interest, blog-like | Use grids: 7+5 splits, 5+7, bento, sidebar layouts |

---

## Banned Code Patterns

| Pattern | Why It's Banned | What To Do Instead |
|---------|----------------|-------------------|
| Inline styles | Unmaintainable, fights Tailwind | Use Tailwind utilities. Scoped `<style>` in `.astro` is fine for animation recipes. |
| `setTimeout` for animation timing | Unreliable, not synced to frame rate | Chain CSS `animation-delay` or use WAAPI `anim.finished.then(...)` |
| Missing animation cleanup in Solid islands | Memory leak when the component unmounts | `const anim = el.animate(...)` inside `onMount` + `onCleanup(() => anim.cancel())` |
| Hard-coded `px` for font sizes | Not responsive, breaks on zoom | Use `clamp()` for headings, `rem` for body |
| Firing a scroll listener to implement animation | Jank, main-thread cost | Use `animation-timeline: scroll()` / `view()` |
| Images without dimensions | Layout shift (CLS penalty) | Always set `width`, `height`, or use `aspect-ratio` |
| Importing `gsap` or `@gsap/react` | Banned in this stack | Use CSS first; WAAPI or Motion One if genuinely necessary |
| React syntax in a Solid island (`useState`, `useEffect`, `"use client"`) | Wrong framework | Solid uses `createSignal`, `createEffect`, `onMount`, `onCleanup`. No `"use client"` directive — hydration is controlled by `client:*` directives on the component in the `.astro` parent. |

---

## Required Quality Markers

Every page built by this skill MUST have ALL of these. If any are missing, the output is not complete.

### Visual
- [ ] At least 1 full-bleed section (edge-to-edge, no container max-width)
- [ ] At least 1 section with a contrasting background color
- [ ] Noise texture overlay (subtle, 2-5% opacity, SVG `feTurbulence` filter)
- [ ] No consecutive sections with the same background color
- [ ] At least 2 different section layouts per page (not all centered-single-column)
- [ ] At least 1 section with asymmetric layout (text one side, visual other side)

### Typography
- [ ] All headings use `clamp()` for fluid sizing
- [ ] Display text has negative letter-spacing (-0.02em or tighter)
- [ ] Body text constrained to `max-w-[65ch]`
- [ ] Font loaded via `@fontsource-variable/*` (imported in `BaseLayout.astro`) or preconnected Google Fonts `<link>` tag — not an unconnected CDN `<link>`

### Animation
- [ ] Hero section has a CSS-driven entrance (`@keyframes` on load, or `animation-timeline: view()` if below-fold)
- [ ] Below-fold sections use `animation-timeline: view()` (not page-load animation)
- [ ] Staggered entrance timing via per-child `--i` + `animation-delay: calc(var(--i) * 80ms)` (80–150ms range)
- [ ] Every animation block has a matching `@media (prefers-reduced-motion: reduce)` override
- [ ] Solid islands that animate use WAAPI with `onMount`/`onCleanup` cleanup

### Interaction
- [ ] Navbar has a scroll state — morphs via `animation-timeline: scroll(root)` (transparent → backdrop-blur) or uses a persistent style appropriate to the direction's navigation pattern (see component-chrome-index.md)
- [ ] Every button has hover + active + focus states
- [ ] Every card has a hover interaction (lift, glow, or scale)
- [ ] Links have animated underline effect
- [ ] Dark mode toggle works and dark mode is intentionally designed

### Code Quality
- [ ] `.astro` for static markup; Solid `.tsx` islands only when interactive; the minimum `client:*` directive needed (`client:visible` preferred)
- [ ] TypeScript strict mode — no `any` types
- [ ] Semantic HTML (`<section>`, `<nav>`, `<main>`, `<article>`, `<footer>`)
- [ ] Accessible: ARIA labels, keyboard navigation, focus management
- [ ] `pnpm astro build` succeeds (no build errors)

---

## Banned Component Mistakes

These are common AI implementation errors. Treat them as hard bans, same as the visual anti-patterns above.

**Counter animation on process step numbers.**
Step numbers (01, 02, 03) are static decorative text. NEVER wrap them in CounterTicker or any count-up animation. CounterTicker is ONLY for stat numbers (clients served, years, revenue, percentages, etc.).

**Social proof with company names as plain text.**
Client logos MUST be real image files — inline SVG, a hosted PNG/JPG, or an SVG element drawn in code. A row of company names in grey text is not social proof. It is a list. If you do not have real logos, render monogram circles with company initials styled with the brand palette. Do not render text names.

**Manifesto section without scroll-triggered reveal.**
If the Manifesto section is present, the power statement should use a scroll-triggered reveal animation calibrated to the direction card's motion register — the default is a word-by-word CSS TextReveal with per-word `animation-delay` and `animation-timeline: view()` (see `core-animation.md`). A static paragraph on a dark background is not a manifesto — it is a paragraph.

**Hero image when the direction card explicitly forbids it.**
If the direction card declares a type-led hero (typography IS the visual), adding a background image dilutes the hero's identity. The direction card is always the final authority over generic guidance.

**Stats numbers that do not animate.**
If a stat number is presented as a counter, it MUST count up when it enters the viewport. A stat reading "0+" on page load means `animation-timeline: view()` is not firing (wrong `animation-range`, `@property` registration missing, or parent `view-timeline` misconfigured). Verify by scrolling past and checking the rendered number. Never ship a stats section with static-looking counters.

**Glassmorphism misuse.**
Glass cards only work when they float on top of a richly coloured or blurred background. Never apply `backdrop-filter: blur()` to elements that are not overlapping a rich background — the effect disappears and looks broken. Never stack multiple glass cards in one section.

---

## Composition Anti-Patterns

These are structural mistakes that cause every site to look identical regardless of style direction. They are as dangerous as the visual anti-patterns above.

| Anti-Pattern | Why It's Banned | What To Do Instead |
|---|---|---|
| Always including a Manifesto section | 70% of AI-generated sites have a dark full-bleed section with word-reveal text. It reads as a template marker unless philosophy is a genuine differentiator. | Only include Manifesto if the business's values are their actual competitive edge. A ceramics studio doesn't need one. A B-Corp does. |
| Always including a Stats section | Stats sections only work when the numbers are genuinely impressive (150+ clients, $50M managed, 10 years). Showing "3 projects, 2 years, 100% satisfaction" looks desperate. | Include stats only when numbers are genuinely impressive and verifiable. If in doubt, omit. |
| Always including a Social Proof Strip | A logo strip with placeholder monograms signals "this business has no real clients." | Include a logo strip only if real logo assets exist. Otherwise, use a testimonials section or case study teasers instead. |
| 10-section homepage template | Hero → Logos → Features → Process → Manifesto → Testimonials → Stats → CTA → Footer — every time. | Let business content drive section selection. A solo consultant needs fewer sections than a SaaS. A portfolio site needs different sections than a service firm. |
| Selecting components based on style, not content | Choosing StickyCardStack because it looks good on a dark + restrained direction, regardless of what content it will hold. | Classify business content first (what do they offer? how do they work? what's their proof?). Then select the component that best presents that content type. Then apply the direction card. |
| Treating section order as fixed | Hero always followed by Social Proof always followed by Features — exactly. | Let narrative flow guide section order. Sometimes Testimonials before Features makes sense if credibility is the barrier. |
| Every page gets the same section count | 10 sections on every page regardless of content depth. | Minimum viable homepage: 5 sections. Typical: 7–9. Max: 11. Only add sections if content justifies them. |
| Consecutive sections at same visual weight | Two heavy (high-motion, content-rich) sections back to back overwhelm the user. Two light sections in a row feel underdeveloped. | Alternate heavy → medium → light → heavy. Never place two heavy sections adjacent. |
