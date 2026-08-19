# StatsStrip

3–4 large numbers with labels. Each number animates with the CSS counter ticker below — a static "0+" on load is a banned pattern (it means the scroll timeline isn't firing).

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive
- texture-appetite: low, medium
- type-personality: geometric-sans, editorial-display
- notes: Only include if numbers are genuinely impressive AND attributable. "3 projects, 2 years, 100% satisfaction" is desperate — omit.

## Structure

- `<section class="ss">` centered container
  - optional kicker `<p class="ss__kicker">` (e.g. "By the numbers")
  - `<ul class="ss__row">`; one `<li>` per stat (1 column, 2 at >=640px, `--cols` at >=1024px, default 4)
    - value `<p class="ss__value">` containing the counter ticker plus any suffix text ("m", ".99%", "+")
    - label `<p class="ss__label">`
    - optional caption `<p class="ss__caption">` ("since 2019", "last 24 months")

Counter ticker markup (per value):

```html
<span class="ticker" style="--n-to: 47"><span class="ticker__static">47</span></span>
```

The final number appears twice: as `--n-to` (drives the animation) and as literal text (the static fallback).

## CSS

```css
.ss { max-width: 80rem; margin: 0 auto; padding: 4rem 1.5rem; }
.ss__kicker {
  font-family: var(--font-mono);
  font-size: 0.75rem; letter-spacing: 0.18em; text-transform: uppercase;
  color: var(--color-text-secondary);
  text-align: center;
  margin-bottom: 2.5rem;
}
.ss__row {
  list-style: none; padding: 0;
  display: grid;
  grid-template-columns: 1fr;
  gap: 2rem;
  text-align: center;
}
@media (min-width: 640px) { .ss__row { grid-template-columns: repeat(2, 1fr); } }
@media (min-width: 1024px) { .ss__row { grid-template-columns: repeat(var(--cols, 4), 1fr); } }

.ss__value {
  font-family: var(--font-display);
  font-size: clamp(3rem, 6vw, 5rem);
  line-height: 1;
  letter-spacing: -0.03em;
  color: var(--color-accent);
}
.ss__label {
  font-size: 0.875rem;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  opacity: 0.75;
  margin-top: 0.75rem;
}
.ss__caption {
  font-size: 0.75rem;
  opacity: 0.5;
  margin-top: 0.25rem;
  max-width: 22ch;
  margin-inline: auto;
}

/* entrance: scroll-driven stagger via per-item animation-range offsets
   (never a time delay — those are ignored on scroll timelines) */
@keyframes ss-in { from { opacity: 0; translate: 0 12px; } to { opacity: 1; translate: 0 0; } }
@supports (animation-timeline: view()) {
  .ss__row li {
    animation: ss-in 700ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 30%;
  }
  .ss__row li:nth-child(2) { animation-range: entry 8% cover 38%; }
  .ss__row li:nth-child(3) { animation-range: entry 16% cover 46%; }
  .ss__row li:nth-child(4) { animation-range: entry 24% cover 54%; }
}

/* counter ticker: animatable @property integer rendered through a CSS counter.
   Registration makes --n interpolate; counter() turns it into text. */
@property --n {
  syntax: "<integer>";
  initial-value: 0;
  inherits: false;
}
@keyframes tick-up { from { --n: 0; } to { --n: var(--n-to); } }
@supports (animation-timeline: view()) {
  .ticker {
    counter-reset: tick calc(var(--n));
    animation: tick-up 1200ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    animation-timeline: view();
    animation-range: entry 0% cover 40%;
  }
  .ticker::before { content: counter(tick); }
  .ticker__static { display: none; }
}
@media (prefers-reduced-motion: reduce) {
  .ss__row li { animation: none; }
  .ticker { animation: none; }
  .ticker::before { content: none; }
  .ticker__static { display: inline; }
}
```

## Behavior

- No JS. The ticker is pure CSS: registered `--n` interpolates 0 → `--n-to` on the element's view timeline; `counter-reset: tick calc(var(--n))` plus `content: counter(tick)` renders the integer.
- Engines supporting `animation-timeline: view()` also support `@property`, so the single `@supports` guard covers both; everywhere else the literal `.ticker__static` text shows unchanged.
- Reduced motion disables the animation and restores the static number (otherwise the counter would freeze at 0).

## Notes

- Decimal or suffixed values ("99.99%", "47m"): animate only the integer part with the ticker and print the rest as literal text in `.ss__value` (e.g. ticker for 99, literal ".99%").
- Captions are optional but useful — they contextualise the number ("since 2019", "last 24 months").
- Example set: 47m lines of code reviewed (since 2019), 99.99% platform uptime (last 24 months), 312 pull requests shipped (this quarter), 8 people in the studio.
