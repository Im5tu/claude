# Trend: Scroll Progress Indicators

## What It Is
A thin bar at the top of the viewport that grows from left to right as the user scrolls through a page, indicating how far they have read. The bar is a functional delight — it serves the reading experience by showing progress, but the visual execution (brand colour, smooth scaling, optional completion state) makes it feel designed rather than utilitarian.

## Implementation
```css
.scroll-progress {
  position: fixed;
  top: 0;
  left: 0;
  height: 2px;
  background: var(--color-accent);
  transform-origin: left;
  transform: scaleX(0);
  z-index: 9999;
  pointer-events: none;
}
```

```js
gsap.to('.scroll-progress', {
  scaleX: 1,
  ease: 'none',
  scrollTrigger: {
    start: 'top top',
    end: 'bottom bottom',
    scrub: 0,  // exact tracking, no smoothing
  }
});
```

Height: 2–3px. Thinner than 2px becomes invisible; thicker than 4px becomes a design element competing with the navbar. Colour: brand accent colour, optionally with a subtle gradient (`linear-gradient(90deg, var(--color-accent), var(--color-accent-light))`). Use `scaleX` transform (not `width`) for GPU performance — animating `width` causes layout recalculation on every frame. Completion state: when `scaleX` reaches 1, optionally fade the bar out after a 1-second delay — the reader has finished, so the progress indicator is no longer needed.

Appropriate for: editorial/long-form pages, case studies, long About pages, blog posts — any page where reading progress is meaningful. Not appropriate for: homepages, product pages, short pages, or pages where scrolling is not linear (pages with horizontal scroll sections or pinned sequences will produce misleading progress).

## Premium Signals
- Brand accent colour, not generic blue
- `scaleX` transform for GPU performance
- Deployed only on pages where reading progress is meaningful

## Anti-Execution Warnings
- **Scroll progress on short pages** — a progress bar that reaches 100% after two viewport-heights of scrolling serves no purpose and cheapens the mechanic. Deploy only on genuinely long pages (4+ viewport heights of content).

## Context Signals
Use when the brief signals: editorial or long-form content where reading progress is meaningful, case studies or detailed product pages that require sustained reading, brand positioning around "depth" / "thoroughness" / "we go deep"
Avoid when: the page is short (under 4 viewport heights — the bar fills too quickly), the page has non-linear scroll patterns (horizontal sections, pinned sequences produce misleading progress), or the page is action-oriented rather than reading-oriented (homepages, product pages with primarily visual content)
Cross-aesthetic applications: An editorial or long-form content site can use a scroll progress indicator because it serves the reading experience directly, not as decoration — the indicator is a functional element using the brand's accent colour. A brand building trust through depth and thoroughness can use a progress bar on detailed case studies — the indicator signals that the reader is investing time in substantial content. A brand where editorial restraint defines the design language can calibrate the bar's weight and colour to match — the height, colour, and presence of the bar should all derive from the brief's established vocabulary, not a style preset.
Implementation threshold: The page must contain enough content that tracking reading progress is genuinely useful. A progress bar on a page the user can see the end of (2–3 viewport heights) is unnecessary noise.

## Longevity Signal
Mature — a functional pattern that feels designed when executed with brand colour and appropriate deployment context. No longer a differentiator on its own, but its absence on long-form pages is noticeable.
