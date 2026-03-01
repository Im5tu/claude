# Trend: Expressive Serifs

## What It Is
High-contrast serif fonts (Freight Display, Canela, Editorialist, pp-editorial) returning as the premium display choice, often mixed with geometric sans for body text. The combination creates the editorial register — authoritative at large sizes, clean and functional at reading sizes. Specific pairing logic: serif at 48px+, sans at 18px and below. On dark backgrounds, high-contrast serifs with thin strokes create elegance at large sizes but become illegible below 32px — avoid. The revival is driven by reaction to the monotony of variable geometric sans that dominated 2019–2023.

## Implementation
```css
.display-heading {
  font-family: 'Canela', 'Freight Display', serif;
  font-size: clamp(48px, 8vw, 96px);
}

.body-text {
  font-family: 'Figtree', 'Helvetica Neue', sans-serif;
  font-size: 18px;
}
```

## Premium Signals
- Serif/sans pairings where the serif font was chosen for its specific personality (not just "a serif"), visibly different from the body sans

## Anti-Execution Warnings
- **Serif body text at reading sizes on screen** — high-contrast serifs at 16–18px on screen have poor legibility at lower resolutions. Serifs should remain at 32px+ in display roles.
- **Serif chosen purely for the "premium" signal** — serif typefaces have personalities. A heritage serif (Garamond) on a Web3 startup reads as confused, not premium.

## Context Signals
Use when the brief signals: words like "editorial," "authoritative," "storied," "crafted," or "literary"; a brand whose personality has a point of view (opinion, curation, taste); content that benefits from the cultural register of print journalism, book design, or magazine layout.
Avoid when: the brand persona is purely technical, utilitarian, or speed-focused (a serif headline on a devtool dashboard reads as confused); the serif would appear below 32px on screen where high-contrast thin strokes become illegible; the brief describes "clean," "minimal," and "modern" without any editorial or heritage dimension.
Cross-aesthetic applications: A technology-forward, innovation-coded brand can use an expressive serif when the brief describes "the intersection of technology and humanity" or when the product is positioned as opinionated rather than neutral — the serif carries conviction that a geometric sans cannot. A vibrant, maximalist brand can pair an expressive display serif with a tight grid and saturated colour when the brief references "magazine covers" or "poster art" — the serif becomes part of the compositional density.
Implementation threshold: The serif must be chosen for its specific personality — Canela communicates differently from Freight Display, which communicates differently from Editorialist. A generic "serif font" selection, chosen only because serifs signal premium, fails the test.

## Longevity Signal
Ascending — the pendulum away from geometric sans is still in motion. Strong bet through 2026–2027.
