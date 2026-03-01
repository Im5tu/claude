# FloatingInput

Form input with animated floating label. Use for contact forms, newsletter captures with fields, and any form that has more than one input. The label animates up and shrinks when the field receives focus or has a value.

```tsx
"use client";
import { type InputHTMLAttributes } from "react";
import { cn } from "@/lib/utils";

interface FloatingInputProps extends InputHTMLAttributes<HTMLInputElement> {
  label: string;
  error?: string;
}

export function FloatingInput({ label, error, className, id, ...props }: FloatingInputProps) {
  return (
    <div className={cn("relative", className)}>
      <input
        id={id}
        className={cn(
          "peer w-full rounded-lg border bg-transparent px-4 pt-5 pb-2 text-base text-primary",
          "outline-none transition-all duration-200",
          error
            ? "border-error focus:ring-2 focus:ring-error/20"
            : "border-border focus:border-accent focus:ring-2 focus:ring-accent/20",
        )}
        placeholder=" "
        aria-invalid={!!error}
        aria-describedby={error ? `${id}-error` : undefined}
        {...props}
      />
      <label
        htmlFor={id}
        className={cn(
          "absolute left-4 transition-all duration-200 pointer-events-none",
          // Resting state (placeholder visible)
          "peer-placeholder-shown:top-1/2 peer-placeholder-shown:-translate-y-1/2",
          "peer-placeholder-shown:text-base peer-placeholder-shown:text-disabled",
          // Active / filled state
          "peer-focus:top-2 peer-focus:text-xs peer-focus:text-accent peer-focus:-translate-y-0",
          "peer-[:not(:placeholder-shown)]:top-2 peer-[:not(:placeholder-shown)]:text-xs",
          "peer-[:not(:placeholder-shown)]:-translate-y-0",
          error ? "text-error" : "text-secondary",
        )}
      >
        {label}
      </label>
      {error && (
        <p id={`${id}-error`} className="mt-1.5 text-xs text-error" role="alert">
          {error}
        </p>
      )}
    </div>
  );
}
```
