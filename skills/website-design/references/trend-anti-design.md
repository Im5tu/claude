# Trend: Anti-Design

## What It Is
Total removal of conventional page structure — the website IS the experience, with no pretense of being an informational document. Core pattern: cursor-as-unwind interaction where the mouse cursor literally reveals or unwinds the website as it moves across the surface. Alternative patterns: TikTok-feed browsing (vertical swipe/click through content sequentially, no section navigation); visuals-on-sides with detail-on-click (portrait-orientation feel on desktop, images flanking a click-to-reveal center); scroll-controlled narrative where the user has no sense of being on a "website" versus in an experience. Requires full creative conviction — partial execution reads as broken UX, not intentional art direction. The defining characteristic: if you could describe the page with the word "site," the anti-design is incomplete.

## Implementation

Inside a **SolidJS island** hydrated `client:load` (this is the page — must be immediate). Pattern for the cursor-reveal:

```tsx
// src/components/islands/CursorReveal.tsx
import { onMount, onCleanup, children as slots, type JSX } from "solid-js";
export default function CursorReveal(props: { children: JSX.Element }) {
  let el: HTMLDivElement | undefined;
  onMount(() => {
    const onMove = (e: PointerEvent) => {
      if (!el) return;
      const r = el.getBoundingClientRect();
      el.style.setProperty("--cx", `${((e.clientX - r.left) / r.width) * 100}%`);
      el.style.setProperty("--cy", `${((e.clientY - r.top) / r.height) * 100}%`);
    };
    el!.addEventListener("pointermove", onMove);
    onCleanup(() => el!.removeEventListener("pointermove", onMove));
  });
  return (
    <div ref={el} class="cr" style="--cx: 50%; --cy: 50%;">
      {props.children}
    </div>
  );
}
```

CSS drives the mask:

```css
.cr {
  min-height: 100svh; background: #000;
  mask-image: radial-gradient(circle 220px at var(--cx) var(--cy), black 0%, transparent 100%);
}
@media (prefers-reduced-motion: reduce) {
  .cr { mask-image: none; }
}
```

TikTok-feed navigation: Solid `createSignal(currentIndex)` + pointer/wheel listener in `onMount`. Same island pattern.

## Premium Signals
- The anti-design mechanic rewards exploration — users who spend time with it discover content or interactions that visitors who leave quickly never see. The depth of the experience scales with engagement.
- Mobile mapping: the cursor-based mechanic maps cleanly to touch (finger = cursor), making the experience genuinely cross-device rather than a desktop novelty.
- The experience has a defined "end" or resolution — an anti-design that simply continues indefinitely without a destination reads as unfinished. The experience must go somewhere.

## Anti-Execution Warnings
- **Anti-design with a conventional homepage attached** — an experience that starts unconventionally and then resolves to a standard-layout homepage undermines the commitment. Either commit fully or don't use the technique.
- **No discoverable entry point** — a cursor-reveal experience where the user doesn't understand how to interact will read as a loading failure. A single UI hint ("move your cursor to explore") costs nothing and prevents abandonment.
- **Desktop-only experience with no mobile adaptation** — cursor mechanics require a cursor. On mobile, map to touch (touchmove as cursor equivalent) or provide a completely different but equally unconventional mobile experience.

## Context Signals
Use when: the brief explicitly describes a brand for which the website is a performance, an exhibition, or an experience — not an information delivery mechanism; the brand is in art, experimental design, fashion, or creative industries where unconventionality is not just acceptable but expected; the brief includes phrases like "unexpected," "experience-first," "artistic," or "the anti-portfolio."
Avoid when: the brand serves any conversion-primary function — lead capture, trial signup, purchase — where unconventional navigation increases abandonment; the brief describes "trusted," "accessible," "clear," or "simple" as aspirational qualities; the brand serves an audience that includes people unfamiliar with experimental web design (e.g., older demographics, non-design-adjacent industries).
Cross-aesthetic applications: An experimental typographer or motion designer can use an anti-design experience as their portfolio site with a single conventional contact link as the only traditional element. A luxury fashion brand launching a capsule collection can use anti-design for the campaign microsite while maintaining a conventional e-commerce site for the main brand.
Implementation threshold: Anti-design requires complete design conviction — there is no "partial anti-design." Define the experience from first cursor movement to final destination before building. Always implement: a single discoverable interaction hint, a touch adaptation, and a way out (a conventional link or navigation that never disappears entirely). Test with users unfamiliar with experimental web design.

## Longevity Signal
Niche and intentional — not a mainstream technique, and should not be; its effectiveness depends on rarity and full commitment; appropriate for exactly the briefs where it fits and never for others.
