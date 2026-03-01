# Trend: Split Loading Screens and Page Transitions

## What It Is
A full-screen overlay (or pair of panels) that covers the page on navigation, then splits or peels back to reveal the destination. Implementation in Next.js: a layout-level component that listens to route changes and triggers a GSAP timeline: `tl.to('.curtain', { scaleY: 1, duration: 0.4, ease: 'power3.in' }).to('.curtain', { scaleY: 0, transformOrigin: 'top', duration: 0.4, ease: 'power3.out' })`. Variation: two panels that slide out left and right. The curtain colour is the brand's primary colour or background — not always black. A loading screen on first visit (not navigation) is separate: a minimal brand mark that fades out after a 600ms pause, giving the page time to render. Duration discipline: never exceed 800ms total for any loading/transition animation.

## Implementation
```js
// Layout-level GSAP timeline for page transition
const tl = gsap.timeline();
tl.to('.curtain', {
    scaleY: 1,
    duration: 0.4,
    ease: 'power3.in'
  })
  .to('.curtain', {
    scaleY: 0,
    transformOrigin: 'top',
    duration: 0.4,
    ease: 'power3.out'
  });
```

```css
.curtain {
  position: fixed;
  inset: 0;
  z-index: 9999;
  background-color: var(--color-brand-primary);
  transform: scaleY(0);
  transform-origin: bottom;
}
```

## Premium Signals
- Page transition colour that matches a brand element (primary CTA colour, brand mark colour), making the transition feel native to the brand

## Anti-Execution Warnings
- **Page transitions longer than 800ms total** — users interpret any delay above 800ms as a performance problem, not a design decision.

## Context Signals
Use when the brief signals: a multi-page narrative where the transitions between pages are part of the storytelling; language like "cinematic," "immersive," or "experience"; a brand colour strong enough to carry a full-screen moment (the curtain colour IS a brand expression).
Avoid when: the site is a single-page layout; the brief prioritises speed and performance perception over polish; the audience navigates via direct links or search rather than sequential page browsing.
Cross-aesthetic applications: A warm, personal brand can use a slow single-colour wipe in its primary warm tone when the brief describes "taking time" or "unhurried craftsmanship" — the transition pace mirrors the brand's relationship with speed. A minimal, content-first brand can use a fast, clean fade (200ms) when the brief describes precision and directness. A precision, technology brand can use a minimal brand-mark preloader on first visit (the logo mark appears, holds for 400ms, then fades) when the brief describes "first impression of exactness" — the timing and typography of that opening moment become the brand's first statement before content loads.
Implementation threshold: total transition duration under 800ms. Curtain colour derived from a brand element. Layout-level GSAP timeline with `power3` easing. First-visit loading screen is a separate concern: 600ms brand mark fade, not a page transition.

## Longevity Signal
Ascending — underused due to Next.js App Router implementation friction. A visible differentiator when executed.
