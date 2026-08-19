# Core animation — CSS-first

This file defines the animation primitives available to the skill. The rules here OVERRIDE any animation pattern shown in a component file.

## Principles

**Hierarchy (strict priority order):**
1. **CSS-first default.** `@keyframes`, `transition`, `animation-timeline: scroll()` and `view()` with `animation-range`, CSS `@property` for interpolatable custom properties, and the View Transitions API for page-to-page animation. This covers ~90% of entrance, scroll-linked, and hover animations.
2. **Escape hatch: Web Animations API.** `element.animate(keyframes, options)` from a small script or the framework's mount hook. Cancel on teardown. Use only when state drives timing (accordion, card shuffle, user-triggered sequence, reactive value).
3. **Last resort: Motion One.** Opt-in, never installed by default. Only for orchestrated sequenced timelines genuinely beyond CSS+WAAPI.

**Do NOT install or reference:**
- `gsap`, `@gsap/react`, `ScrollTrigger`, `ScrollSmoother`
- `framer-motion`
- `lenis` (unless the brief explicitly requests smooth-scroll)
- AOS, Animate.css, any "drop-in animation library"

**Do NOT write:**
- Manual `window.addEventListener("scroll", ...)` driving transforms. Use `animation-timeline: scroll()`.
- `setTimeout` for animation sequencing. Use `animation-range` offsets (scroll-driven), `animation-delay` (time-driven only), or WAAPI `anim.finished.then(...)`.
- Time-valued `animation-delay` on a rule that also sets a scroll-driven `animation-timeline`. The spec ignores the delay; stagger scroll-driven entrances with per-item `animation-range` offsets instead.

---

## CSS vs scripted behavior: when to use which

| Situation | Where it lives | Mechanism |
|---|---|---|
| Entrance on scroll (fade, slide, stagger) | stylesheet | CSS `animation-timeline: view()` inside an `@supports` guard |
| Scroll-linked (parallax, nav morph, progress bar) | stylesheet | CSS `animation-timeline: scroll()` |
| Hover, focus, active states | stylesheet | CSS `transition` |
| Page-to-page transitions | layout | View Transitions API (`view-transition-name`; in frameworks, their VT integration) |
| Counter ticking to a target number | stylesheet | CSS `@property --n` animated via `animation-timeline: view()` |
| Accordion / collapsible reacting to state | script | WAAPI `element.animate()` |
| Card shuffle / reorder / reactive list | script | WAAPI with FLIP pattern |
| Drag, gesture, pointer-driven | script | Pointer events + WAAPI |
| Orchestrated multi-step sequence with branching | script | Motion One (opt-in) |

**Decision rule:** If the trigger is "the element is in viewport" or "the user is hovering", use CSS. If the trigger is "state changed", use a script with WAAPI.

---

## Support guard (mandatory for every scroll-driven entrance)

`animation-timeline` is not universal. An entrance that starts elements at `opacity: 0` without a guard leaves the page permanently blank below the fold on unsupported engines. Two rules, no exceptions:

1. The scroll-driven block lives inside `@supports (animation-timeline: view()) { ... }`.
2. The hidden starting state lives in the keyframes' `from` frame (applied via `animation-fill-mode: both`), never as a static declaration outside the guard. Unsupported engines then render the content statically visible.

## Reduced-motion guard (mandatory for every animation)

```css
@media (prefers-reduced-motion: reduce) {
  .my-animated { animation: none; transition: none; }
}
```

### Global nuke (safety net in the global stylesheet)

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

Use this as a safety net, not as a replacement for per-block guards.

---

## ScrollReveal (entrance on viewport enter)

Purely CSS. No JS. Add the `reveal` class to any element that should enter on scroll.

```css
@keyframes reveal-in {
  from { opacity: 0; translate: 0 var(--distance, 24px); }
  to   { opacity: 1; translate: 0 0; }
}

@supports (animation-timeline: view()) {
  .reveal {
    animation: reveal-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
}

@media (prefers-reduced-motion: reduce) {
  .reveal { animation: none; }
}
```

### Staggering sibling reveals

Time delays are ignored on scroll-driven timelines, so stagger by shifting each item's range start:

```css
@supports (animation-timeline: view()) {
  .reveal:nth-child(2) { animation-range: entry 8% cover 38%; }
  .reveal:nth-child(3) { animation-range: entry 16% cover 46%; }
  .reveal:nth-child(4) { animation-range: entry 24% cover 54%; }
}
```

For arbitrary counts, set the offset from a per-item custom property (`--i`) emitted at build time:

```css
@supports (animation-timeline: view()) {
  .reveal-item {
    animation: reveal-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry calc(var(--i, 0) * 8%) cover calc(30% + var(--i, 0) * 8%);
  }
}
```

---

## TextReveal (word-by-word or char-by-char stagger)

Split the string at build time; wrap each word (or char) in a span carrying `--i`. Whitespace stays outside the spans. Same range-offset stagger as above:

```css
.text-reveal { display: inline-block; }

@keyframes tr-in {
  from { opacity: 0; translate: 0 0.35em; }
  to   { opacity: 1; translate: 0 0; }
}

@supports (animation-timeline: view()) {
  .tr-part {
    display: inline-block;
    animation: tr-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry calc(var(--i, 0) * 3%) cover calc(25% + var(--i, 0) * 3%);
  }
}

@media (prefers-reduced-motion: reduce) {
  .tr-part { animation: none; }
}
```

Default stagger density: ~3% range offset per word (~60-80ms perceived at normal scroll speed). Word-level splitting is the default; char-level only for short display headlines.

---

## CounterTicker (0 → target on viewport enter)

CSS `@property` makes a custom property interpolatable as an integer; `counter()` renders it. Markup: a span with `--to: <target>`, an empty presentation span (`aria-hidden`), a visually-hidden span containing the real final number for accessibility and as the no-support fallback.

```css
@property --n {
  syntax: "<integer>";
  inherits: false;
  initial-value: 0;
}

.counter { display: inline-flex; align-items: baseline; gap: 0.05em; }
.counter-n::after { content: counter(n); }

@supports (animation-timeline: view()) {
  .counter-n {
    counter-reset: n var(--n);
    animation: count-up 1200ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 10% cover 40%;
  }
  @keyframes count-up {
    from { --n: 0; }
    to   { --n: var(--to); }
  }
  /* hide the static fallback only when the animated counter is active */
  .counter-fallback { position: absolute; clip-path: inset(50%); }
}

@media (prefers-reduced-motion: reduce) {
  .counter-n { animation: none; counter-reset: n var(--to); }
}
```

**Fallback behavior:** without `@supports` a scripted version can drive the number via `IntersectionObserver` + `requestAnimationFrame` (ease-out cubic, ~1200ms, threshold 0.4); otherwise the static number simply shows. Use CounterTicker ONLY on real numeric stats. Step numbers (01, 02, 03) are static text.

---

## ParallaxLayer (scroll-linked translate)

```css
.parallax {
  animation: parallax-y linear both;
  animation-timeline: scroll(root);
}
@keyframes parallax-y {
  from { translate: 0 calc(var(--speed, 0.3) * -100px); }
  to   { translate: 0 calc(var(--speed, 0.3) *  100px); }
}
@media (prefers-reduced-motion: reduce) {
  .parallax { animation: none; translate: 0 0; }
}
```

`--speed`: 0 = static, 1 = page speed, negative = reverse. No guard needed: the unanimated state is fully visible.

---

## Navbar scroll morph

No JS. The fixed header goes from transparent to backdrop-blurred over the first 160px of scroll:

```css
.nav {
  position: fixed;
  inset: 0 0 auto 0;
  z-index: 50;
  background: transparent;
  backdrop-filter: blur(0);
  border-bottom: 1px solid transparent;
  animation: nav-morph linear both;
  animation-timeline: scroll(root);
  animation-range: 0 160px;
}
@keyframes nav-morph {
  to {
    background: color-mix(in oklab, var(--color-surface-primary) 70%, transparent);
    backdrop-filter: blur(12px);
    border-bottom-color: color-mix(in oklab, currentColor 10%, transparent);
  }
}
@supports not (animation-timeline: scroll()) {
  .nav {
    background: color-mix(in oklab, var(--color-surface-primary) 70%, transparent);
    backdrop-filter: blur(12px);
  }
}
@media (prefers-reduced-motion: reduce) {
  .nav { animation: none; background: var(--color-surface-primary); backdrop-filter: blur(8px); }
}
```

---

## Page-to-page transitions (View Transitions API)

Tag the matching element on both pages with the same `view-transition-name` (e.g. a case-study image on the listing page and on the detail page), and enable cross-document view transitions (`@view-transition { navigation: auto; }`, or the framework's own integration where one exists). Keep names unique per page. Default crossfade is usually right; reserve custom `::view-transition-*` keyframes for the one signature moment.

---

## Stateful: accordion (script + WAAPI)

State drives timing, so this is scripted. `height: auto` cannot be transitioned universally yet, so animate measured `scrollHeight`:

- Markup: a list of rows; each row is a full-width `<button>` (question, plus a `+` glyph that rotates 45deg when open via a CSS transition) and a panel `<div>` at `height: 0; overflow: hidden`.
- Behavior: clicking a row toggles it (and closes any other open row). On toggle, cancel the in-flight animation, then `panel.animate([{height: from}, {height: to}], { duration: 320, easing: "cubic-bezier(0.2, 0.8, 0.2, 1)", fill: "forwards" })` where from/to are `0` and `panel.scrollHeight`. After an open finishes, set `height: auto` so the panel reflows with content.
- Reduced motion: set the height directly, no animation.
- Accessibility: the button carries `aria-expanded`; the panel `role="region"` and is labelled by the button.

---

## Motion One (opt-in, last resort)

Only if CSS+WAAPI genuinely can't express the sequence, and only with explicit install (`pnpm add motion`). Typical use: `animate(items, { opacity: [0,1], transform: ["translateY(24px)", "translateY(0)"] }, { duration: 0.6, easing: [0.2, 0.8, 0.2, 1], delay: stagger(0.08) })` over `[data-step]` children, skipped entirely under reduced motion, stopped on teardown.

---

## Duration + easing tokens

Author once in the global stylesheet (Tailwind v4 `@theme`, or `:root`) so both CSS and WAAPI can reference them:

```css
@theme {
  --ease-out-soft: cubic-bezier(0.2, 0.8, 0.2, 1);
  --ease-in-out-soft: cubic-bezier(0.4, 0, 0.2, 1);

  --motion-duration-fast: 200ms;
  --motion-duration-base: 400ms;
  --motion-duration-slow: 700ms;

  --motion-distance: 24px;
  --motion-stagger: 80ms;
}
```

Use from CSS:

```css
.card { transition: translate var(--motion-duration-fast) var(--ease-out-soft); }
```

Use from WAAPI: read via `getComputedStyle(document.documentElement).getPropertyValue(...)`.

---

## Things CSS cannot do today (escape-hatch justification)

- **`height: auto` ↔ `0` smooth animation.** `interpolate-size: allow-keywords` is Chromium-only as of the 2026 baseline. Use WAAPI with measured `scrollHeight` (accordion pattern above).
- **Branching sequences that depend on async results.** `anim.finished.then(...)` or Motion One.
- **Pointer-driven drag / gesture curves.** Pointer events + WAAPI.
- **FLIP transitions on list reorder.** Measure, mutate, animate deltas via WAAPI.

Everything else — entrances, scroll links, hover, focus, navbar morph, counter tickers, parallax, page transitions — belongs in CSS.
