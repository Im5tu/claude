# Component Proof — Index

Proof components present the evidence: client logos, stats, testimonials, case studies. Include only when the evidence is real and specific. A thin proof section is worse than none.

| Component | Kind | Best for |
|---|---|---|
| LogoStrip | static | 6–12 real client logos (image files, never text) |
| StatsStrip | static | 3–4 genuinely impressive numbers with the CSS counter ticker |
| FeaturedTestimonial | static | One extended testimonial with portrait, long-form |
| TestimonialGrid | static | 4–6 shorter testimonials in a grid |
| TestimonialSplit | static | One testimonial + supporting case-study summary |
| TestimonialMarquee | static | Scrolling ticker of short quotes (CSS marquee) |
| CaseStudyTeaser | static | Single case study preview linking to the full page |

None of these components needs JS behavior; all motion is CSS (scroll-driven entrances, the counter ticker, the marquee loop).

## Selection

| Dimensional position | First pick |
|---|---|
| Dark + restrained | FeaturedTestimonial |
| Dark + expressive | TestimonialMarquee |
| Light + restrained + editorial | FeaturedTestimonial or TestimonialSplit |
| Light + moderate + technical | LogoStrip + StatsStrip |
| Light + expressive | TestimonialGrid or TestimonialMarquee |

## Rules

- **LogoStrip logos must be image files.** A row of plain-text company names is a list, not proof.
- **StatsStrip numbers must animate via the CSS counter ticker** (specced in StatsStrip). Static "0+" on load means the scroll timeline isn't firing — debug before ship. On engines without scroll timelines the static fallback number must show.
- Only include a proof section when you have specific, attributable, verifiable evidence. Invented testimonials are worse than none.
- Two proof components per page max.

## Component files

- [LogoStrip](component-proof-logostrip.md)
- [StatsStrip](component-proof-statsstrip.md)
- [FeaturedTestimonial](component-proof-featuredtestimonial.md)
- [TestimonialGrid](component-proof-testimonialgrid.md)
- [TestimonialSplit](component-proof-testimonialsplit.md)
- [TestimonialMarquee](component-proof-testimonialmarquee.md)
- [CaseStudyTeaser](component-proof-casestudyteaser.md)
