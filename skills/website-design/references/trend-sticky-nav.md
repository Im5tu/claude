# Trend: Sticky Nav Patterns

## What It Is
Two variations trending in 2025–2026: (1) **Pill navbar** — a floating, horizontally centred nav with rounded corners (`border-radius: 9999px`), positioned `fixed top-4 left-1/2 -translate-x-1/2`, appearing initially transparent and transitioning to `backdrop-filter: blur(16px)` with `background: rgba(0,0,0,0.7)` after the hero scrolls 80px off screen. The transition: `transition: background 300ms ease, backdrop-filter 300ms ease`. (2) **Morphing navbar** — a full-width transparent nav that shrinks to a pill on scroll. JavaScript: listen to `scroll` event, toggle a class at `scrollY > 80`. Premium signal: the nav's `background-color` source point (where it picks up its blur from) is the hero section's background colour, creating visual continuity.

## Implementation
```css
.pill-nav {
  position: fixed;
  top: 1rem;
  left: 50%;
  transform: translateX(-50%);
  border-radius: 9999px;
  padding: 0.75rem 1.5rem;
  transition: background 300ms ease, backdrop-filter 300ms ease;
}

.pill-nav.scrolled {
  backdrop-filter: blur(16px);
  background: rgba(0, 0, 0, 0.7);
}
```

```js
// Toggle class on scroll
window.addEventListener('scroll', () => {
  const nav = document.querySelector('.pill-nav');
  nav.classList.toggle('scrolled', window.scrollY > 80);
});
```

## Premium Signals
- Pill nav that picks up the correct blur source from the underlying section as the page scrolls — not just a generic dark blur

## Anti-Execution Warnings
- **Sticky navbar with excessive height** — on mobile, a sticky nav taller than 56px consumes 8–10% of viewport. Height must collapse on mobile (`height: 56px` mobile, `height: 64px` desktop).

## Context Signals
Use when the brief signals: a multi-section page where persistent navigation improves wayfinding; the brand's navigation items are concise enough to fit a pill format (5–6 items maximum); the visual identity benefits from a floating element (the nav becomes a design feature, not just a utility).
Avoid when: navigation items are numerous or long (the pill cannot hold 8+ items without compression); the brief describes a minimal, immersive experience where persistent chrome interrupts the flow; the page is short enough that a sticky nav adds no functional value.
Cross-aesthetic applications: A dark, atmospheric brand can use a pill nav with `backdrop-filter: blur(16px)` and `background: rgba(0,0,0,0.7)` when the brief describes "immersion" — the glass effect lets the content show through, reinforcing depth. A warm, approachable brand can use a full-width-to-pill morphing nav when the brief describes "welcoming but structured." A minimal, editorial brand can use a full-width sticky nav that dissolves to near-invisible (text only, no background) after the hero when the brief describes "content without chrome" — the navigation remains accessible but does not compete with the reading experience.
Implementation threshold: pill nav appears after the hero scrolls 80px off screen. Transition between states uses `300ms ease` on background and backdrop-filter. The blur source point picks up the underlying section's background colour, not a generic dark overlay.

## Longevity Signal
Ascending — replacing full-width sticky navs as the standard premium pattern. Not yet ubiquitous.
