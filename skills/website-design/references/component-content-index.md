# Component Content — Index

Selection logic:
1. Many features at once, mixed importance? → BentoGrid
2. Each feature deserves its own full-width moment? → AlternatingRows
3. Distinct product areas where you want the user to explore? → FeatureTabs
4. Content-first, image-minimal, editorial brand? → MagazineGrid
5. Credibility through raw numbers? → StackedValueProps
6. Simple, scannable feature list? → IconGrid
7. Common objections or questions (5+)? → FAQAccordion

## Comparison Table

| Component | Use When | Visual Weight | Motion Profile | Dimension Fit |
|---|---|---|---|---|
| BentoGrid | 4-8 features with mixed importance; visual hierarchy via card size | heavy | moderate | contrast-dark: high, contrast-light: high, energy-energetic: high, energy-moderate: high |
| AlternatingRows | 2-4 features each with their own image; full-width rhythm | medium | moderate | contrast-dark: high, contrast-light: high, energy-restrained: high, energy-moderate: high |
| FeatureTabs | 3-5 distinct product areas; interactive explore | medium | moderate | contrast-light: high, energy-moderate: high, contrast-dark: medium |
| MagazineGrid | Editorial content with natural hierarchy; text-heavy | medium | minimal | contrast-dark: high, contrast-light: high, energy-energetic: high, energy-restrained + editorial: high |
| StackedValueProps | 3-4 powerful one-line propositions; type-as-design | light | minimal | contrast-dark: high, contrast-light: high, energy-restrained: high |
| IconGrid | 4-6 equal-importance features; quick-scan | light | minimal | contrast-light: high, energy-moderate: high, energy-restrained: high |
| FAQAccordion | 5+ genuine FAQs; objection handling; pre-conversion hesitation | light | minimal | all dimensions: high (universal) |

## Component Files
- [BentoGrid](component-content-bentogrid.md) — Mixed-size card grid. Asymmetric layout communicates feature hierarchy.
- [AlternatingRows](component-content-alternatingrows.md) — Full-width rows with image and text alternating sides.
- [FeatureTabs](component-content-featuretabs.md) — Tabbed section with GSAP cross-fade between product areas.
- [MagazineGrid](component-content-magazinegrid.md) — Editorial asymmetric grid with featured + secondary cards.
- [StackedValueProps](component-content-stackedvalueprops.md) — Vertical numbered stack. Typography carries the section.
- [IconGrid](component-content-icongrid.md) — Uniform grid of icon + title + description cards.
- [FAQAccordion](component-content-faqaccordion.md) — Animated accordion with grid-template-rows transition and weight-change indicators.
