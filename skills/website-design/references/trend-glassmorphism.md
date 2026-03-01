# Trend: Glassmorphism

## What It Is
`backdrop-filter: blur(12px–24px)` applied to semi-transparent surfaces (`background: rgba(255,255,255,0.08)` or `background: rgba(0,0,0,0.3)`), creating the illusion of frosted glass floating over a rich background. Requires a visually complex background (gradient mesh, photography, colour field) to produce the blur effect — glass over a flat solid background renders as a translucent box, not glass. Implementation: `backdrop-filter: blur(16px)`, `border: 1px solid rgba(255,255,255,0.15)`, subtle inner glow via `box-shadow: inset 0 1px 0 rgba(255,255,255,0.2)`. Use once per section maximum — the technique loses impact with repetition and creates accessibility concerns (contrast ratio falls below WCAG AA when overused).

## Implementation
```css
.glass-card {
  backdrop-filter: blur(16px);
  background: rgba(255, 255, 255, 0.08);
  border: 1px solid rgba(255, 255, 255, 0.15);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2);
}
```

## Premium Signals
- Glassmorphism used once per section, on a meaningful card (pricing, featured testimonial, hero callout), against a background complex enough to produce visible blur depth

## Anti-Execution Warnings
- **Multiple glass cards in a single section** — if every card on a pricing page is glass, the hierarchy collapses. One glass card surrounded by solid cards creates emphasis; all-glass creates sameness.
- **Glassmorphism over flat solid backgrounds** — the blur effect requires visual complexity behind it. Glass over `#FFFFFF` or `#000000` renders as a box with a border.
- **Glass cards with insufficient contrast on text** — `rgba(255,255,255,0.08)` background with white text fails WCAG AA below 24px. Test contrast ratios explicitly.

## Context Signals
Use when the brief signals: words like "transparent," "open," "airy," "floating," or "digital-native"; a hero background complex enough to produce visible blur depth (photography, gradient mesh, animated gradient); a brand metaphor involving lightness, immateriality, or distance from the physical world.
Avoid when: the background behind the glass card is a flat solid colour (blur renders as a translucent box, not glass); contrast ratio of text on glass falls below WCAG AA; the technique would appear on more than 1–2 elements per section.
Cross-aesthetic applications: A warmly textured, handmade brand can use glassmorphism when the brief describes "morning light through a window" or "condensation on glass" — the frosted quality references physical material, not software UI. An authoritative, established-institution brand can use a single glass card on a photography background when the brand persona emphasises openness alongside tradition — the glass becomes a window into the organisation, not a tech motif.
Implementation threshold: `backdrop-filter` must produce visible blur against a rich background. 1px rgba border with inner glow. Applied to one elevated element surrounded by solid cards — hierarchy depends on contrast, not repetition.

## Longevity Signal
Peaking — saturated in design systems and templates. Use only for specific, high-value UI moments (not as a card style applied uniformly).
