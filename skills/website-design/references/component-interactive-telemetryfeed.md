# TelemetryFeed

A live-looking typewriter data stream. Pulsing cursor, character-by-character reveal, committed lines fade in below the previous ones, and the loop restarts when the script runs out. Needs JS behavior (state drives the typing timing).

## Dimensional fit

- surface-depth: dark (strongest), light possible on technical directions
- motion-register: moderate, expressive
- texture-appetite: low
- type-personality: geometric-sans + mono accent
- notes: Best for SaaS/data/tech products where a "live feed" metaphor supports the brand claim. Avoid on warm/editorial/consumer registers — feels incongruent.

## Structure

- `.feed` panel with `role="log"` and `aria-live="off"` (the loop is decorative; do not announce it)
  - `.feed__rail` grid of lines
    - one `.feed__line` per committed line, with `data-tone="ok|warn|err|info"` (default info)
      - `.feed__prefix` `<span>` (glyph such as →, ✓, Δ, ⚠) then a `<span>` with the body text
    - while typing, a trailing `.feed__line feed__line--typing` holding the partial text plus `.feed__cursor` (▍ glyph)

Line data: each line has a prefix, a body, and an optional tone. Example script:

- `→ query optimised (+64% throughput)` (ok)
- `✓ 13 auth tokens rotated` (ok)
- `Δ latency budget: 42ms / 200ms` (info)
- `⚠ retry queue drained in 0.8s` (warn)
- `→ nightly build shipped to 214 edges` (ok)

## CSS

The panel is deliberately dark in both themes (a terminal metaphor), so it uses literal colors rather than surface tokens.

```css
.feed {
  font-family: var(--font-mono);
  background: #0A0A0A;
  color: #E6E6E6;
  border-radius: 1rem;
  padding: 1.25rem;
  border: 1px solid color-mix(in oklab, currentColor 10%, transparent);
  overflow: hidden;
  min-height: 18rem;
}
.feed__rail { display: grid; gap: 0.35rem; font-size: 0.875rem; }
.feed__line {
  display: flex; gap: 0.75rem; align-items: baseline;
  opacity: 0;
  animation: line-in 300ms cubic-bezier(0.2, 0.8, 0.2, 1) forwards;
}
.feed__line[data-tone="ok"]   .feed__prefix { color: #4ade80; }
.feed__line[data-tone="warn"] .feed__prefix { color: #fbbf24; }
.feed__line[data-tone="err"]  .feed__prefix { color: #f87171; }
.feed__line[data-tone="info"] .feed__prefix { color: #7dd3fc; }
.feed__prefix { font-weight: 600; }
.feed__line--typing { opacity: 1; }
.feed__cursor { animation: cursor-blink 900ms steps(2) infinite; }
@keyframes line-in { to { opacity: 1; } }
@keyframes cursor-blink { to { opacity: 0; } }
@media (prefers-reduced-motion: reduce) {
  .feed__line, .feed__cursor { animation: none; opacity: 1; }
}
```

## Behavior

- State: the list of committed lines (capped at the most recent 6), the partial string currently being typed, a line index, and a character index into the current line.
- Typing tick: append one character of `prefix + " " + body` to the partial string, then schedule the next tick after 22ms plus a random 0–28ms jitter.
- When the current line is fully typed: commit it to the visible list (trimming to the last 6), clear the partial string, advance to the next line, and pause 420ms before typing resumes. Committed lines fade in via the 300ms `line-in` keyframes.
- When the script is exhausted: clear the visible list, reset to the first line, and pause 1500ms (configurable cycle pause) before the loop restarts.
- Start the loop only once the component is on screen; cancel any pending timer when the component is removed.
- If `(prefers-reduced-motion: reduce)` matches: skip the loop entirely and render the first 5 lines statically (the CSS also forces lines and cursor fully visible with no animation).

## Notes

- Mono font must be wired through the `--font-mono` token.
- Keep body strings short — long lines wrap and ruin the tape feel.
- Never use for real-time PII. This is a static looping animation, not a data source.
