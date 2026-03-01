# GradientMeshHero

Clean SaaS dark hero with an animated gradient mesh background. Centered or split layout. Glass card overlay for form, CTA widget, or social proof. Use when the product or lead form should share attention with the headline.

```
---
component: GradientMeshHero
category: heroes
subtype: gradient-mesh-saas

dimension-fit:
  contrast-dark: medium
  contrast-light: high
  energy-restrained: low
  energy-moderate: high
  energy-energetic: medium
  motion-minimal: low
  motion-moderate: high
  motion-expressive: low
  # escape (energy-restrained + texture-high): digitally-native artisan product (craft courses, online education) where lead-gen in the hero is essential; mesh colors must be drawn exclusively from warm earth tones
  # escape (energy-restrained + editorial): editorial product requiring a lead-gen form (newsletter, waitlist) with gradient reduced to a single barely-perceptible tone shift — not a color showcase

visual-weight: medium
content-density: rich
trend-alignment: trending
motion-profile: moderate

use-when:
  - SaaS product that needs a lead-gen form in the hero
  - Brand wants visual energy without a photograph
  - Dark or deep-toned hero that still feels technical and credible
  - When a glass-card CTA needs a rich background to read against

avoid-when:
  - Warm Artisan — mesh reads as cold and digital
  - Editorial Minimal — too much visual noise for a type-first approach
  - When the hero already has a strong photograph (pick FullBleedImageHero instead)

pairs-well-with: [LogoStrip, FeatureTabs, StatsStrip]
pairs-poorly-with: [FullBleedImageHero, TypeHero — competing visual treatments in adjacent sections]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { EASE, DURATION, STAGGER } from "@/lib/animations";
import { GradientMesh } from "@/components/animations/gradient-mesh";
import { GlassCard } from "@/components/ui/glass-card";

interface GradientMeshHeroProps {
  badge?: string;
  headline: string;
  subline: string;
  /** Colors for the three mesh orbs — derive from preset palette */
  meshColors: [string, string, string];
  /** Content rendered inside the glass card (form, CTA widget, social proof) */
  cardContent: React.ReactNode;
  /** Label above the card */
  cardLabel?: string;
}

export function GradientMeshHero({
  badge,
  headline,
  subline,
  meshColors,
  cardContent,
  cardLabel,
}: GradientMeshHeroProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;
    const items = ref.current.querySelectorAll("[data-animate]");
    gsap.set(items, { y: 24, opacity: 0 });
    gsap.to(items, {
      y: 0,
      opacity: 1,
      duration: DURATION.moderate,
      stagger: STAGGER.normal,
      ease: EASE.enter,
      delay: 0.2,
    });
  }, { scope: ref });

  return (
    <section
      ref={ref}
      id="hero"
      className="relative min-h-screen flex items-center bg-neutral-950 overflow-hidden"
    >
      {/* Animated gradient mesh — pure atmosphere */}
      <GradientMesh colors={meshColors} />

      {/* Content */}
      <div className="relative z-10 mx-auto max-w-7xl w-full px-6 grid grid-cols-1 gap-12 lg:grid-cols-2 lg:gap-20 items-center pt-32 pb-16 lg:pt-40 lg:pb-24">
        {/* Left: Text */}
        <div>
          {badge && (
            <span
              data-animate
              className="inline-flex items-center gap-2 rounded-full border border-white/15 bg-white/8 px-4 py-1.5 text-caption font-semibold text-white/70 tracking-widest uppercase"
            >
              <span className="inline-block h-1.5 w-1.5 rounded-full bg-accent" />
              {badge}
            </span>
          )}
          <h1
            data-animate
            className="mt-6 font-display font-bold text-display-xl leading-[1.05] tracking-tight text-white max-w-[22ch]"
          >
            {headline}
          </h1>
          <p
            data-animate
            className="mt-6 text-body-lg text-white/60 max-w-[46ch] leading-relaxed"
          >
            {subline}
          </p>
        </div>

        {/* Right: Glass card with form/CTA */}
        <div data-animate>
          {cardLabel && (
            <p className="mb-4 text-caption font-semibold text-white/40 tracking-widest uppercase">
              {cardLabel}
            </p>
          )}
          <GlassCard className="p-8" theme="dark">
            {cardContent}
          </GlassCard>
        </div>
      </div>
    </section>
  );
}
```

**Usage:**
```tsx
<GradientMeshHero
  badge="Now in beta"
  headline="Financial clarity starts here."
  subline="Automated reporting that turns complex data into decisions your whole team understands."
  meshColors={["#0D3B2E", "#1A5C42", "#0A2A1E"]}
  cardLabel="Start free — no credit card"
  cardContent={
    <form className="space-y-4">
      <input type="email" placeholder="Work email" className="w-full rounded-lg border border-white/15 bg-white/8 px-4 py-3 text-white placeholder:text-white/30 outline-none focus:border-accent" />
      <button type="submit" className="w-full rounded-lg bg-accent py-3 text-body-sm font-semibold text-white hover:bg-accent-light transition-colors">
        Get early access
      </button>
      <p className="text-center text-caption text-white/35">Join 2,400 teams already on the waitlist</p>
    </form>
  }
/>
```
