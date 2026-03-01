# Manifesto

Full-bleed dark section with a parallax texture behind two contrasting statements. The contrast line states the industry's common approach; the power line states your differentiation. The power line reveals word-by-word on scroll.

```markdown
---
component: Manifesto
category: cta
subtype: philosophy-differentiation

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: medium
  energy-energetic: high
visual-weight: heavy
content-density: sparse
trend-alignment: evergreen
motion-profile: moderate

use-when:
  - Business philosophy is genuinely their competitive differentiator
  - The brand has a clear, ownable POV that contrasts with industry convention
  - Long-form homepage where this serves as the narrative midpoint (between Process and Testimonials)

avoid-when:
  - Generic service business with no distinctive philosophy
  - E-commerce or transactional sites (no philosophy to express)
  - Solo practitioners without a strong differentiated point of view
  - Tools/SaaS without a genuine mission (forced mission statements read as marketing copy, not belief)
  - warm-artisan: the dark treatment clashes with organic warmth

pairs-well-with: [CTABanner, StickyCardStack]
pairs-poorly-with: [NewsletterCapture, ContactGateway]
---
```

**CRITICAL:** The Manifesto only works when the contrast line and power line are genuinely true and ownable. Never write generic versions ("We put clients first," "Quality you can trust"). If the business cannot produce an honest, specific contrast line, omit this section entirely.

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION, STAGGER } from "@/lib/animations";
import { ParallaxLayer } from "@/components/animations/parallax-layer";

gsap.registerPlugin(ScrollTrigger);

interface ManifestoProps {
  /** Small contrast statement: "Most [industry] does [common approach]." */
  contrastLine: string;
  /** Large power statement: "We [differentiate]." */
  powerLine: string;
  /** The single keyword in powerLine to highlight with accent color */
  accentKeyword: string;
  /** Optional background texture image (low opacity, parallax scrolling) */
  textureImage?: string;
}

export function Manifesto({
  contrastLine,
  powerLine,
  accentKeyword,
  textureImage,
}: ManifestoProps) {
  const sectionRef = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!sectionRef.current) return;

    // Contrast line — simple fade up
    const contrastEl = sectionRef.current.querySelector(".manifesto-contrast");
    if (contrastEl) {
      gsap.set(contrastEl, { y: 20, opacity: 0 });
      gsap.to(contrastEl, {
        y: 0,
        opacity: 1,
        duration: DURATION.moderate,
        ease: EASE.enter,
        scrollTrigger: {
          trigger: sectionRef.current,
          start: "top 70%",
          toggleActions: "play none none none",
        },
      });
    }

    // Power line — word by word reveal
    const words = sectionRef.current.querySelectorAll(".manifesto-word");
    if (words.length) {
      gsap.set(words, { y: "110%", opacity: 0 });
      gsap.to(words, {
        y: "0%",
        opacity: 1,
        duration: DURATION.slow,
        stagger: STAGGER.relaxed,
        ease: EASE.enter,
        scrollTrigger: {
          trigger: sectionRef.current,
          start: "top 60%",
          toggleActions: "play none none none",
        },
      });
    }
  }, { scope: sectionRef });

  const powerWords = powerLine.split(" ");

  return (
    <section
      ref={sectionRef}
      className="relative overflow-hidden bg-neutral-950 py-20 lg:py-32"
    >
      {/* Parallax texture */}
      {textureImage && (
        <ParallaxLayer speed={0.3} className="absolute inset-0 z-0">
          <img
            src={textureImage}
            alt=""
            className="h-full w-full object-cover opacity-[0.07]"
            width={1920}
            height={1080}
          />
        </ParallaxLayer>
      )}

      <div className="relative z-10 mx-auto max-w-5xl px-6 text-center">
        {/* Contrast line */}
        <p className="manifesto-contrast text-body-lg text-neutral-500 max-w-[50ch] mx-auto">
          {contrastLine}
        </p>

        {/* Power statement */}
        <h2 className="mt-10 font-display text-[clamp(2rem,5vw,4.5rem)] leading-[1.1] tracking-tight">
          {powerWords.map((word, i) => (
            <span key={i} className="inline-block overflow-hidden mx-[0.15em]">
              <span
                className={`manifesto-word inline-block ${
                  word.toLowerCase().replace(/[.,!?]/g, "") === accentKeyword.toLowerCase()
                    ? "text-accent font-bold italic"
                    : "text-white font-semibold"
                }`}
              >
                {word}
              </span>
            </span>
          ))}
        </h2>
      </div>
    </section>
  );
}
```

**Usage:**
```tsx
<Manifesto
  contrastLine="Most financial advisers focus on products — commissions, quotas, and cookie-cutter portfolios."
  powerLine="We focus on clarity."
  accentKeyword="clarity"
  textureImage="https://images.unsplash.com/photo-1557683316-973673baf926?w=1920&q=60"
/>
```
