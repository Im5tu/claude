# TelemetryFeed

Character-by-character typewriter effect with pulsing cursor. Creates a live data stream aesthetic — ideal for SaaS, tech, or any product that processes or generates data.

```markdown
---
component: TelemetryFeed
category: interactive
subtype: typewriter-terminal

dimension-fit:
  contrast-dark: medium
  contrast-light: high
  energy-restrained: medium
  energy-moderate: high
  energy-energetic: medium
visual-weight: medium
content-density: rich
trend-alignment: trending
motion-profile: moderate

use-when:
  - SaaS or tech product that processes/monitors data
  - "Under the hood" feature section
  - Stats or metrics section that benefits from a live-data feel

avoid-when:
  - Service businesses (feels incongruous — BANNED for refined-professional, warm-artisan)
  - Content is narrative rather than data-structured
  - More than 8 lines (becomes overwhelming)

pairs-well-with: [WaveformPulse, GradientMesh]
pairs-poorly-with: [Manifesto, CardShuffler]
---
```

```tsx
"use client";
import { useRef, useState, useEffect } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

interface TelemetryLine {
  label: string;
  value: string;
  prefix?: string;
}

interface TelemetryFeedProps {
  lines: TelemetryLine[];
  typingSpeed?: number; // ms per character, default 30
  title?: string; // Terminal window title
}

export function TelemetryFeed({
  lines,
  typingSpeed = 30,
  title = "system.monitor",
}: TelemetryFeedProps) {
  const containerRef = useRef<HTMLDivElement>(null);
  const [visibleLines, setVisibleLines] = useState<
    { label: string; typed: string; prefix: string; complete: boolean }[]
  >([]);
  const [isActive, setIsActive] = useState(false);

  // Fire on scroll entry
  useGSAP(() => {
    if (!containerRef.current) return;
    ScrollTrigger.create({
      trigger: containerRef.current,
      start: "top 75%",
      onEnter: () => setIsActive(true),
      once: true,
    });
  }, { scope: containerRef });

  // Typewriter sequencing
  useEffect(() => {
    if (!isActive) return;

    let lineIndex = 0;
    let charIndex = 0;
    let current: typeof visibleLines = [];
    let cancelled = false;

    const tick = () => {
      if (cancelled || lineIndex >= lines.length) return;

      const line = lines[lineIndex];

      if (charIndex === 0) {
        current = [
          ...current,
          { label: line.label, typed: "", prefix: line.prefix ?? ">", complete: false },
        ];
      }

      const typed = line.value.slice(0, charIndex + 1);
      const isComplete = charIndex + 1 >= line.value.length;

      current = current.map((l, idx) =>
        idx === lineIndex ? { ...l, typed, complete: isComplete } : l,
      );
      setVisibleLines([...current]);

      charIndex++;
      if (isComplete) {
        lineIndex++;
        charIndex = 0;
        setTimeout(tick, typingSpeed * 8);
      } else {
        setTimeout(tick, typingSpeed + Math.random() * 20);
      }
    };

    tick();
    return () => { cancelled = true; };
  }, [isActive, lines, typingSpeed]);

  return (
    <div
      ref={containerRef}
      className="rounded-xl border border-neutral-800 bg-neutral-950 overflow-hidden font-mono text-sm"
      role="region"
      aria-label="Live system telemetry"
    >
      {/* Title bar */}
      <div className="flex items-center gap-2 border-b border-neutral-800 px-4 py-3 bg-neutral-900">
        <span className="h-2.5 w-2.5 rounded-full bg-red-500/60" />
        <span className="h-2.5 w-2.5 rounded-full bg-amber-500/60" />
        <span className="h-2.5 w-2.5 rounded-full bg-emerald-500/60" />
        <span className="ml-3 text-xs text-neutral-500 tracking-wider">{title}</span>
        <div className="ml-auto flex items-center gap-2">
          <span className="relative flex h-2 w-2">
            <span className="absolute inline-flex h-full w-full animate-ping rounded-full bg-emerald-400 opacity-75" />
            <span className="relative inline-flex h-2 w-2 rounded-full bg-emerald-500" />
          </span>
          <span className="text-[10px] text-emerald-400 uppercase tracking-widest">Live</span>
        </div>
      </div>

      {/* Feed lines */}
      <div className="p-6 space-y-2 min-h-[200px]">
        {visibleLines.map((line, i) => (
          <div key={i} className="flex gap-3 items-baseline">
            <span className="text-neutral-600 select-none shrink-0">{line.prefix}</span>
            <span className="text-neutral-500 shrink-0">{line.label}</span>
            <span className="text-emerald-400">{line.typed}</span>
            {i === visibleLines.length - 1 && !line.complete && (
              <span
                className="inline-block w-[2px] h-4 bg-emerald-400 animate-pulse shrink-0"
                aria-hidden="true"
              />
            )}
          </div>
        ))}
        {visibleLines.length === 0 && (
          <div className="flex gap-3 items-baseline opacity-40">
            <span className="text-neutral-600">{">"}</span>
            <span className="inline-block w-[2px] h-4 bg-emerald-400 animate-pulse" />
          </div>
        )}
      </div>
    </div>
  );
}
```

**Usage:**
```tsx
<TelemetryFeed
  title="pipeline.status"
  lines={[
    { label: "ingestion:", value: "12,847 records/sec", prefix: "→" },
    { label: "processing:", value: "99.98% success rate", prefix: "→" },
    { label: "latency_p99:", value: "14ms", prefix: "→" },
    { label: "uptime:", value: "99.97% (30d)", prefix: "→" },
  ]}
/>
```