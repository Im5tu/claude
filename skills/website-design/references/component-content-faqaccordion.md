# FAQAccordion

FAQ list with expand/collapse rows. Needs JS behavior: the open/close height animation uses the Web Animations API with measured `scrollHeight`, because CSS `height: auto` interpolation is not universally supported yet.

## Dimensional fit

- surface-depth: any
- motion-register: any (height animation is subtle)
- texture-appetite: any
- type-personality: any
- notes: 5–8 items ideal. Fewer → AlternatingRows. More → split into category tabs.

## Structure

- `<ul class="faq">`
  - one `<li>` per item
    - `<button class="faq__btn" aria-expanded aria-controls="faq-p-{i}">`
      - `<span>` question text
      - `<span class="faq__mark" aria-hidden="true">` plus/minus glyph drawn with pseudo-elements
    - `<div id="faq-p-{i}" class="faq__panel">`
      - `<p class="faq__answer">` answer text

## CSS

```css
.faq { display: grid; border-top: 1px solid var(--color-border); }
.faq > li { border-bottom: 1px solid var(--color-border); }
.faq__btn {
  display: flex; align-items: center; justify-content: space-between;
  width: 100%; padding: 1.5rem 0; text-align: left;
  font-family: var(--font-display);
  font-size: clamp(1.125rem, 1.6vw, 1.375rem);
  letter-spacing: -0.01em;
}
.faq__mark {
  width: 1.25rem; height: 1.25rem;
  position: relative; flex-shrink: 0;
  transition: transform 220ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
.faq__mark::before, .faq__mark::after {
  content: ""; position: absolute; inset: 0; margin: auto;
  background: currentColor;
}
.faq__mark::before { width: 100%; height: 1.5px; }
.faq__mark::after { width: 1.5px; height: 100%; transition: scale 220ms cubic-bezier(0.2, 0.8, 0.2, 1); }
.faq__btn[aria-expanded="true"] .faq__mark::after { scale: 0; }
.faq__panel { height: 0; overflow: hidden; }
.faq__answer {
  padding: 0 0 1.5rem 0;
  color: var(--color-text-secondary);
  max-width: 64ch;
}
@media (prefers-reduced-motion: reduce) {
  .faq__mark { transition: none; }
  .faq__mark::after { transition: none; }
}
```

## Behavior

- One item open at most. Clicking a button toggles its own row: if it was open it closes, if another row was open that state moves here (open state is a single index, not per-row booleans).
- Clicking the toggle flips `aria-expanded` on the button; the panel is referenced by `aria-controls`/`id`.
- Open/close animates panel height with the Web Animations API: measure `scrollHeight`, animate `height` between `0px` and that pixel value, `duration: 320`, `easing: cubic-bezier(0.2, 0.8, 0.2, 1)`, `fill: "forwards"`.
- When the open animation finishes, set the panel's inline height to `auto` so content reflows correctly.
- Cancel any in-flight animation on the same panel before starting a new one, and cancel on teardown.
- If `(prefers-reduced-motion: reduce)` matches, skip the animation and set height directly to `auto` or `0px`.
- The plus/minus mark is pure CSS: the vertical bar scales to 0 when expanded.

## Notes

- Initialize this behavior lazily (when the section scrolls near the viewport); nothing above the fold depends on it.
- Answers cap at 64ch; keep them to 1 or 2 sentences.
