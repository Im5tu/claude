# Trend: Hidden Easter Eggs

## What It Is
Interactions or content that are not visible or documented — they must be discovered. A Konami code that triggers a special animation. A logo that does something unexpected when clicked five times. A 404 page with a hidden game. A specific scroll pattern that reveals a developer credit. Easter eggs are the purest form of micro-delight because they cannot be systematised or expected — they reward curiosity and exploration.

The psychology: discovery generates dopamine. When a user finds something that was hidden, they feel a sense of achievement and insider knowledge. They are more likely to share the discovery (word-of-mouth), and they associate the positive emotion with the brand. The easter egg costs almost nothing to implement but creates disproportionate brand affinity.

## Implementation
Implementation principles: the trigger must be non-obvious but discoverable (clicking a logo five times, typing a specific word, scrolling to a specific position on a specific page). The reward must be proportional to the effort — a Konami code should trigger something visually spectacular, not a subtle colour change. The easter egg must not interfere with normal use — it activates only on an unusual interaction pattern that would never be triggered accidentally.

```js
// Konami code example
const konamiCode = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown',
  'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'KeyB', 'KeyA'];
let konamiIndex = 0;

document.addEventListener('keydown', (e) => {
  if (e.code === konamiCode[konamiIndex]) {
    konamiIndex++;
    if (konamiIndex === konamiCode.length) {
      triggerEasterEgg();
      konamiIndex = 0;
    }
  } else {
    konamiIndex = 0;
  }
});
```

## Premium Signals
- The easter egg reflects the brand's personality (a playful brand's easter egg is different from a luxury brand's)
- The reward animation is polished (not a placeholder)
- The discovery can be shared (e.g., a URL parameter that persists the easter egg state: `?found=true`)
- It is keyboard-accessible (not locked behind mouse-only interaction)

## Anti-Execution Warnings
- Easter eggs that are essential to find (hiding important information behind discovery)
- Easter eggs that trigger accidentally (disrupting the experience)
- Easter eggs that are stale (a holiday-themed egg visible year-round)
- Easter eggs with sound (unexpected audio is always hostile)

## Context Signals
Use when the brief signals: brand personality that includes playfulness, wit, or insider culture, products with engaged communities who would share discoveries, teams that value developer/designer craft visible to those who look closely
Avoid when: the brand personality is strictly corporate or institutional (easter eggs can undermine credibility in regulated industries), the easter egg would require users to find it for information they need (hiding important content is hostile), or implementation time would be better spent on core experience quality
Cross-aesthetic applications: A bold studio brand can hide a Konami code that triggers a wild full-screen animation — the excess matches the personality and rewards the curious. A minimal editorial brand can hide a subtle typographic detail — a specific word on the 404 page that, when clicked, reveals a short essay from the editor. A clean SaaS brand can hide a developer-oriented joke in the console log or source comments — it rewards the technical audience without affecting the primary experience.
Implementation threshold: The easter egg must be genuinely delightful when found — a low-effort easter egg (a console.log message, a colour change) is worse than no easter egg at all. The reward must be proportional to the effort of discovery.

## Longevity Signal
Evergreen — by nature, they cannot become ubiquitous or overused. Each one is unique. The delight is in the discovery, which is permanently rewarding regardless of trend cycles. The rarest and most permanently effective form of micro-delight.
