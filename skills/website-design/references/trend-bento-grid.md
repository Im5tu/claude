# Trend: Bento Grids

## What It Is
Mixed-size card grids popularised by Apple product pages and widely adopted as a features/highlights layout. Cards occupy 1-unit, 2-unit wide, or 2-unit tall slots in a defined grid. The rhythm of alternating cell sizes creates visual interest across the section. In practice: `grid-template-columns: repeat(3, 1fr)` with individual cards using `col-span-2` or `row-span-2`. Strong bento grids have meaningful variation in cell content — one cell has a large visual, another has a stat, another has a short quote. Weak bento grids are just cards arranged in an irregular pattern.

## Implementation
```css
.bento-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1rem;
}

.bento-grid .feature-card {
  /* Default: 1x1 */
}

.bento-grid .feature-card.wide {
  grid-column: span 2;
}

.bento-grid .feature-card.tall {
  grid-row: span 2;
}
```

## Premium Signals
- Bento grids with intentional weight variation: one cell is a large visual, one is a single data point, one is a short testimonial — not all cells the same content type

## Anti-Execution Warnings
- **Bento grids where all cells share the same height** — this produces a grid, not a bento. Row-span variation is mandatory.
- **Bento grids with text-only cells** — every cell needs a distinct visual register (icon, illustration, number, image, or colour block). All-text bento is just a feature list in a fancy grid.

## Context Signals
Use when the brief signals: multiple distinct content types that need to coexist in a single section (stats, testimonials, visuals, features); a product or service with varied proof points that are best scanned rather than read sequentially; a desire for visual rhythm and density without clutter.
Avoid when: all grid cells contain the same content type (all text cards, all icons with labels) — this produces a feature list in a fancy container, not a bento grid; the content count is fewer than 4 items (insufficient variation to justify the format); the cells would need to be uniform height to accommodate the content, eliminating the row-span variation that defines bento.
Cross-aesthetic applications: A serious, trust-focused brand can use bento grids when the brief describes "evidence" or "proof" — mixing a large client logo, a specific metric, a short quote, and a case study thumbnail in a single bento section communicates breadth of credibility without the repetitive feel of a testimonial carousel. A brand whose brief features rich, varied evidence from multiple angles — product photography, a key metric, a short testimonial — can use bento grids to create the feeling of a curated gallery rather than a product catalogue, regardless of the ambient mood of the design.
Implementation threshold: At least one cell must span two columns or two rows. At least two cells must contain different content types (image vs stat vs quote vs icon). If every cell is 1x1 with the same content structure, the technique adds complexity without visual payoff.

## Longevity Signal
Sustained — confirmed strong in 2026; the grid format itself is no longer a differentiator, but differentiation is now in content variety per cell and motion sophistication within cells. Use only when content genuinely supports the format.

## Bento Evolution: Scroll-Driven Card Navigation

An emerging evolution of bento grid: Tinder-style card shuffle on scroll. Rather than a static grid, cards slide into view sequentially as the user scrolls — each card occupies the same position but layers over the previous one. This transforms bento from a static layout into a scroll-driven reveal sequence, maintaining the mixed-content-type logic while adding temporal pacing.

**Implementation:**
```js
// Scroll-driven card stack (each card stacks over previous)
import { ScrollTrigger } from "gsap/ScrollTrigger";

const cards = document.querySelectorAll(".bento-scroll-card");

cards.forEach((card, i) => {
  ScrollTrigger.create({
    trigger: card,
    start: "top 80%",
    onEnter: () => gsap.fromTo(card,
      { x: "100%", opacity: 0 },
      { x: 0, opacity: 1, duration: 0.5, ease: "power3.out" }
    ),
  });
});
```

Context: Use when the bento content has a natural reveal order — one insight leads to the next — and static simultaneous display reduces the impact of each item. Avoid when the content benefits from simultaneous comparison (all proof points visible at once) rather than sequential revelation.
