# Trend: Confetti / Celebration Moments

## What It Is
A burst of particles — coloured shapes, brand-coloured dots, or thematic elements — that erupts when a user completes a significant action. Form submission, account creation, payment confirmation, milestone achievement. The confetti appears for 1.5–3 seconds, then fades or falls out of view. It is the digital equivalent of applause.

## Implementation
Implementation with canvas-confetti (lightweight library) or a custom GSAP particle system.

```js
// canvas-confetti
confetti({
  particleCount: 100,
  spread: 70,
  origin: { y: 0.6 },
  colors: ['var(--color-accent)', 'var(--color-accent-light)', '#ffffff'],
  gravity: 1.2,
  scalar: 0.9
});

// Custom GSAP particle system
function celebrationBurst(origin) {
  const particles = Array.from({ length: 60 }, () => {
    const el = document.createElement('div');
    el.style.cssText = `
      position: fixed;
      width: ${4 + Math.random() * 4}px;
      height: ${4 + Math.random() * 4}px;
      background: var(--color-accent);
      border-radius: 50%;
      pointer-events: none;
      left: ${origin.x}px;
      top: ${origin.y}px;
    `;
    document.body.appendChild(el);
    return el;
  });

  particles.forEach((p) => {
    gsap.to(p, {
      x: gsap.utils.random(-200, 200),
      y: gsap.utils.random(-300, 50),
      rotation: gsap.utils.random(0, 720),
      opacity: 0,
      duration: gsap.utils.random(1.5, 2.5),
      ease: 'power2.out',
      onComplete: () => p.remove()
    });
  });
}
```

## Premium Signals
- Confetti colours are drawn from the brand palette (not generic rainbow)
- Particle shapes match the brand's visual language (dots for minimal brands, irregular shapes for organic brands, geometric shapes for tech brands)
- The burst origin is the element that triggered it (the submit button, the completed step)
- Confetti fades naturally rather than being cut off
- Particle count calibrated to brand personality — subtle brands: 40–60 particles; exuberant brands: 100–150

## Anti-Execution Warnings
- Confetti on every form submission (it should be reserved for meaningful completions)
- Confetti that blocks content or interaction
- Confetti that loops or persists
- Confetti with sound effects
- Generic multicolour rainbow confetti unrelated to brand

## Context Signals
Use when the brief signals: a product where users complete meaningful milestones (signups, purchases, achievements), brand personality described as "celebratory" / "rewarding" / "community-driven," or conversion flows where the confirmation moment deserves emphasis
Avoid when: the brand personality is reserved or understated and the moment is not genuinely significant, the action being celebrated is trivial (a filter selection, a newsletter signup), or celebrations would fire frequently enough to become noise
Cross-aesthetic applications: A restrained, premium brand can use confetti on a membership confirmation page when the brief describes a signature celebratory moment — the surprise is the point, not the frivolity. Use brand-coloured particles in a restrained quantity (40–60 particles) calibrated to the visual register. A SaaS product can use confetti when a user completes onboarding or reaches a usage milestone — the celebration reinforces product stickiness and rewards engagement. A professional services brand can use a subtle particle burst (not traditional confetti — elegant dots or brand-coloured shapes) on a significant form completion like a consultation request.
Implementation threshold: The celebration must fire on an action the user perceives as meaningful. If the user would not describe the action as an accomplishment, confetti is patronising.

## Longevity Signal
Ascending — still a differentiator when tied to meaningful moments and executed with brand-calibrated colours and physics. Risk of overuse is rising, but restrained, brand-specific execution remains rare.
