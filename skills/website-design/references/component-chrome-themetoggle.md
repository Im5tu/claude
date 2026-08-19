# ThemeToggle — Solid island

Dark mode toggle. Reads `prefers-color-scheme` on mount, persists to `localStorage`, applies a `.dark` class on `<html>`. Use in the navbar only when the site actually supports both themes.

Hydration: `client:load` — it's above-the-fold and must apply the correct initial state before paint to avoid a flash.

## Dimensional fit

- surface-depth: only relevant when both are supported
- motion-register: any
- notes: The Tailwind v4 `@theme` block in `src/styles/global.css` should define colour tokens for both themes via `@variant dark`.

## File

### `src/components/islands/ThemeToggle.tsx`

```tsx
import { createSignal, onMount } from "solid-js";
import { Sun, Moon } from "lucide-solid";

type Theme = "light" | "dark";

function readInitial(): Theme {
  if (typeof document === "undefined") return "light";
  const stored = localStorage.getItem("theme") as Theme | null;
  if (stored === "light" || stored === "dark") return stored;
  return matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
}

function apply(theme: Theme) {
  document.documentElement.classList.toggle("dark", theme === "dark");
  localStorage.setItem("theme", theme);
}

export default function ThemeToggle() {
  const [theme, setTheme] = createSignal<Theme>("light");

  onMount(() => {
    const initial = readInitial();
    setTheme(initial);
    apply(initial);
  });

  const toggle = () => {
    const next: Theme = theme() === "dark" ? "light" : "dark";
    setTheme(next);
    apply(next);
  };

  return (
    <button
      onClick={toggle}
      class="theme-toggle"
      aria-label={`Switch to ${theme() === "dark" ? "light" : "dark"} mode`}
      aria-pressed={theme() === "dark"}
    >
      {theme() === "dark" ? <Sun size={16} /> : <Moon size={16} />}
      <style>{`
        .theme-toggle {
          display: inline-flex;
          align-items: center;
          justify-content: center;
          width: 2rem;
          height: 2rem;
          border-radius: 999px;
          color: var(--color-primary);
          transition: background 180ms cubic-bezier(0.2,0.8,0.2,1);
        }
        .theme-toggle:hover { background: color-mix(in oklab, currentColor 8%, transparent); }
        .theme-toggle:focus-visible { outline: 2px solid var(--color-accent); outline-offset: 3px; }
      `}</style>
    </button>
  );
}
```

## Anti-flash inline script (mandatory)

To avoid a light→dark flash on first paint, add a blocking script to `<head>` in `BaseLayout.astro` BEFORE any stylesheet that depends on `.dark`:

```astro
<script is:inline>
  (function () {
    const stored = localStorage.getItem("theme");
    const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches;
    const theme = stored ?? (prefersDark ? "dark" : "light");
    if (theme === "dark") document.documentElement.classList.add("dark");
  })();
</script>
```

This runs synchronously before first paint, pinning the correct class before the Solid island hydrates.

## Props

None — the component is self-contained.

## Usage

```astro
---
import ThemeToggle from "../islands/ThemeToggle.tsx";
---
<header>
  <ThemeToggle client:load />
</header>
```

## Dimensional adaptation

- Icon-only default is sufficient for most directions.
- Editorial register → swap icons for labelled text: `Light / Dark`.
- Expressive register → add a subtle rotate on toggle via CSS transition on an inner `<span>`.
