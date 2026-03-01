# Trend: Scroll-Linked Animations

## What It Is
Animations whose progress is continuously mapped to scroll position rather than triggered once at scroll entry. GSAP ScrollTrigger with `scrub: true` (or `scrub: 1` for 1-second lag smoothing). Use cases: parallax layer depth (background at 0.3x scroll rate, foreground at 1x), colour transitions between sections (background-color interpolated via ScrollTrigger `onUpdate`), scale transformations that begin oversized and reduce to final scale as the user reaches the section, and text tracking changes tied to scroll progress. The key distinction from triggered animation: the user feels in control of the motion, as though they are pulling the animation forward with their scroll. Premium scrub lag: 0.8–1.2 seconds. Too little (0.1) feels jerky; too much (3+) feels broken.

## Implementation
```js
gsap.to('.parallax-bg', {
  y: -200,
  scrollTrigger: {
    trigger: '.section',
    start: 'top bottom',
    end: 'bottom top',
    scrub: 1, // 1-second lag smoothing
  }
});
```

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
