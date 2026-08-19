# TestimonialGrid — `.astro`

4–6 shorter testimonials laid out in a grid. Each card has a quote, a short attribution, optional company logo.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any

## File

### `src/components/sections/TestimonialGrid.astro`

```astro
---
interface Testimonial {
  quote: string;
  name: string;
  role: string;
  company: string;
  logo?: { src: string; alt: string };
}
interface Props { testimonials: Testimonial[]; kicker?: string; title?: string; }
const { testimonials, kicker, title } = Astro.props;
---
<section class="tg">
  {(kicker || title) && (
    <header class="tg__header">
      {kicker && <p class="tg__kicker">{kicker}</p>}
      {title && <h2 class="tg__title">{title}</h2>}
    </header>
  )}
  <ul class="tg__grid">
    {testimonials.map((t, i) => (
      <li class="tg__card" style={`--i: ${i};`}>
        <blockquote class="tg__quote">“{t.quote}”</blockquote>
        <figcaption class="tg__caption">
          <div>
            <p class="tg__name">{t.name}</p>
            <p class="tg__role">{t.role}, {t.company}</p>
          </div>
          {t.logo && <img src={t.logo.src} alt={t.logo.alt} height="20" loading="lazy" />}
        </figcaption>
      </li>
    ))}
  </ul>
</section>

<style>
  .tg { max-width: 80rem; margin: 0 auto; padding: 5rem 1.5rem; }
  .tg__header { max-width: 52rem; margin-bottom: 3rem; }
  .tg__kicker { font-family: var(--font-mono); font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase; color: var(--color-accent); }
  .tg__title { font-family: var(--font-display); font-size: clamp(1.75rem, 3.5vw, 2.5rem); letter-spacing: -0.02em; margin-top: 0.75rem; }

  .tg__grid {
    list-style: none; padding: 0;
    display: grid; gap: 1.25rem;
    grid-template-columns: 1fr;
  }
  @media (min-width: 768px) { .tg__grid { grid-template-columns: repeat(2, 1fr); } }
  @media (min-width: 1024px) { .tg__grid { grid-template-columns: repeat(3, 1fr); } }

  .tg__card {
    padding: 1.75rem;
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
    border-radius: 1.25rem;
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
    opacity: 0; translate: 0 12px;
    animation: tg-in 600ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-delay: calc(var(--i) * 70ms);
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .tg__quote { margin: 0; font-family: var(--font-display); font-size: 1.125rem; line-height: 1.45; letter-spacing: -0.01em; }
  .tg__caption { display: flex; align-items: center; justify-content: space-between; gap: 1rem; }
  .tg__name { font-weight: 500; font-size: 0.9375rem; }
  .tg__role { font-size: 0.8125rem; color: var(--color-secondary); }

  @keyframes tg-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .tg__card { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```
