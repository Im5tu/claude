# Trend: Confetti / Celebration Moments

## What It Is
A burst of particles — coloured shapes, brand-coloured dots, or thematic elements — that erupts when a user completes a significant action. Form submission, account creation, payment confirmation, milestone achievement. The confetti appears for 1.5–3 seconds, then fades or falls out of view. It is the digital equivalent of applause.

## Implementation

Inside a **SolidJS island** triggered by the celebration event (form success, purchase complete). Use `canvas-confetti` — a lightweight, framework-neutral library — OR spawn 40–80 absolutely-positioned DOM particles and animate each with WAAPI (`element.animate()`). Colours drawn from the brand palette via `getComputedStyle(document.documentElement).getPropertyValue('--color-accent')`. Skip entirely when `matchMedia("(prefers-reduced-motion: reduce)").matches`.

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
