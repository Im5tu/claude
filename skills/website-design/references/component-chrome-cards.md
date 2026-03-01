# Card Hover Tiers

Three hover interaction tiers for cards. Choose based on card content type.

**Tier selection guide — choose based on card content type:**
- `LiftCard` — best for primarily text/information cards where a physical lift implies interactivity. Well-suited to contrast-light + energy-restrained contexts and texture-high contexts.
- `GlowCard` — best for cards on dark surfaces or when a digital/technical character is appropriate. Well-suited to contrast-light + energy-moderate + technical and contrast-dark + energy-restrained contexts.
- `ZoomCard` — best for image-primary cards where the photograph IS the content and zooming into it rewards hover. Appropriate wherever the card's primary content is visual.

Content type takes precedence over dimensional signal: a texture-high portfolio card with a strong photograph may use ZoomCard; a technical testimonial card may use LiftCard. Let the card's content type determine the choice first — the dimensional correlations above are guidance, not rules.

```tsx
import { cn } from "@/lib/utils";

// Tier 1: Subtle lift — energy-restrained, texture-high
function LiftCard({ children, className }: { children: React.ReactNode; className?: string }) {
  return (
    <div
      className={cn(
        "rounded-xl border border-border bg-surface-secondary p-6",
        "shadow-sm transition-all duration-300 ease-out",
        "hover:-translate-y-1 hover:shadow-lg hover:border-border-strong",
        className,
      )}
    >
      {children}
    </div>
  );
}

// Tier 2: Border glow — energy-moderate + technical, contrast-dark + restrained
function GlowCard({ children, className }: { children: React.ReactNode; className?: string }) {
  return (
    <div
      className={cn(
        "rounded-xl border border-border bg-surface-secondary p-6",
        "transition-all duration-300 ease-out",
        "hover:border-accent/50 hover:shadow-[0_0_20px_rgba(var(--color-accent-rgb),0.1)]",
        className,
      )}
    >
      {children}
    </div>
  );
}

// Tier 3: Image zoom — editorial, energy-energetic
function ZoomCard({
  image,
  imageAlt = "",
  children,
  className,
}: {
  image: string;
  imageAlt?: string;
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <div className={cn("group overflow-hidden rounded-xl", className)}>
      <div className="overflow-hidden">
        <img
          src={image}
          alt={imageAlt}
          className="aspect-[4/3] w-full object-cover transition-transform duration-500 ease-out group-hover:scale-105"
        />
      </div>
      <div className="p-6">{children}</div>
    </div>
  );
}
```
