# MagazineGrid — `.astro`

Asymmetric editorial grid for article/work/journal index pages. Mixed card sizes, varied aspect ratios, careful whitespace. Pure `.astro`; per-card `animation-timeline: view()` on entrance.

## Dimensional fit

- surface-depth: light (default), dark possible
- motion-register: restrained, moderate
- texture-appetite: medium, high
- type-personality: humanist-serif, editorial-display
- notes: Editorial-first directions only. On consumer or technical directions, use `BentoGrid` instead.

## File

### `src/components/sections/MagazineGrid.astro`

```astro
---
interface Entry {
  eyebrow?: string;
  title: string;
  excerpt?: string;
  href: string;
  image: { src: string; alt: string };
  size?: "sm" | "md" | "lg";
}
interface Props {
  kicker?: string;
  title?: string;
  entries: Entry[];
}
const { kicker, title, entries } = Astro.props;
---
<section class="mg">
  {(kicker || title) && (
    <header class="mg__header">
      {kicker && <p class="mg__kicker">{kicker}</p>}
      {title && <h2 class="mg__title">{title}</h2>}
    </header>
  )}

  <div class="mg__grid">
    {entries.map((e, i) => (
      <a href={e.href} class:list={["mg__entry", `is-${e.size ?? "md"}`]} style={`--i: ${i};`}>
        <figure class="mg__figure">
          <img src={e.image.src} alt={e.image.alt} width="1200" height="900" loading="lazy" />
        </figure>
        <div class="mg__body">
          {e.eyebrow && <p class="mg__eyebrow">{e.eyebrow}</p>}
          <h3 class="mg__entry-title">{e.title}</h3>
          {e.excerpt && <p class="mg__excerpt">{e.excerpt}</p>}
        </div>
      </a>
    ))}
  </div>
</section>

<style>
  .mg { max-width: 84rem; margin: 0 auto; padding: 5rem 1.5rem; }
  .mg__header { max-width: 52rem; margin-bottom: 3.5rem; }
  .mg__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
  .mg__title { font-family: var(--font-display); font-size: clamp(2rem, 4vw, 3rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 22ch; }

  .mg__grid {
    display: grid;
    grid-template-columns: repeat(12, 1fr);
    gap: 2rem 1.5rem;
  }

  .mg__entry {
    grid-column: span 12;
    opacity: 0; translate: 0 14px;
    animation: mg-in 650ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i) * 80ms);
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  @media (min-width: 768px) {
    .mg__entry.is-sm { grid-column: span 4; }
    .mg__entry.is-md { grid-column: span 6; }
    .mg__entry.is-lg { grid-column: span 12; }
  }

  .mg__figure { margin: 0; overflow: hidden; border-radius: 1rem; aspect-ratio: 3 / 2; }
  .mg__entry.is-lg .mg__figure { aspect-ratio: 21 / 9; }
  .mg__entry.is-sm .mg__figure { aspect-ratio: 4 / 5; }
  .mg__figure img {
    width: 100%; height: 100%; object-fit: cover;
    transition: scale 700ms cubic-bezier(0.2, 0.8, 0.2, 1);
  }
  .mg__entry:hover .mg__figure img { scale: 1.02; }

  .mg__body { margin-top: 1.25rem; max-width: 56ch; }
  .mg__eyebrow { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.12em; text-transform: uppercase; color: var(--color-secondary); }
  .mg__entry-title {
    font-family: var(--font-display);
    font-size: clamp(1.25rem, 2vw, 1.75rem);
    letter-spacing: -0.01em;
    margin-top: 0.5rem;
  }
  .mg__excerpt { margin-top: 0.5rem; color: var(--color-secondary); }

  @keyframes mg-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .mg__entry { animation: none; opacity: 1; translate: 0 0; }
    .mg__figure img, .mg__entry:hover .mg__figure img { transition: none; scale: 1; }
  }
</style>
```
