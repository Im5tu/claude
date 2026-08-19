# Trend: Scroll-Linked Text Effects

## What It Is
Text properties that change continuously as the user scrolls, linked to scroll position via `animation-timeline: scroll()` / `view()` rather than triggered once at viewport entry. The distinction is critical: scroll-triggered text animations fire once (text fades in, then stays) and are entrance choreography. Scroll-linked text effects are ongoing — the text's visual properties are live-mapped to scroll position and change as long as the user is scrolling through the relevant section.

Examples of scroll-linked text effects: words transition from `color: #999` (grey) to `color: #000` (black) as they "pass through" the viewport centre, creating a reading-progress highlight effect (the Apple "shot on iPhone" style). A headline's `letter-spacing` narrows from `0.2em` to `0` as the user scrolls down, giving the visual impression of the text tightening or focusing. Text `color` interpolates between two brand colours over the height of a section. A word's `font-weight` shifts from 300 to 700 as it crosses the viewport midpoint (requires a variable font). Individual characters scale from `0.8` to `1` as they enter and pass through the viewport.

## Implementation

Pure CSS. Every effect is an `@property`-registered variable interpolating via `animation-timeline: view()` (per-word) or `scroll()` (per-section).

```css
/* Word-by-word reading progress: grey → accent */
.scroll-word {
  color: color-mix(in oklab, currentColor 40%, transparent);
  animation: sw-fill linear both;
  animation-timeline: view();
  animation-range: entry 20% cover 60%;
}
@keyframes sw-fill { to { color: var(--color-primary); } }

/* Headline letter-spacing tightens as the section enters */
@property --tr { syntax: "<length>"; inherits: false; initial-value: 0.2em; }
.headline {
  letter-spacing: var(--tr);
  animation: hd-tighten linear both;
  animation-timeline: view();
  animation-range: entry 0% cover 80%;
}
@keyframes hd-tighten { to { --tr: 0em; } }

/* Colour interpolation over full section scroll */
.statement-text {
  animation: st-colour linear both;
  animation-timeline: view(block);
  animation-range: cover 0% cover 100%;
}
@keyframes st-colour {
  from { color: var(--color-secondary); }
  to   { color: var(--color-accent); }
}

@media (prefers-reduced-motion: reduce) {
  .scroll-word, .headline, .statement-text { animation: none; }
}
```

Premium execution: the text effect reinforces the content's meaning. A headline about "clarity" tightens its tracking as the user scrolls, literally becoming clearer. A word about "growth" fills with brand colour from left to right as the user scrolls past it. A paragraph about "precision" narrows its letter-spacing to a tight, precise setting. When the animation is semantic — when it means something — the effect elevates from decoration to communication. When it is applied generically (every heading tightens its tracking), it becomes wallpaper.

## Premium Signals
- Scroll-linked text effects where the visual transformation is semantic — the animation means something relative to the word or phrase it affects
- `prefers-reduced-motion` disables scrub-linked effects and falls back to instant states or simple fades — never ignored

## Anti-Execution Warnings
- **Scroll-linked text effects on body copy** — animating the colour or spacing of body text that users are trying to read creates interference. Scroll-linked text effects should target display typography (headlines, pull quotes, statements) that is meant to be experienced, not read word-by-word.
- **Every section using the same scroll technique** — a page where every section uses the same text effect creates monotony. Scroll storytelling techniques are punctuation marks, not the typeface. They should appear at 2–3 key narrative moments per page, interleaved with standard flowing sections.

## Context Signals
Use when the brief signals: typographic brands where "words matter," manifesto-style content, hero statements that deserve more than a static display, brand voice is a primary differentiator, the copy itself is the hero content
Avoid when: the text is informational body copy meant to be read at the user's pace, the effect does not reinforce the content's meaning (arbitrary colour shifts on unrelated headlines), the page has many text sections (overuse turns the effect into wallpaper), or the text is long enough that the scroll distance required to complete the effect becomes tedious
Cross-aesthetic applications: A refined professional brand can use the word-by-word reading progress effect on a mission statement — it slows the reader down and demands attention, giving weight to every word. An editorial minimal brand can use letter-spacing tightening on a flagship headline because the typographic manipulation IS the design — the text is both content and ornament. A brand built around a core statement where words are the primary design medium can use colour interpolation on a tagline, transitioning from neutral to the brand's accent colour as words are "activated" by scroll — the colour arrival should feel like illumination, not decoration; the specific colours derive from the brief's palette.
Implementation threshold: The text effect must be semantic — the animation must mean something in relation to the content it affects. Generic application (every headline tightens its tracking, every heading changes colour) is worse than no effect at all.

## Longevity Signal
Ascending — underused outside creative agency portfolios. The word-by-word reading progress pattern is beginning to appear on brand and editorial sites. Semantic text effects (where the animation reinforces meaning) remain rare and premium.
