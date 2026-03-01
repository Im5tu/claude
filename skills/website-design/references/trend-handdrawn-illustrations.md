# Trend: Hand-Drawn Illustrations

## What It Is
Mascot characters and hand-drawn illustration systems integrated throughout the site — not as decorative accent, but as the primary personality layer. Patterns: animated characters that respond to scroll and hover state; illustrations extending to interactive elements (buttons, text, clickable items with hand-drawn overlays); scrolling figure representing the user moving through content (meta-narrative animation); full-illustration approach where logo, hero, navigation, and animations are all hand-drawn. Cookie consent, error pages, and loading states as illustration personality moments. Animated hand-drawn sequences using GSAP or Lottie for frame-by-frame character animation. Makes brands memorable and distinctly human — the strongest anti-template technique available because no template can ship custom illustrations.

## Implementation
```tsx
// SVG character with scroll-triggered state change
import { useGSAP } from "@gsap/react";
import { ScrollTrigger } from "gsap/ScrollTrigger";

export function ScrollingCharacter({ svgPath }: { svgPath: string }) {
  const charRef = useRef<SVGSVGElement>(null);

  useGSAP(() => {
    if (!charRef.current) return;
    const paths = charRef.current.querySelectorAll(".character-arm, .character-wave");

    ScrollTrigger.create({
      trigger: charRef.current,
      start: "top 80%",
      onEnter: () => gsap.to(paths, {
        rotation: 20, transformOrigin: "bottom center",
        duration: 0.4, yoyo: true, repeat: 2, ease: "power2.inOut",
      }),
    });
  });

  return <svg ref={charRef}><use href={`${svgPath}#character`} /></svg>;
}

// Lottie animation for hand-drawn sequences
import Lottie from "lottie-react";
import characterData from "@/assets/character-wave.json";

<Lottie
  animationData={characterData}
  loop={false}
  autoPlay={false}
  ref={lottieRef}
  className="w-48 h-48"
/>

// SVG path draw-on animation
useGSAP(() => {
  const paths = document.querySelectorAll(".hand-drawn-path");
  paths.forEach((path) => {
    const length = (path as SVGPathElement).getTotalLength();
    gsap.fromTo(path,
      { strokeDasharray: length, strokeDashoffset: length },
      { strokeDashoffset: 0, duration: 1.5, ease: "power2.inOut",
        scrollTrigger: { trigger: path, start: "top 80%" }
      }
    );
  });
});
```

## Premium Signals
- Character states managed as CSS classes — the mascot has a resting state, a hover state, a scroll state, and a success state. State transitions feel like the character is genuinely reacting to user behavior.
- Illustration style is internally consistent across every appearance — same line weight, same color fills, same proportions — whether in the hero, the error page, or the email confirmation.
- Path draw-on animation used for feature callouts — the illustration appears to be drawing itself in response to scroll, mimicking the feeling of watching someone sketch in real time.

## Anti-Execution Warnings
- **Stock illustration used as hand-drawn substitute** — unDraw, Storyset, and similar libraries are immediately recognizable as stock. Hand-drawn illustrations must be bespoke to the brand. Using stock and calling it "hand-drawn" destroys the personality signal.
- **Inconsistent illustration style across pages** — a mascot that has different proportions, line weights, or a different color palette on different pages reads as assembled from multiple sources rather than designed as a system.
- **Illustration that doesn't react to any interaction** — a static SVG illustration is decoration. For this technique to function as a trend, the illustration must respond to at least one user action (scroll, hover, or page load).

## Context Signals
Use when: the brief describes a brand with strong personality — a founder-led business, a creative studio, a consumer product with genuine character; the audience is consumer-facing and responds to warmth and humor; the brief uses words like "human," "fun," "approachable," "memorable," or "anti-corporate."
Avoid when: the brief describes a regulated industry (financial services, legal, pharmaceutical) where a mascot would undermine institutional credibility; the brand is service-led without a defined personality (the illustration would feel forced rather than genuine); no illustration budget exists — this technique requires bespoke asset creation that cannot be shortcut.
Cross-aesthetic applications: A SaaS productivity tool can use minimal hand-drawn UI state illustrations (empty state, success state, error state) without committing to a full mascot system — these add warmth to functional interfaces without overwhelming the product aesthetic. A coaching or educational brand can use a scrolling figure illustration to represent the user's journey through the course content.
Implementation threshold: Requires dedicated illustration assets — cannot be substituted with icon libraries. SVG format required for animation. Lottie is the recommended format for complex character animation sequences. All illustrations must be optimized for web (simplified paths, compressed SVG). Always test character animation on mobile — complex path animations can cause jank on lower-powered devices.

## Longevity Signal
Ascending — hand-drawn illustration systems are increasingly seen as a premium differentiator precisely because they cannot be templated; brands that invest in custom illustration earn a genuine visual monopoly.
