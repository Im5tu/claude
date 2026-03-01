# Trend: Page Transitions

## What It Is
GSAP-powered transitions that fire on navigation: clip-path wipe (a panel wipes across the screen before the new page content enters), fade + translate (content fades and shifts 24px down while new content enters from above), curtain reveal (a full-screen overlay splits vertically to reveal the destination page). In Next.js App Router: managed via layout-level GSAP context or Framer Motion's `AnimatePresence`. The transition must feel like an extension of the brand — a luxury brand uses a slow, deliberate wipe (600–800ms); a studio brand uses a sharp cut (200ms) with a flash frame. Page transitions that take longer than 700ms are too slow and will be perceived as broken on fast connections.

## Implementation
```js
// Layout-level GSAP timeline for page transition
const tl = gsap.timeline();
tl.to('.curtain', { scaleY: 1, duration: 0.4, ease: 'power3.in' })
  .to('.curtain', { scaleY: 0, transformOrigin: 'top', duration: 0.4, ease: 'power3.out' });
```

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
Ascending — underused in Next.js App Router sites due to implementation friction. A differentiator when done correctly.
