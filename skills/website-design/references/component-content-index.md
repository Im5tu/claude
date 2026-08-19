# Component Content — Index

Content components present what the business does: services, features, value props. Most are pure `.astro` with `ScrollReveal` for entrance. FAQAccordion and FeatureTabs are Solid islands because state drives timing.

## Components

| Component | File kind | Best for |
|---|---|---|
| BentoGrid | `.astro` | Multi-product / platform; 4–9 tiles of varied content |
| AlternatingRows | `.astro` | 3–5 features each with text + visual; narrative flow |
| FeatureTabs | Solid island | Comparing variants of one thing; technical directions |
| MagazineGrid | `.astro` | Editorial register; asymmetric article/work grids |
| StackedValueProps | `.astro` | 3 core value props at section scale; restrained |
| IconGrid | `.astro` | Short feature list with icons; any register |
| FAQAccordion | Solid island | FAQ content; uses WAAPI height animation |

## Selection by dimensional position

| Position | First pick |
|---|---|
| Dark + restrained | StackedValueProps or AlternatingRows |
| Dark + expressive | BentoGrid |
| Light + restrained + editorial | MagazineGrid |
| Light + restrained | AlternatingRows |
| Light + moderate + technical | FeatureTabs or BentoGrid |
| Light + expressive | BentoGrid |
| Any | FAQAccordion (pairs with CTA below) |

## Rules

- At most two "grid"-style components per page. If you need BentoGrid AND IconGrid, you don't — merge.
- FeatureTabs must have 2–4 tabs. Five tabs is a list masquerading as a selector.
- FAQAccordion: 5–8 items ideal. Under 5, use `AlternatingRows`. Over 8, split into categories.
- Every below-fold content section uses `ScrollReveal` (see `core-animation.md`) for entrance.

## Component files

- [BentoGrid](component-content-bentogrid.md)
- [AlternatingRows](component-content-alternatingrows.md)
- [FeatureTabs](component-content-featuretabs.md)
- [MagazineGrid](component-content-magazinegrid.md)
- [StackedValueProps](component-content-stackedvalueprops.md)
- [IconGrid](component-content-icongrid.md)
- [FAQAccordion](component-content-faqaccordion.md)
