# Component Hero — Index

Selection logic:
1. Does the brand have a strong image or photo asset? → FullBleedImageHero, SplitHero, FullBleedVideoHero, SplitHeroPortrait
2. Is typography the primary brand signal? → TypeHero, CenteredHero
3. Does the hero need a lead-gen form or CTA widget? → GradientMeshHero
4. Is the product the hero? → BentoHero, GradientMeshHero
5. Is motion a core brand expression? → TypeHero, FullBleedVideoHero

## Comparison Table

| Component | Use When | Visual Weight | Motion Profile | Dimension Fit |
|---|---|---|---|---|
| SplitHero | Brand has strong product image; equal text/visual weight needed | medium | minimal | contrast-light: high, energy-restrained: high, energy-moderate: high |
| FullBleedImageHero | Powerful editorial/atmospheric photograph available | heavy | minimal | contrast-dark: high, contrast-light: medium, energy-restrained: high |
| GradientMeshHero | SaaS hero needs lead-gen form or glass-card CTA | medium | moderate | contrast-light: high, energy-moderate: high, contrast-dark: medium |
| TypeHero | Typography IS the identity; single powerful concept | heavy | moderate | contrast-dark: medium, energy-energetic: high, motion-moderate: high |
| CenteredHero | Editorial-minimal; content-first, type-as-design | light | minimal | contrast-light: high, energy-restrained: high, motion-minimal: high |
| SplitHeroPortrait | Principal/maker is the brand; tall portrait image | medium | minimal | contrast-light: high, energy-restrained: high |
| BentoHero | Product has visual UI worth showing in bento grid | heavy | moderate | contrast-light: high, energy-moderate: high, energy-energetic: high |
| FullBleedVideoHero | High-quality atmospheric video asset available | heavy | high | contrast-dark: high, energy-energetic: high, motion-expressive: high |

## Component Files
- [SplitHero](component-hero-splithero.md) — Text/image split, 55/45, full viewport. Default for professional and artisan brands.
- [FullBleedImageHero](component-hero-fullbleedimage.md) — Full-screen background image with gradient overlay. Content bottom-left.
- [GradientMeshHero](component-hero-gradientmesh.md) — Animated gradient mesh background with glass card for form/CTA.
- [TypeHero](component-hero-typehero.md) — Oversized headline fills viewport. Typography IS the visual.
- [CenteredHero](component-hero-centered.md) — Centered editorial hero. Typography-first with generous whitespace.
- [SplitHeroPortrait](component-hero-splitheroportrait.md) — Text left + full-height portrait photo right.
- [BentoHero](component-hero-bentohero.md) — Bento grid of product screenshots as the hero visual.
- [FullBleedVideoHero](component-hero-fullbleedvideo.md) — Full-screen looping video background. Atmospheric motion.
