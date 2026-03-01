# Trend: Icon Morphing

## What It Is
An icon that smoothly transforms from one state to another — hamburger to X, play to pause, plus to minus, arrow to checkmark — using SVG path interpolation or CSS clip-path transitions. The morph communicates state change through motion rather than replacement: the user sees the icon become its next state, not swap to it.

## Implementation
CSS implementation for simple shapes:

```css
/* Hamburger to X */
.hamburger .bar {
  transition: transform 300ms cubic-bezier(0.34, 1.56, 0.64, 1),
              opacity 200ms ease;
}

.hamburger.open .bar-top {
  transform: rotate(45deg) translateY(7px);
}

.hamburger.open .bar-middle {
  opacity: 0;
}

.hamburger.open .bar-bottom {
  transform: rotate(-45deg) translateY(-7px);
}
```

SVG path morphing for complex shapes:

```js
// GSAP MorphSVGPlugin
gsap.to('#icon-path', {
  morphSVG: '#target-path',
  duration: 0.4,
  ease: 'power2.inOut'
});

// With colour shift
gsap.to('#icon-path', {
  morphSVG: '#target-path',
  fill: 'var(--color-success)',
  duration: 0.4,
  ease: 'power2.inOut'
});
```

The paths should have the same number of points for smooth interpolation; use GSAP's built-in point matching if they differ. Duration: 200–300ms.

## Premium Signals
- The morph path is considered — the icon does not just cross-fade between states but physically transforms through a designed intermediate shape
- A plus sign becoming a checkmark rotates and extends rather than dissolving and re-forming
- Easing matches the action's emotional weight — `elastic.out` for a satisfying snap (like/favourite), `power2.inOut` for considered transitions (navigation toggle)
- Colour shifts accompany shape changes
- Morph reverses cleanly on toggle

## Anti-Execution Warnings
- Swapping `src` attributes instead of morphing (jarring)
- Instant toggle with no transition
- Morphing icons below 24px where the morph is invisible
- Using complex Lottie where a simple CSS transition would serve

## Context Signals
Use when the brief signals: attention to craft and detail, interactive UI elements that toggle between states (navigation, favourites, playback controls), a brand that values "considered interaction" or "thoughtful design"
Avoid when: the icon states are unrelated (morphing a search icon into a settings icon has no semantic path), the toggle is too frequent (rapid morphing on a frequently tapped element becomes annoying), or the icon is too small for the morph to be visible (below 24px, morphing is imperceptible)
Cross-aesthetic applications: A minimal editorial brand can use icon morphing on the hamburger-to-X navigation toggle — the clean transformation reinforces the site's attention to typographic and geometric precision. A warm artisan brand can use icon morphing on a heart/favourite toggle with an organic, slightly overshooting ease — the morph feels handmade. A bold studio brand can use aggressive, fast morphs with sharp overshoot easing on interactive icons — the speed matches the brand's energy.
Implementation threshold: The morph must follow a logical physical path — the intermediate state between the two icons should make visual sense, not look like a random deformation.

## Longevity Signal
Ascending — path morphing and Rive state machines are still technically demanding enough to be a genuine differentiator. SVG morph will become more common as tooling improves, but designed morph paths (not generic interpolation) will remain premium.
