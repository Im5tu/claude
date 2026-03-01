# Link Animations

Three underline animation patterns. Match to dimensional personality.

**When to use each:**
- `NavLink` (expand-left) — Default. Use in navbar, body text links, most contexts.
- `SlideLink` (slide-through) — High-energy, editorial headers. More kinetic.
- `HighlightLink` (background-highlight) — Texture-high or editorial contexts. Feels like a highlighter pen.

```tsx
import { cn } from "@/lib/utils";

// Style 1: Expand from left — default nav link
function NavLink({ href, children }: { href: string; children: React.ReactNode }) {
  return (
    <a
      href={href}
      className={cn(
        "relative text-sm font-medium text-secondary transition-colors hover:text-primary",
        "after:absolute after:bottom-0 after:left-0 after:h-[2px] after:w-full",
        "after:origin-left after:scale-x-0 after:bg-accent",
        "after:transition-transform after:duration-300 after:ease-out",
        "hover:after:scale-x-100",
      )}
    >
      {children}
    </a>
  );
}

// Style 2: Slide through — enter from left, exit right
function SlideLink({ href, children }: { href: string; children: React.ReactNode }) {
  return (
    <a
      href={href}
      className={cn(
        "relative text-sm font-medium text-secondary transition-colors hover:text-primary",
        "after:absolute after:bottom-0 after:left-0 after:h-[2px] after:w-full",
        "after:origin-right after:scale-x-0 after:bg-accent",
        "after:transition-transform after:duration-300 after:ease-out",
        "hover:after:origin-left hover:after:scale-x-100",
      )}
    >
      {children}
    </a>
  );
}

// Style 3: Background highlight — highlighter pen effect
function HighlightLink({ href, children }: { href: string; children: React.ReactNode }) {
  return (
    <a
      href={href}
      className={cn(
        "bg-gradient-to-r from-accent/20 to-accent/20 bg-[length:0%_2px] bg-left-bottom bg-no-repeat",
        "transition-[background-size] duration-300 ease-out",
        "hover:bg-[length:100%_2px]",
        "text-sm font-medium text-primary",
      )}
    >
      {children}
    </a>
  );
}
```
