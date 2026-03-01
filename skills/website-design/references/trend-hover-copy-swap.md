# Trend: Copy That Changes on Hover

## What It Is
A text element — usually a button label or link — that swaps its text content on hover. "Learn More" becomes "Read the Case Study." "Get Started" becomes "Takes 2 Minutes." "Contact Us" becomes "We Reply in 2 Hours." The swap reveals specific, useful information that the generic label could not contain, turning a hover state into a micro-conversion moment.

## Implementation
```css
.swap-button {
  overflow: hidden;
  position: relative;
}

.swap-button .default,
.swap-button .hover-text {
  display: block;
  transition: transform 250ms cubic-bezier(0.34, 1.56, 0.64, 1);
}

.swap-button .hover-text {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  transform: translateY(100%);
}

.swap-button:hover .default {
  transform: translateY(-100%);
}

.swap-button:hover .hover-text {
  transform: translateY(0);
}
```

## Premium Signals
- The hover text is genuinely more specific and useful than the default label (not just a synonym)
- The swap animation direction matches the reading flow (sliding up for a CTA below a content block, sliding right for an inline link)
- Both text states have similar character count so the button does not resize on hover
- The hover state reveals a more human or more specific version of the original copy
- Transition time 150–250ms (fast — must feel responsive)

## Anti-Execution Warnings
- Hover text that is longer than the default (causes button resize and layout shift)
- Hover text that is just a synonym ("Learn More" to "Find Out More")
- Using this on mobile-primary elements (no hover on touch)
- Swapping copy on every button on the page (dilutes the surprise)
- Hover copy that changes the button's apparent action ("Contact Us" becoming "Pricing" is misleading)

## Context Signals
Use when the brief signals: CTAs where the generic label could be more specific, conversion-focused pages where reducing friction matters, brands that value transparency and directness ("we tell you exactly what you'll get")
Avoid when: the site is primarily mobile (no hover state available), the hover text does not add genuinely new information, or every button on the page uses this technique (dilutes the surprise and creates a pattern rather than a delight)
Cross-aesthetic applications: A refined professional brand can swap "Contact Us" to "Replies Within 4 Hours" — the specificity builds trust without breaking the professional tone. A bold studio brand can swap "View Work" to "42 Projects, Zero Templates" — the swagger matches the personality and removes an objection. A clean SaaS brand can swap "Get Started" to "Free for 14 Days" — the swap removes a conversion objection at the moment of highest intent.
Implementation threshold: The hover text must be more specific, more useful, or more motivating than the default label. If it is just a synonym or restatement, the swap is a gimmick.

## Longevity Signal
Ascending — still rare and still surprising. Requires genuine copywriting investment, which acts as a natural quality gate. Will peak when it becomes a standard pattern; currently still a differentiator.
