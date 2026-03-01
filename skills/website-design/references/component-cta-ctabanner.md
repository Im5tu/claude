# CTABanner

Full-bleed or contained CTA section. The default conversion section for most page types. Three variants cover the major visual treatments — choose based on style preset and surrounding section context.

```markdown
---
component: CTABanner
category: cta
subtype: primary-conversion-banner

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: high
  energy-energetic: high
visual-weight: medium
content-density: sparse
trend-alignment: evergreen
motion-profile: minimal

use-when:
  - Primary conversion section at the bottom of any page
  - Feature page needs a focused CTA after explaining value
  - Pricing page confirmation CTA

avoid-when:
  - Page already ends with ContactGateway (don't double up CTAs)
  - Hero section already has identical CTA text (vary the framing)

pairs-well-with: [EnhancedFooter]
pairs-poorly-with: [ContactGateway, NewsletterCapture]
---
```

**Variants:**
- `accent` — Solid accent-colored background. High energy, use for product/SaaS.
- `dark` — Near-black background. Premium, use for dark-luxury or refined-professional.
- `glass` — Frosted glass on a gradient/mesh background. Modern, use for clean-saas hero CTAs or standalone glass cards. Requires a richly colored background beneath.

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { cn } from "@/lib/utils";

gsap.registerPlugin(ScrollTrigger);

type CTAVariant = "accent" | "dark" | "glass";

interface CTABannerProps {
  headline: string;
  subline?: string;
  primaryCta: { label: string; href: string };
  secondaryCta?: { label: string; href: string };
  variant?: CTAVariant;
  /** For glass variant: background colors passed to GradientMesh or a background class */
  backgroundClassName?: string;
}

const variantStyles: Record<CTAVariant, {
  section: string;
  container: string;
  headline: string;
  subline: string;
  primaryBtn: string;
  secondaryBtn: string;
}> = {
  accent: {
    section: "py-16 lg:py-24",
    container: "rounded-3xl bg-accent px-8 py-16 text-center lg:px-16 lg:py-20",
    headline: "font-display font-bold text-h1 tracking-tight text-white",
    subline: "text-body-lg text-white/80",
    primaryBtn:
      "inline-flex items-center rounded-lg bg-white px-7 py-3.5 text-sm font-medium text-accent transition-all duration-200 hover:bg-white/90 hover:scale-[1.02] active:scale-[0.98]",
    secondaryBtn:
      "inline-flex items-center rounded-lg border border-white/30 px-7 py-3.5 text-sm font-medium text-white transition-colors hover:bg-white/10",
  },
  dark: {
    section: "py-16 lg:py-24",
    container: "rounded-3xl bg-neutral-950 border border-neutral-800 px-8 py-16 text-center lg:px-16 lg:py-20",
    headline: "font-display font-bold text-h1 tracking-tight text-white",
    subline: "text-body-lg text-neutral-400",
    primaryBtn:
      "inline-flex items-center rounded-lg bg-accent px-7 py-3.5 text-sm font-medium text-white transition-all duration-200 hover:bg-accent-light hover:scale-[1.02] active:scale-[0.98]",
    secondaryBtn:
      "inline-flex items-center rounded-lg border border-neutral-700 px-7 py-3.5 text-sm font-medium text-neutral-300 transition-colors hover:bg-neutral-800 hover:text-white",
  },
  glass: {
    section: "py-16 lg:py-24 relative overflow-hidden",
    container: "rounded-3xl px-8 py-16 text-center lg:px-16 lg:py-20",
    headline: "font-display font-bold text-h1 tracking-tight text-white",
    subline: "text-body-lg text-white/70",
    primaryBtn:
      "inline-flex items-center rounded-lg bg-white px-7 py-3.5 text-sm font-medium text-neutral-900 transition-all duration-200 hover:bg-white/90 hover:scale-[1.02] active:scale-[0.98]",
    secondaryBtn:
      "inline-flex items-center rounded-lg border border-white/30 px-7 py-3.5 text-sm font-medium text-white transition-colors hover:bg-white/10",
  },
};

export function CTABanner({
  headline,
  subline,
  primaryCta,
  secondaryCta,
  variant = "accent",
  backgroundClassName,
}: CTABannerProps) {
  const ref = useRef<HTMLElement>(null);
  const styles = variantStyles[variant];

  useGSAP(() => {
    if (!ref.current) return;
    const items = ref.current.querySelectorAll("[data-animate]");
    gsap.set(items, { y: 20, opacity: 0 });
    gsap.to(items, {
      y: 0,
      opacity: 1,
      duration: 0.5,
      stagger: 0.08,
      ease: "power3.out",
      scrollTrigger: {
        trigger: ref.current,
        start: "top 75%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  const inner = (
    <div
      className={styles.container}
      style={
        variant === "glass"
          ? {
              backdropFilter: "blur(20px) saturate(180%)",
              WebkitBackdropFilter: "blur(20px) saturate(180%)",
              backgroundColor: "rgba(255,255,255,0.08)",
              borderColor: "rgba(255,255,255,0.14)",
              border: "1px solid rgba(255,255,255,0.14)",
            }
          : undefined
      }
    >
      <h2 data-animate className={styles.headline}>
        {headline}
      </h2>
      {subline && (
        <p data-animate className={`mx-auto mt-4 max-w-xl ${styles.subline}`}>
          {subline}
        </p>
      )}
      <div data-animate className="mt-10 flex flex-wrap justify-center gap-4">
        <a href={primaryCta.href} className={styles.primaryBtn}>
          {primaryCta.label}
        </a>
        {secondaryCta && (
          <a href={secondaryCta.href} className={styles.secondaryBtn}>
            {secondaryCta.label}
          </a>
        )}
      </div>
    </div>
  );

  return (
    <section ref={ref} className={styles.section}>
      {variant === "glass" && backgroundClassName && (
        <div className={`absolute inset-0 -z-10 ${backgroundClassName}`} />
      )}
      <div className="mx-auto max-w-7xl px-6">{inner}</div>
    </section>
  );
}
```

**Usage examples:**
```tsx
// Accent — high-energy, product or growth-focused CTA
<CTABanner
  headline="Start building in minutes"
  subline="No credit card required. Free up to 10,000 events/month."
  primaryCta={{ label: "Get started free", href: "/signup" }}
  secondaryCta={{ label: "Talk to sales", href: "/contact" }}
  variant="accent"
/>

// Dark — measured authority, premium or consultation-focused CTA
<CTABanner
  headline="Ready to work together?"
  subline="We take on three new clients per quarter. Enquire early."
  primaryCta={{ label: "Start the conversation", href: "/contact" }}
  variant="dark"
/>

// Glass — atmospheric CTA on gradient or mesh background
<CTABanner
  headline="Your data, working harder"
  primaryCta={{ label: "Request a demo", href: "/demo" }}
  variant="glass"
  backgroundClassName="bg-gradient-to-br from-indigo-900 to-violet-900"
/>
```
