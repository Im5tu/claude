# LogoStrip — `.astro`

Horizontal strip of client logos. Logos are real image files (SVG preferred). Plain-text company names are banned by `core-anti-patterns.md`.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any
- notes: Grayscale + desaturate by default so the strip reads as proof, not a logo parade.

## File

### `src/components/sections/LogoStrip.astro`

```astro
---
interface Logo { src: string; alt: string; width?: number; height?: number; }
interface Props {
  kicker?: string;
  logos: Logo[];          // 6-12 recommended
  grayscale?: boolean;
}
const { kicker, logos, grayscale = true } = Astro.props;
---
<section class="ls" data-gs={grayscale}>
  {kicker && <p class="ls__kicker">{kicker}</p>}
  <ul class="ls__row">
    {logos.map((l, i) => (
      <li style={`--i: ${i};`}>
        <img
          src={l.src}
          alt={l.alt}
          width={l.width ?? 140}
          height={l.height ?? 40}
          loading="lazy"
        />
      </li>
    ))}
  </ul>
</section>

<style>
  .ls { max-width: 80rem; margin: 0 auto; padding: 3rem 1.5rem; }
  .ls__kicker {
    font-family: var(--font-mono);
    font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
    color: var(--color-secondary);
    text-align: center;
    margin-bottom: 1.5rem;
  }
  .ls__row {
    list-style: none;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 2rem 3rem;
    align-items: center;
    justify-items: center;
    padding: 0;
  }
  @media (min-width: 768px) { .ls__row { grid-template-columns: repeat(4, 1fr); } }
  @media (min-width: 1024px) { .ls__row { grid-template-columns: repeat(6, 1fr); } }
  .ls__row li {
    opacity: 0; translate: 0 10px;
    animation: ls-in 500ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i) * 50ms);
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ls__row img {
    max-height: 2rem;
    width: auto;
    opacity: 0.7;
    transition: opacity var(--motion-duration-fast) var(--ease-out-soft),
                filter var(--motion-duration-fast) var(--ease-out-soft);
  }
  .ls[data-gs="true"] .ls__row img { filter: grayscale(1); }
  .ls__row li:hover img { opacity: 1; filter: grayscale(0); }

  @keyframes ls-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .ls__row li { animation: none; opacity: 1; translate: 0 0; }
    .ls__row img, .ls__row li:hover img { transition: none; }
  }
</style>
```

## Usage

```astro
<LogoStrip
  kicker="Trusted by"
  logos={[
    { src: "/logos/apex.svg", alt: "Apex Financial", width: 130 },
    { src: "/logos/meridian.svg", alt: "Meridian Labs", width: 150 },
    { src: "/logos/halcyon.svg", alt: "Halcyon", width: 120 },
    { src: "/logos/atlas.svg", alt: "Atlas Shipping", width: 120 },
    { src: "/logos/kestrel.svg", alt: "Kestrel Audio", width: 130 },
    { src: "/logos/orbit.svg", alt: "Orbit Systems", width: 110 },
  ]}
/>
```

## Rules

- Every logo must be a real file with a real alt — never a `<span>` with company text.
- If you do not have real logos, omit this section and use testimonials or case studies instead.
