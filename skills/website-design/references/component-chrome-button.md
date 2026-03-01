# Button + HeroButton

Multi-variant button with scale-on-interaction physics. Use `Button` for all standard CTAs. Use `HeroButton` only for the primary hero CTA where extra visual weight is justified.

```
// Variants:
//   primary   — filled accent background (most CTAs)
//   secondary — surface background with border
//   ghost     — transparent, text only
//   outline   — transparent with accent border, fills on hover
//
// Sizes: sm | md | lg | xl
// Use xl for hero CTAs, md for body CTAs, sm for inline actions
```

```tsx
"use client";
import { type ButtonHTMLAttributes, forwardRef } from "react";
import { cn } from "@/lib/utils";

type ButtonVariant = "primary" | "secondary" | "ghost" | "outline";
type ButtonSize = "sm" | "md" | "lg" | "xl";

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: ButtonVariant;
  size?: ButtonSize;
  loading?: boolean;
}

const variantStyles: Record<ButtonVariant, string> = {
  primary:
    "bg-accent text-white hover:bg-accent-light active:bg-accent-dark shadow-sm hover:shadow-md",
  secondary:
    "bg-surface-secondary text-primary border border-border hover:bg-surface-sunken hover:border-border-strong",
  ghost:
    "bg-transparent text-primary hover:bg-surface-secondary",
  outline:
    "bg-transparent text-accent border border-accent hover:bg-accent hover:text-white",
};

const sizeStyles: Record<ButtonSize, string> = {
  sm: "h-8 px-3 text-sm gap-1.5",
  md: "h-10 px-5 text-sm gap-2",
  lg: "h-12 px-6 text-base gap-2",
  xl: "h-14 px-8 text-base gap-2.5",
};

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ variant = "primary", size = "md", loading, className, children, disabled, ...props }, ref) => {
    return (
      <button
        ref={ref}
        disabled={disabled || loading}
        className={cn(
          "relative inline-flex items-center justify-center font-medium",
          "rounded-lg transition-all duration-200",
          "hover:scale-[1.02] active:scale-[0.98]",
          "focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-accent",
          "focus:not(:focus-visible):outline-none",
          "disabled:opacity-50 disabled:pointer-events-none",
          variantStyles[variant],
          sizeStyles[size],
          className,
        )}
        {...props}
      >
        {loading ? (
          <span
            className="inline-block h-4 w-4 animate-spin rounded-full border-2 border-current border-t-transparent"
            aria-label="Loading"
          />
        ) : (
          children
        )}
      </button>
    );
  },
);
Button.displayName = "Button";
```

## HeroButton — Sliding Background Layer

For the primary hero CTA only. Adds a white shimmer sweep on hover for extra visual presence.

```tsx
import { type ButtonHTMLAttributes } from "react";
import { cn } from "@/lib/utils";

export function HeroButton({
  children,
  className,
  ...props
}: ButtonHTMLAttributes<HTMLButtonElement>) {
  return (
    <button
      className={cn(
        "group relative overflow-hidden rounded-lg px-8 py-4",
        "bg-accent text-white font-medium text-base",
        "transition-transform duration-200",
        "hover:scale-[1.02] active:scale-[0.98]",
        "focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-accent",
        className,
      )}
      {...props}
    >
      {/* Shimmer sweep */}
      <span
        className={cn(
          "absolute inset-0 -translate-x-full bg-white/20",
          "transition-transform duration-500 ease-out",
          "group-hover:translate-x-0",
        )}
        aria-hidden="true"
      />
      <span className="relative z-10">{children}</span>
    </button>
  );
}
```
