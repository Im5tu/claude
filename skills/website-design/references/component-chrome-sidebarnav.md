# Sidebar nav

Fixed left-rail navigation for editorial and content-heavy sites. Desktop shows a persistent left column; mobile collapses to a sheet behind a hamburger. Needs JS for the mobile open/close state and the optional scroll-spy highlighting.

## Dimensional fit

- surface-depth: light (default), dark (secondary)
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, editorial-display (editorial contexts)
- notes: Replaces `Navbar` entirely. Do not render both. Best for long-form magazines, documentation, portfolios with chaptered work.

## Structure

- Mobile toggle: `<button aria-label="Toggle navigation" aria-expanded>`, fixed top-right (`top: 1rem; right: 1rem; z-index: 50`), circular, background `var(--color-surface-elevated)` with a `var(--color-border)` border, menu/close icons as inline SVG; hidden at and above 768px
- `<aside class="sidebar">` (add `sidebar--open` when the mobile sheet is open)
  - `<a href="/" class="sidebar__brand">` wordmark
  - `<nav>`: `<p class="sidebar__label">Pages</p>` and `<ul class="sidebar__list">` of primary links
  - optional second `<nav>` (`margin-top: 2rem`) for in-page anchors: `<p class="sidebar__label">On this page</p>` and a `<ul class="sidebar__list">` of `#id` links; the current section's link carries `is-active`
- Page content wrapper gets `margin-left: 16rem` at and above 768px so it clears the rail

## CSS

```css
.sidebar {
  position: fixed;
  inset: 0 auto 0 0;
  width: 16rem;
  padding: 2rem 1.5rem;
  border-right: 1px solid var(--color-border);
  background: var(--color-surface-primary);
  overflow-y: auto;
  z-index: 40;
  transform: translateX(-100%);
  transition: transform 320ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
.sidebar--open { transform: translateX(0); }
@media (min-width: 768px) {
  .sidebar { transform: translateX(0); }
}
.sidebar__brand {
  display: block;
  font-family: var(--font-display);
  font-size: 1.25rem;
  letter-spacing: -0.02em;
  margin-bottom: 2.5rem;
}
.sidebar__label {
  font-size: 0.75rem;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  opacity: 0.5;
  margin-bottom: 0.75rem;
}
.sidebar__list { display: grid; gap: 0.5rem; }
.sidebar__list a {
  opacity: 0.8;
  transition: opacity 180ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
.sidebar__list a:hover { opacity: 1; }
.sidebar__list a.is-active {
  opacity: 1;
  color: var(--color-accent);
}
@media (prefers-reduced-motion: reduce) {
  .sidebar { transition-timing-function: linear; }
}
```

## Behavior

- Clicking the mobile toggle flips `sidebar--open` and mirrors the state on the button's `aria-expanded`; the icon swaps between menu and close glyphs.
- Clicking any link inside the sheet closes it before navigation.
- Scroll-spy (only when in-page anchors are configured): an IntersectionObserver with `rootMargin: "-40% 0px -50% 0px"` and thresholds `[0, 0.25, 0.5, 0.75, 1]` observes each section element by id; on each callback the intersecting entry with the highest intersection ratio becomes the active section, and its link gets `is-active`. The observer is disconnected on teardown.
- Initialize on page load: the rail is above the fold and immediately usable on mobile, so the behavior must attach as early as possible.

## Notes

- The desktop rail is pure CSS; JS drives only the mobile sheet and scroll-spy.
- Section elements to observe must carry the ids the anchor list points at.

## Dimensional adaptation

- Restrained: drop the scroll-spy; static list only.
- Editorial display: add a small decorative rule above each section group.
- Dark surface-depth: invert to a dark sidebar on a light content surface for editorial contrast.
