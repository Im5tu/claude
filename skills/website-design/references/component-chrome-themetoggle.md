# Theme toggle

Dark mode toggle. Reads `prefers-color-scheme` on first load, persists the choice to `localStorage`, applies a `.dark` class on `<html>`. Use in the navbar only when the site actually supports both themes. Needs JS.

## Dimensional fit

- surface-depth: only relevant when both are supported
- motion-register: any
- notes: The global stylesheet should define colour tokens for both themes, with the `.dark` class on `<html>` switching the dark set on.

## Structure

- `<button class="theme-toggle" aria-pressed aria-label="Switch to light|dark mode">` containing a sun icon (in dark mode) or moon icon (in light mode) as inline SVG, 16px

## CSS

```css
.theme-toggle {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 2rem;
  height: 2rem;
  border-radius: 999px;
  color: var(--color-primary);
  transition: background 180ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
.theme-toggle:hover { background: color-mix(in oklab, currentColor 8%, transparent); }
.theme-toggle:focus-visible { outline: 2px solid var(--color-accent); outline-offset: 3px; }
```

## Behavior

- Initial state: read `localStorage.theme`; if absent or invalid, fall back to `matchMedia("(prefers-color-scheme: dark)")`.
- Clicking the toggle flips the theme, toggles the `dark` class on `document.documentElement`, writes the new value to `localStorage.theme`, swaps the icon, and updates `aria-pressed` (true when dark) and the `aria-label` to name the mode it will switch to.
- Anti-flash script (mandatory): a small blocking inline script in `<head>`, placed before any stylesheet that depends on `.dark`, reads `localStorage.theme`, falls back to `prefers-color-scheme`, and adds the `dark` class to `<html>` when dark. It runs synchronously before first paint so the page never flashes the wrong theme, whatever script later manages the button.

## Notes

- The component is self-contained; no configuration.
- The toggle button itself can attach its behavior lazily; only the anti-flash script must block.

## Dimensional adaptation

- Icon-only default is sufficient for most directions.
- Editorial register: swap icons for labelled text: `Light / Dark`.
- Expressive register: add a subtle rotate on toggle via CSS transition on an inner `<span>`.
