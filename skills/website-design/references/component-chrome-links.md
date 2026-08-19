# Link Animations — `.astro`

Three underline animation patterns. All pure CSS. Choose to match motion register and type personality.

| Component | Pattern | Best for |
|---|---|---|
| `NavLink` | Underline draws in left-to-right on hover via `::after` transform | Primary nav, persistent headers |
| `SlideLink` | Underline slides in from the right of the next-state label | Body links, inline emphasis |
| `HighlightLink` | A rectangular highlight background grows from zero width | Editorial surfaces, high-contrast CTAs |

## Dimensional fit

- NavLink: any — default for navbar items.
- SlideLink: moderate / expressive — incongruent on strict restrained registers.
- HighlightLink: editorial display or bold geometric sans; strong on light + restrained + editorial.

## Files

### `src/components/ui/NavLink.astro`

```astro
---
interface Props { href: string; active?: boolean; class?: string; }
const { href, active = false, class: className = "" } = Astro.props;
---
<a href={href} class:list={["nav-link", active && "is-active", className]}>
  <span><slot /></span>
</a>

<style>
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
  @media (prefers-reduced-motion: reduce) {
    .nav-link::after, .nav-link:hover::after { transition: none; transform: scaleX(0); }
    .nav-link.is-active::after { transform: scaleX(1); }
  }
</style>
```

### `src/components/ui/SlideLink.astro`

```astro
---
interface Props { href: string; class?: string; }
const { href, class: className = "" } = Astro.props;
---
<a href={href} class:list={["slide-link", className]}>
  <span><slot /></span>
</a>

<style>
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
  @media (prefers-reduced-motion: reduce) {
    .slide-link::after, .slide-link:hover::after { transition: none; }
  }
</style>
```

### `src/components/ui/HighlightLink.astro`

```astro
---
interface Props { href: string; class?: string; }
const { href, class: className = "" } = Astro.props;
---
<a href={href} class:list={["highlight-link", className]}>
  <span class="highlight-link__text"><slot /></span>
</a>

<style>
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
  .highlight-link:hover .highlight-link__text { color: var(--color-surface); }
  @media (prefers-reduced-motion: reduce) {
    .highlight-link::before, .highlight-link:hover::before { transition: none; }
  }
</style>
```

## Usage

```astro
<nav class="flex gap-6">
  <NavLink href="/about">About</NavLink>
  <NavLink href="/work" active>Work</NavLink>
  <NavLink href="/contact">Contact</NavLink>
</nav>

<p>
  Read our full <SlideLink href="/manifesto">founding manifesto</SlideLink> to understand why.
</p>

<p class="text-3xl">
  We make things that <HighlightLink href="/work">work in production</HighlightLink>.
</p>
```
