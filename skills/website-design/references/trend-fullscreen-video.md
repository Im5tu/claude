# Trend: Fullscreen Video

## What It Is
Video as the primary surface — replacing static hero imagery with motion footage as the page's emotional foundation. Key patterns: full-screen background video in the hero (always `autoplay muted loop playsinline`); video as case study cover (looping thumbnail on hover, full-screen on click); transparent-background video (`.webm` with alpha channel) that creates sections visually bleeding into each other — the brand subject moves through sections as if the sections don't exist. Enabled by increasing user bandwidth — static imagery reads increasingly as the low-effort choice for creative and production brands. Production quality requirement: the video must have emotional content — expression, action, environment. A screen recording or a talking head is worse than no video.

## Implementation
```tsx
// Full-screen hero video
<section className="relative min-h-screen overflow-hidden">
  <video
    autoPlay
    muted
    loop
    playsInline
    poster="/hero-poster.jpg"
    className="absolute inset-0 h-full w-full object-cover"
  >
    <source src="/hero.webm" type="video/webm" />
    <source src="/hero.mp4" type="video/mp4" />
  </video>
  {/* Overlay for text legibility */}
  <div className="absolute inset-0 bg-black/40" />
  <div className="relative z-10 flex min-h-screen items-center">
    {/* Hero content */}
  </div>
</section>

// Transparent-background video (.webm with alpha)
<div className="relative">
  <div className="bg-surface-secondary py-24">{/* Section A content */}</div>
  <video
    autoPlay muted loop playsInline
    className="absolute bottom-[-120px] right-0 z-10 w-[40vw] pointer-events-none"
  >
    <source src="/brand-element.webm" type="video/webm" />
  </video>
  <div className="bg-surface-primary py-24 pt-40">{/* Section B content */}</div>
</div>

// Video-on-hover case study card
function CaseStudyCard({ poster, video, title }: Props) {
  const videoRef = useRef<HTMLVideoElement>(null);
  return (
    <div
      className="group relative overflow-hidden rounded-2xl"
      onMouseEnter={() => videoRef.current?.play()}
      onMouseLeave={() => { if (videoRef.current) { videoRef.current.pause(); videoRef.current.currentTime = 0; }}}
    >
      <img src={poster} alt={title} className="w-full transition-opacity duration-300 group-hover:opacity-0" />
      <video ref={videoRef} muted loop playsInline src={video}
        className="absolute inset-0 h-full w-full object-cover opacity-0 transition-opacity duration-300 group-hover:opacity-100" />
    </div>
  );
}
```

## Premium Signals
- Transparent-background `.webm` video used to create visual continuity between sections — the subject appears to occupy real space on the page rather than a contained frame
- Video that matches the editorial register of the brand — a fine dining brand uses slow, atmospheric footage; an action sport brand uses rapid cuts. The editing grammar matches the brand personality.
- Poster image that looks like a premium still from the video — not a blurred or pixelated frame, but a deliberately chosen image that works as both a loading state and a standalone hero

## Anti-Execution Warnings
- **Autoplaying audio** — `muted` is non-negotiable. Any video that autoplays with audio will be muted or closed by the user within 2 seconds.
- **Screen recording or talking-head footage at hero scale** — low-production video at full bleed is worse than no video. UI screen recordings belong in product demos with a browser frame, not as the hero background.
- **More than 3 full-screen video zones per page** — each full-screen video demands attention and bandwidth. Beyond 3, performance degrades and the impact of each individual moment is diluted.
- **No mobile fallback** — full-screen video on mobile can cause significant performance issues. Always provide a poster image fallback and consider `media` attribute to serve static images on narrow viewports.

## Context Signals
Use when: the brand produces or depends on visual content — creative agencies, production companies, event organizers, hospitality, fitness, fashion; the brief describes "showcasing work," "demonstrating craft," or "feeling alive"; the brand has existing footage that is well-shot and emotionally resonant.
Avoid when: the brand has no existing video footage or only screen recordings; the target audience is on low-bandwidth connections (rural, developing markets) where video delivery is unreliable; the brief describes a "clean," "minimal," or "text-first" experience where video would add noise.
Cross-aesthetic applications: A professional services firm can use video in a tightly constrained way — a single atmospheric background video that plays at low opacity, as texture rather than subject matter. A content creator or educator can use video-on-hover for their course catalog without committing to full-screen video as the primary surface.
Implementation threshold: Minimum viable video: 1080p, compressed to ≤8MB for hero, ≤3MB for case study cards. Always provide `poster` for load state. Use `loading="lazy"` for below-fold video elements. `.webm` format required for transparent alpha channel support; `.mp4` as fallback for non-transparent videos.

## Longevity Signal
Ascending — video as primary surface is increasingly expected in creative industries; static imagery is read as the budget or low-effort choice for brands where motion content is central to the product.
