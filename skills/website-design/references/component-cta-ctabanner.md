# CTABanner

Large closing banner: one headline, optional sub line, one primary CTA, optional secondary. Full-bleed background. Static, no JS behavior.

## Dimensional fit

- surface-depth: any (most effective on dark)
- motion-register: any
- texture-appetite: any
- type-personality: any

## Structure

- `<section class="cta">` full-bleed, centered text; tone modifier class `cta--dark`, `cta--light`, or `cta--accent`
  - `.cta__inner` centered container, max-width 56rem
    - optional `.cta__eyebrow` `<p>` (mono, uppercase)
    - `.cta__headline` `<h2>`
    - optional `.cta__sub` `<p>`
    - `.cta__actions` inline-flex row: primary CTA as a hero-weight button link, optional secondary as a ghost button link

## CSS

```css
.cta {
  padding: 7rem 1.5rem;
  text-align: center;
}
.cta--dark {
  background: #0A0A0A;
  color: #F5F5F5;
}
.cta--light {
  background: var(--color-surface-secondary);
  color: var(--color-text-primary);
}
.cta--accent {
  background: var(--color-accent);
  color: var(--color-surface-primary);
}
.cta__inner {
  max-width: 56rem;
  margin: 0 auto;
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

@keyframes cta-in {
  from { opacity: 0; translate: 0 16px; }
  to   { opacity: 1; translate: 0 0; }
}
@supports (animation-timeline: view()) {
  .cta__inner {
    animation: cta-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
}
@media (prefers-reduced-motion: reduce) {
  .cta__inner { animation: none; }
}
```

## Notes

- Dark tone uses literal `#0A0A0A` / `#F5F5F5` because the token set has no dedicated dark-surface pair; swap for the site's dark surface values if it defines them.
- Entrance keyframes carry the `from { opacity: 0 }` state and the animation only applies inside `@supports (animation-timeline: view())`, so engines without scroll-driven animations show the banner statically.
- Example content: eyebrow "Ready when you are", headline "Let's ship something quiet.", sub "Two-week engagements start at £24k. We reply within one working day.", primary "Book a call" to /contact, secondary "See case studies" to /work, dark tone.
