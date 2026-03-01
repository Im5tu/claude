# Trend: Gradient Text

## What It Is
A single accent word within a headline rendered with a gradient fill via `background: linear-gradient(135deg, color1, color2); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent; display: inline-block;`. The critical constraint: the gradient lands on ONE word — the word that carries the emotional or strategic weight of the headline — never the entire heading and never body text. Gradient colours are drawn from the brand palette at a 90–135 degree angle; generic purple-to-blue or rainbow spectrums signal stock templates, not considered design. `display: inline-block` is non-negotiable — without it, the background-clip fails to contain the gradient to the text bounds. Animated variant: `background-size: 200% 200%` with a slow `background-position` shift via CSS animation or GSAP, producing a colour that appears to breathe within the word. Scroll-driven variant: `background-position` animated via GSAP `ScrollTrigger` with `scrub: 1`, so the headline "fills with colour" as the user scrolls to it — the gradient begins desaturated or single-colour and resolves into full gradient at the scroll midpoint. The anti-pattern (gradient applied to the full headline) is documented in `core-anti-patterns.md`; this technique is the precise, restrained alternative.

## Implementation
```css
.gradient-word {
  background: linear-gradient(135deg, var(--color-accent), var(--color-accent-secondary));
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  display: inline-block; /* non-negotiable */
}

/* Animated variant */
.gradient-word-animated {
  background-size: 200% 200%;
  animation: gradient-shift 8s ease-in-out infinite alternate;
}

@keyframes gradient-shift {
  0% { background-position: 0% 50%; }
  100% { background-position: 100% 50%; }
}
```

```js
// Scroll-driven gradient fill
gsap.fromTo('.gradient-word', {
  backgroundPosition: '100% 50%',
}, {
  backgroundPosition: '0% 50%',
  scrollTrigger: {
    trigger: '.headline-section',
    start: 'top 60%',
    end: 'top 20%',
    scrub: 1,
  }
});
```

## Premium Signals
- A typographic hierarchy that communicates priority without relying on colour

## Anti-Execution Warnings
- Gradient applied to the full headline rather than a single word — documented as anti-pattern in `core-anti-patterns.md`
- Generic purple-to-blue or rainbow spectrums signal stock templates

## Context Signals
Use when the brief signals: a brand that describes itself as "dynamic," "energetic," or "forward-looking"; a hero headline with a single word that carries outsized emotional or strategic weight; a brand palette with two or more colours that produce a harmonious gradient at 90–135 degrees without muddy midpoints.
Avoid when: the brand palette consists of monochromatic or neutral tones where a gradient would require introducing off-brand colours; the headline word receiving the gradient is longer than ~12 characters (gradient bands compress and become indistinct); the page already uses gradient backgrounds, gradient buttons, and gradient borders — adding gradient text creates saturation.
Cross-aesthetic applications: A serious, institutional brand can use gradient text on a single word when the brief describes "transformation" or "evolution" — the colour shift within the word becomes a visual metaphor for change, not a decorative flourish. A dark, understated brand can use a scroll-driven gradient fill (desaturated to full colour on scroll) when the brief describes "revelation" or "emerging" — the technique serves the narrative without competing with the restrained surrounding design. A warm, lifestyle or artisan brand can use gradient text when the brand palette includes two harmonious analogous tones (amber to terracotta, sage to olive) and the brief identifies a single word that embodies the brand's sensory promise — the gentle tonal shift reinforces craft character without importing a digital aesthetic.
Implementation threshold: `display: inline-block` must be present for correct clip behaviour. The gradient uses exactly two brand-palette colours — not a stock purple-to-blue. Animated variants shift `background-position` slowly enough that the movement is felt, not seen as motion.

## Longevity Signal
N/A — Not explicitly listed in the source file's longevity section. As a technique, gradient text is mature when applied to single words with brand colours, but becomes a template signal when applied broadly.
