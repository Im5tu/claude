# Trend: Edge-to-Edge / Container-Less Sections

## What It Is
Most sites maintain a max-width container (typically 1280px or 1440px). Premium layouts deliberately break this constraint at specific moments: a hero image that fills 100vw, a marquee that runs wall-to-wall, a colour band section that uses the full viewport width. The contrast between contained sections and edge-to-edge moments creates visual hierarchy across the page.

## Implementation
```css
/* Standard contained section */
.container {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 1.5rem;
}

/* Edge-to-edge break */
.full-width {
  width: 100vw;
  margin-left: calc(-50vw + 50%);
}

/* Or simply break out of container */
.edge-to-edge {
  max-width: none;
  margin: 0;
  padding: 0;
}
```

## Premium Signals
- A single well-placed edge-to-edge break that makes the rest of the contained layout feel more intentional

## Anti-Execution Warnings
- **Edge-to-edge used everywhere** — the power of breaking the container is lost if every section does it.

## Context Signals
Use when the brief signals: a moment in the page that must feel expansive, immersive, or boundary-breaking (a hero image, a brand statement, a full-width marquee); a brand personality that benefits from contrast between contained precision and expansive release; photography or video content that loses impact when constrained to a 1280px container.
Avoid when: every section would go edge-to-edge (the technique's power depends on contrast with contained sections — if everything is full-width, nothing is); the content within the full-width section is text-heavy and would become uncomfortably wide without its own internal container; the site uses a strong sidebar or persistent navigation that conflicts with full-viewport elements.
Cross-aesthetic applications: A minimal, restrained brand can use a single edge-to-edge section when the brief describes "a moment of release" or "breathing room" — one full-bleed photograph amid tightly contained text sections creates a visual exhale that makes the surrounding restraint feel more intentional. A bold, statement-driven brand can use edge-to-edge for a scrolling text marquee when the brief describes "energy" or "motion" — the wall-to-wall text feels unstoppable, reinforcing the brand's confidence.
Implementation threshold: Edge-to-edge must be used at most 2–3 times per page. The contrast between contained and full-width sections IS the design move — a page where every section breaks the container has no container to break.

## Longevity Signal
Mature — expected on premium sites. Absence is more noticeable than presence.
