# TestimonialMarquee

Infinite horizontal scroll of short testimonial cards. Pure CSS marquee, no JS at runtime.

## Dimensional fit

- surface-depth: any
- motion-register: moderate, expressive (skip on restrained)
- texture-appetite: low, medium
- type-personality: any
- notes: Quotes must be short (under 20 words). Longer quotes break the pacing.

## Structure

- `<section class="tm">`
  - marquee viewport (overflow hidden, full width) containing a flex track
    - the set of cards, then a duplicate of the whole set with `aria-hidden="true"` (see Behavior)
    - each card: `<article class="tm__card">` with quote `<p class="tm__quote">` (wrapped in typographic quote marks) and attribution `<p class="tm__attr">` ("Name · Company")

## CSS

```css
.tm { padding: 4rem 0; }

.tm__viewport { overflow: hidden; }
.tm__track {
  display: flex;
  width: max-content;
  animation: tm-scroll var(--tm-duration, 55s) linear infinite;
}
.tm__viewport:hover .tm__track { animation-play-state: paused; }
/* direction "right": reverse the animation */
.tm--right .tm__track { animation-direction: reverse; }

@keyframes tm-scroll {
  from { translate: 0 0; }
  to { translate: -50% 0; } /* exactly one copy's width; loops seamlessly */
}

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
  color: var(--color-text-secondary);
  letter-spacing: 0.04em;
  text-transform: uppercase;
}

@media (prefers-reduced-motion: reduce) {
  .tm__track { animation: none; }
  .tm__viewport { overflow-x: auto; } /* cards remain reachable by manual scroll */
}
```

## Behavior

- The card set is duplicated once inside the track (the duplicate marked `aria-hidden="true"`), so the -50% translation lands exactly on the start of the second copy and the loop is seamless.
- Hovering the viewport pauses the animation (`animation-play-state: paused`).
- Default duration 55s; direction defaults to leftward, `tm--right` reverses it.
- Reduced motion stops the marquee and exposes the cards via normal horizontal scrolling.

## Notes

- Example register: "Half the ceremony. Twice the shipping cadence." — Rachel Ashe · Meridian Labs; "They made our stack boring. That's the review." — Dan Olenga · Apex. Five or more distinct quotes keeps the loop from feeling thin.
- Card width is fixed at 22rem; the duplicate-and-translate loop needs uniform spacing (the 1.25rem margin-right), so don't switch to gap on the track without adjusting the -50% math.
