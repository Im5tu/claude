# Trend: Floating / Drifting Parallax Hero Elements

## What It Is
Multiple absolutely-positioned decorative elements within a hero, each responding to cursor movement at different speeds to create a layered depth illusion. Each floating element gets a per-layer `depth` value (e.g. 20, 40, 60, 80) — varied depth is what manufactures the three-dimensional illusion; uniform depth collapses to a flat wobble. Independently, each element carries a slow idle drift on a 6–8 second CSS cycle with staggered `animation-delay`. On touch devices, cursor parallax becomes scroll-driven via `animation-timeline: scroll(root)`.

## Implementation

Idle drift is pure CSS. Cursor parallax requires a tiny **SolidJS island** (there's no native cursor-timeline yet).

```astro
<!-- src/components/sections/FloatingParallaxHero.astro -->
<section class="fph">
  <div class="fph__shape" style="--d: 20;"></div>
  <div class="fph__shape" style="--d: 40;"></div>
  <div class="fph__shape" style="--d: 60;"></div>
  <div class="fph__shape" style="--d: 80;"></div>
  <slot />
</section>

<style>
  .fph { position: relative; overflow: hidden; }
  .fph__shape {
    position: absolute;
    --mx: 0; --my: 0;
    translate: calc(var(--mx, 0) * var(--d) * 1px) calc(var(--my, 0) * var(--d) * 1px);
    transition: translate 500ms cubic-bezier(0.2, 0.8, 0.2, 1);
    animation: fph-drift 7s ease-in-out infinite;
  }
  .fph__shape:nth-child(2) { animation-delay: -2s; }
  .fph__shape:nth-child(3) { animation-delay: -4s; }
  .fph__shape:nth-child(4) { animation-delay: -6s; }
  @keyframes fph-drift {
    50% { translate: calc(var(--mx, 0) * var(--d) * 1px) calc(var(--my, 0) * var(--d) * 1px + -20px); }
  }
  @media (prefers-reduced-motion: reduce) {
    .fph__shape { animation: none; transition: none; translate: 0 0; }
  }
</style>
```

In a lightweight Solid island (`client:visible`), attach a single `mousemove` to the section and mutate `--mx` / `--my` CSS vars on each shape. No GSAP needed — CSS transitions smooth the interpolation.

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
