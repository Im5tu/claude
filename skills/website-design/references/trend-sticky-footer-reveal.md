# Trend: Sticky Footer Reveal

## What It Is
The site footer sits behind the main content for the entire page visit. As the user scrolls past the final content section, the footer is revealed — not entering from below, but uncovered. It was always there, waiting. The effect is a curtain-lift moment: the main content acts as a solid panel sliding away to expose the footer beneath.

This technique reframes the footer from an afterthought navigation dump to a designed destination. When users know the footer will be revealed rather than scrolled to, designers invest in it — the footer becomes a full-screen composition with generous spacing, considered typography, and staggered entrance animations for its content as it becomes visible. The reveal moment creates a tonal shift: after a page of curated marketing, the footer can be personal, warm, or surprising — a brand closing statement rather than a navigation utility.

## Implementation
Two CSS approaches:

**Approach 1 (fixed):**
```css
.site-footer {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: -1;
  min-height: 100vh;
}

.main-content {
  position: relative;
  z-index: 1;
  background-color: var(--color-background); /* must be opaque */
}
```

**Approach 2 (sticky):**
```css
.site-footer {
  position: sticky;
  bottom: 0;
  z-index: -1;
}

.main-content {
  position: relative;
  z-index: 1;
  background-color: var(--color-background); /* must be opaque */
}
```

Both require the main content background to be fully opaque — if transparent, the footer bleeds through during scroll.

For the reveal moment to feel premium, footer content should sequence in with staggered entrance animations triggered by a ScrollTrigger that fires when the footer becomes visible. Use `IntersectionObserver` or a ScrollTrigger on the footer element with `start: 'top bottom'` to initiate the choreography.

## Premium Signals
- Footer reveal where the footer is designed as a destination composition, not a navigation utility — large brand mark, closing statement, generous whitespace

## Anti-Execution Warnings
- **Footer reveal on a footer that is not designed** — revealing a generic footer (three columns of nav links, a copyright line, and a newsletter input) is an anti-climax. The reveal mechanic promises a destination; the footer must deliver one. If the footer is utilitarian, skip the reveal.

## Context Signals
Use when the brief signals: a brand that values closing impressions, a footer designed as a brand statement rather than a navigation utility, language like "leave a lasting impression" / "the final moment matters" / "sense of completion"
Avoid when: the footer is purely functional (nav links, legal text, newsletter signup only), the site is a long-form editorial page where the footer is encountered frequently, the page has minimal scroll height (the reveal needs distance to feel earned), or the footer and page share the same background colour (the reveal becomes invisible)
Cross-aesthetic applications: A bold agency brand can use this when the footer is a full-screen brand manifesto — the dramatic reveal rewards the user for scrolling to the end. A refined professional services brand can use this when the footer contains a single, elegant closing CTA and contact details presented as an invitation — the restraint of the footer design makes the reveal feel like an unveiling. A brand with emotional depth can use this when the footer represents a genuine tonal shift — lighter, more personal, revealing the human side of the brand.
Implementation threshold: The footer must be designed as a destination — if you would not screenshot the footer as a standalone design, it does not warrant a reveal mechanic.

## Longevity Signal
Evergreen — a structural refinement that is invisible when done correctly and will never feel dated. The web equivalent of a well-bound book's endpaper. The differentiator has always been and remains the quality of the footer design that is revealed.
