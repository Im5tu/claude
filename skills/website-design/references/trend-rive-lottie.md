# Trend: Rive / Lottie Micro-Illustrations

## What It Is
Animated illustrations embedded in the UI that respond to interaction or play on trigger. These replace static icons and illustrations with living, moving elements that reinforce brand personality. The distinction between Rive and Lottie defines the use case.

**Rive**: state-machine animations where the user can interact and the animation responds to state. A button's icon has three states: idle, hover, and active. On hover, the icon transitions to its hover state within the Rive state machine — this is not a CSS hover effect applied to a static asset but a designed animation state authored in the Rive editor. Best for: persistent UI elements like icons in nav, CTA button illustrations, interactive onboarding characters, elements where the animation needs to branch based on user behaviour.

**Lottie**: one-shot or looping animations exported from After Effects via the Bodymovin plugin. A celebratory illustration plays once on form completion. A loading spinner loops while content fetches. A hero illustration loops gently as ambient motion. Best for: celebratory moments, loading states, hero illustrations, one-time entrance animations, any animation that plays linearly without branching.

## Implementation
```tsx
// Rive state machine
import { useRive, useStateMachineInput } from '@rive-app/react-canvas';

const { RiveComponent, rive } = useRive({
  src: '/animations/icon.riv',
  stateMachines: 'State Machine 1',
  autoplay: true,
});

const hoverInput = useStateMachineInput(rive, 'State Machine 1', 'isHovered');
```

```tsx
// Lottie one-shot animation
import Lottie from 'lottie-react';
import animationData from './celebration.json';

<Lottie animationData={animationData} loop={false} />
```

File sizes: Rive files are typically 10–50KB; Lottie JSON files range from 20KB to 200KB. Use `.lottie` compressed format for production (50–70% smaller than JSON). Provide a static fallback image. Respect `prefers-reduced-motion` (autoplay off, show static state).

## Premium Signals
- The animation was designed for this specific brand — its colours, stroke weights, motion tempo, and character style match the brand's visual identity
- A Rive animation with the brand's exact colour palette and a bespoke character is premium
- A generic Lottie icon downloaded from LottieFiles with default colours is not
- The investment in custom animation is the signal; the technology is just the delivery mechanism

## Anti-Execution Warnings
- Large unoptimised Lottie files (>1MB) on hero
- Infinite loop animations for anything other than loading states
- Rive or Lottie used where a CSS animation would serve
- No fallback for environments where canvas rendering fails
- Lottie files at default colours — a Lottie animation with the default colours from the LottieFiles library signals that the animation was downloaded, not designed. Brand colours must be applied to all animated illustrations.

## Context Signals
Use when the brief signals: brand personality that benefits from character or illustration, onboarding flows where animation can guide users, empty states that need to feel designed rather than broken, hero sections where static illustration is insufficient
Avoid when: the brand aesthetic is photography-driven (illustration conflicts with photographic realism), there is no budget for custom animation (generic library downloads undermine the premium signal), or the animation would compete with primary content for attention
Cross-aesthetic applications: A clean SaaS brand can use Rive state-machine icons in the navigation — hover states on nav items trigger brand-specific micro-animations that reinforce product identity beyond what CSS can express. A warm artisan brand can use Lottie illustrations as gentle ambient loops in the hero — hand-drawn style animation matches the craft aesthetic and adds life to the page. A bold studio brand can use Rive interactive illustrations as a portfolio navigation mechanic — each project thumbnail is a living preview that responds to cursor proximity.
Implementation threshold: The animation must be custom-designed for the brand (matching brand colours, stroke weights, and motion tempo). Stock Lottie animations from public libraries are the micro-delight equivalent of stock photography — technically competent but generically recognisable.

## Longevity Signal
Ascending — Rive state machines in particular are underused relative to their capability. Custom-designed Lottie (vs. library downloads) remains rare. The technology is maturing faster than adoption.
