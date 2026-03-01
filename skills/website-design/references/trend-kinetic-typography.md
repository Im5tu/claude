# Trend: Kinetic Typography

## What It Is
Type that moves in response to scroll or time. The dominant pattern is the TextReveal: words or lines clipped inside an overflow-hidden container, animating from `y: 100%` to `y: 0` on entrance. GSAP implementation: wrap each line in a clip container, use `gsap.from('.line', { yPercent: 100, stagger: 0.08, ease: 'power3.out' })`. Scroll-linked variants map font-size or letter-spacing to scroll progress via `ScrollTrigger` with `scrub: 1`. Character-by-character reveals are high-impact for short hero phrases. Kinetic type's purpose is to sequence information delivery — fast reveals for punchy claims, slower reveals for emotional weight.

## Implementation
```js
// Line-by-line text reveal
gsap.from('.line', {
  yPercent: 100,
  stagger: 0.08,
  ease: 'power3.out',
  duration: 0.8,
  scrollTrigger: {
    trigger: '.headline-container',
    start: 'top 80%',
  }
});

// Character-by-character reveal for short phrases
gsap.from('.char', {
  yPercent: 100,
  stagger: 0.02,
  ease: 'power3.out',
  duration: 0.6,
});
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
