# Trend: Ambient Background Animation

## What It Is
Continuous, non-interactive motion in the background layer: gradient meshes that slowly rotate or breathe (`@keyframes` rotating a conic-gradient), SVG paths that drift with subtle transforms, noise textures that shift via CSS `background-position` animation. Implementation: `animation-duration: 12s–30s`, `animation-timing-function: ease-in-out`, `animation-iteration-count: infinite`, `animation-direction: alternate`. The opacity of the animation relative to the background must be calibrated to the point where it cannot be seen changing in real-time — only noticed when the page is viewed in motion vs static screenshot. If you can watch the gradient move, the opacity is too high.

## Implementation
```css
.ambient-gradient {
  animation: ambient-shift 20s ease-in-out infinite alternate;
}

@keyframes ambient-shift {
  0% { background-position: 0% 50%; }
  100% { background-position: 100% 50%; }
}
```

## Premium Signals
- Ambient animation invisible in isolation but missing when removed

## Anti-Execution Warnings
- **Ambient animation visible as motion** — if a user notices the background gradient rotating, it is competing with the content. Halve the opacity and double the duration.

## Context Signals
Use when the brief signals: a brand that wants to feel "alive" or "breathing" even when the user is not interacting; backgrounds complex enough to support motion (gradient meshes, noise textures, SVG patterns); language like "atmosphere," "mood," or "immersive environment."
Avoid when: the brand identity is rooted in stillness, restraint, or print-like precision; the background is a flat solid colour where animation would look like a rendering bug; the brief values content clarity above atmosphere.
Cross-aesthetic applications: A traditionally professional brand can use an almost imperceptible gradient shift (30s cycle, 3% opacity) when the brief describes the brand as "established but forward-looking" — the motion is felt rather than seen. A dark, luxurious brand can use slow-breathing gradient meshes when the brief describes "depth" or "layers."
Implementation threshold: animation cycle 12–30 seconds, `ease-in-out`, infinite alternate. If the motion is visible in real-time observation (rather than noticed only when comparing a static screenshot to a live view), the opacity is too high — halve it and double the duration.

## Longevity Signal
Evergreen — a stable, low-risk premium signal that adds life without risk of overuse.
