# AlternatingRows — `.astro`

3–5 rows alternating text-left/image-right and text-right/image-left. Narrative flow for features or process. Each row enters via `animation-timeline: view()`.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, geometric-sans
- notes: The workhorse content component. Low risk, high flexibility. Use 3 rows for restrained, up to 5 for expressive.

## File

### `src/components/sections/AlternatingRows.astro`

```astro
---
interface Row {
  eyebrow?: string;
  title: string;
  body: string;
  media: { src: string; alt: string };
  bullets?: string[];
}
interface Props {
  kicker?: string;
  title?: string;
  rows: Row[];
}
const { kicker, title, rows } = Astro.props;
---
<section class="ar">
  {(kicker || title) && (
    <div class="ar__header">
      {kicker && <p class="ar__kicker">{kicker}</p>}
      {title && <h2 class="ar__title">{title}</h2>}
    </div>
  )}

  <div class="ar__rows">
    {rows.map((r, i) => (
      <div class:list={["ar__row", i % 2 === 1 && "ar__row--flip"]}>
        <div class="ar__text">
          {r.eyebrow && <p class="ar__eyebrow">{r.eyebrow}</p>}
          <h3 class="ar__row-title">{r.title}</h3>
          <p class="ar__body">{r.body}</p>
          {r.bullets && (
            <ul class="ar__bullets">
              {r.bullets.map(b => <li>{b}</li>)}
            </ul>
          )}
        </div>
        <div class="ar__media">
          <img src={r.media.src} alt={r.media.alt} width="1200" height="800" loading="lazy" />
        </div>
      </div>
    ))}
  </div>
</section>

<style>
  .ar { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
  .ar__header { max-width: 52rem; margin-bottom: 4rem; }
  .ar__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
  .ar__title { font-family: var(--font-display); font-size: clamp(2rem, 4vw, 3rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 22ch; text-wrap: balance; }

  .ar__rows { display: grid; gap: 6rem; }

  .ar__row {
    display: grid;
    grid-template-columns: 1fr;
    gap: 2rem;
    align-items: center;
  }
  @media (min-width: 1024px) {
    .ar__row { grid-template-columns: 1fr 1fr; gap: 5rem; }
    .ar__row--flip .ar__text { order: 2; }
  }

  .ar__text {
    opacity: 0; translate: 0 16px;
    animation: ar-text-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ar__media {
    opacity: 0; translate: 0 24px;
    animation: ar-media-in 800ms cubic-bezier(0.2, 0.8, 0.2, 1) 120ms both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ar__media img { width: 100%; border-radius: 1.25rem; aspect-ratio: 3 / 2; object-fit: cover; }

  .ar__eyebrow { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.14em; text-transform: uppercase; color: var(--color-accent); }
  .ar__row-title { font-family: var(--font-display); font-size: clamp(1.5rem, 2.5vw, 2.25rem); letter-spacing: -0.02em; margin-top: 0.5rem; }
  .ar__body { margin-top: 0.75rem; max-width: 54ch; color: var(--color-secondary); }
  .ar__bullets { margin-top: 1rem; padding-left: 1.25rem; color: var(--color-secondary); display: grid; gap: 0.25rem; }

  @keyframes ar-text-in { to { opacity: 1; translate: 0 0; } }
  @keyframes ar-media-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .ar__text, .ar__media { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<AlternatingRows
  kicker="How we work"
  title="Three engagements, no surprises."
  rows={[
    {
      eyebrow: "Discover",
      title: "A week of listening before a line of code.",
      body: "We interview the team, read the backlog, and write a plain-English brief you can circulate.",
      media: { src: "/discover.jpg", alt: "Notebook and pen on a walnut desk" },
    },
    {
      eyebrow: "Ship",
      title: "Small pull requests, merged daily.",
      body: "Every change goes behind a feature flag. No big-bang launches.",
      media: { src: "/ship.jpg", alt: "Terminal screen reflected on a monitor" },
    },
    {
      eyebrow: "Operate",
      title: "We keep running it if you want.",
      body: "Monthly review, quarterly roadmap, twelve-month retainer option.",
      media: { src: "/operate.jpg", alt: "Graph on a laptop in low light" },
    },
  ]}
/>
```
