# Trend: Cinematic Scroll Sequences

## What It Is
A viewport-pinned section where multiple visual layers animate at different rates along a single scroll timeline, creating the sensation of a camera moving through a scene rather than content being swapped. The viewport locks in place (GSAP `pin: true`) while the user's scroll drives a multi-layer parallax animation — background elements move at 0.3x scroll rate, midground at 0.6x, foreground at 1x. Content appears and disappears within the pinned viewport as though the user is panning through a physical environment.

Each "scene" within the pinned section can contain its own micro-choreography: text appearing and disappearing, images sliding into position and scaling, background colours transitioning, and decorative elements drifting. The entire composition is mapped to scroll progress, so the user controls the pacing. The premium feel comes from the physical sensation of depth — layers at different Z-positions moving at different speeds, creating the parallax that the human visual system interprets as three-dimensional space. Scene transitions should feel like camera moves — a slow cross-dissolve (opacity) or a lateral pan (translateX) — not like DOM elements being swapped.

## Implementation
```js
const tl = gsap.timeline({
  scrollTrigger: {
    trigger: '.cinematic-section',
    start: 'top top',
    end: '+=3000',      // 3000px of scroll distance for the pinned sequence
    pin: true,
    scrub: 1.5,         // 1.5s smoothing for a dreamier feel (1 for precise)
  }
});

// Scene 1: background drifts, midground rises, first text enters
tl.to('.bg-layer', { y: -200, scale: 1.1, duration: 3 }, 0);
tl.to('.mid-layer', { y: -80, opacity: 1, duration: 3 }, 0);
tl.fromTo('.fg-text-1', { opacity: 0, y: 60 }, { opacity: 1, y: 0, duration: 1 }, 0.3);

// Scene 2: first text exits, second text enters, colour shifts
tl.to('.fg-text-1', { opacity: 0, y: -40, duration: 0.8 }, 0.55);
tl.fromTo('.fg-text-2', { opacity: 0, y: 60 }, { opacity: 1, y: 0, duration: 1 }, 0.6);
tl.to('.bg-layer', { backgroundColor: '#1a1a2e', duration: 1.5 }, 0.5);

// Scene 3: final reveal — CTA and closing visual
tl.to('.fg-text-2', { opacity: 0, y: -40, duration: 0.8 }, 0.85);
tl.fromTo('.cta-element', { opacity: 0, scale: 0.9 }, { opacity: 1, scale: 1, duration: 0.8 }, 0.9);
```

Scrub calibration: `scrub: 1` gives precise, responsive control where the animation tracks the scroll tightly — best for informational sequences where the user needs agency. `scrub: 1.5–2` creates a smoother, dreamier feel where the animation lags slightly behind the scroll — better for atmospheric, mood-driven sequences. `scrub: 0.5` or below feels twitchy for cinematic work. The `end` value (scroll distance) determines pacing: `+=2000` for a quick 2-scene sequence, `+=3000–4000` for a 3–5 scene narrative. Always use GPU-only properties (`transform`, `opacity`) — never scrub `left`, `top`, `width`, or `height` as these cause layout reflow on every scroll frame.

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
Ascending — still a strong differentiator due to implementation complexity. Most sites use basic scroll-triggered entrances rather than full pinned sequences. The gap between "uses ScrollTrigger" and "uses ScrollTrigger with multi-layer cinematic pacing" is where the premium signal lives.
