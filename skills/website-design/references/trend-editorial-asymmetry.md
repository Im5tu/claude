# Trend: Asymmetric Grids

## What It Is
Abandoning equal-width column splits in favour of deliberate imbalance. Common splits: 7/5, 5/7, 3/9, 8/4. One side holds the primary content (headline + CTA), the other holds a visual that bleeds to the viewport edge. The tension between the unequal halves creates visual energy that symmetrical layouts cannot. In CSS Grid: `grid-template-columns: 7fr 5fr` or `grid-cols-[7fr_5fr]` in Tailwind. The content-heavy side is NOT always the left — reversing this expectation is a premium signal.

## Implementation
```css
.asymmetric-grid {
  display: grid;
  grid-template-columns: 7fr 5fr;
  gap: 2rem;
}

/* Alternate: dominant visual on right */
.asymmetric-grid.reversed {
  grid-template-columns: 5fr 7fr;
}

/* Strong asymmetry */
.asymmetric-grid.dramatic {
  grid-template-columns: 3fr 9fr;
}
```

## Premium Signals
- Asymmetric grids where the wider column is chosen based on which content deserves dominance, not convention

## Anti-Execution Warnings
- **Asymmetric grids that are just two columns with slightly different widths** — a 6/6 split recoloured as 6.5/5.5 does not create tension. The imbalance must be felt.

## Context Signals
Use when the brief signals: a clear content hierarchy where one element (headline, image, product) must dominate its counterpart; a brand personality described as "dynamic," "confident," or "unconventional"; layouts where equal column splits would flatten the visual energy of the content.
Avoid when: the content is genuinely symmetrical (two equal options, A/B comparison, dual-brand partnership) and forcing asymmetry would misrepresent the relationship; the page is data-dense and users need to scan both columns with equal attention; the CMS allows editors to swap content between columns without understanding the dominance logic.
Cross-aesthetic applications: A quiet, restrained brand can use asymmetric grids when the brief describes "considered imbalance" or "editorial composition" — a 3/9 split with a single word on the narrow side and a full-bleed photograph on the wide side communicates restraint through spatial contrast, not visual loudness. A warm, approachable brand can use asymmetric grids when the brief features storytelling — the wider column holds the narrative while the narrower column holds a supporting image, creating the visual rhythm of a picture book.
Implementation threshold: The asymmetry must be felt — a 6.5/5.5 split reads as broken symmetry, not intentional imbalance. Minimum split is 7/5; the premium range is 3/9 or 8/4 where the dominance relationship is unmistakable.

## Longevity Signal
Ascending — becoming the expected baseline for premium. Still a differentiator against template sites.
