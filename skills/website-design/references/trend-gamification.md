# Trend: Gamification

## What It Is
Website-as-game: browsing implemented via game mechanics rather than conventional navigation. Two primary patterns: (1) Platformer navigation — a user-controlled character (often pixel art) navigates between page sections as if they are game levels, each section a distinct environment; (2) 3D room exploration — a rendered or illustrated version of the brand's physical space (studio, office, workshop) where clickable objects reveal brand content (laptop = portfolio, whiteboard = process, TV = social proof). A third pattern: Tinder-style card navigation where users swipe through content sequentially. In all cases: the gamification layer sits above a conventional navigation that is always accessible. The mechanic earns attention — it does not demand it. Signal: technical creativity, personality, and an invitation to explore. Exceptionally effective for portfolio and creative agency sites.

## Implementation

Implement in a **SolidJS island** hydrated `client:load` (interactive above-the-fold). Skeleton:

```tsx
// src/components/islands/PlatformerNav.tsx
import { createSignal, onMount, onCleanup } from "solid-js";

export default function PlatformerNav(props: { sections: string[] }) {
  const [pos, setPos] = createSignal(0);
  const [jumping, setJumping] = createSignal(false);

  onMount(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "ArrowRight") setPos(p => Math.min(p + 1, props.sections.length - 1));
      if (e.key === "ArrowLeft")  setPos(p => Math.max(p - 1, 0));
      if (e.key === " " && !jumping()) {
        setJumping(true);
        setTimeout(() => setJumping(false), 500);
      }
    };
    window.addEventListener("keydown", onKey);
    onCleanup(() => window.removeEventListener("keydown", onKey));
  });

  // React to position: smooth-scroll the matching section into view
  const _ = () => document.getElementById(props.sections[pos()])?.scrollIntoView({ behavior: "smooth" });

  return (
    <div class="plat" aria-hidden="true">
      <div
        class="plat__char"
        classList={{ "is-jump": jumping() }}
        style={`--x: ${pos() * 60}px;`}
      />
    </div>
  );
}
```

```css
.plat { position: fixed; inset: auto 0 2rem 0; display: flex; justify-content: center; z-index: 40; pointer-events: none; }
.plat__char {
  width: 2rem; height: 2rem; background: var(--color-accent); border-radius: 4px;
  translate: var(--x, 0) 0;
  transition: translate 200ms cubic-bezier(0.2, 0.8, 0.2, 1);
}
.plat__char.is-jump { animation: plat-jump 500ms cubic-bezier(0.2, 0.8, 0.2, 1); }
@keyframes plat-jump { 50% { translate: var(--x, 0) -3rem; } }
```

Always render a conventional `<nav>` above it — gamification extends navigation, never replaces it.

## Premium Signals
- The game mechanic is directly connected to the brand's content — a logistics company's 3D room shows a warehouse; a code-first agency's platformer uses terminal-style environments. The game IS the portfolio, not a wrapper around it.
- Two-path design: every section is reachable via both the game mechanic and a conventional click. Users who discover the game are rewarded; users who don't are never penalized.
- Loading and transition animations between "levels" that match the game aesthetic — a brief transition screen that reinforces the game frame.

## Anti-Execution Warnings
- **Gamification that traps users in the mechanic** — any site where the only navigation method is the game is inaccessible and will be abandoned. A conventional navigation must always be visible and functional.
- **Game mechanics unrelated to brand content** — a platformer where the character moves through generic environments that don't reflect the brand is a gimmick, not a statement. The game world must be the brand world.
- **Poor mobile performance** — platformer characters controlled by keyboard are unusable on mobile. Always provide a touch-based alternative (tap to advance, swipe between sections) or explicitly state the desktop-first experience.

## Context Signals
Use when: the brief describes a creative, technical, or studio brand where demonstrating capability through the interface itself is a competitive signal; the target audience is design-literate, tech-literate, or gaming-adjacent; the brief explicitly mentions "personality," "memorable," "unexpected," or "shows rather than tells."
Avoid when: the primary audience is business buyers who are time-constrained — gamification signals playfulness over efficiency; the site serves a conversion-primary function where unusual navigation increases abandonment risk; the development team cannot maintain the mechanic — gamification that feels broken destroys the signal.
Cross-aesthetic applications: An interactive data product can use a "level unlock" metaphor for their onboarding flow — each feature is a level the user progresses through — without making the full site a game. A children's educational brand can use game mechanics as the primary interface when the audience is explicitly children and caregivers.
Implementation threshold: Always implement the conventional navigation first, to completion. Gamification is an enhancement layer built on top — never replace, only extend. Test the game mechanic on desktop, mobile, and with keyboard-only navigation. Minimum viable gamification: a distinctive entrance animation and one interactive section with game characteristics — full platformer navigation is advanced scope.

## Longevity Signal
Ascending for creative/portfolio sites — remains a powerful differentiator because execution difficulty creates a natural barrier to imitation; avoid for any site where exploration conflicts with conversion goals.
