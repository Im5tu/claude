# Trend: Cinematic Scroll Sequences

## What It Is
A viewport-pinned section where multiple visual layers animate at different rates along a single scroll timeline, creating the sensation of a camera moving through a scene rather than content being swapped. The viewport locks in place (`position: sticky`) while the user's scroll drives a multi-layer parallax animation — background elements move at 0.3x scroll rate, midground at 0.6x, foreground at 1x. Content appears and disappears within the pinned viewport as though the user is panning through a physical environment.

Each "scene" within the pinned section can contain its own micro-choreography: text appearing and disappearing, images sliding into position and scaling, background colours transitioning, and decorative elements drifting. The entire composition is mapped to scroll progress, so the user controls the pacing. The premium feel comes from the physical sensation of depth — layers at different Z-positions moving at different speeds, creating the parallax that the human visual system interprets as three-dimensional space. Scene transitions should feel like camera moves — a slow cross-dissolve (opacity) or a lateral pan (translateX) — not like DOM elements being swapped.

## Implementation

Pure CSS. The section is pinned with `position: sticky`, and every scene layer animates via `animation-timeline: scroll()` scoped to the wrapper. Use `scroll-timeline-name` / `view-timeline-name` if you need scene-specific timelines.

```astro
<section class="cin-wrap">
  <div class="cin-pin">
    <div class="cin-bg"></div>
    <div class="cin-mid"></div>
    <h2 class="cin-text cin-text-1">Scene one</h2>
    <h2 class="cin-text cin-text-2">Scene two</h2>
    <a class="cin-cta">Final CTA</a>
  </div>
</section>

<style>
  .cin-wrap { height: 360vh; scroll-timeline-name: --cin; scroll-timeline-axis: block; }
  .cin-pin { position: sticky; top: 0; height: 100vh; overflow: hidden; }

  .cin-bg, .cin-mid, .cin-text, .cin-cta {
    animation-timeline: --cin;
    animation-timing-function: linear;
    animation-fill-mode: both;
  }
  .cin-bg  { animation-name: cin-bg; }
  .cin-mid { animation-name: cin-mid; }
  .cin-text-1 { animation-name: cin-text-1; }
  .cin-text-2 { animation-name: cin-text-2; }
  .cin-cta    { animation-name: cin-cta; }

  @keyframes cin-bg  { to { translate: 0 -200px; scale: 1.1; } }
  @keyframes cin-mid { to { translate: 0 -80px; opacity: 1; } }
  @keyframes cin-text-1 {
    0%, 10% { opacity: 0; translate: 0 60px; }
    20%, 50% { opacity: 1; translate: 0 0; }
    60%, 100% { opacity: 0; translate: 0 -40px; }
  }
  @keyframes cin-text-2 {
    0%, 55% { opacity: 0; translate: 0 60px; }
    65%, 85% { opacity: 1; translate: 0 0; }
    95%, 100% { opacity: 0; translate: 0 -40px; }
  }
  @keyframes cin-cta {
    0%, 85% { opacity: 0; scale: 0.9; }
    100%     { opacity: 1; scale: 1; }
  }

  @media (prefers-reduced-motion: reduce) {
    .cin-wrap { height: auto; }
    .cin-pin { position: static; height: auto; }
    .cin-bg, .cin-mid, .cin-text, .cin-cta { animation: none; }
  }
</style>
```

Pacing is calibrated via the wrapper's `height` (longer = slower scrub) and per-layer keyframe offsets. Only `transform` and `opacity` are animated — GPU-composited, zero layout reflow.

## Premium Signals
- Cinematic scroll sequences where layer speeds are calibrated to content depth — not uniform parallax values but values that reflect the narrative importance of each layer
- Scrub smoothing values calibrated to content type: `scrub: 1` for informational sequences (user wants control), `scrub: 1.5–2` for atmospheric sequences (user wants mood)
- Pin duration (`end: '+=Npx'`) calibrated to content density — longer pin for more scenes, shorter for punchier sequences
- Mobile gets a genuinely adapted experience, not a broken desktop version — cinematic sequences simplify to triggered entrances

## Anti-Execution Warnings
- **Cinematic sequences pinned for too long** — a pinned section that requires 5000px+ of scrolling without new content appearing creates the sensation that the page is broken or frozen. Pin duration should match content density: `+=2000–3000` for a 3-scene sequence, `+=3000–4000` for 5+ scenes. Test by scrolling yourself — if you get bored, the pin is too long.
- **Scrub: 0 on atmospheric sequences** — zero smoothing makes the animation snap instantly to scroll position, which reads as mechanical and twitchy. Reserve `scrub: 0` for video frame sync only; all other scroll-linked animations need `scrub: 0.8–2` for fluid feel.
- **No mobile fallback** — pinned scroll sequences frequently break on mobile Safari. Every scroll storytelling technique must have a tested mobile adaptation that preserves content accessibility without the scroll mechanic.
- **Scrubbing layout properties** — animating `left`, `top`, `width`, `height` via scrub causes layout reflow on every scroll frame. Only scrub GPU-composited properties: `transform` and `opacity`.

## Context Signals
Use when the brief signals: immersive storytelling, product origin stories, "take the user on a journey," brand narratives with temporal progression, content described with film/cinematic language ("scenes," "reveal," "unfold")
Avoid when: the content is transactional (e-commerce product pages, SaaS dashboards), the page needs to be scannable for quick information retrieval, the narrative does not have enough scenes to justify pinning (minimum 3 distinct visual states), or the audience is primarily mobile (pinned sequences on mobile can feel sluggish and frequently break on mobile Safari)
Cross-aesthetic applications: A clean SaaS brand can use this when the brief says "explain our complex process visually, step by step" — the pinned sequence becomes a product explainer, not a mood piece. A warm artisan brand can use this when the brief describes "the journey from raw material to finished product" — the scroll pace matches the brand's relationship with time and care. A minimal editorial brand can use this for a single flagship longform piece that deserves cinematic treatment — the restraint of one immersive moment within an otherwise static page amplifies its impact.
Implementation threshold: The sequence must contain at least 3 distinct visual states (scenes) with a genuine narrative arc — something is revealed, built toward, or resolved as you scroll through it. A section that just fades in some text while a background moves is not cinematic; it is a parallax section.

## Longevity Signal
Ascending — still a strong differentiator due to implementation complexity. Most sites use basic scroll-triggered entrances rather than full pinned sequences. The gap between "uses `animation-timeline: view()`" and "uses `animation-timeline: scroll()` with multi-layer cinematic pacing" is where the premium signal lives.
