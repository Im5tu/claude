# Floating input

Form input with animated floating label. Pure CSS, no JS. The label sits over the input at rest and animates up and shrinks when the field has focus or contains a value, via the `:placeholder-shown` pseudo-class pattern.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any
- notes: The floating label uses `--color-secondary` at rest and `--color-accent` on focus. Borders use `--color-border` / `--color-border-strong`.

## Structure

- `<div class="fi">`
  - `<input class="fi__input" placeholder=" ">` with `id`, `name`, `type` (text/email/tel/url/password), optional `required` and `autocomplete`
  - `<label class="fi__label" for="...">` matching the input's `id`; label text inside

The label must immediately follow the input (the CSS uses the `+` adjacent-sibling combinator).

## CSS

```css
.fi {
  position: relative;
  display: block;
}
.fi__input {
  width: 100%;
  padding: 1.25rem 1rem 0.75rem;
  background: transparent;
  border: 1px solid var(--color-border);
  border-radius: 0.75rem;
  color: var(--color-primary);
  font-family: var(--font-body);
  font-size: 1rem;
  transition: border-color var(--motion-duration-fast) var(--ease-out-soft);
}
.fi__input:focus {
  outline: none;
  border-color: var(--color-accent);
}
.fi__label {
  position: absolute;
  inset: 0.75rem auto auto 1rem;
  pointer-events: none;
  color: var(--color-secondary);
  font-size: 0.75rem;
  letter-spacing: 0.02em;
  transform-origin: left top;
  transition:
    translate var(--motion-duration-fast) var(--ease-out-soft),
    scale var(--motion-duration-fast) var(--ease-out-soft),
    color var(--motion-duration-fast) var(--ease-out-soft);
}
/* Resting state: field is empty (placeholder visible) and NOT focused */
.fi__input:placeholder-shown:not(:focus) + .fi__label {
  translate: 0 0.55rem;
  scale: 1.1;
}
/* Active state: focused OR has a value */
.fi__input:focus + .fi__label {
  color: var(--color-accent);
}

@media (prefers-reduced-motion: reduce) {
  .fi__input, .fi__label { transition: none; }
}
```

## Usage

Sketch of a form pairing floating inputs with the primary button:

```html
<form>
  <div class="fi">
    <input class="fi__input" id="name" name="name" placeholder=" " required autocomplete="name">
    <label class="fi__label" for="name">Full name</label>
  </div>
  <div class="fi">
    <input class="fi__input" id="email" name="email" type="email" placeholder=" " required autocomplete="email">
    <label class="fi__label" for="email">Email</label>
  </div>
  <button class="btn btn-primary" type="submit">Send</button>
</form>
```

## Notes

- The `placeholder=" "` (single space) is load-bearing: it keeps `:placeholder-shown` working so the label animates when the field is empty.
- For multi-line inputs, duplicate this pattern with `<textarea>` and swap the selector accordingly.
- Validation state (`--color-error`) can be layered on by toggling a `data-invalid` attribute from whatever form script the direction requires for inline errors.
