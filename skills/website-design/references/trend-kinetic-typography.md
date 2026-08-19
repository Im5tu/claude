# Trend: Kinetic Typography

## What It Is
Type that moves in response to scroll or time. The dominant pattern is the TextReveal: words or lines clipped inside an overflow-hidden container, animating from `translate: 0 100%` to `translate: 0 0` on entrance. Scroll-linked variants map `font-size` or `letter-spacing` to scroll progress via `animation-timeline: scroll()` (and `@property` to make the value interpolatable). Character-by-character reveals are high-impact for short hero phrases. Kinetic type's purpose is to sequence information delivery — fast reveals for punchy claims, slower reveals for emotional weight.

## Implementation

Use the shared `TextReveal.astro` primitive from `core-animation.md` — it handles word/char splitting at build time and drives per-part `animation-delay: calc(var(--i) * stagger)` via `animation-timeline: view()`. Pure CSS, zero JS.

Scroll-linked axis changes:

```css
.kinetic-headline {
  font-variation-settings: 'wght' 400;
  animation: kin-weight linear both;
  animation-timeline: view();
  animation-range: entry 0% cover 50%;
}
@property --wght { syntax: "<number>"; inherits: true; initial-value: 400; }
@keyframes kin-weight {
  to { font-variation-settings: 'wght' 900; }
}
@media (prefers-reduced-motion: reduce) {
  .kinetic-headline { animation: none; }
}
```

## Premium Signals
- Kinetic reveals that match information architecture — the most important claim arrives last, with emphasis, not first
- Variable font weight changes that correlate to brand tone (a wellness brand eases gently; a fintech brand snaps assertively)

## Anti-Execution Warnings
- **Every headline uses the same word-by-word reveal** — kinetic type must be earned by semantic importance. Subheadings and captions should not animate identically to hero headlines.

## Context Signals
Use when the brief signals: a brand voice described as "confident," "dramatic," or "storytelling-driven"; hero content built around a single claim or manifesto; a desire to control the sequence in which the visitor absorbs information (narrative pacing over scanability).
Avoid when: the page has dense informational content where animation would slow comprehension; the brand persona emphasises speed, efficiency, or utility above personality; the site must function well under reduced-motion preferences with no acceptable fallback.
Cross-aesthetic applications: A quietly authoritative, institutional brand can use kinetic typography when the brief describes a flagship annual report or a single defining statement — slow, line-by-line reveals add gravitas to a message that earns the delay. A playful, handcrafted brand can use character-by-character reveals when the brief describes "a feeling of something being made in front of you" — the motion becomes a craft gesture, not a tech flourish. A product-focused, technology brand can use kinetic type on a key proof statement or single metric when the brief describes "the number that changes everything" — a counter-style or word-by-word reveal that builds to a definitive figure treats data as drama, not decoration.
Implementation threshold: The reveal timing must match the semantic weight of the content — the most important phrase arrives last with emphasis, not first. Kinetic type applied uniformly to every heading on a page is decoration, not design.

## Longevity Signal
Mature — standard practice on premium sites. Quality of execution is the differentiator, not the presence of the technique.
