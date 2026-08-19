# TestimonialMarquee — `.astro`

Infinite horizontal scroll of short testimonial cards. Uses the shared `MarqueeScroller` pattern — pure CSS, no JS.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive (skip on restrained)
- texture-appetite: low, medium
- type-personality: any
- notes: Quotes must be short (under 20 words). Longer quotes break the pacing.

## File

### `src/components/sections/TestimonialMarquee.astro`

```astro
---
import MarqueeScroller from "../sections/MarqueeScroller.astro";

interface Short { quote: string; name: string; role: string; }
interface Props { testimonials: Short[]; direction?: "left" | "right"; duration?: number; }
const { testimonials, direction = "left", duration = 55 } = Astro.props;
---
<section class="tm">
  <MarqueeScroller direction={direction} duration={duration} pauseOnHover>
    {testimonials.map((t) => (
      <article class="tm__card">
        <p class="tm__quote">“{t.quote}”</p>
        <p class="tm__attr">{t.name} · {t.role}</p>
      </article>
    ))}
  </MarqueeScroller>
</section>

<style>
  .tm { padding: 4rem 0; }
  .tm__card {
    flex: 0 0 22rem;
    padding: 1.5rem;
    margin-right: 1.25rem;
    background: var(--color-surface-secondary);
    border: 1px solid var(--color-border);
    border-radius: 1.25rem;
  }
  .tm__quote {
    font-family: var(--font-display);
    font-size: 1rem;
    letter-spacing: -0.01em;
    line-height: 1.5;
  }
  .tm__attr {
    margin-top: 0.75rem;
    font-size: 0.75rem;
    color: var(--color-secondary);
    letter-spacing: 0.04em;
    text-transform: uppercase;
  }
</style>
```

## Usage

```astro
<TestimonialMarquee testimonials={[
  { quote: "Half the ceremony. Twice the shipping cadence.", name: "Rachel Ashe", role: "Meridian Labs" },
  { quote: "They made our stack boring. That's the review.", name: "Dan Olenga", role: "Apex" },
  { quote: "Six engineering weeks back per quarter.", name: "Priya Kohli", role: "Halcyon" },
  { quote: "Quiet, exact, on time, under budget.", name: "Nate Fuller", role: "Orbit Systems" },
  { quote: "Our worst launch since working with them was uneventful.", name: "Kim Vermeer", role: "Kestrel" },
]} />
```
