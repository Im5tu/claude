# GlassCard

Frosted glass surface for UI elements that float over richly colored or animated backgrounds.

**Critical warning: GlassCard only works on richly coloured backgrounds.** On flat white or grey surfaces the glass effect is invisible and the component becomes a white box with no visual meaning. Use it exclusively over GradientMesh heroes, full-bleed photographs, or dark gradient sections.

```
// One GlassCard per section maximum.
// Never stack multiple GlassCards in the same section.
// On flat backgrounds: use a regular surface-secondary card instead.
```

```tsx
// GlassCard — frosted glass for overlaid UI
// Requires rich background beneath (GradientMesh, photo, dark gradient)

interface GlassCardProps {
  children: React.ReactNode;
  className?: string;
  /** "dark" = white glass (use on dark/colored backgrounds)
   *  "light" = dark glass (use on light/white backgrounds — rare) */
  theme?: "dark" | "light";
}

export function GlassCard({ children, className, theme = "dark" }: GlassCardProps) {
  return (
    <div
      className={`rounded-2xl border ${className ?? ""}`}
      style={{
        backdropFilter: "blur(16px) saturate(180%)",
        WebkitBackdropFilter: "blur(16px) saturate(180%)",
        backgroundColor:
          theme === "dark"
            ? "rgba(255, 255, 255, 0.06)"
            : "rgba(0, 0, 0, 0.04)",
        borderColor:
          theme === "dark"
            ? "rgba(255, 255, 255, 0.12)"
            : "rgba(0, 0, 0, 0.08)",
      }}
    >
      {children}
    </div>
  );
}
```

**Correct usage:**
```tsx
<section className="relative min-h-screen flex items-center">
  <GradientMesh colors={["#0D3B2E", "#1A5C42", "#0A2A1E"]} />
  <div className="relative z-10 mx-auto max-w-7xl px-6 grid lg:grid-cols-2 gap-16 items-center">
    <div>
      <h1 className="font-display font-bold text-display-xl text-white">Your headline here</h1>
    </div>
    <GlassCard className="p-8" theme="dark">
      <h3 className="font-display font-bold text-h3 text-white mb-6">Get Started</h3>
      {/* Form or callout content */}
    </GlassCard>
  </div>
</section>
```
