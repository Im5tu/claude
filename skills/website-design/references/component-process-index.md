# Component process index

Process components present how the business works. Pick by register and step count.

| Component | Kind | Best for |
|---|---|---|
| NumberedSteps | static | 3–5 steps, any register |
| VerticalTimeline | static | 4–7 dated milestones, editorial / restrained |
| HorizontalTimeline | static (scroll-snap) | 4–6 equally-weighted phases, moderate register |
| AccordionProcess | needs JS behavior | 3–6 steps where body is optional detail |

## Selection

| Dimensional position | First pick |
|---|---|
| Dark + restrained | VerticalTimeline |
| Dark + expressive | AccordionProcess |
| Light + restrained | NumberedSteps |
| Light + restrained + editorial | VerticalTimeline |
| Light + moderate + technical | AccordionProcess or HorizontalTimeline |
| Light + expressive | HorizontalTimeline |

## Rules

- Never combine two process components in a single page.
- Step numbers (01, 02, 03) are static text, never CounterTicker.
- Use `StickyCardStack` (needs JS behavior) when you want a *single* high-motion process treatment, but count it against the motion budget.

## Component files

- [NumberedSteps](component-process-numberedsteps.md)
- [VerticalTimeline](component-process-verticaltimeline.md)
- [HorizontalTimeline](component-process-horizontaltimeline.md)
- [AccordionProcess](component-process-accordionprocess.md)
