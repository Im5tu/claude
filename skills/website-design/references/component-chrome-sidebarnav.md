# SidebarNav — Editorial Left Rail

Left-rail fixed navigation for editorial and content-heavy sites. Shows as a fixed left column on desktop. Collapses to a hamburger on mobile.

```
// Use when: editorial dimensional signal (contrast-light + energy-restrained + editorial),
// or any content site where the nav should feel like a book's chapter markers, not a marketing header.
// On mobile: collapses to a top bar with hamburger.
```

```tsx
"use client";
import { useState } from "react";
import { cn } from "@/lib/utils";
import { Menu, X } from "lucide-react";

interface SidebarNavProps {
  brand: string;
  links: { label: string; href: string }[];
  cta?: { label: string; href: string };
}

export function SidebarNav({ brand, links, cta }: SidebarNavProps) {
  const [isMobileOpen, setIsMobileOpen] = useState(false);

  return (
    <>
      {/* Desktop: fixed left rail */}
      <nav
        className="hidden lg:flex fixed top-0 left-0 bottom-0 w-56 z-50 flex-col border-r border-border bg-surface-primary px-6 py-8"
        aria-label="Primary navigation"
      >
        <a href="/" className="font-display font-bold text-base text-primary mb-10">
          {brand}
        </a>
        <ul className="flex flex-col gap-1 flex-1">
          {links.map((link) => (
            <li key={link.href}>
              <a
                href={link.href}
                className={cn(
                  "block rounded-md px-3 py-2 text-sm font-medium text-secondary",
                  "transition-colors hover:text-primary hover:bg-surface-secondary",
                )}
              >
                {link.label}
              </a>
            </li>
          ))}
        </ul>
        {cta && (
          <a
            href={cta.href}
            className="mt-auto text-sm font-medium text-accent transition-colors hover:text-accent-light"
          >
            {cta.label}
          </a>
        )}
      </nav>

      {/* Mobile: top bar */}
      <nav
        className="lg:hidden fixed top-0 left-0 right-0 z-50 flex items-center justify-between px-6 py-4 bg-surface-primary border-b border-border"
        aria-label="Primary navigation"
      >
        <a href="/" className="font-display font-bold text-base text-primary">{brand}</a>
        <button
          onClick={() => setIsMobileOpen(true)}
          className="p-2"
          aria-label="Open navigation"
          aria-expanded={isMobileOpen}
        >
          <Menu className="h-5 w-5 text-primary" />
        </button>
      </nav>

      {/* Mobile drawer */}
      {isMobileOpen && (
        <div
          className="lg:hidden fixed inset-0 z-50 bg-surface-primary flex flex-col px-6 py-8"
          role="dialog"
          aria-modal="true"
          aria-label="Navigation menu"
        >
          <div className="flex items-center justify-between mb-10">
            <a href="/" className="font-display font-bold text-base text-primary">{brand}</a>
            <button onClick={() => setIsMobileOpen(false)} aria-label="Close navigation">
              <X className="h-5 w-5 text-primary" />
            </button>
          </div>
          <ul className="flex flex-col gap-2">
            {links.map((link) => (
              <li key={link.href}>
                <a
                  href={link.href}
                  className="block py-3 text-xl font-medium text-primary border-b border-border"
                  onClick={() => setIsMobileOpen(false)}
                >
                  {link.label}
                </a>
              </li>
            ))}
          </ul>
        </div>
      )}
    </>
  );
}
```

**Layout wrapper required when SidebarNav is used:**
```tsx
// In your page layout wrapper:
<div className="lg:pl-56">
  {/* All page content shifted right to accommodate the sidebar */}
  {children}
</div>
```
