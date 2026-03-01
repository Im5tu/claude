# Trend: Scroll-Snapping Sections

## What It Is
Full-viewport-height sections with `scroll-snap-type: y mandatory` on the container and `scroll-snap-align: start` on each section. Creates a mobile app-like navigation rhythm on desktop. Used for: product feature showcases (one feature per snap section), storytelling sequences (narrative unfolds section by section), and portfolio project showcases. Activation criteria: use scroll-snap only when each section demands full attention and should not be partially visible. `scroll-snap-type: y proximity` is a softer variant that snaps only when the scroll stops near a snap point — better for mixed-height pages. Anti-use-case: informational content, pricing, FAQ — anything the user needs to scan rather than experience.

## Implementation
```css
.snap-container {
  scroll-snap-type: y mandatory;
  overflow-y: scroll;
  height: 100vh;
}

.snap-section {
  scroll-snap-align: start;
  height: 100vh;
}

/* Softer variant */
.snap-container-soft {
  scroll-snap-type: y proximity;
}
```

## Premium Signals
- Scroll-snap restricted to sections where focused attention is genuinely the right UX (not applied site-wide)

## Anti-Execution Warnings
- **Scroll-snap on every section** — when an entire site is scroll-snapped, users cannot read long content sections, scroll past a section they want to revisit, or consume content at their own pace. Scroll-snap must be scoped to a specific route or section.

## Context Signals
Use when the brief signals: a feature showcase where each feature deserves isolated, focused attention; a narrative that unfolds in discrete stages (not a continuous scroll); the content can be divided into self-contained viewport-height units without padding or stretching.
Avoid when: sections vary significantly in content length (forcing short content into full-viewport sections creates awkward whitespace); the page contains scannable content (pricing, FAQ, comparison tables) where free scrolling is essential; the brief describes "flow" or "continuity."
Cross-aesthetic applications: A precision-oriented technology brand can use mandatory scroll-snap on a feature showcase when the brief describes "one concept at a time." A narrative editorial brand can use proximity scroll-snap (`scroll-snap-type: y proximity`) when the brief describes a "chapter-by-chapter" reading experience.
Implementation threshold: `scroll-snap-type: y mandatory` scoped to a specific section container, never the full page. Each snap section must justify full viewport height with its content. Mandatory snap for focused showcases; proximity snap for mixed-height content.

## Longevity Signal
Ascending — underused on marketing sites (more common in portfolio/creative). Adds a product-like precision to feature showcases.
