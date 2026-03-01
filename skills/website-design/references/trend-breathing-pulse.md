# Trend: Breathing / Idle Pulse

## What It Is
A slow, continuous pulse on an element that signals it is alive, interactive, or waiting for the user's attention. A CTA button that gently scales between `1` and `1.015` on a 3.5-second loop. A notification dot that pulses its opacity between `0.7` and `1`. A hero illustration that subtly breathes — scaling its container by `0.5%` in a slow cycle. The effect is subliminal: the user does not consciously watch the pulse, but the element feels alive rather than static.

## Implementation
```css
@keyframes breathe {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.015); }
}

.breathing-element {
  animation: breathe 3.5s ease-in-out infinite;
}

/* Glow pulse variant */
@keyframes glow {
  0%, 100% { box-shadow: 0 0 20px rgba(var(--accent-rgb), 0.15); }
  50% { box-shadow: 0 0 30px rgba(var(--accent-rgb), 0.3); }
}

.glow-element {
  animation: glow 4s ease-in-out infinite;
}
```

Duration: 3–5 seconds per cycle. Anything faster reads as urgency (error state); anything slower becomes imperceptible.

## Premium Signals
- The pulse rhythm matches the brand tempo (a calm wellness brand breathes at 5s; a bold agency at 3s)
- The pulse is subtle enough that it cannot be actively watched changing — only noticed as "this element feels alive"
- The pulse stops when the element receives focus or hover (the direct interaction replaces the ambient signal)
- Only 1–2 elements per page maximum
- Amplitude below 2% (1.5% is the sweet spot)

## Anti-Execution Warnings
- Pulsing multiple elements simultaneously (creates visual chaos)
- Pulse amplitude above `scale(1.03)` (noticeable as animation, not ambiance)
- Pulse on elements that are not interactive (misleading affordance)
- Breathing on navigation items or form inputs where it implies status

## Context Signals
Use when the brief signals: CTAs that need to attract attention without being aggressive, elements that communicate "alive" or "active" status, landing pages with a single primary action where ambient motion draws focus to the CTA
Avoid when: the page has multiple competing interactive elements (multiple pulses create visual noise), the brand aesthetic is strictly minimal where pulses add visual weight that conflicts with extreme restraint, or the element is not interactive (pulsing non-clickable elements misleads users)
Cross-aesthetic applications: A brand where dark surfaces and high contrast are core to the design language can use a slow, subtle glow pulse on a primary CTA — the glow reads as luminous against dark backgrounds without competing with surrounding content. A product brand can use a breathing pulse on a primary CTA button during an idle state (user has been on the page for 10+ seconds without interacting) — the pulse is a gentle nudge, not an alert. A warm artisan brand can use a very slow pulse (5s cycle) on a hand-illustrated "Shop Now" element — the breathing makes the illustration feel alive and inviting.
Implementation threshold: The pulse must be subliminal — if a user can consciously watch the element growing and shrinking, the amplitude is too high. Reduce scale change or increase duration until the pulse is felt, not seen.

## Longevity Signal
Evergreen — a timeless, low-risk technique that adds life without trend dependency. Will never feel dated if amplitude stays below 2% and duration stays above 3 seconds.
