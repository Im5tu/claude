# AccordionProcess

Expandable process steps. The default open state shows step 01; clicking another step transitions its body open while the previous closes. Needs JS behavior for the toggle and height animation.

## Dimensional fit

- surface-depth: any
- motion-register: any (animation is subtle)
- texture-appetite: any
- type-personality: any
- notes: 3–6 steps. Large step bodies benefit from this component more than small ones.

## Structure

- `<div class="ap">` container, one row `<div>` per step
  - `<button class="ap__head" aria-expanded aria-controls="ap-p-<i>">`
    - `<span class="ap__num">` static number text ("01", "02", ...)
    - `<span class="ap__title">`
    - `<span class="ap__mark" aria-hidden="true">` plus/minus glyph drawn with pseudo-elements
  - `<div class="ap__panel" id="ap-p-<i>">` collapsible wrapper (height animated)
    - `<div class="ap__body">` with `<p>` body and optional `<ul class="ap__bullets">`

## CSS

```css
.ap { display: grid; border-top: 1px solid var(--color-border); }
.ap > div { border-bottom: 1px solid var(--color-border); }
.ap__head {
  display: grid; grid-template-columns: auto 1fr auto;
  gap: 1.5rem; align-items: baseline;
  padding: 1.5rem 0; text-align: left; width: 100%;
}
.ap__num {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.14em;
  color: var(--color-accent);
  min-width: 2ch;
}
.ap__title {
  font-family: var(--font-display);
  font-size: clamp(1.125rem, 1.8vw, 1.5rem);
  letter-spacing: -0.01em;
}
.ap__mark {
  width: 1.25rem; height: 1.25rem; position: relative;
}
.ap__mark::before, .ap__mark::after {
  content: ""; position: absolute; inset: 0; margin: auto;
  background: currentColor;
}
.ap__mark::before { width: 100%; height: 1.5px; }
.ap__mark::after { width: 1.5px; height: 100%; transition: scale 200ms cubic-bezier(0.2, 0.8, 0.2, 1); }
.ap__head[aria-expanded="true"] .ap__mark::after { scale: 0; }

.ap__panel { height: 0; overflow: hidden; }
.ap__body {
  padding: 0 0 1.5rem 3.5rem;
  max-width: 60ch;
  color: var(--color-text-secondary);
}
.ap__bullets { margin-top: 0.75rem; padding-left: 1rem; display: grid; gap: 0.25rem; }

@media (prefers-reduced-motion: reduce) {
  .ap__mark::after { transition: none; }
}
```

## Behavior

- Exactly one step (or none) is open at a time; the first step is open on initial render, its panel set to `height: auto`.
- Clicking a closed step's header opens it and closes the previously open step; clicking the open step's header closes it, leaving all closed.
- Each header button toggles its `aria-expanded` and points at its panel via `aria-controls`/`id`.
- Height animation uses the Web Animations API on the panel: animate `height` between `0px` and the panel's `scrollHeight` over 340ms with easing `cubic-bezier(0.2, 0.8, 0.2, 1)`, fill forwards. On open completion, set `height: auto` so the panel reflows with content. Cancel any in-flight animation before starting a new one, and on teardown.
- If `(prefers-reduced-motion: reduce)` matches, skip the animation and set `height` to `auto` or `0` directly.
- The plus mark collapses to a minus purely in CSS via `[aria-expanded="true"]`.

## Notes

- Defer initializing the JS until the component is near the viewport if the page has many islands of behavior; nothing above depends on early execution.
- Step numbers are static text, never animated counters.
- Bullets are optional per step; the last step commonly omits them.
