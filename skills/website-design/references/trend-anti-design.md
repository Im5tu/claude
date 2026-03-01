# Trend: Anti-Design

## What It Is
Total removal of conventional page structure — the website IS the experience, with no pretense of being an informational document. Core pattern: cursor-as-unwind interaction where the mouse cursor literally reveals or unwinds the website as it moves across the surface. Alternative patterns: TikTok-feed browsing (vertical swipe/click through content sequentially, no section navigation); visuals-on-sides with detail-on-click (portrait-orientation feel on desktop, images flanking a click-to-reveal center); scroll-controlled narrative where the user has no sense of being on a "website" versus in an experience. Requires full creative conviction — partial execution reads as broken UX, not intentional art direction. The defining characteristic: if you could describe the page with the word "site," the anti-design is incomplete.

## Implementation
```tsx
// Cursor-as-reveal (cursor unmasks content from darkness)
"use client";
export function CursorReveal({ children }: { children: React.ReactNode }) {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const el = containerRef.current;
    if (!el) return;

    const handleMove = (e: MouseEvent) => {
      const rect = el.getBoundingClientRect();
      const x = ((e.clientX - rect.left) / rect.width) * 100;
      const y = ((e.clientY - rect.top) / rect.height) * 100;
      el.style.setProperty("--cursor-x", `${x}%`);
      el.style.setProperty("--cursor-y", `${y}%`);
    };

    el.addEventListener("mousemove", handleMove);
    return () => el.removeEventListener("mousemove", handleMove);
  }, []);

  return (
    <div
      ref={containerRef}
      className="relative min-h-screen bg-black"
      style={{
        WebkitMaskImage: "radial-gradient(circle 200px at var(--cursor-x, 50%) var(--cursor-y, 50%), black 0%, transparent 100%)",
        maskImage: "radial-gradient(circle 200px at var(--cursor-x, 50%) var(--cursor-y, 50%), black 0%, transparent 100%)",
      }}
    >
      {children}
    </div>
  );
}

// TikTok-feed navigation
const [currentIndex, setCurrentIndex] = useState(0);
// Wheel event for desktop, touch for mobile
const handleWheel = (e: WheelEvent) => {
  if (e.deltaY > 0) setCurrentIndex(i => Math.min(i + 1, items.length - 1));
  else setCurrentIndex(i => Math.max(i - 1, 0));
};
```

## Premium Signals
- The anti-design mechanic rewards exploration — users who spend time with it discover content or interactions that visitors who leave quickly never see. The depth of the experience scales with engagement.
- Mobile mapping: the cursor-based mechanic maps cleanly to touch (finger = cursor), making the experience genuinely cross-device rather than a desktop novelty.
- The experience has a defined "end" or resolution — an anti-design that simply continues indefinitely without a destination reads as unfinished. The experience must go somewhere.

## Anti-Execution Warnings
- **Anti-design with a conventional homepage attached** — an experience that starts unconventionally and then resolves to a standard-layout homepage undermines the commitment. Either commit fully or don't use the technique.
- **No discoverable entry point** — a cursor-reveal experience where the user doesn't understand how to interact will read as a loading failure. A single UI hint ("move your cursor to explore") costs nothing and prevents abandonment.
- **Desktop-only experience with no mobile adaptation** — cursor mechanics require a cursor. On mobile, map to touch (touchmove as cursor equivalent) or provide a completely different but equally unconventional mobile experience.

## Context Signals
Use when: the brief explicitly describes a brand for which the website is a performance, an exhibition, or an experience — not an information delivery mechanism; the brand is in art, experimental design, fashion, or creative industries where unconventionality is not just acceptable but expected; the brief includes phrases like "unexpected," "experience-first," "artistic," or "the anti-portfolio."
Avoid when: the brand serves any conversion-primary function — lead capture, trial signup, purchase — where unconventional navigation increases abandonment; the brief describes "trusted," "accessible," "clear," or "simple" as aspirational qualities; the brand serves an audience that includes people unfamiliar with experimental web design (e.g., older demographics, non-design-adjacent industries).
Cross-aesthetic applications: An experimental typographer or motion designer can use an anti-design experience as their portfolio site with a single conventional contact link as the only traditional element. A luxury fashion brand launching a capsule collection can use anti-design for the campaign microsite while maintaining a conventional e-commerce site for the main brand.
Implementation threshold: Anti-design requires complete design conviction — there is no "partial anti-design." Define the experience from first cursor movement to final destination before building. Always implement: a single discoverable interaction hint, a touch adaptation, and a way out (a conventional link or navigation that never disappears entirely). Test with users unfamiliar with experimental web design.

## Longevity Signal
Niche and intentional — not a mainstream technique, and should not be; its effectiveness depends on rarity and full commitment; appropriate for exactly the briefs where it fits and never for others.
