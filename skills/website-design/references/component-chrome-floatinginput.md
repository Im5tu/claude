# FloatingInput — `.astro`

Form input with animated floating label. Pure CSS — no JS. The label sits over the input at rest and animates up + shrinks when the field has focus or contains a value, via the `:placeholder-shown` pseudo-class pattern.

## Dimensional fit

- surface-depth: any
- motion-register: any
- texture-appetite: any
- type-personality: any
- notes: The floating label uses `--color-secondary` at rest and `--color-accent` on focus. Borders use `--color-border` / `--color-border-strong`.

## File

### `src/components/ui/FloatingInput.astro`

```astro
---
interface Props {
  id: string;
  name: string;
  label: string;
  type?: "text" | "email" | "tel" | "url" | "password";
  required?: boolean;
  autocomplete?: string;
  class?: string;
}
const {
  id,
  name,
  label,
  type = "text",
  required = false,
  autocomplete,
  class: className = "",
} = Astro.props;
---
<div class:list={["fi", className]}>
  <input
    id={id}
    name={name}
    type={type}
    required={required}
    autocomplete={autocomplete}
    placeholder=" "
    class="fi__input"
  />
  <label for={id} class="fi__label">{label}</label>
</div>

<style>
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
</style>
```

## Props

| Prop | Type | Required |
|---|---|---|
| `id` | `string` | yes |
| `name` | `string` | yes |
| `label` | `string` | yes |
| `type` | `"text" \| "email" \| "tel" \| "url" \| "password"` | default `"text"` |
| `required` | `boolean` | default `false` |
| `autocomplete` | `string` | optional |

## Usage

```astro
<form>
  <FloatingInput id="name" name="name" label="Full name" required autocomplete="name" />
  <FloatingInput id="email" name="email" label="Email" type="email" required autocomplete="email" />
  <Button type="submit">Send</Button>
</form>
```

## Notes

- The `placeholder=" "` (single space) is load-bearing: it keeps `:placeholder-shown` working so the label animates when the field is empty.
- For multi-line inputs, duplicate this pattern with `<textarea>` and swap the selector accordingly.
- Validation state (`--color-error`) can be layered on by toggling a `data-invalid` attribute from a Solid form island if the direction requires inline errors.
