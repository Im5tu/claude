# Trend: Micro-Animation on Interaction

## What It Is
Hover, focus, and active states that provide immediate physical feedback. Standard values: `scale(1.02)` on hover for cards and large elements, `scale(0.98)` on active/mousedown (simulates physical depression), `translateY(-2px)` on button hover. CSS transition timing: `150ms ease` for hover in, `100ms ease` for hover out (faster out feels more responsive). GSAP for complex states (color + scale + shadow simultaneously). The physicality of micro-interaction is what separates interaction design from styling — elements should feel touchable.

## Implementation
```css
.interactive-card {
  transition: transform 150ms ease;
}

.interactive-card:hover {
  transform: scale(1.02);
}

.interactive-card:active {
  transform: scale(0.98);
  transition-duration: 100ms;
}

.button:hover {
  transform: translateY(-2px);
  transition: transform 150ms ease;
}
```

## Premium Signals
- Micro-animations that use both scale-up on hover AND scale-down on active, creating a complete physical feedback model

## Anti-Execution Warnings
- **Elaborate hover animations on every card** — if every card on a page does a 3-property hover transformation, the page reads as chaotic. Apply elaborate hover states to 1–2 featured items; use simple scale on the rest.

## Context Signals
Use when the brief signals: any interactive element where physical feedback improves usability; a brand that values tactility or craftsmanship; product-like precision in a marketing site (the site should feel as polished as the product itself).
Avoid when: interactions are infrequent enough that animation draws disproportionate attention; the brief explicitly requests a static, print-inspired aesthetic where motion would undermine the design language.
Cross-aesthetic applications: A luxury brand can use slow, restrained micro-animations (200ms ease with minimal scale) when the brief describes "quiet confidence" — the subtlety of the response becomes the premium signal. A playful, personality-forward brand can use exaggerated spring physics on buttons when the brief describes the product as "fun" or "delightful."
Implementation threshold: `scale(1.02)` on hover, `scale(0.98)` on active (the complete physical model). Hover in 150ms, hover out 100ms. Elaborate hover states on 1–2 featured elements; simple scale on the rest.

## Longevity Signal
Ascending — the physical feedback model (up on hover, down on press) is still not universally implemented. Strong accessibility signal when done correctly.
