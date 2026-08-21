# Trend: Page Transitions

## What It Is
Native transitions between routes: clip-path wipe (a panel wipes across the screen before the new page content enters), fade + translate (content fades and shifts 24px down while new content enters from above), curtain reveal (a full-screen overlay splits vertically to reveal the destination page). The transition must feel like an extension of the brand — a luxury brand uses a slow, deliberate wipe (600–800ms); a studio brand uses a sharp cut (200ms) with a flash frame. Transitions over 700ms read as slow, not deliberate.

## Implementation

Astro's native **View Transitions API** via `<ClientRouter />` in `BaseLayout.astro` — no JS library required, no route-level plumbing:

```astro
---
import { ClientRouter } from "astro:transitions";
---
<html>
  <head>
    <ClientRouter fallback="swap" />
  </head>
  <body><slot /></body>
</html>
```

Customise per-element via `transition:name="hero-image"` (shared element animation) or `transition:animate="slide"` / `transition:animate={customAnim}` for a curtain/wipe effect. For a branded curtain, define keyframes on `::view-transition-old(root)` / `::view-transition-new(root)` in `src/styles/global.css`. See `core-animation.md` §Astro View Transitions.

## Premium Signals
- Page transitions that decelerate as they reach the new page (easing matches brand tempo, not a default linear)

## Anti-Execution Warnings
- **Page transitions that delay navigation beyond 700ms** — users tolerate transition animations at this length; beyond it, they interpret the delay as a slow site, not a design decision.

## Context Signals
Use when the brief signals: a multi-page site where the brand story continues across routes (not just repeated chrome); language like "immersive," "cinematic," or "experience"; a content structure where transitions can reinforce the narrative (e.g., a dark curtain wipe between a moody portfolio and a bright contact page).
Avoid when: the site is a single-page marketing site; the brief prioritises load speed above all else; the audience will predominantly navigate via direct links or search rather than sequential browsing.
Cross-aesthetic applications: A traditionally authoritative brand can use a slow, single-colour curtain wipe when the brief describes the firm as "deliberate and unhurried" — the wipe pace becomes a brand tempo signal. A playful consumer brand can use a fast clip-path reveal when the brief describes the product as "instant" or "effortless." A bold, studio or creative brand can use a sharp flash-frame cut (200ms, high-contrast brand colour) when the brief describes the studio's energy as "decisive" or "instant" — the transition pace communicates the brand's relationship with time as clearly as any headline.
Implementation threshold: total transition duration under 700ms. Transition colour is derived from a brand element (primary, accent, or background), never generic black.

## Longevity Signal
Ascending — Astro's View Transitions API makes this low-friction; the differentiator is now taste in branding the transition, not implementation difficulty.
