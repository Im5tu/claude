# Trend: Horizontal Scroll Sections

## What It Is
Mid-page sections where vertical scrolling is pinned while content scrolls horizontally. GSAP implementation: `ScrollTrigger.create({ pin: true, scrub: 1 })` with horizontal translate driven by scroll progress. Correct use cases: portfolio image galleries, feature comparison steps (step 1 -> step 2 -> step 3), timeline sequences. The key test: would this content be worse if laid out vertically? If not, the horizontal scroll is forced and should be removed.

## Implementation
```js
const sections = gsap.utils.toArray('.horizontal-panel');
gsap.to(sections, {
  xPercent: -100 * (sections.length - 1),
  ease: 'none',
  scrollTrigger: {
    trigger: '.horizontal-container',
    pin: true,
    scrub: 1,
    end: () => '+=' + document.querySelector('.horizontal-container').offsetWidth,
  }
});
```

## Premium Signals
- Horizontal scroll sections where the content genuinely benefits (portfolio work that should be scanned laterally)

## Anti-Execution Warnings
- **Horizontal scroll with content that would work fine vertically** — pricing tiers, testimonial cards, FAQ items. If it can scroll vertically, it should.
- **Horizontal scroll without inertia calibration** — scrub speed must feel proportional to content length. Too fast and the user loses their place; too slow and it feels broken.

## Context Signals
Use when the brief signals: portfolio or gallery content where lateral scanning matches the natural viewing behaviour (artwork, photography, physical spaces); step-by-step sequences where spatial progression reinforces temporal progression (process flows, timelines, product journeys); content that would lose its impact if stacked vertically because the horizontal continuity IS the point.
Avoid when: the content works equally well (or better) in a vertical stack — pricing tiers, FAQ items, testimonial cards; the section contains fewer than 4 items (insufficient content to justify the scroll mechanic); the site's primary audience is on mobile where horizontal scroll conflicts with the dominant vertical gesture.
Cross-aesthetic applications: A refined, museum-like brand can use horizontal scroll when the brief describes "exhibition" or "curation" — the scroll becomes a gallery walk, with each item given deliberate spatial separation. A high-energy, maximalist brand can use horizontal scroll for a dense image reel when the brief describes "immersion" or "overwhelm" — fast scrub speed and tightly packed visuals create the feeling of flipping through a magazine at pace.
Implementation threshold: Scrub speed must be calibrated to content density — too fast and the user loses their place, too slow and it feels broken. The section must include a clear visual indicator that horizontal scrolling is occurring (progress bar, visible overflow, or partial next-item reveal).

## Longevity Signal
Ascending — still feels purposeful when used correctly. Risk of misuse is high.
