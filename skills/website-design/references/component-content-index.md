# Component content index

Content components present what the business does: services, features, value props. Most are static markup with a scroll-driven entrance. FAQAccordion and FeatureTabs need JS behavior because state drives timing.

## Components

| Component | Kind | Best for |
|---|---|---|
| BentoGrid | static | Multi-product / platform; 4–9 tiles of varied content |
| AlternatingRows | static | 3–5 features each with text + visual; narrative flow |
| FeatureTabs | needs JS behavior | Comparing variants of one thing; technical directions |
| MagazineGrid | static | Editorial register; asymmetric article/work grids |
| StackedValueProps | static | 3 core value props at section scale; restrained |
| IconGrid | static | Short feature list with icons; any register |
| FAQAccordion | needs JS behavior | FAQ content; animates panel height via the Web Animations API |

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

- At most two "grid"-style components per page. If you need BentoGrid AND IconGrid, you don't: merge.
- FeatureTabs must have 2–4 tabs. Five tabs is a list masquerading as a selector.
- FAQAccordion: 5–8 items ideal. Under 5, use `AlternatingRows`. Over 8, split into categories.
- Every below-fold content section gets a scroll-driven entrance (see `core-animation.md`).

## Component files

- [BentoGrid](component-content-bentogrid.md)
- [AlternatingRows](component-content-alternatingrows.md)
- [FeatureTabs](component-content-featuretabs.md)
- [MagazineGrid](component-content-magazinegrid.md)
- [StackedValueProps](component-content-stackedvalueprops.md)
- [IconGrid](component-content-icongrid.md)
- [FAQAccordion](component-content-faqaccordion.md)
