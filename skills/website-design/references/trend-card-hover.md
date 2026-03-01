# Trend: Card Hover Interactions

## What It Is
Cards that undergo substantial visual transformation on hover, revealing a designed hover state rather than a simple opacity change. Patterns: (1) **Image scale + overlay reveal** — `img` scales to `scale(1.08)` while a colour overlay fades from opacity 0 to opacity 0.7, with copy (title, CTA) sliding up from `y: 16` to `y: 0`. (2) **Content slide** — at rest, only title is visible; on hover, additional content (description, tags, CTA) slides up from below within an `overflow: hidden` container. (3) **Border illuminate** — a gradient border that rotates around the card on hover using `conic-gradient` and `@property` animation. CSS transition on the card: `transition: transform 300ms cubic-bezier(0.34, 1.56, 0.64, 1)` — the slight overshoot of cubic-bezier creates a springy feel. GSAP alternative: `gsap.to(card, { scale: 1.02, duration: 0.3, ease: 'back.out(1.2)' })`.

## Implementation
```css
/* Pattern 1: Image scale + overlay */
.card img {
  transition: transform 500ms ease;
}

.card:hover img {
  transform: scale(1.08);
}

.card .overlay {
  opacity: 0;
  transition: opacity 300ms ease;
}

.card:hover .overlay {
  opacity: 0.7;
}

/* Pattern 2: Content slide */
.card .hidden-content {
  transform: translateY(100%);
  transition: transform 300ms cubic-bezier(0.34, 1.56, 0.64, 1);
}

.card:hover .hidden-content {
  transform: translateY(0);
}

/* Springy card scale */
.card {
  transition: transform 300ms cubic-bezier(0.34, 1.56, 0.64, 1);
}

.card:hover {
  transform: scale(1.02);
}
```

## Premium Signals
- Card hover states that reveal a distinctly designed second state, not just a brightness change

## Anti-Execution Warnings
- **`transform: scale(1.5)` on card hover** — scale values above 1.05 cause layout disturbance (overflow clipping, adjacent cards shifting). Scale on cards: 1.02–1.03 maximum.
- **Card hover states that cause layout shift** — if the hover state reveals content that increases the card's height, it will shift adjacent cards. All hover reveals must occur within a fixed-height container using `overflow: hidden`.

## Context Signals
Use when the brief signals: a collection of items (services, projects, team members, features) where each item has a secondary layer of information worth revealing; the brand personality supports tactile interaction; the audience will browse and explore rather than scan and leave.
Avoid when: cards contain a single piece of information with nothing to reveal on hover; the primary audience is mobile-dominant (hover states are invisible on touch); the brief describes the experience as "scannable" or "at a glance."
Cross-aesthetic applications: A restrained, professional brand can use a single-property hover (subtle border colour shift + content slide) when the brief describes "understated confidence." A bold, expressive brand can use a multi-property transformation (scale + overlay + content reveal) when the brief describes "surprise" or "delight."
Implementation threshold: the hover state must be a distinctly designed second state, not a brightness adjustment. Scale values: 1.02–1.03 maximum. All reveals occur within a fixed-height container (`overflow: hidden`) to prevent layout shift.

## Longevity Signal
Mature — hover states are expected. The differentiator is the quality and intentionality of the designed hover state, not its presence.
