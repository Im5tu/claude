# Trend: Cursor Interactions

## What It Is
Three tiers: (1) **Custom cursors** — replacing the default pointer with a branded element (dot, crosshair, branded icon). (2) **Cursor followers** — a secondary element that trails behind the cursor with spring physics (`gsap.quickTo` with `ease: 'power3'` and a delta multiplier). (3) **Magnetic elements** — interactive elements (buttons, links) that attract the cursor within a defined radius, creating the sensation of a magnetic pull. Magnetic implementation: track `mousemove`, calculate distance from element centre, apply `gsap.to(element, { x: deltaX * 0.3, y: deltaY * 0.3 })` when within threshold. Cursor effects communicate that every pixel of the site was considered.

## Implementation
```js
// Magnetic button
const button = document.querySelector('.magnetic-btn');
button.addEventListener('mousemove', (e) => {
  const rect = button.getBoundingClientRect();
  const deltaX = e.clientX - (rect.left + rect.width / 2);
  const deltaY = e.clientY - (rect.top + rect.height / 2);
  gsap.to(button, { x: deltaX * 0.3, y: deltaY * 0.3, duration: 0.3 });
});
button.addEventListener('mouseleave', () => {
  gsap.to(button, { x: 0, y: 0, duration: 0.5, ease: 'elastic.out(1, 0.5)' });
});

// Cursor follower
const follower = document.querySelector('.cursor-follower');
const xTo = gsap.quickTo(follower, 'x', { duration: 0.4, ease: 'power3' });
const yTo = gsap.quickTo(follower, 'y', { duration: 0.4, ease: 'power3' });
document.addEventListener('mousemove', (e) => {
  xTo(e.clientX);
  yTo(e.clientY);
});
```

## Premium Signals
- Cursor follower that uses brand colours or brand shapes, not a generic white dot

## Anti-Execution Warnings
- **Large custom cursors that lag** — a custom cursor with a 16px+ hit area that doesn't snap precisely to the pointer position feels broken. Cursor elements must use `quickTo` for performance or `transform` not `left/top`.
- **Magnetic effects on every interactive element** — magnetic pull on every link and button creates a disorienting experience. Reserve magnetism for 2–3 primary CTAs per page.

## Context Signals
Use when the brief signals: a brand that describes itself as "bespoke," "considered," or "crafted"; a portfolio or showcase site where exploration is the primary interaction model; an audience of creative professionals or design-literate buyers who will recognise the intentionality.
Avoid when: the primary audience is time-constrained (B2B decision-makers scanning for pricing); the site's core flow is form-driven or conversion-heavy; the brief uses words like "efficient," "simple," or "no-nonsense."
Cross-aesthetic applications: A clean technology brand can use a single magnetic CTA button when the brief describes the product as "precision-engineered" — the magnetic pull becomes a metaphor for the product's exactness. A warm, personal brand can use a subtle cursor follower in a hand-drawn style when the brief describes the founder as the product. An editorial, content-first brand can use a custom cursor replacement (the default arrow replaced with a minimal branded mark or crosshair) when the brief describes "considered reading" or "deliberate discovery" — the cursor becomes part of the reading experience rather than an interaction aid.
Implementation threshold: magnetic effect reserved for 2–3 primary CTAs maximum. Cursor follower uses `gsap.quickTo` for frame-perfect tracking. Custom cursor never exceeds 16px effective hit area.

## Longevity Signal
Peaking — overused in creative/agency portfolios. Increasingly avoided by product and SaaS. Use sparingly; ensure it serves the brand.

## Tier 4: Content-as-Cursor-Follower

Full content elements — high-resolution images, case study cards, project thumbnails — follow the cursor with physics-based weight and momentum. Distinct from Tier 2 (small branded dot): this is a substantial content element with mass.

**Implementation:**
```js
// Content cursor follower with spring physics
const card = document.querySelector('.cursor-content-follower');
const xTo = gsap.quickTo(card, 'x', { duration: 0.7, ease: 'power3' });
const yTo = gsap.quickTo(card, 'y', { duration: 0.7, ease: 'power3' });

// Peripheral containment: restrict to sides of viewport
document.addEventListener('mousemove', (e) => {
  const inPeriphery = e.clientX < 200 || e.clientX > window.innerWidth - 200;
  if (inPeriphery) {
    xTo(e.clientX);
    yTo(e.clientY);
    gsap.to(card, { opacity: 1, scale: 1, duration: 0.3 });
  } else {
    gsap.to(card, { opacity: 0, scale: 0.9, duration: 0.3 });
  }
});
```

**Peripheral containment rule:** Restrict the follower zone to the page periphery — never overlapping central readable content. The follower inhabits the sides of the viewport where it can be seen as context without obscuring what the user is reading. This is the critical UX detail that separates premium execution from distracting execution.

**Scroll + cursor coordination:** When combined with scroll-triggered background transitions, the following content element changes state per scroll section — the image or card displayed matches the content of the section the cursor is beside.

**Distinction from Tier 2:** Tier 2 = small branded dot (16px or less) that follows everywhere. Tier 4 = substantial content element (150–400px) with genuine visual mass, confined to safe peripheral zones.
