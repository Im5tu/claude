# Component Process — Index

Process sections communicate how something works. **Step numbers are ALWAYS static decorative text.** Never wrap process step numbers (01, 02, 03) in CounterTicker. CounterTicker is for stats and metrics only.

Selection logic:
1. Simple 3-5 step sequence? → NumberedSteps
2. Time-ordered history or milestone sequence? → HorizontalTimeline (editorial/professional) or VerticalTimeline (about pages)
3. Complex process with detailed sub-steps? → AccordionProcess

## Comparison Table

| Component | Use When | Visual Weight | Motion Profile | Dimension Fit |
|---|---|---|---|---|
| NumberedSteps | 3-5 simple sequential steps; universal process section | medium | minimal | contrast-dark: medium, contrast-light: high, energy-restrained: high, energy-moderate: high, energy-energetic: high |
| HorizontalTimeline | Phase-based delivery or roadmap; scroll-pinned on desktop | medium | moderate | contrast-light: high, energy-restrained: high, energy-moderate: medium |
| VerticalTimeline | About page history; alternating left/right entries | medium | minimal | contrast-light: high, energy-restrained: high |
| AccordionProcess | 4-7 complex steps with substantial sub-detail | light | moderate | contrast-dark: high, contrast-light: high, energy-restrained: high, energy-moderate: high |

## Component Files
- [NumberedSteps](component-process-numberedsteps.md) — Horizontal/vertical steps with connector lines
- [HorizontalTimeline](component-process-horizontaltimeline.md) — Scroll-pinned horizontal timeline
- [VerticalTimeline](component-process-verticaltimeline.md) — Alternating left/right vertical timeline
- [AccordionProcess](component-process-accordionprocess.md) — Expandable accordion steps with GSAP height animation
