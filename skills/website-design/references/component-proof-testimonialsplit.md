# TestimonialSplit — `.astro`

Split layout: testimonial quote on one side, case-study summary + outcome stats on the other. Links through to the full case study.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, geometric-sans

## File

### `src/components/sections/TestimonialSplit.astro`

```astro
---
import Button from "../ui/Button.astro";
import CounterTicker from "../ui/CounterTicker.astro";

interface Outcome { to: number; suffix?: string; label: string; }
interface Props {
  quote: string;
  author: { name: string; role: string; company: string; portrait?: { src: string; alt: string } };
  caseStudy: {
    title: string;
    summary: string;
    href: string;
    cta?: string;
    outcomes?: Outcome[];
  };
}
const { quote, author, caseStudy } = Astro.props;
---
<section class="ts">
  <div class="ts__quote">
    <blockquote>“{quote}”</blockquote>
    <figcaption>
      {author.portrait && (
        <img src={author.portrait.src} alt={author.portrait.alt} width="96" height="96" loading="lazy" />
      )}
      <div>
        <p class="ts__name">{author.name}</p>
        <p class="ts__role">{author.role}, {author.company}</p>
      </div>
    </figcaption>
  </div>

  <div class="ts__study">
    <h3 class="ts__study-title">{caseStudy.title}</h3>
    <p class="ts__study-body">{caseStudy.summary}</p>

    {caseStudy.outcomes && (
      <ul class="ts__outcomes">
        {caseStudy.outcomes.map((o) => (
          <li>
            <p class="ts__outcome-value">
              <CounterTicker to={o.to} suffix={o.suffix ?? ""} />
            </p>
            <p class="ts__outcome-label">{o.label}</p>
          </li>
        ))}
      </ul>
    )}

    <div class="ts__cta">
      <Button as="a" href={caseStudy.href} variant="ghost">
        {caseStudy.cta ?? "Read the case study"}
      </Button>
    </div>
  </div>
</section>

<style>
  .ts {
    max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem;
    display: grid;
    grid-template-columns: 1fr;
    gap: 3rem;
  }
  @media (min-width: 1024px) {
    .ts { grid-template-columns: 5fr 7fr; gap: 4rem; }
  }

  .ts__quote {
    opacity: 0; translate: 0 14px;
    animation: ts-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view(); animation-range: entry 0% cover 30%;
  }
  .ts__quote blockquote {
    font-family: var(--font-display);
    font-size: clamp(1.5rem, 2.5vw, 2rem);
    line-height: 1.25;
    letter-spacing: -0.02em;
    margin: 0;
  }
  .ts__quote figcaption {
    display: flex; align-items: center; gap: 1rem;
    margin-top: 1.5rem;
    padding-top: 1.5rem;
    border-top: 1px solid var(--color-border);
  }
  .ts__quote figcaption img {
    width: 3rem; height: 3rem; border-radius: 999px; object-fit: cover;
  }
  .ts__name { font-weight: 500; }
  .ts__role { font-size: 0.875rem; color: var(--color-secondary); }

  .ts__study {
    padding: 2rem;
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
    border-radius: 1.25rem;
    opacity: 0; translate: 0 14px;
    animation: ts-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) 140ms both;
    animation-timeline: view(); animation-range: entry 0% cover 30%;
  }
  .ts__study-title {
    font-family: var(--font-display);
    font-size: clamp(1.25rem, 2vw, 1.75rem);
    letter-spacing: -0.01em;
  }
  .ts__study-body { margin-top: 0.75rem; color: var(--color-secondary); max-width: 58ch; }
  .ts__outcomes {
    list-style: none; padding: 0;
    display: grid; gap: 1.25rem;
    grid-template-columns: repeat(auto-fit, minmax(8rem, 1fr));
    margin-top: 1.75rem;
  }
  .ts__outcome-value {
    font-family: var(--font-display);
    font-size: clamp(1.5rem, 2.5vw, 2.25rem);
    color: var(--color-accent);
    letter-spacing: -0.02em;
  }
  .ts__outcome-label { font-size: 0.75rem; letter-spacing: 0.06em; text-transform: uppercase; opacity: 0.7; margin-top: 0.25rem; }
  .ts__cta { margin-top: 2rem; }

  @keyframes ts-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .ts__quote, .ts__study { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```
