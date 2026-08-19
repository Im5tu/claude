# Trend: Entrance Choreography

## What It Is
The sequenced order of element arrivals in a section or hero. The canonical premium hero sequence: badge/label → headline (line 1) → headline (line 2) → subline → primary CTA → secondary CTA → visual element. Sibling stagger 80ms; group stagger (headline block → CTA block) 120–160ms; entrance values: `translate: 0 24px → 0 0` with `opacity: 0 → 1`; easing: `cubic-bezier(0.2, 0.8, 0.2, 1)`. The stagger values are not arbitrary — 80ms between siblings feels like a person reading down the page; 200ms feels like individual animations playing independently.

## Implementation

Pure CSS. Assign each element a `--i` and drive `animation-delay: calc(var(--i) * 80ms)`:

```astro
<section class="hero">
  <p class="h-el" style="--i: 0;">Badge</p>
  <h1 class="h-el" style="--i: 1;">Headline line 1</h1>
  <h1 class="h-el" style="--i: 2;">Headline line 2</h1>
  <p class="h-el" style="--i: 3;">Subline</p>
  <a class="h-el" style="--i: 4;">Primary CTA</a>
  <a class="h-el" style="--i: 5;">Secondary CTA</a>
</section>

<style>
  .h-el {
    opacity: 0;
    translate: 0 24px;
    animation: h-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i, 0) * 80ms);
  }
  @keyframes h-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .h-el { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

For below-fold sections, swap to `animation-timeline: view()` so the choreography fires on viewport entry rather than page load.

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
