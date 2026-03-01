# NoiseOverlay

SVG feTurbulence noise texture at fixed position. Adds subtle film grain that elevates perceived quality — the difference between "polished" and "generic template." Mandatory on every site.

```
// Placement: layout.tsx, after {children}, pointer-events-none, z-[9999]
// Opacity: varies by dimensional signal — see index for table
```

```tsx
// NoiseOverlay — authoritative version (from component-recipes.md)
// The micro-interactions.md version is the simplified fallback — use this one.

export function NoiseOverlay({ opacity = 0.03 }: { opacity?: number }) {
  return (
    <div
      className="pointer-events-none fixed inset-0 z-[9999]"
      style={{ opacity }}
      aria-hidden="true"
    >
      <svg className="h-full w-full" xmlns="http://www.w3.org/2000/svg">
        <filter id="noise-filter">
          <feTurbulence
            type="fractalNoise"
            baseFrequency="0.85"
            numOctaves="4"
            stitchTiles="stitch"
          />
          <feColorMatrix type="saturate" values="0" />
        </filter>
        <rect width="100%" height="100%" filter="url(#noise-filter)" />
      </svg>
    </div>
  );
}
```

**Placement in `src/app/layout.tsx`:**
```tsx
import { NoiseOverlay } from "@/components/ui/noise-overlay";

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>
        <GSAPProvider>
          {children}
        </GSAPProvider>
        <NoiseOverlay opacity={0.03} /> {/* Use dimensional-signal-specific opacity value */}
      </body>
    </html>
  );
}
```
