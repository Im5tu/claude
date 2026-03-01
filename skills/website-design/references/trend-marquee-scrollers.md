# Trend: Marquee Scrollers

## What It Is
Continuously scrolling rows of logos, short testimonial quotes, or images using CSS `animation: marquee 20s linear infinite` with `@keyframes marquee { from { transform: translateX(0) } to { transform: translateX(-50%) } }`. The content is duplicated so the loop is seamless. No pause, no dot navigation, no click interaction. Key calibrations: speed should be 18–25 seconds for a full cycle (faster feels frantic, slower feels broken), content should be spaced with `gap: 48px–80px`, and the marquee should fade at the edges using a CSS `mask-image: linear-gradient(to right, transparent, black 15%, black 85%, transparent)`. Two rows scrolling in opposite directions is a premium variant. Marquee replaces static logo grids because it communicates volume — you can't fit 20 logos in a static row, but a marquee can hold 40.

## Implementation
```css
.marquee-container {
  overflow: hidden;
  mask-image: linear-gradient(to right, transparent, black 15%, black 85%, transparent);
}

.marquee-track {
  display: flex;
  gap: 64px;
  animation: marquee 22s linear infinite;
}

@keyframes marquee {
  from { transform: translateX(0); }
  to { transform: translateX(-50%); }
}
```

## Premium Signals
- Marquee with edge fade masks, consistent speed, and content that reflects genuine brand social proof (named companies, real testimonials)

## Anti-Execution Warnings
- **Marquee used as a substitute for real social proof** — a marquee of placeholder company names or a marquee with 5 logos cycling slowly signals that the social proof is fabricated. Marquee requires 12+ logos to justify the continuous-scroll pattern.

## Context Signals
Use when the brief signals: a volume of social proof that exceeds what a static grid can hold (12+ logos, 8+ testimonial snippets); language like "trusted by," "partnered with," or "used by thousands"; a brand that needs to communicate momentum and market presence without narrating each relationship.
Avoid when: the business has fewer than 8 real logos to display (a slow marquee with 4 logos cycling exposes the gap); the social proof is fabricated or aspirational; the brief describes the brand as "exclusive" or "selective" in a way that contradicts volume signalling.
Cross-aesthetic applications: A quiet, authoritative brand can use a single-row text-only marquee of client names in the brand's serif typeface when the brief describes "established relationships built over decades." A playful consumer brand can use a dual-row marquee scrolling in opposite directions when the brief describes "community" and "scale."
Implementation threshold: 12+ content items, edge fade masks via CSS `mask-image`, 18–25 second cycle. Content is duplicated for seamless looping. Speed never draws conscious attention.

## Longevity Signal
Mature — ubiquitous on premium sites. No longer a differentiator; now the expected treatment for social proof strips. Absence is more noticeable.
