# Core Animation — CSS-First

This file defines the animation primitives available to the skill. The rules here OVERRIDE any animation pattern shown in a component file.

## Principles

**Hierarchy (strict priority order):**
1. **CSS-first default.** `@keyframes`, `transition`, `animation-timeline: scroll()` and `view()` with `animation-range`, CSS `@property` for interpolatable custom properties, and Astro's View Transitions (`<ClientRouter />` + `transition:name`). This covers ~90% of entrance, scroll-linked, and hover animations.
2. **Escape hatch: Web Animations API.** Inside a SolidJS island's `onMount`, use `element.animate(keyframes, options)`. Cancel in `onCleanup`. Use only when state drives timing (accordion, card shuffle, user-triggered sequence, reactive value).
3. **Last resort: Motion One.** `pnpm add motion` — opt-in, never installed by default. Only for orchestrated sequenced timelines genuinely beyond CSS+WAAPI.

**Do NOT install or reference:**
- `gsap`, `@gsap/react`, `ScrollTrigger`, `ScrollSmoother`
- `framer-motion`
- `lenis` (unless the brief explicitly requests smooth-scroll)
- AOS, Animate.css, any "drop-in animation library"

**Do NOT write:**
- Manual `window.addEventListener("scroll", ...)` driving transforms — use `animation-timeline: scroll()`.
- `setTimeout` for animation sequencing — use `animation-delay` or WAAPI `anim.finished.then(...)`.
- React hooks (`useState`, `useEffect`, `useRef` from React), `"use client"`, or `next/*` imports.

---

## Astro vs Solid: when to use which

| Situation | Where it lives | Mechanism |
|---|---|---|
| Entrance on scroll (fade, slide, stagger) | `.astro` | CSS `animation-timeline: view()` |
| Scroll-linked (parallax, nav morph, progress bar) | `.astro` | CSS `animation-timeline: scroll()` |
| Hover, focus, active states | `.astro` | Tailwind utilities + CSS `transition` |
| Page-to-page transitions | `BaseLayout.astro` | `<ClientRouter />` + `transition:name` |
| Counter ticking to a target number | `.astro` | CSS `@property --n` animated via `animation-timeline: view()` |
| Accordion / collapsible reacting to state | Solid island `.tsx` | WAAPI `element.animate()` in `onMount` |
| Card shuffle / reorder / reactive list | Solid island `.tsx` | WAAPI with FLIP pattern |
| Drag, gesture, pointer-driven | Solid island `.tsx` | Pointer events + WAAPI |
| Orchestrated multi-step sequence with branching | Solid island `.tsx` | Motion One (opt-in) |

**Decision rule:** If the trigger is "the element is in viewport" or "the user is hovering", use CSS. If the trigger is "state changed", use a Solid island with WAAPI.

---

## Global reduced-motion template

Every animation block MUST include a reduced-motion guard. No exceptions.

### CSS pattern (mandatory wrapper)

```css
.my-animated {
  opacity: 0;
  translate: 0 24px;
  animation: my-reveal 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
  animation-timeline: view();
  animation-range: entry 0% cover 30%;
}
@keyframes my-reveal {
  to { opacity: 1; translate: 0 0; }
}
@media (prefers-reduced-motion: reduce) {
  .my-animated {
    opacity: 1;
    translate: 0 0;
    animation: none;
  }
}
```

### WAAPI pattern (Solid island)

```tsx
import { onMount, onCleanup } from "solid-js";

const reduced = () => matchMedia("(prefers-reduced-motion: reduce)").matches;

export default function Reveal(props: { children: any }) {
  let ref: HTMLDivElement | undefined;
  onMount(() => {
    if (reduced()) return;
    const anim = ref!.animate(
      [
        { opacity: 0, transform: "translateY(24px)" },
        { opacity: 1, transform: "translateY(0)" },
      ],
      { duration: 700, easing: "cubic-bezier(0.2, 0.8, 0.2, 1)", fill: "forwards" },
    );
    onCleanup(() => anim.cancel());
  });
  return <div ref={ref}>{props.children}</div>;
}
```

Hydrate as `<Reveal client:visible>…</Reveal>`.

### Global nuke (safety net in `src/styles/animations.css`)

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

Purely CSS. No JS. Animation runs once the element enters the viewport, driven by `animation-timeline: view()`.

### `src/components/ui/ScrollReveal.astro`

```astro
---
interface Props {
  delay?: number;       // ms
  distance?: number;    // px
  class?: string;
}
const { delay = 0, distance = 24, class: className = "" } = Astro.props;
---
<div
  class:list={["reveal", className]}
  style={`--delay: ${delay}ms; --distance: ${distance}px;`}
>
  <slot />
</div>

<style>
  .reveal {
    opacity: 0;
    translate: 0 var(--distance, 24px);
    animation: reveal-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) var(--delay, 0ms) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  @keyframes reveal-in {
    to { opacity: 1; translate: 0 0; }
  }
  @media (prefers-reduced-motion: reduce) {
    .reveal { opacity: 1; translate: 0 0; animation: none; }
  }
</style>
```

Usage:

```astro
<ScrollReveal>
  <h2 class="text-5xl">Our work, up close.</h2>
</ScrollReveal>
<ScrollReveal delay={120}>
  <p class="max-w-[60ch]">Each engagement starts with…</p>
</ScrollReveal>
```

---

## TextReveal (word-by-word or char-by-char stagger)

Split the string at build time in the `.astro` frontmatter; assign a `--i` custom property per span; drive `animation-delay` from it.

### `src/components/ui/TextReveal.astro`

```astro
---
interface Props {
  text: string;
  stagger?: number;   // ms between words
  by?: "word" | "char";
  class?: string;
}
const { text, stagger = 60, by = "word", class: className = "" } = Astro.props;
const parts = by === "word" ? text.split(/(\s+)/) : [...text];
---
<span class:list={["text-reveal", className]} style={`--stagger: ${stagger}ms;`}>
  {parts.map((p, i) =>
    /^\s+$/.test(p) ? p : (
      <span class="tr-part" style={`--i: ${i};`}>{p}</span>
    )
  )}
</span>

<style>
  .text-reveal { display: inline-block; }
  .tr-part {
    display: inline-block;
    opacity: 0;
    translate: 0 0.35em;
    animation: tr-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i, 0) * var(--stagger, 60ms));
    animation-timeline: view();
    animation-range: entry 0% cover 25%;
  }
  @keyframes tr-in {
    to { opacity: 1; translate: 0 0; }
  }
  @media (prefers-reduced-motion: reduce) {
    .tr-part { opacity: 1; translate: 0 0; animation: none; }
  }
</style>
```

Usage:

```astro
<h1 class="text-7xl tracking-tight">
  <TextReveal text="We build the quiet part." stagger={70} />
</h1>
```

---

## CounterTicker (0 → target on viewport enter)

Uses CSS `@property` to make a custom property interpolatable as an integer, then animates it via `animation-timeline: view()`. Renders via `counter()`.

### `src/components/ui/CounterTicker.astro`

```astro
---
interface Props {
  to: number;
  suffix?: string;
  class?: string;
}
const { to, suffix = "", class: className = "" } = Astro.props;
---
<span class:list={["counter", className]} style={`--to: ${to};`}>
  <span class="counter-n" aria-hidden="true"></span>
  <span class="sr-only">{to}{suffix}</span>
  {suffix && <span class="counter-suffix">{suffix}</span>}
</span>

<style>
  @property --n {
    syntax: "<integer>";
    inherits: false;
    initial-value: 0;
  }

  .counter { display: inline-flex; align-items: baseline; gap: 0.05em; }

  .counter-n {
    counter-reset: n var(--n);
    animation: count-up 1200ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 10% cover 40%;
  }
  .counter-n::after { content: counter(n); }

  @keyframes count-up {
    from { --n: 0; }
    to { --n: var(--to); }
  }

  @media (prefers-reduced-motion: reduce) {
    .counter-n { animation: none; --n: var(--to); }
  }
</style>
```

**Browser note:** `@property` integer animation is supported in evergreen Chromium, WebKit, and Firefox. For conservative targets, use the WAAPI fallback in a Solid island:

```tsx
// src/components/islands/CounterIsland.tsx
import { onMount, onCleanup, createSignal } from "solid-js";

export default function CounterIsland(props: { to: number; suffix?: string }) {
  let ref: HTMLSpanElement | undefined;
  const [n, setN] = createSignal(0);

  onMount(() => {
    if (matchMedia("(prefers-reduced-motion: reduce)").matches) {
      setN(props.to);
      return;
    }
    let raf = 0;
    const io = new IntersectionObserver((entries) => {
      if (!entries[0].isIntersecting) return;
      const start = performance.now();
      const duration = 1200;
      const tick = (t: number) => {
        const p = Math.min(1, (t - start) / duration);
        const eased = 1 - Math.pow(1 - p, 3);
        setN(Math.round(eased * props.to));
        if (p < 1) raf = requestAnimationFrame(tick);
      };
      raf = requestAnimationFrame(tick);
      io.disconnect();
    }, { threshold: 0.4 });
    io.observe(ref!);
    onCleanup(() => { io.disconnect(); cancelAnimationFrame(raf); });
  });

  return <span ref={ref}>{n()}{props.suffix ?? ""}</span>;
}
```

Use CounterTicker ONLY on real numeric stats. Step numbers (01, 02, 03) are static text.

---

## ParallaxLayer (scroll-linked translate)

```astro
---
interface Props {
  speed?: number;   // 0 = static, 1 = page speed, negative = reverse
  class?: string;
}
const { speed = 0.3, class: className = "" } = Astro.props;
---
<div class:list={["parallax", className]} style={`--speed: ${speed};`}>
  <slot />
</div>

<style>
  .parallax {
    animation: parallax-y linear both;
    animation-timeline: scroll(root);
  }
  @keyframes parallax-y {
    from { translate: 0 calc(var(--speed) * -100px); }
    to   { translate: 0 calc(var(--speed) *  100px); }
  }
  @media (prefers-reduced-motion: reduce) {
    .parallax { animation: none; translate: 0 0; }
  }
</style>
```

---

## Navbar scroll morph

No JS. The navbar goes from transparent to backdrop-blurred as the page scrolls past a threshold.

```astro
---
// src/components/layout/Navbar.astro
---
<header class="nav">
  <nav class="container mx-auto flex items-center justify-between py-4">
    <a href="/" class="font-display text-lg tracking-tight">Brand</a>
    <ul class="flex items-center gap-6 text-sm">
      <li><a href="/about">About</a></li>
      <li><a href="/work">Work</a></li>
      <li><a href="/contact">Contact</a></li>
    </ul>
  </nav>
</header>

<style>
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
      background: color-mix(in oklab, var(--color-surface) 70%, transparent);
      backdrop-filter: blur(12px);
      border-bottom-color: color-mix(in oklab, currentColor 10%, transparent);
    }
  }
  @media (prefers-reduced-motion: reduce) {
    .nav { animation: none; background: var(--color-surface); backdrop-filter: blur(8px); }
  }
</style>
```

---

## Astro View Transitions (page-to-page)

Enable once in `BaseLayout.astro`:

```astro
---
import { ClientRouter } from "astro:transitions";
---
<html lang="en">
  <head>
    <ClientRouter />
    <!-- other head -->
  </head>
  <body><slot /></body>
</html>
```

Then tag matching elements across pages:

```astro
<!-- src/pages/index.astro -->
<a href="/work/apex">
  <img src="/apex.jpg" alt="Apex case study" transition:name="hero-apex" />
</a>

<!-- src/pages/work/apex.astro -->
<img src="/apex.jpg" alt="Apex case study" transition:name="hero-apex" class="w-full" />
```

For per-element custom transitions use `transition:animate="fade"`, `"slide"`, or `transition:animate={customAnim}`.

---

## Stateful: Accordion (Solid + WAAPI)

State drives timing → Solid island + WAAPI. Uses `scrollHeight` measured at runtime because CSS `height: auto` animation isn't universal yet.

### `src/components/islands/Accordion.tsx`

```tsx
import { createSignal, onCleanup, onMount, For } from "solid-js";

interface Item { q: string; a: string; }
interface Props { items: Item[] }

const reduced = () => matchMedia("(prefers-reduced-motion: reduce)").matches;

export default function Accordion(props: Props) {
  const [open, setOpen] = createSignal<number | null>(null);
  return (
    <ul class="divide-y divide-black/10">
      <For each={props.items}>
        {(item, i) => (
          <Row
            item={item}
            isOpen={() => open() === i()}
            toggle={() => setOpen(o => (o === i() ? null : i()))}
          />
        )}
      </For>
    </ul>
  );
}

function Row(props: { item: Item; isOpen: () => boolean; toggle: () => void }) {
  let panel: HTMLDivElement | undefined;
  let current: Animation | undefined;

  const play = (to: "open" | "close") => {
    if (!panel) return;
    current?.cancel();
    const h = panel.scrollHeight;
    if (reduced()) { panel.style.height = to === "open" ? "auto" : "0px"; return; }
    const from = to === "open" ? 0 : h;
    const target = to === "open" ? h : 0;
    current = panel.animate(
      [{ height: `${from}px` }, { height: `${target}px` }],
      { duration: 320, easing: "cubic-bezier(0.2, 0.8, 0.2, 1)", fill: "forwards" },
    );
    current.finished.then(() => {
      if (to === "open") panel!.style.height = "auto";
    }).catch(() => {});
  };

  onMount(() => onCleanup(() => current?.cancel()));

  return (
    <li>
      <button
        class="flex w-full items-center justify-between py-5 text-left"
        onClick={() => { const next = !props.isOpen(); props.toggle(); play(next ? "open" : "close"); }}
      >
        <span class="font-display text-xl">{props.item.q}</span>
        <span aria-hidden classList={{ "rotate-45": props.isOpen() }} class="transition-transform">+</span>
      </button>
      <div ref={panel} style="height: 0; overflow: hidden;">
        <p class="pb-6 max-w-[60ch]">{props.item.a}</p>
      </div>
    </li>
  );
}
```

Hydrate as `<Accordion client:visible items={faqs} />`.

---

## Motion One (opt-in, last resort)

Only if CSS+WAAPI genuinely can't express the sequence. Install explicitly:

```bash
pnpm add motion
```

```tsx
// src/components/islands/SequencedReveal.tsx
import { onMount, onCleanup } from "solid-js";
import { animate, stagger } from "motion";

export default function SequencedReveal(props: { children: any }) {
  let root: HTMLDivElement | undefined;
  onMount(() => {
    if (matchMedia("(prefers-reduced-motion: reduce)").matches) return;
    const items = root!.querySelectorAll<HTMLElement>("[data-step]");
    const controls = animate(
      items,
      { opacity: [0, 1], transform: ["translateY(24px)", "translateY(0)"] },
      { duration: 0.6, easing: [0.2, 0.8, 0.2, 1], delay: stagger(0.08) },
    );
    onCleanup(() => controls.stop());
  });
  return <div ref={root}>{props.children}</div>;
}
```

---

## Duration + easing tokens

Author once in Tailwind v4 `@theme` so both CSS and WAAPI can reference them.

```css
/* src/styles/global.css */
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

Use from WAAPI (read via `getComputedStyle`):

```tsx
const root = getComputedStyle(document.documentElement);
const duration = parseInt(root.getPropertyValue("--motion-duration-slow"));
const ease = root.getPropertyValue("--ease-out-soft").trim();
```

---

## Things CSS cannot do today (escape-hatch justification)

- **`height: auto` ↔ `0` smooth animation** — `interpolate-size: allow-keywords` is Chromium-only as of the 2026 baseline. Use WAAPI with measured `scrollHeight` (accordion pattern above).
- **Branching sequences that depend on async results** — `anim.finished.then(...)` or Motion One.
- **Pointer-driven drag / gesture curves** — pointer events + WAAPI.
- **FLIP transitions on list reorder** — measure, mutate, animate deltas via WAAPI.

Everything else — entrances, scroll links, hover, focus, navbar morph, counter tickers, parallax, page transitions — belongs in CSS.
