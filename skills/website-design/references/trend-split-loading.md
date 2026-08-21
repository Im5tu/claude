# Trend: Split Loading Screens and Page Transitions

## What It Is
A full-screen overlay (or pair of panels) that covers the page on navigation, then splits or peels back to reveal the destination. The curtain colour is the brand's primary colour — not always black. A first-visit loading screen is a separate concern: a minimal brand mark that fades out after ~600ms. Duration discipline: never exceed 800ms total.

## Implementation

Astro's **View Transitions API** with a custom transition targeting the `root` pseudo-elements. No JS library needed.

```css
/* src/styles/global.css */
::view-transition-old(root) {
  animation: curtain-out 400ms cubic-bezier(0.4, 0, 1, 1) both;
}
::view-transition-new(root) {
  animation: curtain-in 400ms cubic-bezier(0.22, 1, 0.36, 1) 200ms both;
}
@keyframes curtain-out { to { clip-path: inset(0 0 100% 0); } }
@keyframes curtain-in  { from { clip-path: inset(100% 0 0 0); } }

@media (prefers-reduced-motion: reduce) {
  ::view-transition-old(root), ::view-transition-new(root) { animation: none; }
}
```

Enable the router in `BaseLayout.astro`:

```astro
---
import { ClientRouter } from "astro:transitions";
---
<html>
  <head><ClientRouter /></head>
  <body><slot /></body>
</html>
```

For the first-visit loader, render a fixed-position brand mark and animate opacity via CSS `@keyframes` on `body` load — no scripting.

## Premium Signals
- Page transition colour that matches a brand element (primary CTA colour, brand mark colour), making the transition feel native to the brand

## Anti-Execution Warnings
- **Page transitions longer than 800ms total** — users interpret any delay above 800ms as a performance problem, not a design decision.

## Context Signals
Use when the brief signals: a multi-page narrative where the transitions between pages are part of the storytelling; language like "cinematic," "immersive," or "experience"; a brand colour strong enough to carry a full-screen moment (the curtain colour IS a brand expression).
Avoid when: the site is a single-page layout; the brief prioritises speed and performance perception over polish; the audience navigates via direct links or search rather than sequential page browsing.
Cross-aesthetic applications: A warm, personal brand can use a slow single-colour wipe in its primary warm tone when the brief describes "taking time" or "unhurried craftsmanship" — the transition pace mirrors the brand's relationship with speed. A minimal, content-first brand can use a fast, clean fade (200ms) when the brief describes precision and directness. A precision, technology brand can use a minimal brand-mark preloader on first visit (the logo mark appears, holds for 400ms, then fades) when the brief describes "first impression of exactness" — the timing and typography of that opening moment become the brand's first statement before content loads.
Implementation threshold: total transition duration under 800ms. Curtain colour derived from a brand element. `::view-transition-*` pseudo-elements with eased keyframes. First-visit loading screen is a separate concern: 600ms brand mark fade, not a page transition.

## Longevity Signal
Ascending — Astro's View Transitions API removes the implementation friction. A visible differentiator when executed.
