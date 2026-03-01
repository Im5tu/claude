# Trend: Overlapping Sections

## What It Is
Content from one section extends visually into the next, creating a layered z-depth effect. Techniques: negative margin-bottom on the outgoing section (`-mb-16`), absolute positioning of a transition element, or sticky offset where the new section slides over the previous one. Pairs well with scroll-linked entrance animations. Creates a sense of continuous composition rather than modular sections stacked in sequence.

## Implementation
```css
/* Negative margin overlap */
.section-with-overlap {
  position: relative;
  z-index: 2;
  margin-bottom: -4rem;
}

.section-beneath {
  position: relative;
  z-index: 1;
  padding-top: 6rem; /* compensate for overlap */
}

/* Sticky slide-over */
.slide-over-section {
  position: sticky;
  top: 0;
  z-index: 2;
  background: var(--color-background);
}
```

## Premium Signals
- Overlapping sections where the overlap is thematically meaningful (e.g., a headline from the above section remains visible as the next section arrives)

## Anti-Execution Warnings
- **Overlapping sections without z-index management** — overlapping elements that inadvertently obscure interactive elements (CTAs, links) beneath them.

## Context Signals
Use when the brief signals: a brand that values depth, layering, or continuity over modularity; page designs where adjacent sections share a thematic relationship (a headline from one section should remain visible as the next section arrives); a desire for the page to feel like a single composition rather than stacked blocks.
Avoid when: the overlapping element would obscure interactive content (CTAs, links, form fields) in the section beneath; the design relies on clear section boundaries for navigation or anchor links; the sections being overlapped have no visual or thematic relationship — arbitrary overlap reads as a z-index bug.
Cross-aesthetic applications: A clean, product-focused brand can use overlapping sections when the brief describes "seamless" or "continuous experience" — a product image that bridges two sections (features above, specs below) creates visual continuity that reinforces the product as the unifying thread. A textured, atmospheric brand can use overlapping sections when the brief features layered backgrounds — a section with a warm gradient sliding over a photography section creates physical depth, as if the page has material weight.
Implementation threshold: The overlap must be thematically meaningful — the element that extends into the next section should connect the two sections conceptually. Negative margin applied purely for visual interest, with no relationship between the overlapping content and what it overlaps, reads as a layout error.

## Longevity Signal
Ascending — underused relative to impact. Strong bet for depth and sophistication.
