# ScrollColorShift

Wraps multiple content sections and transitions the background and text color as the user scrolls through each. Creates a cinematic "chapter" effect where the entire page mood shifts.

```markdown
---
component: ScrollColorShift
category: interactive
subtype: scroll-linked-color

dimension-fit:
  contrast-dark: high
  contrast-light: medium
  energy-restrained: high
  energy-moderate: medium
  energy-energetic: high
visual-weight: medium
content-density: moderate
trend-alignment: trending
motion-profile: moderate

use-when:
  - Narrative content that moves through distinct moods or themes
  - Long-form pages with 3+ thematic sections
  - When brand palette has high contrast between light and dark values

avoid-when:
  - Short pages (fewer than 3 sections — no payoff for the setup)
  - Sections contain complex imagery that conflicts with background color shifts
  - User is expected to skim rather than read

pairs-well-with: [Manifesto, StickyCardStack]
pairs-poorly-with: [GradientMesh, FloatingShapes]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

interface ColorSection {
  /** Must match the id of a child element */
  id: string;
  bgColor: string;
  textColor: string;
}

interface ScrollColorShiftProps {
  sections: ColorSection[];
  children: React.ReactNode;
  className?: string;
}

export function ScrollColorShift({
  sections,
  children,
  className,
}: ScrollColorShiftProps) {
  const containerRef = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    if (!containerRef.current) return;

    sections.forEach((section) => {
      const el = document.getElementById(section.id);
      if (!el) return;

      const animate = () => {
        gsap.to(containerRef.current, {
          backgroundColor: section.bgColor,
          color: section.textColor,
          duration: 0.6,
          ease: "power2.inOut",
        });
      };

      ScrollTrigger.create({
        trigger: el,
        start: "top 60%",
        end: "bottom 40%",
        onEnter: animate,
        onEnterBack: animate,
      });
    });
  }, { scope: containerRef });

  return (
    <div ref={containerRef} className={className}>
      {children}
    </div>
  );
}
```

**Usage:**
```tsx
<ScrollColorShift
  sections={[
    { id: "section-discover", bgColor: "#FAFAF8", textColor: "#1A1A1A" },
    { id: "section-design", bgColor: "#0F0F0F", textColor: "#F5F5F5" },
    { id: "section-deliver", bgColor: "#1A1A3E", textColor: "#FFFFFF" },
  ]}
>
  <div id="section-discover" className="min-h-screen py-24">...</div>
  <div id="section-design" className="min-h-screen py-24">...</div>
  <div id="section-deliver" className="min-h-screen py-24">...</div>
</ScrollColorShift>
```