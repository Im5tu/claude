# Navbar — `.astro`

Fixed navbar that starts transparent and morphs to frosted glass as the page scrolls past a threshold. The morph is pure CSS via `animation-timeline: scroll(root)` — no IntersectionObserver, no scroll listener, no JS.

Mobile menu open/close state is handled by a tiny SolidJS island (`MobileMenu.tsx`) hydrated with `client:visible`.

## Dimensional fit

- surface-depth: any (two variants: pill for light/expressive, full-width for dark/restrained)
- motion-register: any
- texture-appetite: any
- type-personality: any
- notes: The threshold (default 160px) can be raised for tall heroes. See `core-animation.md` §Navbar scroll morph.

## Files

### `src/components/layout/Navbar.astro`

```astro
---
import NavLink from "../ui/NavLink.astro";
import MobileMenu from "../islands/MobileMenu.tsx";
import ThemeToggle from "../islands/ThemeToggle.tsx";

interface NavItem { label: string; href: string; }
interface Props {
  brand: string;
  items: NavItem[];
  cta?: { label: string; href: string };
  variant?: "pill" | "full-width";
  withThemeToggle?: boolean;
}
const {
  brand,
  items,
  cta,
  variant = "pill",
  withThemeToggle = false,
} = Astro.props;
---
<header class:list={["nav", `nav-${variant}`]}>
  <div class="nav__inner">
    <a href="/" class="nav__brand">{brand}</a>

    <nav class="nav__links" aria-label="Primary">
      {items.map((i) => <NavLink href={i.href}>{i.label}</NavLink>)}
    </nav>

    <div class="nav__actions">
      {withThemeToggle && <ThemeToggle client:load />}
      {cta && <a href={cta.href} class="nav__cta">{cta.label}</a>}
      <MobileMenu items={items} cta={cta} client:visible />
    </div>
  </div>
</header>

<style>
  .nav {
    position: fixed;
    inset: 0 0 auto 0;
    z-index: 50;
    background: transparent;
    backdrop-filter: blur(0);
    border-bottom: 1px solid transparent;
    animation: nav-morph linear both;
    animation-timeline: scroll(root);
    animation-range: 0 160px;
  }
  @keyframes nav-morph {
    to {
      background: color-mix(in oklab, var(--color-surface) 75%, transparent);
      backdrop-filter: blur(14px);
      border-bottom-color: color-mix(in oklab, currentColor 10%, transparent);
    }
  }
  @media (prefers-reduced-motion: reduce) {
    .nav { animation: none; background: color-mix(in oklab, var(--color-surface) 85%, transparent); backdrop-filter: blur(10px); }
  }

  .nav__inner {
    max-width: 80rem;
    margin: 0 auto;
    padding: 0.75rem 1.5rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 2rem;
  }

  .nav-pill .nav__inner {
    max-width: 64rem;
    margin: 0.75rem auto 0;
    border-radius: 999px;
    border: 1px solid color-mix(in oklab, currentColor 8%, transparent);
  }

  .nav__brand { font-family: var(--font-display); font-size: 1.125rem; letter-spacing: -0.02em; }

  .nav__links { display: none; gap: 1.5rem; }
  @media (min-width: 768px) { .nav__links { display: flex; } }

  .nav__actions { display: flex; align-items: center; gap: 1rem; }

  .nav__cta {
    display: none;
    padding: 0.5rem 1.25rem;
    border-radius: 999px;
    background: var(--color-accent);
    color: var(--color-surface);
    font-size: 0.875rem;
    transition: background var(--motion-duration-fast) var(--ease-out-soft);
  }
  .nav__cta:hover { background: var(--color-accent-dark); }
  @media (min-width: 768px) { .nav__cta { display: inline-flex; } }
</style>
```

### `src/components/islands/MobileMenu.tsx` — Solid island

```tsx
import { createSignal, onCleanup, onMount, For, Show } from "solid-js";
import { Menu, X } from "lucide-solid";

interface NavItem { label: string; href: string; }
interface Props {
  items: NavItem[];
  cta?: { label: string; href: string };
}

export default function MobileMenu(props: Props) {
  const [open, setOpen] = createSignal(false);

  onMount(() => {
    const onKey = (e: KeyboardEvent) => { if (e.key === "Escape") setOpen(false); };
    window.addEventListener("keydown", onKey);
    onCleanup(() => window.removeEventListener("keydown", onKey));
  });

  return (
    <>
      <button
        class="md:hidden p-2 -mr-2"
        aria-label="Toggle menu"
        aria-expanded={open()}
        onClick={() => setOpen(o => !o)}
      >
        <Show when={open()} fallback={<Menu size={20} />}>
          <X size={20} />
        </Show>
      </button>
      <Show when={open()}>
        <div class="fixed inset-0 top-[56px] bg-[var(--color-surface)] p-6 z-40 md:hidden">
          <ul class="grid gap-4 text-xl">
            <For each={props.items}>
              {(i) => <li><a href={i.href} onClick={() => setOpen(false)}>{i.label}</a></li>}
            </For>
            {props.cta && (
              <li>
                <a href={props.cta.href} class="inline-block mt-4 px-5 py-2 rounded-full bg-[var(--color-accent)] text-[var(--color-surface)]">
                  {props.cta.label}
                </a>
              </li>
            )}
          </ul>
        </div>
      </Show>
    </>
  );
}
```

## Props

| Prop | Type | Notes |
|---|---|---|
| `brand` | `string` | Wordmark |
| `items` | `{ label; href }[]` | Primary nav links |
| `cta` | `{ label; href }` | Optional right-aligned CTA |
| `variant` | `"pill" \| "full-width"` | Default `"pill"`. Full-width for dark + restrained or editorial |
| `withThemeToggle` | `boolean` | Inserts `ThemeToggle` client:load |

## Dimensional adaptation

- Pill variant → centered rounded bar at top, 0.75rem gutter from viewport top.
- Full-width variant → flush top, no pill inner border.
- Dark + restrained → `nav-morph` target becomes a near-opaque surface instead of translucent.
- Editorial → replace with `SidebarNav` instead of this component.
