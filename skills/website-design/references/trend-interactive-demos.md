# Trend: Interactive Product Demos

## What It Is
Embedded mini-applications that allow users to experience the product interface before signing up. Implemented as actual React components rendered inside a browser-chrome frame (`border-radius: 8px`, OS-style traffic light buttons at top-left, URL bar with fake domain). Premium execution: the demo is genuinely interactive — users can type, click, and see real state changes. The demo state is managed independently (not connected to a real backend). Provides a screenshot or video fallback for reduced-motion preferences. The framing device (browser chrome, phone mockup) is essential — it signals "this is the product, not marketing imagery."

## Implementation
```tsx
// Browser chrome frame wrapper
<div className="rounded-lg border border-white/10 overflow-hidden shadow-2xl">
  {/* Traffic light buttons */}
  <div className="flex items-center gap-2 px-4 py-3 bg-neutral-900/80 border-b border-white/5">
    <div className="w-3 h-3 rounded-full bg-red-500/80" />
    <div className="w-3 h-3 rounded-full bg-yellow-500/80" />
    <div className="w-3 h-3 rounded-full bg-green-500/80" />
    <div className="ml-4 px-3 py-1 bg-neutral-800 rounded text-xs text-neutral-400">
      app.yourproduct.com
    </div>
  </div>
  {/* Interactive demo content */}
  <div className="p-6 bg-neutral-950">
    <InteractiveDemoComponent />
  </div>
</div>
```

## Premium Signals
- Interactive demo where users can manipulate state and see realistic feedback — even a simple one (colour theme picker, content preview) is more premium than a slideshow

## Anti-Execution Warnings
- **"Interactive demo" that is a screenshot slideshow** — clicking Next to advance slides is not a demo. If the demo cannot be made interactive, use a video with autoplay and loop instead.

## Context Signals
Use when the brief signals: a product with a visual interface that benefits from hands-on exploration; language like "try it," "see it in action," "experience the product"; a confidence in the product's polish — the demo IS the sales argument.
Avoid when: the product has no visual interface or the interface requires backend state to be meaningful; the brief describes the product abstractly (APIs, infrastructure, invisible services); building a convincing demo would require more engineering than the marketing site itself.
Cross-aesthetic applications: A traditionally professional brand can embed a product demo in a browser-chrome frame with muted chrome styling when the brief describes the product as "enterprise-grade" — the framing device adds credibility. A bold, energetic brand can use an unframed, full-width embedded demo when the brief describes "hands-on" and "immediate."
Implementation threshold: the demo must be genuinely interactive — users manipulate state and see feedback. A screenshot slideshow is not a demo. Browser-chrome framing (traffic-light buttons, fake URL bar) is the minimum container for credibility.

## Longevity Signal
Ascending — still a strong differentiator. Most sites use screenshots or video. An actual interactive demo signals product confidence.
