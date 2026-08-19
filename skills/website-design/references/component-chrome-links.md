# Link animations

Three underline animation patterns. All pure CSS. Choose to match motion register and type personality.

| Pattern | Mechanism | Best for |
|---|---|---|
| Nav link | Underline draws in left-to-right on hover via `::after` transform | Primary nav, persistent headers |
| Slide link | Underline slides in from the right of the next-state label | Body links, inline emphasis |
| Highlight link | A rectangular highlight background grows from zero width | Editorial surfaces, high-contrast CTAs |

## Dimensional fit

- NavLink: any — default for navbar items.
- SlideLink: moderate / expressive — incongruent on strict restrained registers.
- HighlightLink: editorial display or bold geometric sans; strong on light + restrained + editorial.

## Structure

- Nav link: `<a class="nav-link" href>` with a `<span>` wrapping the label; add class `is-active` for the current page
- Slide link: `<a class="slide-link" href>` with a `<span>` wrapping the label
- Highlight link: `<a class="highlight-link" href>` with `<span class="highlight-link__text">` wrapping the label

## CSS

```css
.nav-link {
  position: relative;
  display: inline-block;
  color: var(--color-primary);
  opacity: 0.8;
  transition: opacity var(--motion-duration-fast) var(--ease-out-soft);
}
.nav-link:hover, .nav-link.is-active { opacity: 1; }
.nav-link::after {
  content: "";
  position: absolute;
  left: 0; right: 0; bottom: -4px;
  height: 1px;
  background: currentColor;
  transform: scaleX(0);
  transform-origin: left;
  transition: transform var(--motion-duration-fast) var(--ease-out-soft);
}
.nav-link:hover::after, .nav-link.is-active::after { transform: scaleX(1); }

.slide-link {
  position: relative;
  display: inline-block;
  color: var(--color-accent);
  overflow: hidden;
}
.slide-link::after {
  content: "";
  position: absolute;
  inset: auto 0 0 -100%;
  height: 1px;
  background: currentColor;
  transition: inset var(--motion-duration-base) var(--ease-out-soft);
}
.slide-link:hover::after { inset: auto 0 0 0; }

.highlight-link {
  position: relative;
  display: inline-block;
  padding: 0 0.2em;
  color: var(--color-primary);
}
.highlight-link::before {
  content: "";
  position: absolute;
  inset: 0;
  background: var(--color-accent);
  transform: scaleX(0);
  transform-origin: left;
  transition: transform var(--motion-duration-base) var(--ease-out-soft);
  z-index: -1;
}
.highlight-link__text { position: relative; z-index: 1; transition: color var(--motion-duration-fast) var(--ease-out-soft); }
.highlight-link:hover::before { transform: scaleX(1); }
.highlight-link:hover .highlight-link__text { color: var(--color-surface-primary); /* page-bg color as text over the accent fill */ }

@media (prefers-reduced-motion: reduce) {
  .nav-link::after, .nav-link:hover::after { transition: none; transform: scaleX(0); }
  .nav-link.is-active::after { transform: scaleX(1); }
  .slide-link::after, .slide-link:hover::after { transition: none; }
  .highlight-link::before, .highlight-link:hover::before { transition: none; }
}
```

## Usage

```html
<nav style="display: flex; gap: 1.5rem;">
  <a class="nav-link" href="/about"><span>About</span></a>
  <a class="nav-link is-active" href="/work"><span>Work</span></a>
  <a class="nav-link" href="/contact"><span>Contact</span></a>
</nav>

<p>
  Read our full <a class="slide-link" href="/manifesto"><span>founding manifesto</span></a> to understand why.
</p>

<p style="font-size: 1.875rem;">
  We make things that <a class="highlight-link" href="/work"><span class="highlight-link__text">work in production</span></a>.
</p>
```
