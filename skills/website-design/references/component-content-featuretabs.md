# FeatureTabs

Tabbed feature comparison. Needs JS behavior: state selects which panel is visible.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low
- type-personality: geometric-sans, editorial-display
- notes: 2–4 tabs. Five tabs becomes a list.

## Structure

- `<div class="ft">`
  - `<div class="ft__rail" role="tablist">`
    - one `<button class="ft__tab" role="tab" id="tab-{id}" aria-selected aria-controls="panel-{id}">` per tab; active tab also gets `.is-active`
  - one `<div class="ft__panel" role="tabpanel" id="panel-{id}" aria-labelledby="tab-{id}">` for the active tab
    - `.ft__body`: `.ft__title` `<h3>`, `.ft__text` `<p>`, optional `.ft__bullets` `<ul>`
    - `.ft__media` `<figure>` with `<img width="1200" height="800" loading="lazy">` and meaningful alt text

## CSS

```css
.ft {
  max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem;
}
.ft__rail {
  display: inline-flex; gap: 0.25rem;
  padding: 0.25rem;
  background: var(--color-surface-secondary);
  border: 1px solid var(--color-border);
  border-radius: 999px;
  margin-bottom: 2.5rem;
}
.ft__tab {
  padding: 0.6rem 1.25rem;
  font-size: 0.875rem;
  color: var(--color-text-secondary);
  border-radius: 999px;
  transition: background 200ms cubic-bezier(0.2, 0.8, 0.2, 1),
              color 200ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
.ft__tab.is-active {
  background: var(--color-surface-elevated);
  color: var(--color-text-primary);
  box-shadow: 0 1px 2px rgb(0 0 0 / 0.08);
}
.ft__tab:focus-visible {
  outline: 2px solid var(--color-accent); outline-offset: 2px;
}
.ft__panel {
  display: grid;
  grid-template-columns: 1fr;
  gap: 3rem;
  align-items: center;
  animation: ft-in 380ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
}
@media (min-width: 1024px) {
  .ft__panel { grid-template-columns: 5fr 7fr; gap: 4rem; }
}
.ft__title {
  font-family: var(--font-display);
  font-size: clamp(1.5rem, 2.5vw, 2.25rem);
  letter-spacing: -0.02em;
}
.ft__text {
  margin-top: 0.75rem;
  max-width: 54ch;
  color: var(--color-text-secondary);
}
.ft__bullets {
  margin-top: 1rem; padding-left: 1.25rem;
  display: grid; gap: 0.25rem;
  color: var(--color-text-secondary);
}
.ft__media img { width: 100%; border-radius: 1.25rem; aspect-ratio: 3 / 2; object-fit: cover; }

@keyframes ft-in {
  from { opacity: 0; translate: 0 8px; }
  to   { opacity: 1; translate: 0 0; }
}
@media (prefers-reduced-motion: reduce) {
  .ft__tab { transition: none; }
  .ft__panel { animation: none; }
}
```

## Behavior

- The first tab is selected on load.
- Clicking a tab makes it the active one: it gets `aria-selected="true"` and `.is-active`; every other tab gets `aria-selected="false"` without the class.
- Only the active tab's panel is rendered (or visible); switching swaps panels, and the incoming panel replays the `ft-in` entrance because it enters the DOM fresh.
- Tabs and panels are paired through `aria-controls`/`aria-labelledby` on stable ids (`tab-{id}`, `panel-{id}`).

## Notes

- Tab content per item: short label for the rail, plus title, body, media, optional bullets for the panel.
- Initialize the behavior lazily (when the section scrolls near the viewport).
- The panel entrance is a time-based keyframe animation, not scroll-driven; no `animation-timeline` is involved.
