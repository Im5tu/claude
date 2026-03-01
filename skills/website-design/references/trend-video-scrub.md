# Trend: Video Scroll-Scrubbing

## What It Is
The user's scroll position directly controls a video's playback position. Scroll down, the video advances. Scroll up, the video reverses. The video becomes a scroll-controlled animation — every frame is accessible, and the user moves through the content at their own pace. This is the ultimate "scroll as playhead" implementation: the narrative is literally a film, and the scrollbar is the scrub control.

Video requirements: preloaded (`<video preload="auto" muted playsinline>`), muted (browsers block autoplay of unmuted video), encoded for smooth scrubbing — H.264 with high keyframe density (ideally every frame is a keyframe), short duration (10–30 seconds). Long videos scrub poorly because browsers cannot seek to arbitrary frames quickly enough. High keyframe density increases file size significantly; keep scrub videos under 15 seconds for manageable payloads.

Frame sequence alternative for smoother results: export the video as a numbered image sequence (`frames/frame_0000.jpg` through `frames/frame_0120.jpg`), then update the displayed image per frame index based on scroll progress. This is smoother than video scrubbing for short sequences (under 120 frames) because image loading can be prefetched and there is no codec seeking latency. Implementation: preload all frames into an array, then on ScrollTrigger `onUpdate`, set `element.style.backgroundImage = url(frames[frameIndex])` or draw to a `<canvas>` element for better performance.

## Implementation
```js
const video = document.querySelector('.scrub-video');

gsap.to({}, {
  scrollTrigger: {
    trigger: '.video-scrub-section',
    start: 'top top',
    end: '+=5000',       // scroll distance mapped to video duration
    pin: true,
    scrub: 0,            // scrub: 0 for frame-accurate sync (no smoothing)
    onUpdate: (self) => {
      if (video.duration) {
        video.currentTime = self.progress * video.duration;
      }
    }
  }
});
```

```html
<video class="scrub-video" preload="auto" muted playsinline>
  <source src="/video/product-rotate.mp4" type="video/mp4">
</video>
```

Premium execution: the video or frame sequence is purpose-shot for scrubbing — a product rotating on a turntable, an ingredient dissolving into a recipe, a building being constructed floor by floor, a garment being assembled stitch by stitch. Stock footage scrubbed via scroll reads as a tech demo. The content must justify the mechanic — if the video would work just as well at normal 1x playback, scrubbing adds friction without value.

## Premium Signals
- Video scrub content that was purpose-produced for the mechanic — the video subject rotates, assembles, transforms, or progresses in a way that only works when the user controls the pace
- Scroll distance is calibrated to content weight — a simple message gets `+=1500` of scroll, a complex product demo gets `+=4000`

## Anti-Execution Warnings
- **Video scrub with stock footage** — scrubbing a generic aerial drone shot or a stock timelapse reads as a tech demo, not a design decision. The video content must justify user-controlled pacing. If the video does not benefit from being scrubbed (i.e., it would work just as well at 1x playback), do not scrub it.
- **Video scrub with poor encoding** — videos not encoded with high keyframe density will show frame-jumping artefacts during scrubbing. H.264 with a keyframe interval of 1 (every frame is a keyframe) is required for smooth scrubbing. This increases file size significantly; keep scrub videos under 15 seconds.

## Context Signals
Use when the brief signals: a physical product that rotates or assembles, a manufacturing or craftsmanship process, an architectural walkthrough, content where the user benefits from controlling the pace of a visual transformation, "see how it's made" / "every detail matters"
Avoid when: the video is atmospheric or ambient (it would work fine at normal playback speed), the video is longer than 20 seconds (scrubbing long videos creates impatience), the video content does not change meaningfully frame-to-frame, or there is no budget for purpose-shot or purpose-rendered video
Cross-aesthetic applications: A luxury brand can use this when scrubbing a product being hand-assembled — the slowness of scroll-controlled pacing reinforces the care behind the craft. A bold studio brand can use this when scrubbing an explosive product launch animation where every frame is a designed composition — the user gets to linger on the frames they find most striking. A clean SaaS brand can use this when scrubbing a UI walkthrough where the user controls the pace of feature discovery — the product demo becomes interactive without requiring a real backend.
Implementation threshold: The video or frame sequence must be purpose-produced for scrubbing — repurposed marketing video or stock footage immediately reads as a tech demo rather than a design decision. Minimum requirements: fully preloaded, muted, H.264 with high keyframe density, under 15 seconds.

## Longevity Signal
Peaking — widely used on flagship product pages (Apple-style). The technique is well-understood; the differentiator has shifted entirely to content quality (purpose-shot vs. repurposed footage). Still premium when the content justifies it.
