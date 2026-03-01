# GSAPProvider

Global GSAP setup. Registers ScrollTrigger, handles `prefers-reduced-motion`, and cleans up all triggers on unmount. Must wrap the entire app in `layout.tsx`.

```
// Placement: src/app/layout.tsx, wrapping {children}
// This is the only place GSAP is registered globally.
// Individual components also call gsap.registerPlugin(ScrollTrigger) as a safety
// measure — this is idempotent and safe.
```

```tsx
"use client";
import { useEffect } from "react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

export function GSAPProvider({ children }: { children: React.ReactNode }) {
  useEffect(() => {
    gsap.registerPlugin(ScrollTrigger);

    // Respect prefers-reduced-motion globally
    const mq = window.matchMedia("(prefers-reduced-motion: reduce)");
    if (mq.matches) {
      // Effectively instant — animations complete in one frame
      gsap.globalTimeline.timeScale(1000);
      ScrollTrigger.defaults({ animation: undefined });
    }

    // Listen for runtime changes (user toggles OS setting)
    const handleChange = (e: MediaQueryListEvent) => {
      gsap.globalTimeline.timeScale(e.matches ? 1000 : 1);
    };
    mq.addEventListener("change", handleChange);

    return () => {
      mq.removeEventListener("change", handleChange);
      ScrollTrigger.getAll().forEach((t) => t.kill());
    };
  }, []);

  return <>{children}</>;
}
```
