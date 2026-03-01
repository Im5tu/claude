# Trend: Hyper Colors

## What It Is
Highly saturated, bold background colors used as the primary surface — not gradients, not accents, but flat saturated blocks as the page atmosphere. Multi-hue palettes (blues, yellows, greens, teals coexisting) applied section by section. Scroll-triggered background color shifts so each section feels uniquely branded. Video-on-hover carousels within hyper-color contexts. Approachability signal: makes "scary" industries (healthcare, finance, legal) feel friendlier and more accessible. Each section color switch is abrupt and intentional — a deliberate chapter break.

## Implementation
```js
// GSAP ScrollTrigger section-level color swap
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

const sections = document.querySelectorAll("[data-bg-color]");

sections.forEach((section) => {
  const color = section.getAttribute("data-bg-color");
  ScrollTrigger.create({
    trigger: section,
    start: "top 50%",
    onEnter: () => gsap.to("body", { backgroundColor: color, duration: 0.4, ease: "power2.out" }),
    onLeaveBack: () => {
      const prev = section.previousElementSibling?.getAttribute("data-bg-color") ?? "#ffffff";
      gsap.to("body", { backgroundColor: prev, duration: 0.4, ease: "power2.out" });
    },
  });
});
```
```css
/* Tailwind CSS custom property approach */
@layer utilities {
  .bg-hyper-1 { background-color: var(--hyper-color-1); }
  .bg-hyper-2 { background-color: var(--hyper-color-2); }
  .bg-hyper-3 { background-color: var(--hyper-color-3); }
}
/* Text must always be dark/black or clearly contrasting — WCAG AA */
.hyper-section { color: #0a0a0a; }
```

## Premium Signals
- Scroll-triggered background transitions where the color shift is pixel-perfect timed to section entry — not a cross-fade, but an instant swap that feels editorial
- Product UI or brand elements that adopt the section's color system — cohesion between surface and content
- Contrasting text that is typographically bold — the color does the atmosphere, the type does the authority

## Anti-Execution Warnings
- **Hyper color on both text AND background simultaneously** — saturated text on saturated background destroys legibility and reads as accidental. One element at maximum saturation, the other at near-black or white.
- **More than 4 distinct hues per page** — beyond four, the palette reads as random rather than bold. Define the palette upfront; every section draws from it.
- **Gradients substituted for flat saturated blocks** — gradient-background is a different technique. Hyper colors are flat, confident, and high-contrast. Gradients soften the effect and eliminate the chapter-break feel.
- **No contrast testing** — each background color must meet WCAG AA (4.5:1) against the text color used on it. Saturated mid-tones frequently fail. Always verify.

## Context Signals
Use when: the brief describes a brand that wants to feel "approachable," "energetic," "bold," or "human" in a category that tends toward visual austerity; the brand has 3+ distinct service areas or content categories that benefit from strong visual differentiation; the brief signals a consumer audience rather than a B2B enterprise buyer.
Avoid when: the brief uses words like "trusted," "established," "expert," "calm," or "refined" — hyper color conflicts with authority register; the brand's existing visual identity uses a highly controlled single-color palette that would be contradicted by section-level color switching.
Cross-aesthetic applications: A healthcare brand can use hyper colors when the brief explicitly describes overcoming "clinical coldness" as a differentiator — the color confidence signals humanity. A fintech startup can use hyper colors when the brief describes democratizing access to financial tools — the approachability signal counters institutional intimidation.
Implementation threshold: Define the full palette before building. Minimum 3, maximum 5 section colors. Each must meet WCAG AA contrast with a shared text color (near-black recommended). Scroll trigger timing must be precise — test on mobile where scroll inertia can cause double-triggers.

## Longevity Signal
Ascending — growing as a counter to muted, neutral SaaS aesthetics; most effective when committed to fully rather than used as an accent technique.
