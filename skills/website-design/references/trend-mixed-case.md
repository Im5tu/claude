# Trend: Mixed Case and Capitalization

## What It Is
Selective ALL CAPS for labels, category tags, overlines, and short emphasis phrases. Mixed within a single typographic hierarchy: `CATEGORY LABEL` (caps, tracked) -> `Expressive Headline` (title case, display) -> `Supporting detail here` (sentence case, body). Tracking (`letter-spacing`) is the differentiator: `tracking-[0.15em]` on caps labels, `tracking-[-0.03em]` on display headlines, `tracking-normal` on body. The logic must be semantic — ALL CAPS signals categorisation and label-level information, not random emphasis.

## Implementation
```css
.label {
  text-transform: uppercase;
  letter-spacing: 0.15em;
  font-size: 12px;
}

.display-headline {
  text-transform: none; /* title case in markup */
  letter-spacing: -0.03em;
}

.body-text {
  text-transform: none; /* sentence case */
  letter-spacing: normal;
}
```

## Premium Signals
- Tracking values chosen per element — not a global decision applied everywhere
- A typographic hierarchy that communicates priority without relying on colour

## Anti-Execution Warnings
- **ALL CAPS applied to long-form content** — exhausting to read. Caps labels work at 2–5 words. Beyond that, sentence case reads faster.

## Context Signals
Use when the brief signals: a structured content hierarchy with distinct information tiers (category -> headline -> detail); a brand voice that uses formal labelling or taxonomy (common in editorial, finance, real estate, curated marketplaces); visual systems where typographic rhythm must substitute for colour or imagery.
Avoid when: the content structure is flat (no distinct category or label layer exists to warrant ALL CAPS treatment); the brief describes an approachable, conversational brand where ALL CAPS labels would feel stiff or institutional; the page contains user-generated content where case conventions cannot be enforced.
Cross-aesthetic applications: A raw, anti-establishment brand can use mixed case when the brief describes "organised chaos" — ALL CAPS labels on a grid of otherwise freeform content creates the tension between system and rebellion. A soft, wellness-oriented brand can use light-weight tracked ALL CAPS for whisper-quiet category labels when the brief emphasises "clarity without loudness" — the caps signal structure while the tracking and weight keep the volume low.
Implementation threshold: Each case treatment must be tied to a specific semantic tier: caps for labels and categories, title case for display headlines, sentence case for body. If two adjacent elements share the same case treatment without sharing the same semantic role, the system is broken.

## Longevity Signal
Ascending — still feels considered when executed with semantic logic.
