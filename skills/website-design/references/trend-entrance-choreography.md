# Trend: Entrance Choreography

## What It Is
The sequenced order of element arrivals in a section or hero. The canonical premium hero sequence: badge/label -> headline (line 1) -> headline (line 2) -> subline -> primary CTA -> secondary CTA -> visual element. GSAP timeline: stagger between sibling elements 80ms; stagger between groups (headline block -> CTA block) 120–160ms; entrance values: `y: 24` to `y: 0` with `opacity: 0` to `opacity: 1`; easing: `power3.out`. The stagger values are not arbitrary — 80ms between siblings feels like a person reading down the page. 200ms between siblings feels like individual animations playing independently. Choreography's purpose: reveal the information hierarchy through sequence, not just through size and weight.

## Implementation
```js
const tl = gsap.timeline();
tl.from('.badge', { y: 24, opacity: 0, duration: 0.6, ease: 'power3.out' })
  .from('.headline-line-1', { y: 24, opacity: 0, duration: 0.6, ease: 'power3.out' }, '-=0.52')
  .from('.headline-line-2', { y: 24, opacity: 0, duration: 0.6, ease: 'power3.out' }, '-=0.52')
  .from('.subline', { y: 24, opacity: 0, duration: 0.6, ease: 'power3.out' }, '-=0.44')
  .from('.cta-primary', { y: 24, opacity: 0, duration: 0.6, ease: 'power3.out' }, '-=0.44')
  .from('.cta-secondary', { y: 24, opacity: 0, duration: 0.6, ease: 'power3.out' }, '-=0.52');
```

## Premium Signals
- Entrance choreography where the sequence reveals the argument — the most important claim enters last within a group, not first

## Anti-Execution Warnings
- **Uniform stagger on all section entrances** — when every section uses identical 80ms stagger with identical y:24 entrance, the animation becomes wallpaper. Hero entrance should be the most elaborate; subsequent sections should simplify.

## Context Signals
Use when the brief signals: a brand that values hierarchy and intentional communication; content-rich sections where the order of element arrival reinforces the argument (claim -> evidence -> CTA); a hero section with more than three distinct content elements.
Avoid when: sections contain only one or two elements (choreography on a single headline is just a delayed fade-in); the brief describes the brand as "direct" or "no-frills" with an expectation of immediate content visibility.
Cross-aesthetic applications: A minimal editorial brand can use entrance choreography on a single hero sequence when the brief describes "the weight of the first sentence" — the slow, deliberate reveal of one headline becomes the entire motion vocabulary. A bold, energetic brand can use rapid-fire stagger (40ms siblings) when the brief describes "impact" and "urgency."
Implementation threshold: sibling stagger 80ms, group stagger 120–160ms. Hero entrance is the most elaborate; subsequent sections progressively simplify. The most important claim in a group enters last, not first.

## Longevity Signal
Mature — expected. The differentiator is calibration quality (stagger timing, easing choice, entrance values).
