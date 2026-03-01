# Trend: 3D Perspective Tilt

## What It Is
A card or element that tilts in 3D space in response to cursor position, creating the illusion that the element has physical depth and the user is looking at it from an angle. The tilt is driven by the cursor's position relative to the element's centre: cursor at top-left tilts the card to show more of the top-left surface.

Container setup: `perspective: 1000–1200px` on the parent element. The card receives `rotateX` and `rotateY` transforms calculated from the cursor's position relative to the element's centre. Maximum rotation: 10–15 degrees. Above 15 degrees, content distorts and reads as a tech demo rather than a physical simulation.

## Implementation
GSAP `quickTo` for performance-safe cursor tracking:

```js
const card = document.querySelector('.tilt-card');
const xTo = gsap.quickTo(card, 'rotateY', { duration: 0.3, ease: 'power3' });
const yTo = gsap.quickTo(card, 'rotateX', { duration: 0.3, ease: 'power3' });

card.addEventListener('mousemove', (e) => {
  const rect = card.getBoundingClientRect();
  const x = (e.clientX - rect.left) / rect.width - 0.5;  // -0.5 to 0.5
  const y = (e.clientY - rect.top) / rect.height - 0.5;   // -0.5 to 0.5
  xTo(x * 15);   // max 15 degrees
  yTo(-y * 15);  // inverted Y for natural feel
});

card.addEventListener('mouseleave', () => {
  gsap.to(card, {
    rotateX: 0,
    rotateY: 0,
    duration: 0.6,
    ease: 'elastic.out(1, 0.5)'  // satisfying spring-back
  });
});
```

Inner elements use `translateZ` for layered depth, reinforcing the 3D illusion:

```css
.tilt-card {
  transform-style: preserve-3d;
}

.tilt-card .image { transform: translateZ(50px); }
.tilt-card .text { transform: translateZ(30px); }
.tilt-card .shadow { transform: translateZ(-20px); }
```

Shine overlay simulating light reflection:

```css
.tilt-card::after {
  content: '';
  position: absolute;
  inset: 0;
  border-radius: inherit;
  background: radial-gradient(
    circle at var(--mx, 50%) var(--my, 50%),
    rgba(255, 255, 255, 0.2),
    transparent 60%
  );
  pointer-events: none;
  opacity: 0;
  transition: opacity 300ms ease;
}

.tilt-card:hover::after {
  opacity: 1;
}
```

Update `--mx` and `--my` CSS custom properties via JavaScript in the `mousemove` handler: `card.style.setProperty('--mx', percentX + '%'); card.style.setProperty('--my', percentY + '%')`.

On `mouseleave`: return to `rotateX: 0, rotateY: 0` with `ease: 'elastic.out(1, 0.5)'` — the spring-back is the most satisfying moment of the interaction.

Mobile: disable the tilt entirely or reduce maximum rotation to 5 degrees driven by device orientation (`DeviceOrientationEvent`).

## Premium Signals
- Inner `translateZ` layering on child elements creating genuine depth, not just a flat plane rotating
- Shine overlay that follows cursor position simulating light reflection
- Elastic spring-back on `mouseleave`
- Maximum rotation at 10–15 degrees

## Anti-Execution Warnings
- **3D tilt above 15 degrees** — rotation beyond 15 degrees distorts content, breaks text readability, and makes the element feel like a tech demo. Keep maximum rotation at 10–15 degrees, and disable entirely on mobile.
- **3D tilt on every card in a grid** — when a grid of 12 cards all tilt on hover, the page feels chaotic and the effect loses its premium quality. Apply tilt to 1–2 featured or highlighted cards; use simpler hover states (scale, shadow) for the rest.

## Context Signals
Use when the brief signals: products described as "tangible" / "something you can feel" / "objects worth examining closely," portfolio pieces or featured work that deserves to be inspected, or brands where physicality and craft are core values
Avoid when: the content is text-heavy (tilt distorts readability), the cards contain interactive elements like form inputs (3D transforms break input affordances), the page is information-dense with many cards (tilt on multiple elements creates chaos), or the audience is primarily mobile (no cursor for tilt interaction)
Cross-aesthetic applications: A warm artisan brand can use 3D perspective tilt when the brief describes "handcrafted products you can feel" or "objects worth examining closely" — the physicality of tilt reinforces tangibility and makes the product feel like something you hold. A restrained professional brand can use subtle tilt (maximum 8 degrees) on a featured case study card — the depth suggests the work has substance worth examining. A brand where physical object presence is central to the proposition can use tilt with inner `translateZ` layering on a product showcase card — the parallax depth mirrors the experience of examining a physical object under light.
Implementation threshold: The tilt must include internal `translateZ` layering on child elements and elastic spring-back on `mouseleave` — a flat plane that rotates without internal parallax is not 3D tilt, it is a rotation effect. Shine overlay and depth layers separate premium from basic.

## Longevity Signal
Peaking — widely used on creative portfolios and SaaS marketing sites. The differentiator has shifted from "has tilt" to "has tilt with internal parallax layering, shine overlay, and elastic spring-back." Basic rotation without depth is now generic.
