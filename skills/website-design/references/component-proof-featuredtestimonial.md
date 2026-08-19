# FeaturedTestimonial — `.astro`

One large, editorial-weight testimonial with portrait, pull-quote display treatment, and attribution. Pure `.astro`.

## Dimensional fit

- surface-depth: any
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, editorial-display

## File

### `src/components/sections/FeaturedTestimonial.astro`

```astro
---
interface Props {
  quote: string;
  author: { name: string; role: string; company: string; portrait?: { src: string; alt: string } };
  logo?: { src: string; alt: string };
}
const { quote, author, logo } = Astro.props;
---
<section class="ft">
  <figure class="ft__inner">
    <blockquote class="ft__quote">
      <span aria-hidden="true" class="ft__mark">“</span>
      {quote}
    </blockquote>
    <figcaption class="ft__caption">
      {author.portrait && (
        <img class="ft__portrait" src={author.portrait.src} alt={author.portrait.alt} width="96" height="96" loading="lazy" />
      )}
      <div>
        <p class="ft__name">{author.name}</p>
        <p class="ft__role">{author.role}, {author.company}</p>
      </div>
      {logo && <img class="ft__logo" src={logo.src} alt={logo.alt} height="28" loading="lazy" />}
    </figcaption>
  </figure>
</section>

<style>
  .ft { max-width: 68rem; margin: 0 auto; padding: 5rem 1.5rem; }
  .ft__inner {
    padding: 3rem;
    background: var(--color-surface-secondary);
    border-radius: 1.5rem;
    border: 1px solid var(--color-border);
    opacity: 0; translate: 0 16px;
    animation: ft-in 750ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ft__quote {
    font-family: var(--font-display);
    font-size: clamp(1.5rem, 3vw, 2.5rem);
    line-height: 1.2;
    letter-spacing: -0.02em;
    margin: 0;
    position: relative;
    max-width: 58ch;
  }
  .ft__mark {
    position: absolute;
    top: -0.4em; left: -0.4em;
    font-size: 3em;
    line-height: 1;
    color: var(--color-accent);
    opacity: 0.4;
  }
  .ft__caption {
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-top: 2rem;
    padding-top: 1.75rem;
    border-top: 1px solid var(--color-border);
  }
  .ft__portrait {
    width: 3rem; height: 3rem;
    border-radius: 999px;
    object-fit: cover;
  }
  .ft__name { font-weight: 500; }
  .ft__role { font-size: 0.875rem; color: var(--color-secondary); }
  .ft__logo { margin-left: auto; opacity: 0.75; }

  @keyframes ft-in { to { opacity: 1; translate: 0 0; } }
  @media (prefers-reduced-motion: reduce) {
    .ft__inner { animation: none; opacity: 1; translate: 0 0; }
  }
</style>
```

## Usage

```astro
<FeaturedTestimonial
  quote="They didn't rebuild our stack. They quietly made every single part of it 30% better."
  author={{
    name: "Rachel Ashe",
    role: "Head of Platform",
    company: "Meridian Labs",
    portrait: { src: "/rachel.jpg", alt: "Rachel Ashe in profile, studio light" },
  }}
  logo={{ src: "/logos/meridian.svg", alt: "Meridian Labs" }}
/>
```
