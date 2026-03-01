# FullBleedImageHero

Full-screen background image with gradient overlay. Content anchored to bottom-left (`justify-end pb-24`). The image IS the atmosphere — the text is a caption for the feeling it creates.

```
---
component: FullBleedImageHero
category: heroes
subtype: full-bleed-image

dimension-fit:
  contrast-dark: high
  contrast-light: medium
  energy-restrained: high
  energy-moderate: medium
  energy-energetic: low
  motion-minimal: high
  motion-moderate: low
  motion-expressive: low
  # escape (contrast-light): SaaS product with a human story where photography IS the brand asset and no product UI exists or is suitable as the primary hero visual

visual-weight: heavy
content-density: sparse
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - Brand has a powerful editorial or atmospheric photograph
  - The image communicates the brand feeling without text
  - Dark luxury positioning or experiential/lifestyle brands
  - Warm artisan where location or craft environment is the story

avoid-when:
  - Clean SaaS — product photography rarely has the atmospheric depth needed
  - The image is a product mockup or screenshot (use BentoHero instead)
  - The headline is longer than 10 words — bottom-left space is limited

pairs-well-with: [LogoStrip, StatsStrip, FeaturedTestimonial]
pairs-poorly-with: [SplitHero, BentoHero — competing visual intensity]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { EASE, DURATION, STAGGER } from "@/lib/animations";

interface FullBleedImageHeroProps {
  headline: string;
  subline: string;
  primaryCta: { label: string; href: string };
  secondaryCta?: { label: string; href: string };
  backgroundImage: string;
  /** Overlay darkness — defaults to moderate for readability */
  overlayIntensity?: "light" | "moderate" | "heavy";
}

const overlayMap = {
  light: "from-black/60 via-black/30 to-black/10",
  moderate: "from-black/80 via-black/50 to-black/20",
  heavy: "from-black/90 via-black/60 to-black/30",
};

export function FullBleedImageHero({
  headline,
  subline,
  primaryCta,
  secondaryCta,
  backgroundImage,
  overlayIntensity = "moderate",
}: FullBleedImageHeroProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;
    const items = ref.current.querySelectorAll("[data-animate]");
    gsap.set(items, { y: 32, opacity: 0 });
    gsap.to(items, {
      y: 0,
      opacity: 1,
      duration: DURATION.slow,
      stagger: STAGGER.relaxed,
      ease: EASE.enter,
      delay: 0.5,
    });

    // Subtle Ken Burns on the image
    const img = ref.current.querySelector<HTMLImageElement>(".hero-bg-image");
    if (img) {
      gsap.fromTo(
        img,
        { scale: 1.08 },
        { scale: 1, duration: 8, ease: "none" }
      );
    }
  }, { scope: ref });

  return (
    <section
      ref={ref}
      id="hero"
      className="relative min-h-screen flex items-end overflow-hidden"
    >
      {/* Background image */}
      <div className="absolute inset-0">
        <img
          src={backgroundImage}
          alt=""
          role="presentation"
          className="hero-bg-image h-full w-full object-cover"
          width={1920}
          height={1080}
        />
        {/* Multi-stop gradient — heavy at bottom for text legibility */}
        <div
          className={`absolute inset-0 bg-gradient-to-t ${overlayMap[overlayIntensity]}`}
        />
      </div>

      {/* Content — bottom-left anchored */}
      <div className="relative z-10 mx-auto w-full max-w-7xl px-6 pb-20 lg:pb-28">
        <h1
          data-animate
          className="max-w-[18ch] font-display font-bold text-display-xl leading-[1.05] tracking-tight text-white"
        >
          {headline}
        </h1>
        <p
          data-animate
          className="mt-5 max-w-[44ch] text-body-lg text-white/75 leading-relaxed"
        >
          {subline}
        </p>
        <div data-animate className="mt-8 flex flex-wrap gap-4">
          <a
            href={primaryCta.href}
            className="inline-flex items-center rounded-lg bg-white px-7 py-3.5 text-body-sm font-semibold text-neutral-900 transition-all duration-200 hover:bg-white/90 hover:scale-[1.02] active:scale-[0.98]"
          >
            {primaryCta.label}
          </a>
          {secondaryCta && (
            <a
              href={secondaryCta.href}
              className="inline-flex items-center rounded-lg border border-white/30 px-7 py-3.5 text-body-sm font-medium text-white transition-colors hover:bg-white/10 hover:border-white/50"
            >
              {secondaryCta.label}
            </a>
          )}
        </div>
      </div>
    </section>
  );
}
```
