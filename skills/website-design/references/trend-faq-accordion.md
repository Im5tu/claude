# Trend: FAQ Accordion with Animation

## What It Is
FAQ items using CSS `grid-template-rows: 0fr -> 1fr` transition for smooth height animation — the most performant height transition technique (avoids `height: auto` jank). Implementation: `transition: grid-template-rows 300ms ease`. Inner content has `overflow: hidden` and `min-height: 0`. The open/close indicator (chevron or plus/minus) rotates via `transform: rotate(45deg)` on open using `transition: transform 200ms ease`. Premium signal: the indicator is a custom brand-consistent SVG, not a generic Heroicons chevron. The question text itself uses a weight change on open: regular weight closed, medium weight open — a subtle signal that the item is the active focus.

## Implementation
```css
.faq-item .answer-wrapper {
  display: grid;
  grid-template-rows: 0fr;
  transition: grid-template-rows 300ms ease;
}

.faq-item.open .answer-wrapper {
  grid-template-rows: 1fr;
}

.faq-item .answer-content {
  overflow: hidden;
  min-height: 0;
}

.faq-item .indicator {
  transition: transform 200ms ease;
}

.faq-item.open .indicator {
  transform: rotate(45deg);
}

/* Weight change on active question */
.faq-item .question {
  font-weight: 400;
  transition: font-weight 200ms ease;
}

.faq-item.open .question {
  font-weight: 500;
}
```

## Premium Signals
- FAQ accordion with a custom indicator icon that rotates, plus a question weight change on open

## Anti-Execution Warnings
- **FAQ accordion with instant height change** — `display: none -> block` with no animation is one of the most recognisable template-quality signals. The grid-rows transition is 8 lines of CSS; there is no excuse to omit it.

## Context Signals
Use when the brief signals: a set of questions that visitors commonly ask (genuine FAQs, not marketing copy disguised as questions); enough questions (5+) to justify the accordion pattern; content where scanning question titles is the primary interaction mode.
Avoid when: there are fewer than 4 questions (a short list reads better as static text); the "questions" are actually feature descriptions or sales arguments reframed as FAQ; the brief describes the content as "essential reading" where hiding answers behind clicks reduces comprehension.
Cross-aesthetic applications: A traditionally authoritative brand can use a minimal accordion with weight-change indicators (regular to medium on open) and no decorative elements when the brief describes "clarity" and "directness." A bold, expressive brand can use a custom animated SVG indicator and colour-shift on the active item when the brief describes "personality in every detail."
Implementation threshold: `grid-template-rows: 0fr -> 1fr` transition for smooth height animation. Custom indicator icon that rotates on open. Question text weight changes on active state (regular -> medium). No instant `display: none -> block` — this is one of the most recognisable template signals.

## Longevity Signal
Mature — the animation is now expected. Absence (instant show/hide) is a visible quality regression.
