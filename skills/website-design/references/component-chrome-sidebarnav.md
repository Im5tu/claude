# SidebarNav — Solid island

Fixed left-rail navigation for editorial and content-heavy sites. Desktop shows a persistent left column; mobile collapses to a sheet behind a hamburger.

State is driven (open/closed on mobile, active section highlighting) → SolidJS island, hydrated `client:load` because it's above the fold and immediately usable on mobile.

## Dimensional fit

- surface-depth: light (default), dark (secondary)
- motion-register: restrained, moderate
- texture-appetite: any
- type-personality: humanist-serif, editorial-display (editorial contexts)
- notes: Replaces `Navbar` entirely. Do not render both. Best for long-form magazines, documentation, portfolios with chaptered work.

## File

### `src/components/islands/SidebarNav.tsx`

```tsx
import { createSignal, onCleanup, onMount, For, Show } from "solid-js";
import { Menu, X } from "lucide-solid";

interface Section { id: string; label: string; }
interface Props {
  brand: string;
  items: { label: string; href: string }[];
  sections?: Section[];   // optional in-page anchors to highlight as user scrolls
}

const reduced = () => matchMedia("(prefers-reduced-motion: reduce)").matches;

export default function SidebarNav(props: Props) {
  const [open, setOpen] = createSignal(false);
  const [active, setActive] = createSignal<string | null>(null);

  onMount(() => {
    if (!props.sections?.length) return;
    const io = new IntersectionObserver(
      (entries) => {
        const visible = entries.filter(e => e.isIntersecting).sort((a, b) => b.intersectionRatio - a.intersectionRatio);
        if (visible[0]) setActive(visible[0].target.id);
      },
      { rootMargin: "-40% 0px -50% 0px", threshold: [0, 0.25, 0.5, 0.75, 1] },
    );
    for (const s of props.sections) {
      const el = document.getElementById(s.id);
      if (el) io.observe(el);
    }
    onCleanup(() => io.disconnect());
  });

  return (
    <>
      <button
        class="md:hidden fixed top-4 right-4 z-50 p-2 rounded-full bg-[var(--color-surface)] border border-[var(--color-border)]"
        aria-label="Toggle navigation"
        aria-expanded={open()}
        onClick={() => setOpen(o => !o)}
      >
        <Show when={open()} fallback={<Menu size={20} />}>
          <X size={20} />
        </Show>
      </button>

      <aside
        classList={{
          "sidebar": true,
          "sidebar--open": open(),
        }}
      >
        <a href="/" class="sidebar__brand">{props.brand}</a>

        <nav>
          <p class="sidebar__label">Pages</p>
          <ul class="sidebar__list">
            <For each={props.items}>
              {(i) => <li><a href={i.href} onClick={() => setOpen(false)}>{i.label}</a></li>}
            </For>
          </ul>
        </nav>

        <Show when={props.sections?.length}>
          <nav class="mt-8">
            <p class="sidebar__label">On this page</p>
            <ul class="sidebar__list">
              <For each={props.sections}>
                {(s) => (
                  <li>
                    <a
                      href={`#${s.id}`}
                      classList={{ "is-active": active() === s.id }}
                      onClick={() => setOpen(false)}
                    >{s.label}</a>
                  </li>
                )}
              </For>
            </ul>
          </nav>
        </Show>
      </aside>

      <style>{`
        .sidebar {
          position: fixed;
          inset: 0 auto 0 0;
          width: 16rem;
          padding: 2rem 1.5rem;
          border-right: 1px solid var(--color-border);
          background: var(--color-surface);
          overflow-y: auto;
          z-index: 40;
          transform: translateX(-100%);
          transition: transform 320ms ${reduced() ? "linear" : "cubic-bezier(0.2,0.8,0.2,1)"};
        }
        .sidebar--open { transform: translateX(0); }
        @media (min-width: 768px) {
          .sidebar { transform: translateX(0); }
        }
        .sidebar__brand {
          display: block;
          font-family: var(--font-display);
          font-size: 1.25rem;
          letter-spacing: -0.02em;
          margin-bottom: 2.5rem;
        }
        .sidebar__label {
          font-size: 0.75rem;
          letter-spacing: 0.08em;
          text-transform: uppercase;
          opacity: 0.5;
          margin-bottom: 0.75rem;
        }
        .sidebar__list { display: grid; gap: 0.5rem; }
        .sidebar__list a {
          opacity: 0.8;
          transition: opacity 180ms cubic-bezier(0.2,0.8,0.2,1);
        }
        .sidebar__list a:hover { opacity: 1; }
        .sidebar__list a.is-active {
          opacity: 1;
          color: var(--color-accent);
        }
      `}</style>
    </>
  );
}
```

## Page layout when using SidebarNav

```astro
---
import BaseLayout from "../layouts/BaseLayout.astro";
import SidebarNav from "../components/islands/SidebarNav.tsx";
---
<BaseLayout>
  <SidebarNav
    client:load
    brand="Atelier"
    items={[
      { label: "Work", href: "/work" },
      { label: "Studio", href: "/about" },
      { label: "Journal", href: "/journal" },
      { label: "Contact", href: "/contact" },
    ]}
  />
  <main class="md:ml-64">
    <slot />
  </main>
</BaseLayout>
```

## Props

| Prop | Type | Notes |
|---|---|---|
| `brand` | `string` | Wordmark |
| `items` | `{ label; href }[]` | Primary nav |
| `sections` | `{ id; label }[]` | Optional in-page anchor list (scroll-spy) |

## Dimensional adaptation

- Restrained → drop the scroll-spy; static list only.
- Editorial display → add a small decorative rule above each section group.
- Dark surface-depth → invert to a dark sidebar on a light content surface for editorial contrast.
