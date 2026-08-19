# Trend: Scroll-Linked Animations

## What It Is
Animations whose progress is continuously mapped to scroll position rather than triggered once at scroll entry. Native CSS `animation-timeline: scroll()` and `view()` handle this directly, composited off-main-thread by the browser. Use cases: parallax layer depth (background at 0.3x scroll rate, foreground at 1x), colour transitions between sections, scale transformations that begin oversized and reduce to final scale as the section enters, text tracking changes tied to scroll progress. The user feels in control of the motion, as though pulling the animation forward with their scroll.

## Implementation

Pure CSS:

```css
.parallax-bg {
  animation: parallax-y linear both;
  animation-timeline: view();
  animation-range: entry 0% exit 100%;
}
@keyframes parallax-y {
  from { translate: 0 -200px; }
  to   { translate: 0  200px; }
}
@media (prefers-reduced-motion: reduce) {
  .parallax-bg { animation: none; translate: 0 0; }
}
```

For document-scoped timelines (progress bars, nav morph) use `animation-timeline: scroll(root)` — see `core-animation.md` §ParallaxLayer and §Navbar scroll morph. No JS, no scrub lag — the browser interpolates on the compositor thread.

## Premium Signals
- Scrub animations calibrated to content length — a longer horizontal scroll section uses a faster scrub rate to maintain proportion

## Anti-Execution Warnings
- **Scroll-linked animations that obscure text during scroll** — if a headline is animating (tracking, opacity) while the user is trying to read it, the animation interferes with the page's purpose. Scroll-linked motion should apply to non-content elements (backgrounds, decorative elements, images) or to content that has already been consumed.

## Context Signals
Use when the brief signals: long-form storytelling content, a narrative that unfolds in stages, or language like "journey," "progression," or "transformation"; backgrounds rich enough (photography, gradient, illustration) to reward parallax depth; sections where the visitor should feel they are pulling the story forward.
Avoid when: content is short-form or transactional (pricing, FAQ); sections contain dense readable text that would compete with simultaneous motion; the brief prioritises speed and efficiency over immersion.
Cross-aesthetic applications: A warmly textured brand can use scroll-linked parallax on photographic hero layers when the brief describes a hands-on craft process — the scroll pace mirrors the slowness of the work. An authoritative traditional brand can use a single scroll-linked colour transition between its hero and proof section when the brief emphasises gravitas and deliberate pacing. A precise, product-focused brand can use a single scroll-linked scale transformation on a hero product image when the brief describes "seeing the product come into focus" — the image resolves from slightly oversized to its final scale as the section is reached, turning the user's attention into a reveal mechanic.
Implementation threshold: scrub lag between 0.8–1.2 seconds. Motion applies to non-content elements (backgrounds, decorative layers, images) — never to text the visitor is actively reading.

## Longevity Signal
Mature — standard on premium sites. Quality of scrub calibration is the differentiator.
