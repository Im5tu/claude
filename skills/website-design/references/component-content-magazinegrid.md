# MagazineGrid

Editorial asymmetric grid mixing one large featured card with 2-4 smaller secondary cards. Not uniform — the featured card spans 2 columns. Text-heavy, image-minimal. For editorial-minimal and bold-studio brands where the content IS the product.

```
---
component: MagazineGrid
category: content
subtype: editorial-grid

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: low
  energy-energetic: high
visual-weight: medium
content-density: rich
trend-alignment: trending
motion-profile: minimal

use-when:
  - Editorial-minimal brand with long-form content, articles, or perspectives
  - Bold Studio with case studies or projects displayed magazine-style
  - Content has natural hierarchy — one story is more important than others
  - Brand wants to signal intellectual credibility through content presentation

avoid-when:
  - Clean SaaS — magazine layout signals publishing not product
  - Warm Artisan — grid is too cool and architectural for handcrafted warmth
  - When all content items are equally important (use BentoGrid instead)
  - When you have fewer than 3 items

pairs-well-with: [StackedValueProps, FeaturedTestimonial, CenteredHero]
pairs-poorly-with: [BentoGrid — both are grid-based, sequential feels redundant]
---
```

```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { EASE, DURATION } from "@/lib/animations";

gsap.registerPlugin(ScrollTrigger);

interface MagazineCard {
  category: string;
  headline: string;
  excerpt: string;
  /** Featured card spans 2 cols and gets larger treatment */
  featured?: boolean;
  image?: string;
  imageAlt?: string;
  href: string;
  date?: string;
  readTime?: string;
}

interface MagazineGridProps {
  eyebrow?: string;
  headline: string;
  cards: MagazineCard[];
}

export function MagazineGrid({ eyebrow, headline, cards }: MagazineGridProps) {
  const ref = useRef<HTMLElement>(null);

  useGSAP(() => {
    if (!ref.current) return;

    const header = ref.current.querySelectorAll("[data-header]");
    gsap.set(header, { y: 20, opacity: 0 });
    gsap.to(header, {
      y: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: 0.08,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 80%",
        toggleActions: "play none none none",
      },
    });

    const cards = ref.current.querySelectorAll(".magazine-card");
    gsap.set(cards, { y: 28, opacity: 0 });
    gsap.to(cards, {
      y: 0, opacity: 1,
      duration: DURATION.moderate,
      stagger: 0.09,
      ease: EASE.enter,
      scrollTrigger: {
        trigger: ref.current,
        start: "top 70%",
        toggleActions: "play none none none",
      },
    });
  }, { scope: ref });

  return (
    <section ref={ref} className="py-16 lg:py-24 bg-surface-primary">
      <div className="mx-auto max-w-7xl px-6">
        {/* Header */}
        <div className="mb-12 flex flex-col gap-3 lg:flex-row lg:items-end lg:justify-between">
          <div>
            {eyebrow && (
              <p data-header className="text-caption font-semibold text-accent tracking-widest uppercase mb-4">
                {eyebrow}
              </p>
            )}
            <h2 data-header className="font-display font-bold text-h1 leading-tight tracking-tight text-primary">
              {headline}
            </h2>
          </div>
        </div>

        {/* Asymmetric grid */}
        <div className="grid grid-cols-1 gap-px bg-border md:grid-cols-2 lg:grid-cols-3">
          {cards.map((card, i) => (
            <a
              key={i}
              href={card.href}
              className={`magazine-card group relative bg-surface-primary p-8 transition-colors duration-200 hover:bg-surface-secondary ${
                card.featured ? "lg:col-span-2" : ""
              }`}
            >
              {card.image && card.featured && (
                <div className="mb-6 overflow-hidden rounded-xl">
                  <img
                    src={card.image}
                    alt={card.imageAlt ?? ""}
                    className="w-full object-cover aspect-[16/7] transition-transform duration-500 group-hover:scale-[1.03]"
                    width={900}
                    height={394}
                  />
                </div>
              )}

              <p className="text-caption font-semibold text-accent tracking-widest uppercase">
                {card.category}
              </p>

              <h3
                className={`mt-3 font-display font-bold leading-tight tracking-tight text-primary ${
                  card.featured ? "text-h2" : "text-h3"
                }`}
              >
                {card.headline}
              </h3>

              <p className="mt-3 text-body-sm text-secondary leading-relaxed max-w-[55ch]">
                {card.excerpt}
              </p>

              {(card.date || card.readTime) && (
                <div className="mt-5 flex items-center gap-4 text-caption text-disabled">
                  {card.date && <span>{card.date}</span>}
                  {card.date && card.readTime && <span aria-hidden>·</span>}
                  {card.readTime && <span>{card.readTime} read</span>}
                </div>
              )}

              {/* Arrow — reveals on hover */}
              <span className="absolute bottom-8 right-8 text-accent opacity-0 transition-opacity duration-200 group-hover:opacity-100" aria-hidden="true">
                &rarr;
              </span>
            </a>
          ))}
        </div>
      </div>
    </section>
  );
}
```
