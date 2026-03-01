# Trend: Dark Mode as First-Class Citizen

## What It Is
Not a CSS `@media (prefers-color-scheme: dark)` inversion of the light site. A purpose-designed dark experience using surfaces that aren't pure black: `#09090B` (near-black with blue undertone), `#0D0F14` (near-black with cool undertone), `#111113` (neutral near-black). Cards and elevated surfaces: `#1A1A1F` or `#16161A`. Colour choices for dark-first: accent colours that glow against dark (high chroma: `oklch(70% 0.2 250)`), text in true white `#FAFAFA` or warm off-white `#F5F4F0`. The test: does the dark design feel intentionally dark, or does it feel like someone turned the lights off?

## Implementation
```css
:root {
  --bg-base: #09090B;        /* near-black with blue undertone */
  --bg-elevated: #1A1A1F;    /* card surfaces */
  --text-primary: #FAFAFA;   /* true white */
  --text-secondary: #F5F4F0; /* warm off-white */
  --accent: oklch(70% 0.2 250); /* high chroma accent */
}
```

## Premium Signals
- Dark mode where card surfaces are noticeably lighter than the page background — elevation is communicated through lightness, not shadow

## Anti-Execution Warnings
- **Dark mode that is pure `#000000`** — flat black backgrounds make coloured elements appear to float without context. Dark surfaces need slight warmth or coolness to feel grounded.

## Context Signals
Use when the brief signals: a product that will be used in low-light environments (evening reading, creative tools, media consumption); a brand personality described as "sophisticated," "immersive," "cinematic," or "nocturnal"; accent colours in the brand palette that gain vibrancy against dark surfaces (high-chroma blues, greens, violets); photography or video content that benefits from a dark surround.
Avoid when: the brand is built on warmth, sunlight, or daytime energy — forcing dark mode on a brand whose metaphors are all about brightness creates cognitive dissonance; the content is primarily long-form text where dark backgrounds increase eye strain over extended reading sessions; the dark surfaces would make the site feel oppressive rather than sophisticated because the content lacks visual variety to break the darkness.
Cross-aesthetic applications: A natural, earthy brand can use dark-mode-first design when the brief describes "night sky," "deep earth," or "evening fire" — the dark palette references the natural world after sunset, not technology. Near-black surfaces with warm undertones (`#0D0A07`) and amber accents feel grounded rather than digital. A clinical, precision-focused brand can use dark mode when the brief describes "focus" or "instrument panel" — the dark background recedes, making data visualisations and interface elements appear to float with authority.
Implementation threshold: The background must not be pure `#000000` — use near-blacks with a deliberate undertone (cool: `#0D0F14`, warm: `#0D0A07`, neutral: `#111113`). Card and elevated surfaces must be noticeably lighter than the page background to communicate z-depth through lightness, not shadow. Accent colours must be tested for vibrancy and contrast on the specific dark surface chosen.

## Longevity Signal
Ascending — as OS dark mode adoption increases, intentional dark design becomes an expectation, not a nice-to-have.
