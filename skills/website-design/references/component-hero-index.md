# Component hero — index

The hero is the first section on every homepage. Its job: establish identity + set register + deliver the primary CTA in the first viewport. Pick the variant that matches the direction card.

All hero variants are static; none needs JS behavior. Entrance animation runs on page load via CSS `@keyframes` with per-element staggered `animation-delay`.

## Variants at a glance

| Variant | Visual mechanism | Best for |
|---|---|---|
| `TypeHero` | Typography IS the visual. Large display type, no background image. | Editorial display, anti-establishment, bold studios |
| `CenteredHero` | Centred headline, supporting paragraph, CTAs, modest visual below fold | Consumer, technical, moderate registers |
| `SplitHero` | Text left, image/visual right | Establishment, service firms, B2B |
| `SplitHeroPortrait` | Text left, portrait photo right | Founder-led, advisory, personal brand |
| `FullBleedImageHero` | Full-viewport photo with headline overlay | Hospitality, lifestyle, property, warm + texture-high |
| `FullBleedVideoHero` | Full-viewport looping video | Product demos, agency showcase, expressive energy |
| `GradientMeshHero` | Animated gradient mesh behind headline | Dark + technical or dark + expressive |
| `BentoHero` | Grid of tiles, one headline tile + multiple content tiles | Technical, platform, multi-product |

## Selection by dimensional position

| Dimensional position | First pick | Alternatives |
|---|---|---|
| Dark + restrained + humanist-serif | SplitHero or CenteredHero | GradientMeshHero (muted) |
| Dark + restrained + geometric-sans | GradientMeshHero | CenteredHero |
| Dark + expressive | TypeHero or FullBleedVideoHero | GradientMeshHero |
| Light + restrained + humanist-serif | SplitHero | CenteredHero |
| Light + restrained + texture-high | FullBleedImageHero | SplitHeroPortrait |
| Light + moderate + technical | BentoHero | CenteredHero |
| Light + expressive | TypeHero or BentoHero | FullBleedImageHero |
| Light + restrained + editorial | TypeHero | SplitHero |

## Rules

- **TypeHero must not have a background image.** Typography IS the visual. Adding imagery dilutes the register.
- **FullBleedVideoHero must have a poster image** that renders for `prefers-reduced-motion: reduce` users and for first-frame LCP.
- **BentoHero tiles stagger in** via CSS `animation-delay: calc(var(--i) * 80ms)`. Don't animate them all simultaneously.
- Every hero's headline uses `clamp()` for fluid scaling.
- Every hero's primary CTA uses the HeroButton variant of the Button spec (see `component-chrome-button.md`).

## Component files

- [TypeHero](component-hero-typehero.md)
- [CenteredHero](component-hero-centered.md)
- [SplitHero](component-hero-splithero.md)
- [SplitHeroPortrait](component-hero-splitheroportrait.md)
- [FullBleedImageHero](component-hero-fullbleedimage.md)
- [FullBleedVideoHero](component-hero-fullbleedvideo.md)
- [GradientMeshHero](component-hero-gradientmesh.md)
- [BentoHero](component-hero-bentohero.md)
