# CardShuffler

Cycling overlapping card stack. The front card is visible; the stack auto-rotates on a timer and advances on click. Reordering animates with a FLIP pattern (measure positions, reorder DOM, invert, play). Needs JS behavior.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low / medium
- type-personality: any
- notes: Best when each card is a testimonial or a rotating value prop. Not for ordered content — order is not preserved visually beyond the front card.

## Structure

- `.shuffler` container (relative, fixed height, click target for advancing)
  - one `.shuffler__card` per card (3 to 5 recommended), absolutely positioned and stacked; each carries a stable `data-id` and a per-card index custom property `--i` (0 = front)
    - `.shuffler__eyebrow` (`<p>`, source label such as "Apex, CTO")
    - `.shuffler__heading` (`<h3>`, the pull quote)
    - `.shuffler__body` (`<p>`, supporting sentence)

## CSS

```css
.shuffler {
  position: relative;
  height: 24rem;
  max-width: 34rem;
  margin: 0 auto; /* centered */
  cursor: pointer;
}
.shuffler__card {
  position: absolute;
  inset: 0;
  background: var(--color-surface-secondary);
  border: 1px solid var(--color-border);
  border-radius: 1.5rem;
  padding: 2rem;
  translate: calc(var(--i) * 1.25rem) calc(var(--i) * 0.5rem);
  scale: calc(1 - var(--i) * 0.04);
  opacity: calc(1 - var(--i) * 0.18);
  z-index: calc(10 - var(--i));
  transition: translate 500ms cubic-bezier(0.2, 0.8, 0.2, 1),
              scale 500ms cubic-bezier(0.2, 0.8, 0.2, 1),
              opacity 500ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
.shuffler__eyebrow {
  font-size: 0.75rem; letter-spacing: 0.1em; text-transform: uppercase;
  color: var(--color-accent); margin-bottom: 0.75rem;
}
.shuffler__heading {
  font-family: var(--font-display); font-size: 1.5rem;
  letter-spacing: -0.01em;
}
.shuffler__body {
  margin-top: 0.75rem; color: var(--color-text-secondary);
}
@media (prefers-reduced-motion: reduce) {
  .shuffler__card { transition: none; }
}
```

## Behavior

- State is the card order (array of card ids). Advancing moves the first card to the end; per-card `--i` values are reassigned to match the new order, which restyles depth, offset, scale, and opacity via the CSS above.
- Advance runs on click anywhere in `.shuffler`, and automatically every 4000ms (configurable interval). Clear the timer when the component is removed.
- Defer starting the auto-advance timer until the component is on screen; offscreen it stays idle.
- Reorder animates with FLIP via the Web Animations API: before reordering, record each card's bounding rect keyed by `data-id`; after the DOM reorder (next microtask), for each card compute dx and dy as old position minus new position and ds as old width divided by new width, then animate from `translate(dx, dy) scale(ds)` to `translate(0, 0) scale(1)` over 500ms with easing `cubic-bezier(0.2, 0.8, 0.2, 1)`.
- If `(prefers-reduced-motion: reduce)` matches: never start the auto-advance timer and skip the FLIP animation on manual advance (the reorder still applies instantly).

## Notes

- Clicking anywhere on the stack advances it.
- Keyboard access: wrap the stack in a `<button>` or add focus and keydown handling if advancing is a primary interaction.
- 3 to 5 cards; each card needs an id, eyebrow, heading, and body.
- For ordered content (process steps, chaptered work), use `StickyCardStack` instead; it needs no JS.
