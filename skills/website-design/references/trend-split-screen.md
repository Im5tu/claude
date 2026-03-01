# Trend: Split-Screen

## What It Is
A vertical line divides the viewport into two contrasting halves. One side: text/brand content. Other side: image, video, or solid colour. The contrast between halves carries the design. Variations include: static split (both sides scroll together), independent scroll (each side scrolls at a different rate via GSAP ScrollTrigger), and animated split (the dividing line is itself a reveal mechanic). Works as a hero and as a comparison section (before/after, product A vs B).

## Implementation
```css
.split-screen {
  display: grid;
  grid-template-columns: 1fr 1fr;
  min-height: 100vh;
}

.split-screen .content-side {
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 4rem;
}

.split-screen .visual-side {
  position: relative;
  overflow: hidden;
}

.split-screen .visual-side img {
  object-fit: cover;
  width: 100%;
  height: 100%;
}
```

## Premium Signals
- Split-screen where the dividing line itself is animated or acts as a decorative element

## Anti-Execution Warnings
- N/A — Split-screen specific anti-patterns are covered under context signals (avoid when one side would be empty or padded).

## Context Signals
Use when the brief signals: a brand built on contrasts, duality, or transformation (before/after, old/new, problem/solution); content that benefits from simultaneous comparison; a hero concept where text and visual must occupy equal conceptual weight without one subordinating the other.
Avoid when: one side of the split would be empty or padded to fill space (split-screen demands equally strong content on both halves); the content is sequential rather than parallel (a narrative that flows from left to right is better served by a single column); mobile viewports would stack the halves into a layout indistinguishable from a standard section.
Cross-aesthetic applications: A craft-oriented, handmade brand can use split-screen when the brief describes "process" — one half shows the finished product, the other shows the making of it, and the vertical divider becomes the conceptual boundary between raw material and finished object. A data-driven, analytical brand can use split-screen with independent scroll when the brief compares two datasets or time periods — each half scrolls its own content, turning the viewport into a live comparison tool.
Implementation threshold: The dividing line must be a deliberate design element — visible, potentially animated, or acting as a reveal mechanic. If the split is just two columns that happen to touch at the centre, the technique is indistinguishable from a standard two-column layout.

## Longevity Signal
Mature — still valid, not a differentiator. Execution quality is what separates premium from generic.
