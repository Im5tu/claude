# FullBleedVideoHero

Full-screen video or high-quality looping image sequence. Dark overlay. Content anchored bottom-left. The video is purely atmospheric — it loops silently and creates kinetic energy the text alone cannot. Always include a poster image.

```
---
component: FullBleedVideoHero
category: heroes
subtype: full-bleed-video

dimension-fit:
  contrast-dark: high
  contrast-light: low
  energy-restrained: low
  energy-moderate: medium
  energy-energetic: high
  motion-minimal: low
  motion-moderate: medium
  motion-expressive: high
  # escape (contrast-light + energy-moderate + technical): SaaS in the creative or media industry where video IS the medium being sold, or a human story where product UI would misrepresent the offering
  # escape (contrast-light + energy-restrained + editorial): a single carefully art-directed video loop that functions as a moving photograph (no motion graphics, no cuts, no music) with text in a contained non-competing area

visual-weight: heavy
content-density: sparse
trend-alignment: trending
motion-profile: high

use-when:
  - Brand has a high-quality video asset (studio-grade, not user footage)
  - Bold Studio — kinetic energy as the defining brand signal
  - Dark Luxury — slow, atmospheric video (landscapes, craft, material)
  - Experiential brands, events, hospitality, architecture

avoid-when:
  - Clean SaaS — video backgrounds distract from product clarity
  - Editorial Minimal — motion contradicts the deliberate stillness
  - When the video asset is low quality or shows product UI (use BentoHero)
  - Mobile-only sites (video backgrounds are data-heavy; always fallback to poster)

pairs-well-with: [LogoStrip, FeaturedTestimonial, StatsStrip]
pairs-poorly-with: [TypeHero — both are kinetic, one overwhelms the other]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { EASE, DURATION, STAGGER } from "@/lib/animations";

interface FullBleedVideoHeroProps {
  headline: string;
  subline: string;
  primaryCta: { label: string; href: string };
  secondaryCta?: { label: string; href: string };
  /** MP4 video source */
  videoSrc: string;
  /** Poster image — shown while video loads and on mobile where autoplay may be blocked */
  posterImage: string;
  /** Small label above headline */
  label?: string;
}

export function FullBleedVideoHero({
  headline,
  subline,
  primaryCta,
  secondaryCta,
  videoSrc,
  posterImage,
  label,
}: FullBleedVideoHeroProps) {
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
      delay: 0.6, // Let the video establish itself first
    });
  }, { scope: ref });

  return (
    <section
      ref={ref}
      id="hero"
      className="relative min-h-screen flex items-end overflow-hidden"
    >
      {/* Video background */}
      <div className="absolute inset-0">
        <video
          autoPlay
          muted
          loop
          playsInline
          poster={posterImage}
          className="h-full w-full object-cover"
          aria-hidden="true"
        >
          <source src={videoSrc} type="video/mp4" />
        </video>
        {/* Layered overlay: bottom-heavy for text, slight vignette */}
        <div className="absolute inset-0 bg-gradient-to-t from-black/85 via-black/40 to-black/15" />
        <div className="absolute inset-0 bg-gradient-to-r from-black/30 to-transparent" />
      </div>

      {/* Content — bottom-left */}
      <div className="relative z-10 mx-auto w-full max-w-7xl px-6 pb-20 lg:pb-28">
        {label && (
          <p
            data-animate
            className="mb-6 text-caption font-semibold text-white/50 tracking-widest uppercase"
          >
            {label}
          </p>
        )}
        <h1
          data-animate
          className="max-w-[18ch] font-display font-bold text-display-xl leading-[1.05] tracking-tight text-white"
        >
          {headline}
        </h1>
        <p
          data-animate
          className="mt-5 max-w-[44ch] text-body-lg text-white/70 leading-relaxed"
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
