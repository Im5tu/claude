# Component Proof — Index

Proof sections validate claims. They are the evidence layer — stats, logos, testimonials, and case studies. Every proof section must provide real, specific evidence.

**CounterTicker rule (applies to StatsStrip only):**
- CounterTicker applies ONLY to numeric stats (revenue, clients, years, percentages)
- Process step numbers (01, 02, 03) are ALWAYS static text — never CounterTicker
- CounterTicker manages its own ScrollTrigger — do NOT wrap it in ScrollReveal

Selection logic:
1. Need to show scale quickly? → StatsStrip
2. Need to show who trusts you? → LogoStrip or MarqueeLogoStrip
3. Have 4+ short client quotes (1-2 sentences each)? → TestimonialMarquee
4. Have 1 strong + 2-3 supporting quotes? → TestimonialSplit
5. Have 2-4 equally strong client quotes? → TestimonialGrid
6. Have one extraordinary testimonial? → FeaturedTestimonial
7. Have measurable client outcomes? → CaseStudyTeaser

## Comparison Table

| Component | Use When | Visual Weight | Motion Profile | Dimension Fit |
|---|---|---|---|---|
| StatsStrip | 3-4 real impressive metrics; visual color break | heavy | moderate | all dimensions: high (universal) |
| LogoStrip | Client logos available (min 5); fastest credibility signal | light | none | all dimensions: high (universal) |
| MarqueeLogoStrip | Same as LogoStrip with infinite scroll motion | light | minimal | energy-moderate: high, energy-energetic: high |
| TestimonialMarquee | 4+ short client quotes (1-2 sentences); lightweight scrolling strip | light | minimal (CSS-only) | all dimensions: high (universal) |
| TestimonialSplit | 1 strong featured quote + 2-3 supporting quotes; asymmetric 7/5 split | medium | minimal | contrast-dark: high, contrast-light: high, energy-restrained: high, energy-moderate: high |
| TestimonialGrid | 2-4 equally strong client quotes; supports grid-3, grid-2-offset, masonry layouts | medium | minimal | contrast-light: high, energy-restrained: high, energy-moderate: high |
| FeaturedTestimonial | One extraordinary quote; singular authority | medium | minimal | contrast-dark: high, contrast-light: high, energy-restrained: high |
| CaseStudyTeaser | 2-3 projects with visual outcomes + measurable results | heavy | moderate | contrast-dark: high, energy-energetic: high, energy-moderate: high |

## Component Files
- [StatsStrip](component-proof-statsstrip.md) — Animated counter metrics on contrasting background
- [LogoStrip + MarqueeLogoStrip](component-proof-logostrip.md) — Grayscale client logos (static and marquee variants)
- [TestimonialMarquee](component-proof-testimonialmarquee.md) — Horizontal CSS marquee strip of short quotes (light weight, CSS-only animation)
- [TestimonialSplit](component-proof-testimonialsplit.md) — Asymmetric 7/5 split: 1 featured quote + 2-3 supporting quotes
- [TestimonialGrid](component-proof-testimonialgrid.md) — Card grid of 2-4 client testimonials (grid-3, grid-2-offset, masonry layouts)
- [FeaturedTestimonial](component-proof-featuredtestimonial.md) — Single large featured quote with word-by-word reveal
- [CaseStudyTeaser](component-proof-casestudyteaser.md) — Case study preview cards with hover overlay
