# Glass card

Frosted glass surface for UI elements floating over rich, animated, or imagery backgrounds. Do NOT use on flat surfaces: the effect disappears.

## Dimensional fit

- surface-depth: any — most effective over dark or media-heavy backgrounds
- motion-register: any
- texture-appetite: medium / low — glass and texture-high together can look muddy
- type-personality: any
- notes: Uses `backdrop-filter: blur()` plus a semi-transparent border. Requires rich content underneath.

## Structure

- `<div class="glass glass-light">` or `<div class="glass glass-dark">`; content as children
  - `glass-light`: bright glass suited to dark backgrounds
  - `glass-dark`: dim glass suited to light backgrounds

## CSS

```css
.glass {
  border-radius: 1.25rem;
  padding: 1.5rem;
  backdrop-filter: blur(14px) saturate(140%);
  -webkit-backdrop-filter: blur(14px) saturate(140%);
  transition: background var(--motion-duration-fast) var(--ease-out-soft),
              border-color var(--motion-duration-fast) var(--ease-out-soft);
}
.glass-light {
  background: color-mix(in oklab, white 14%, transparent);
  border: 1px solid color-mix(in oklab, white 22%, transparent);
  color: white;
}
.glass-dark {
  background: color-mix(in oklab, black 10%, transparent);
  border: 1px solid color-mix(in oklab, black 14%, transparent);
  color: var(--color-primary);
}
@supports not (backdrop-filter: blur(1px)) {
  .glass-light { background: color-mix(in oklab, white 30%, transparent); }
  .glass-dark  { background: color-mix(in oklab, black 22%, transparent); }
}

@media (prefers-reduced-motion: reduce) {
  .glass { transition: none; }
}
```

## Usage

```html
<section style="background-image: url(/hero.jpg); background-size: cover;">
  <div class="glass glass-light" style="max-width: 28rem;">
    <h3>Live since 2018</h3>
    <p style="opacity: 0.8; margin-top: 0.25rem;">100% uptime across the last 24 months.</p>
  </div>
</section>
```

## Hard rules

- **Never** stack two glass cards in the same section — the blurs compound and the effect collapses visually.
- **Never** place a glass card on a flat solid background — use a lift card or plain `<section>` instead.
- Glass tones must match background luminance: `light` over dark, `dark` over light. Inverting breaks contrast.

## Dimensional adaptation

- Expressive + dark: heavier blur (20–24px), stronger white at 18–20%.
- Restrained + light: lighter blur (10–12px), bare white at 10%, thinner border.
- Texture-high directions: pair with a subtle inner noise overlay to stop the glass looking plastic.
