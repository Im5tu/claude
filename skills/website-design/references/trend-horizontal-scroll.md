# Trend: Horizontal Scroll Sections

## What It Is
Mid-page sections where vertical scrolling is pinned while content scrolls horizontally. Correct use cases: portfolio image galleries, feature comparison steps (step 1 → step 2 → step 3), timeline sequences. The key test: would this content be worse if laid out vertically? If not, the horizontal scroll is forced and should be removed.

## Implementation

Pure CSS. Use `position: sticky` on the outer wrapper combined with `animation-timeline: scroll(root)` on the inner track:

```astro
<section class="hs-wrap">
  <div class="hs-pin">
    <div class="hs-track">
      <article class="hs-panel">…</article>
      <article class="hs-panel">…</article>
      <article class="hs-panel">…</article>
    </div>
  </div>
</section>

<style>
  .hs-wrap { height: 300vh; }
  .hs-pin { position: sticky; top: 0; height: 100vh; overflow: hidden; }
  .hs-track {
    display: flex;
    height: 100%;
    animation: hs-scroll linear both;
    animation-timeline: scroll(root);
    animation-range: contain 0% contain 100%;
  }
  @keyframes hs-scroll {
    to { translate: calc(-100% + 100vw) 0; }
  }
  .hs-panel { flex: 0 0 100vw; height: 100%; }
  @media (prefers-reduced-motion: reduce) {
    .hs-wrap { height: auto; }
    .hs-pin { position: static; height: auto; overflow-x: auto; scroll-snap-type: x mandatory; }
    .hs-track { animation: none; translate: 0 0; }
    .hs-panel { scroll-snap-align: start; }
  }
</style>
```

Under `prefers-reduced-motion`, the section degrades to a native horizontal scroller with scroll-snap — no transform, no pinning.

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
