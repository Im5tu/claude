# CTABanner — `.astro`

Large closing banner: one headline, optional sub, one primary CTA, optional secondary. Full-bleed background. Pure `.astro`.

## Dimensional fit

- surface-depth: any (most effective on dark)
- motion-register: any
- texture-appetite: any
- type-personality: any

## File

### `src/components/sections/CTABanner.astro`

```astro
---
import HeroButton from "../ui/HeroButton.astro";
import Button from "../ui/Button.astro";

interface Props {
  eyebrow?: string;
  headline: string;
  sub?: string;
  primary: { label: string; href: string };
  secondary?: { label: string; href: string };
  tone?: "dark" | "light" | "accent";
}
const {
  eyebrow, headline, sub, primary, secondary, tone = "dark",
} = Astro.props;
---
<section class:list={["cta", `cta--${tone}`]}>
  <div class="cta__inner">
    {eyebrow && <p class="cta__eyebrow">{eyebrow}</p>}
    <h2 class="cta__headline">{headline}</h2>
    {sub && <p class="cta__sub">{sub}</p>}
    <div class="cta__actions">
      <HeroButton href={primary.href}>{primary.label}</HeroButton>
      {secondary && <Button variant="ghost" as="a" href={secondary.href}>{secondary.label}</Button>}
    </div>
  </div>
</section>

<style>
  .cta {
    padding: 7rem 1.5rem;
    text-align: center;
  }
  .cta--dark {
    background: var(--color-surface-dark, #0A0A0A);
    color: var(--color-primary-on-dark, #F5F5F5);
  }
  .cta--light {
    background: var(--color-surface-secondary);
    color: var(--color-primary);
  }
  .cta--accent {
    background: var(--color-accent);
    color: var(--color-surface);
  }
  .cta__inner {
    max-width: 56rem; margin: 0 auto;
    opacity: 0; translate: 0 16px;
    animation: cta-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .cta__eyebrow {
    font-family: var(--font-mono);
    font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
    opacity: 0.65;
  }
  .cta__headline {
    font-family: var(--font-display);
    font-size: clamp(2.5rem, 5vw, 4.5rem);
    line-height: 1;
    letter-spacing: -0.03em;
    margin-top: 1rem;
    max-width: 22ch;
    margin-inline: auto;
    text-wrap: balance;
  }
  .cta__sub {
    max-width: 52ch;
    margin: 1.25rem auto 0;
    opacity: 0.8;
  }
  .cta__actions {
    display: inline-flex;
    flex-wrap: wrap;
    gap: 0.75rem;
    margin-top: 2rem;
    justify-content: center;
  }

  @keyframes cta-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .cta__inner { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<CTABanner
  eyebrow="Ready when you are"
  headline="Let's ship something quiet."
  sub="Two-week engagements start at £24k. We reply within one working day."
  primary={{ label: "Book a call", href: "/contact" }}
  secondary={{ label: "See case studies", href: "/work" }}
  tone="dark"
/>
```
