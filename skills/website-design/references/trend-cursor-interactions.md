# Trend: Cursor Interactions

## What It Is
Three tiers: (1) **Custom cursors** — replacing the default pointer with a branded element (dot, crosshair, branded icon). (2) **Cursor followers** — a secondary element that trails behind the cursor with CSS transition smoothing. (3) **Magnetic elements** — interactive elements (buttons, links) that attract the cursor within a defined radius. All three live inside small **SolidJS islands** (`client:visible`) that mutate CSS custom properties; CSS transitions interpolate the values — no JS tweening library required.

## Implementation

Magnetic button (Solid island):

```tsx
// src/components/islands/MagneticButton.tsx
import { onMount, onCleanup, type JSX } from "solid-js";
export default function MagneticButton(props: { children: JSX.Element; class?: string }) {
  let btn: HTMLButtonElement | undefined;
  onMount(() => {
    if (matchMedia("(prefers-reduced-motion: reduce)").matches) return;
    const onMove = (e: PointerEvent) => {
      if (!btn) return;
      const r = btn.getBoundingClientRect();
      btn.style.setProperty("--tx", `${(e.clientX - r.left - r.width / 2) * 0.3}px`);
      btn.style.setProperty("--ty", `${(e.clientY - r.top  - r.height / 2) * 0.3}px`);
    };
    const reset = () => { btn!.style.setProperty("--tx", "0px"); btn!.style.setProperty("--ty", "0px"); };
    btn!.addEventListener("pointermove", onMove);
    btn!.addEventListener("pointerleave", reset);
    onCleanup(() => { btn!.removeEventListener("pointermove", onMove); btn!.removeEventListener("pointerleave", reset); });
  });
  return <button ref={btn} class={`magnet ${props.class ?? ""}`}>{props.children}</button>;
}
```

```css
.magnet {
  translate: var(--tx, 0px) var(--ty, 0px);
  transition: translate 300ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
@media (prefers-reduced-motion: reduce) {
  .magnet { translate: 0 0; transition: none; }
}
```

Cursor follower uses the same pattern — one global island listening on `document`, mutating `--cx` / `--cy` on a `<div>` positioned with `fixed` + `transform: translate(var(--cx), var(--cy))`.

## Premium Signals
- Cursor follower that uses brand colours or brand shapes, not a generic white dot

## Anti-Execution Warnings
- **Large custom cursors that lag** — a custom cursor with a 16px+ hit area that doesn't snap precisely to the pointer position feels broken. Cursor elements must use `quickTo` for performance or `transform` not `left/top`.
- **Magnetic effects on every interactive element** — magnetic pull on every link and button creates a disorienting experience. Reserve magnetism for 2–3 primary CTAs per page.

## Context Signals
Use when the brief signals: a brand that describes itself as "bespoke," "considered," or "crafted"; a portfolio or showcase site where exploration is the primary interaction model; an audience of creative professionals or design-literate buyers who will recognise the intentionality.
Avoid when: the primary audience is time-constrained (B2B decision-makers scanning for pricing); the site's core flow is form-driven or conversion-heavy; the brief uses words like "efficient," "simple," or "no-nonsense."
Cross-aesthetic applications: A clean technology brand can use a single magnetic CTA button when the brief describes the product as "precision-engineered" — the magnetic pull becomes a metaphor for the product's exactness. A warm, personal brand can use a subtle cursor follower in a hand-drawn style when the brief describes the founder as the product. An editorial, content-first brand can use a custom cursor replacement (the default arrow replaced with a minimal branded mark or crosshair) when the brief describes "considered reading" or "deliberate discovery" — the cursor becomes part of the reading experience rather than an interaction aid.
Implementation threshold: magnetic effect reserved for 2–3 primary CTAs maximum. Cursor follower uses a CSS transition on `translate` (or WAAPI `element.animate()`) for frame-perfect tracking. Custom cursor never exceeds 16px effective hit area.

## Longevity Signal
Peaking — overused in creative/agency portfolios. Increasingly avoided by product and SaaS. Use sparingly; ensure it serves the brand.

## Tier 4: Content-as-Cursor-Follower

Full content elements — high-resolution images, case study cards, project thumbnails — follow the cursor with physics-based weight and momentum. Distinct from Tier 2 (small branded dot): this is a substantial content element with mass.

**Implementation:** Same Solid island pattern as magnetic button / cursor follower — the card element listens on `document`, mutates `--cx`/`--cy` CSS vars, and toggles an `is-visible` class when the cursor is within the configured peripheral zone (`e.clientX < 200 || e.clientX > window.innerWidth - 200`). CSS handles `transition: translate 700ms, opacity 300ms, scale 300ms`.

**Peripheral containment rule:** Restrict the follower zone to the page periphery — never overlapping central readable content. The follower inhabits the sides of the viewport where it can be seen as context without obscuring what the user is reading. This is the critical UX detail that separates premium execution from distracting execution.

**Scroll + cursor coordination:** When combined with scroll-triggered background transitions, the following content element changes state per scroll section — the image or card displayed matches the content of the section the cursor is beside.

**Distinction from Tier 2:** Tier 2 = small branded dot (16px or less) that follows everywhere. Tier 4 = substantial content element (150–400px) with genuine visual mass, confined to safe peripheral zones.
