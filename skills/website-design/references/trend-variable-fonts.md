# Trend: Variable Fonts

## What It Is
OpenType variable fonts expose axes (weight, width, slant, optical size) that can be animated via CSS `font-variation-settings`. Hover effects: a nav item transitions from `wght 400` to `wght 700` on hover using `transition: font-variation-settings 200ms ease`. Viewport-responsive width: `font-stretch` narrows as viewport shrinks, maintaining the intended letterform proportion. Premium applications use variable weight to express brand personality — a fintech brand's headline gets heavier as the user scrolls toward a CTA (confidence building). Variable fonts used in Tailwind: pair with `[font-variation-settings:'wght'_700]` utility.

## Implementation
```css
.nav-item {
  font-variation-settings: 'wght' 400;
  transition: font-variation-settings 200ms ease;
}

.nav-item:hover {
  font-variation-settings: 'wght' 700;
}

/* Viewport-responsive width */
.responsive-heading {
  font-stretch: 100%;
}

@media (max-width: 768px) {
  .responsive-heading {
    font-stretch: 85%;
  }
}
```

## Premium Signals
- Variable font weight changes that correlate to brand tone (a wellness brand eases gently; a fintech brand snaps assertively)

## Anti-Execution Warnings
- **Variable weight changes that feel random** — if weight increases on hover with no brand rationale, it reads as a CSS experiment, not a design decision.

## Context Signals
Use when the brief signals: interactive product experiences where UI state changes benefit from typographic reinforcement; a brand that describes itself as "adaptive," "responsive," or "modern"; content with hover-heavy navigation or filterable interfaces where weight shifts communicate state.
Avoid when: the design relies on static, print-inspired authority where type should feel immovable; the site targets audiences on low-power devices where font-variation animations cause jank; the variable axes would be exercised for novelty rather than to communicate a state change.
Cross-aesthetic applications: A heritage-coded, established brand can use variable font weight on a single interactive element — a timeline slider where year labels grow heavier as they become current — when the brief describes "tradition meeting the present." A warm, organic brand can use width axis variation when the brief mentions "breathing" or "natural rhythm," mapping subtle font-stretch oscillation to scroll position.
Implementation threshold: Every axis change must correlate to a user action or brand-meaningful state. Weight increasing on hover is valid only when the heavier state signals selection or emphasis — not when it is the only hover feedback available.

## Longevity Signal
Ascending — underused relative to capability. Weight-on-hover is still a differentiator.

## Animated Icon Fonts

A niche but powerful application: icon font families where individual icons are animation frames baked into font variation axes. As `font-variation-settings` progresses along the axis, the glyph morphs from one icon to another — for example, play icon → pause icon, or arrow-right → checkmark. This enables CSS-only icon state transitions without sprite sheets, canvas, or JavaScript animation.

**Implementation:**
```css
/* Icon font with animated FILL or WGHT axis mapping states */
.icon-play-pause {
  font-family: 'AnimatedIcons', sans-serif;
  font-variation-settings: 'FILL' 0; /* play state */
  transition: font-variation-settings 300ms ease;
}

.icon-play-pause.paused {
  font-variation-settings: 'FILL' 1; /* pause state */
}
```

```tsx
// With GSAP for scroll-triggered progression
useGSAP(() => {
  ScrollTrigger.create({
    trigger: iconRef.current,
    start: "top center",
    onEnter: () => {
      gsap.to(iconRef.current, {
        fontVariationSettings: "'FILL' 1",
        duration: 0.4,
        ease: "power2.inOut",
      });
    },
  });
});
```

**Usage constraint:** Only applicable when the icon font family explicitly supports animation axes that map to visual states. Standard icon libraries (Lucide, Heroicons, Phosphor) do not support this — it requires a specifically designed variable icon font. Do not confuse with standard icon libraries or Lottie/Rive animated icons (which are SVG/canvas-based, not font-based).

**Premium signal:** CSS-only icon transitions with zero JavaScript dependency — the animation is handled entirely by the browser's font rendering engine. Imperceptible to most users as a technique; experienced only as tactile responsiveness.
