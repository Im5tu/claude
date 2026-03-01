# Trend: Extremely Tight and Loose Tracking

## What It Is
Both tracking extremes used deliberately and separately. Tight (`tracking-[-0.04em]` to `tracking-[-0.06em]`) on oversized display headlines — at large sizes, default tracking creates visible gaps between letters that look unrefined. Loose (`tracking-[0.12em]` to `tracking-[0.2em]`) on short caps labels, eyebrow text, and section markers. The contrast between tight display and loose labels is a hallmark of high-craft typography. Never apply tight tracking to body text below 20px — at small sizes, negative tracking reduces legibility without visible benefit.

## Implementation
```css
.display-headline {
  letter-spacing: -0.04em; /* tight tracking at display sizes */
}

.caps-label {
  text-transform: uppercase;
  letter-spacing: 0.15em; /* loose tracking on labels */
}
```

## Premium Signals
- Tracking values chosen per element — not a global decision applied everywhere

## Anti-Execution Warnings
- **Tight tracking on body text** — `tracking-tight` on 16px body text reduces readability measurably. Tight tracking is a display-size technique only.

## Context Signals
Use when the brief signals: a design that must communicate craft and typographic sophistication at a glance; display headlines at 48px+ where default tracking produces visible, unrefined gaps; short labels, eyebrow text, or section markers that need to occupy horizontal space without increasing font size.
Avoid when: the content is body text below 20px (tight tracking reduces legibility without visible benefit at small sizes); the design uses a typeface with built-in optical-size tracking that already compensates at display sizes; the tracking values would be applied globally rather than per-element.
Cross-aesthetic applications: A minimalist, restrained brand can use extreme tracking contrast when the brief describes "quiet precision" — very tight display headlines paired with widely tracked section labels create a hierarchy built entirely on spacing, without relying on weight or colour. A bold, high-energy brand can use tight tracking on oversized type when the brief describes "compressed energy" or "density" — the letterforms lock together into a visual block that reads as a single graphic element.
Implementation threshold: Tight and loose tracking must appear on the same page as deliberate opposites — one without the other is invisible. The contrast between `tracking-[-0.04em]` on a display headline and `tracking-[0.15em]` on its label is the design move; either value in isolation is just a setting.

## Longevity Signal
Mature — standard in refined execution. Anti-pattern: applying them inconsistently.
