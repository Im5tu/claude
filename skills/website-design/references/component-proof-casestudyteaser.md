# CaseStudyTeaser — `.astro`

A single case-study preview card. Big image, eyebrow, title, outcomes bullets, CTA to the full page. Pure `.astro`.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: any

## File

### `src/components/sections/CaseStudyTeaser.astro`

```astro
---
import Button from "../ui/Button.astro";
import CounterTicker from "../ui/CounterTicker.astro";

interface Outcome { to: number; suffix?: string; label: string; }
interface Props {
  eyebrow: string;               // "Case study — Meridian"
  title: string;
  summary: string;
  href: string;
  image: { src: string; alt: string };
  outcomes?: Outcome[];
  cta?: string;
}
const { eyebrow, title, summary, href, image, outcomes, cta = "Read the case study" } = Astro.props;
---
<section class="cst">
  <article class="cst__inner">
    <figure class="cst__figure">
      <img src={image.src} alt={image.alt} width="1600" height="1000" loading="lazy" />
    </figure>
    <div class="cst__body">
      <p class="cst__eyebrow">{eyebrow}</p>
      <h3 class="cst__title">{title}</h3>
      <p class="cst__summary">{summary}</p>
      {outcomes && (
        <ul class="cst__outcomes">
          {outcomes.map(o => (
            <li>
              <p class="cst__outcome-value">
                <CounterTicker to={o.to} suffix={o.suffix ?? ""} />
              </p>
              <p class="cst__outcome-label">{o.label}</p>
            </li>
          ))}
        </ul>
      )}
      <div class="cst__cta">
        <Button as="a" href={href} variant="ghost">{cta}</Button>
      </div>
    </div>
  </article>
</section>

<style>
  .cst { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
  .cst__inner {
    display: grid;
    grid-template-columns: 1fr;
    gap: 2.5rem;
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
    border-radius: 1.5rem;
    overflow: hidden;
    opacity: 0; translate: 0 16px;
    animation: cst-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  @media (min-width: 1024px) {
    .cst__inner { grid-template-columns: 7fr 5fr; gap: 0; }
  }
  .cst__figure { margin: 0; }
  .cst__figure img { width: 100%; height: 100%; object-fit: cover; min-height: 20rem; aspect-ratio: 5 / 4; }
  .cst__body { padding: 2.5rem; }
  .cst__eyebrow { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.14em; text-transform: uppercase; color: var(--color-accent); }
  .cst__title { font-family: var(--font-display); font-size: clamp(1.5rem, 2.75vw, 2.25rem); letter-spacing: -0.02em; margin-top: 0.75rem; max-width: 20ch; text-wrap: balance; }
  .cst__summary { margin-top: 1rem; color: var(--color-secondary); max-width: 54ch; }
  .cst__outcomes {
    list-style: none; padding: 0;
    display: grid; gap: 1.25rem;
    grid-template-columns: repeat(auto-fit, minmax(7rem, 1fr));
    margin-top: 1.75rem;
  }
  .cst__outcome-value { font-family: var(--font-display); font-size: clamp(1.5rem, 2.5vw, 2rem); color: var(--color-accent); letter-spacing: -0.02em; }
  .cst__outcome-label { font-size: 0.75rem; letter-spacing: 0.06em; text-transform: uppercase; opacity: 0.7; margin-top: 0.25rem; }
  .cst__cta { margin-top: 2rem; }

  @keyframes cst-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .cst__inner { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```
