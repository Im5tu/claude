# Trend: Oversized Display Type

## What It Is
Headlines at `clamp(60px, 14vw, 180px)` — single words or short two-word phrases that fill the full viewport width. Type becomes landscape. The TypeHero pattern: no competing visual elements, the headline IS the design, with perfect optical kerning (`font-kerning: normal`, manual kern pairs for display sizes). Line breaks are controlled with `<br>` tags at specific breakpoints — not left to browser reflow. Works only with short, powerful copy. Five-word headlines at 14vw span too many lines and lose impact.

## Implementation
```css
.oversized-headline {
  font-size: clamp(60px, 14vw, 180px);
  font-kerning: normal;
  line-height: 0.9;
  letter-spacing: -0.04em;
}
```

## Premium Signals
- Oversized type with controlled line breaks — copy written specifically for the layout, not reflowed from a CMS

## Anti-Execution Warnings
- **Oversized type on busy backgrounds** — large thin letterforms disappear against complex photography or gradient meshes. Oversized type requires either a clean background or a text-shadow/backdrop strategy.
- **Oversized type with more than 6–8 words** — at 14vw, a sentence becomes unreadable. Oversized display is for phrases, not propositions.

## Context Signals
Use when the brief signals: a brand built on bold claims or short, definitive statements; hero sections where the product or idea IS the headline ("One word. That's the brand."); a creative or editorial positioning where type replaces imagery as the primary visual.
Avoid when: the headline copy runs longer than 6–8 words (oversized type turns long phrases into multi-line blocks that lose impact); the page has competing visual elements in the hero (photography, illustration, video) that fight with large type for attention; the CMS allows editors to write unbounded headline lengths.
Cross-aesthetic applications: A clinical, precision-focused brand can use oversized display type when the brief centres on a single metric or data point — "99.97%" at 14vw communicates confidence through scale alone. A warm, community-oriented brand can use oversized type when the brief features a one-word value or emotion — "Belong" at full viewport width becomes a statement of purpose, not a stylistic choice.
Implementation threshold: Line breaks must be explicitly controlled with `<br>` at defined breakpoints, not left to browser reflow. Copy must be written for the layout — if the headline cannot be shortened to fit, the technique is wrong for the content.

## Longevity Signal
Peaking — becoming a template default. Requires distinctive copy and controlled execution to stand out.
