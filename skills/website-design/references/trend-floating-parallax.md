# Trend: Floating / Drifting Parallax Hero Elements

## What It Is
Multiple absolutely-positioned decorative elements within a hero section, each responding to cursor movement at different speeds to create a layered depth illusion. The hero container listens for `mousemove` events and computes normalised coordinates: `(mouseX - centerX) / width` and `(mouseY - centerY) / height`, yielding values from -0.5 to +0.5. Each floating element receives `gsap.to(element, { x: normalizedX * depth, y: normalizedY * depth, duration: 0.5, ease: 'power2.out' })` where `depth` varies per layer — 20 for the furthest elements, 40 and 60 for mid-layers, 80 for the closest. The variation in depth values is what manufactures the perception of three-dimensional space; uniform depth collapses the effect into a flat wobble. Independently, each element carries a CSS idle drift: `@keyframes float { 0%, 100% { transform: translateY(0) } 50% { transform: translateY(-20px) } }` on a 6–8 second cycle, with per-element `animation-delay` values so the drift feels asynchronous and organic rather than synchronised. On mobile, cursor parallax is replaced with scroll-driven parallax (`gsap.to(element, { y: scrollOffset * depthFactor })`) since touch devices have no persistent cursor position.

## Implementation
```js
// Cursor-driven parallax
const hero = document.querySelector('.hero');
const layers = document.querySelectorAll('.float-element');
const depths = [20, 40, 60, 80];

hero.addEventListener('mousemove', (e) => {
  const rect = hero.getBoundingClientRect();
  const normalizedX = (e.clientX - rect.left) / rect.width - 0.5;
  const normalizedY = (e.clientY - rect.top) / rect.height - 0.5;

  layers.forEach((layer, i) => {
    gsap.to(layer, {
      x: normalizedX * depths[i],
      y: normalizedY * depths[i],
      duration: 0.5,
      ease: 'power2.out'
    });
  });
});
```

```css
/* Idle drift animation */
@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-20px); }
}

.float-element {
  animation: float 7s ease-in-out infinite;
}

.float-element:nth-child(2) { animation-delay: -2s; }
.float-element:nth-child(3) { animation-delay: -4s; }
.float-element:nth-child(4) { animation-delay: -6s; }
```

## Premium Signals
- Floating parallax elements with genuinely varied depth values (20, 40, 60, 80) — not uniform translation distances
- Floating elements visually distributed at different z-depths: distant elements carry slight blur and reduced scale, near elements are crisp and larger
- Hero content (headline, CTA) never participates in the parallax — only decorative and atmospheric elements float
- Maximum cursor-driven translation capped at 80px for the closest layer; beyond this, elements escape their intended positions
- Drift animation and cursor response feel independent — they layer on top of each other without conflict or cancellation

## Anti-Execution Warnings
- **All floating elements moving at the same rate** — destroys the depth illusion entirely. The whole hero just feels wobbly, not spatial.
- **Floating elements that overlap or obscure the headline or primary CTA** — decorative depth must never compete with the content it supports.
- **Translation distances exceeding 150px** — decorative elements escape their designed positions and break the layout's spatial logic.
- **No mobile fallback for cursor parallax** — cursor-driven translation does nothing on touch devices. Without a scroll-driven alternative, the hero is static on mobile.
- **Floating parallax applied to non-hero sections** — the effect needs a contained space with clear boundaries. Applied to mid-page content sections, the floating elements lack spatial anchoring.

## Context Signals
Use when the brief signals: a hero section that needs to communicate depth, dimensionality, or a sense of space; atmospheric or abstract brand language ("floating," "layered," "expansive," "above the noise"); decorative visual elements (shapes, icons, textures) that are part of the brand vocabulary but not the primary content.
Avoid when: the hero content is dense and text-heavy (floating elements will compete with readability); the brand personality is grounded, direct, or no-nonsense; the business has no visual assets or brand shapes to float — generic circles and squares will read as template decoration.
Cross-aesthetic applications: A clean technology brand can use floating geometric elements at low depth values (20–40px) when the brief describes "precision in space" — the subtle movement reinforces engineered exactness without theatrical depth. A warm, handcrafted brand can use floating organic shapes (leaves, brushstrokes, texture swatches) when the brief describes "natural movement" or "living materials."
Implementation threshold: depth values genuinely varied across layers (20, 40, 60, 80). Hero content (headline, CTA) does NOT participate — only decorative elements float. Maximum cursor-driven translation: 80px for the closest layer. Mobile provides a scroll-driven fallback, not a disabled state.

## Longevity Signal
Ascending — increasingly common on creative and brand-forward sites. The differentiator is depth variation quality and mobile fallback implementation.
