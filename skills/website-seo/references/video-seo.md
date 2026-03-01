# Video SEO

YouTube optimization, VideoObject schema, video sitemaps, and hosting strategy.

---

## YouTube SEO Fundamentals

YouTube is the world's second largest search engine with ~3 billion daily searches. Its ranking algorithm is distinct from Google's.

### YouTube Ranking Factors

| Factor | Weight | Description |
|--------|--------|-------------|
| **Watch time** | Very High | Total minutes watched — the #1 ranking signal |
| **Audience retention** | Very High | % of video watched — higher is better |
| **CTR (thumbnail + title)** | High | Click-through rate from impressions |
| **Engagement** | High | Likes, comments, shares, saves |
| **Session time** | High | Does your video keep viewers on YouTube? |
| **Upload consistency** | Moderate | Regular upload schedule signals active channel |
| **Channel authority** | Moderate | Subscriber count, channel age, niche consistency |
| **Video freshness** | Moderate | Newer videos favored for trending/timely topics |
| **Keyword relevance** | Moderate | Title, description, tags matching search query |

### Watch Time vs Views

YouTube prioritizes watch time over view count. A 10-minute video watched to completion (10 min watch time) outranks a 1-minute video with more views but only 1 min watch time each.

**Implications:**
- Longer videos can outperform shorter ones if retention is high
- Hook viewers in the first 30 seconds to prevent early drop-off
- Cut filler content — retention drops hurt rankings
- Use chapters to help viewers navigate to relevant sections

---

## YouTube Content Optimization

### Title Optimization

```
Good: "Core Web Vitals: Fix LCP, INP & CLS in 15 Minutes"
Bad:  "Web Performance Video"
Bad:  "How to Fix Your Website Speed SEO Core Web Vitals Performance 2026"
```

- **Front-load the keyword** — most important words first
- **Keep under 60 characters** for full display
- **Include hooks:** numbers ("5 Steps"), outcomes ("That Actually Work"), urgency ("in 2026")
- **Match search intent** — title should tell viewers exactly what they'll learn
- **Avoid clickbait** — high CTR with low retention is worse than moderate CTR

### Description Optimization

**Structure:**

```
[First 2-3 lines: keyword-rich summary — visible without "Show more"]
[Full description of what the video covers — 200-350 words]

⏱️ Timestamps:
0:00 Introduction
1:23 What is LCP?
3:45 How to diagnose LCP issues
6:12 Fix 1: Image optimization
8:30 Fix 2: Font loading
10:15 Fix 3: Critical CSS
12:00 Summary

🔗 Resources mentioned:
[link to blog post]
[link to tool]

📱 Connect:
[social links]

#CoreWebVitals #SEO #WebPerformance
```

**Key points:**
- First 2-3 lines visible before "Show more" — front-load keywords and value proposition
- Include target keyword naturally in first 25 words
- Timestamps/chapters enable Key Moments in Google search results
- Include relevant links (drives traffic to your site)
- 3-5 hashtags at the end (not more)
- 200-350 words total description

### Tag Strategy

- **First tag:** exact target keyword
- **Tags 2-5:** keyword variations and related terms
- **Tags 6-10:** broader topic tags
- Include common misspellings if relevant
- 500 character limit for tags — use it fully
- Research competitor tags (browser extensions can reveal them)

### Thumbnail Optimization

Thumbnails are the single most impactful element for CTR.

**Best practices:**
- **Custom thumbnails always** — never use auto-generated
- **1280×720px** (16:9 ratio, minimum 640px wide)
- **High contrast** — visible at small sizes (mobile, sidebar)
- **Text overlay:** 3-5 words maximum, large font, readable at thumbnail size
- **Face/emotion close-ups** — human faces drive higher CTR
- **Consistent branding** — recognizable style across your channel
- **Test via CTR** in YouTube Studio — swap thumbnails on underperforming videos

**Avoid:**
- Misleading thumbnails (clickbait → poor retention → ranking penalty)
- Too much text (illegible at small size)
- Low contrast or dark images
- Generic stock photos

---

## YouTube Chapters / Key Moments

### Timestamp Format

Add timestamps in the video description:

```
0:00 Introduction
1:30 What are Core Web Vitals?
3:15 Measuring CWV
5:00 Fix #1: Image Optimization
7:45 Fix #2: Font Loading
10:00 Summary
```

**Requirements:**
- First timestamp must be `0:00`
- Minimum 3 timestamps
- Each timestamp label should be descriptive (not "Part 1", "Part 2")
- Timestamps must be in chronological order

### Key Moments in Google Search

When timestamps are present, Google can display "Key Moments" in search results, showing specific video segments that match the query. This significantly increases SERP real estate and CTR.

**SeekToAction schema** (for self-hosted videos):

```json
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "Core Web Vitals Guide",
  "hasPart": [
    {
      "@type": "Clip",
      "name": "What are Core Web Vitals?",
      "startOffset": 90,
      "endOffset": 195,
      "url": "https://example.com/video#t=90"
    }
  ]
}
```

> **Note:** This is a partial example showing only the `hasPart` addition for Key Moments. All required `VideoObject` properties (`name`, `description`, `thumbnailUrl`, `uploadDate`) must be included in the full implementation. See the complete VideoObject example below.

---

## VideoObject Schema

### Full JSON-LD Example

```json
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "Core Web Vitals: Complete Optimization Guide",
  "description": "Learn how to optimize LCP, INP, and CLS for better Google rankings. Step-by-step tutorial with real examples.",
  "thumbnailUrl": [
    "https://example.com/video/cwv-guide-thumb-16x9.jpg",
    "https://example.com/video/cwv-guide-thumb-4x3.jpg",
    "https://example.com/video/cwv-guide-thumb-1x1.jpg"
  ],
  "uploadDate": "2026-01-15T08:00:00-05:00",
  "duration": "PT12M30S",
  "contentUrl": "https://example.com/video/cwv-guide.mp4",
  "embedUrl": "https://www.youtube.com/embed/abc123",
  "interactionStatistic": {
    "@type": "InteractionCounter",
    "interactionType": { "@type": "WatchAction" },
    "userInteractionCount": 15420
  },
  "author": {
    "@type": "Person",
    "name": "Jane Smith",
    "url": "https://example.com/authors/jane-smith"
  },
  "publisher": {
    "@type": "Organization",
    "name": "Example Corp",
    "logo": {
      "@type": "ImageObject",
      "url": "https://example.com/logo.png"
    }
  }
}
```

### Required vs Recommended Properties

| Property | Required | Notes |
|----------|----------|-------|
| `name` | Yes | Video title |
| `description` | Yes | Video description |
| `thumbnailUrl` | Yes | At least one thumbnail |
| `uploadDate` | Yes | ISO 8601 format |
| `duration` | Recommended | ISO 8601 duration (PT#M#S) |
| `contentUrl` | Recommended* | Direct URL to video file |
| `embedUrl` | Recommended* | URL of embeddable player |
| `interactionStatistic` | Recommended | View count |
| `author` | Recommended | Content creator |

*At least one of `contentUrl` or `embedUrl` should be provided.

→ See `schema-structured-data.md` for multi-schema implementation patterns.

---

## Video Sitemaps

### Video Sitemap Format

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:video="http://www.google.com/schemas/sitemap-video/1.1">
  <url>
    <loc>https://example.com/blog/cwv-guide/</loc>
    <video:video>
      <video:thumbnail_loc>https://example.com/video/cwv-thumb.jpg</video:thumbnail_loc>
      <video:title>Core Web Vitals: Complete Optimization Guide</video:title>
      <video:description>Step-by-step tutorial for optimizing LCP, INP, and CLS.</video:description>
      <video:content_loc>https://example.com/video/cwv-guide.mp4</video:content_loc>
      <video:player_loc>https://www.youtube.com/embed/abc123</video:player_loc>
      <video:duration>750</video:duration>
      <video:publication_date>2026-01-15T08:00:00-05:00</video:publication_date>
      <video:family_friendly>yes</video:family_friendly>
      <video:live>no</video:live>
    </video:video>
  </url>
</urlset>
```

### Video Sitemap vs VideoObject Schema

| Feature | Video Sitemap | VideoObject Schema |
|---------|--------------|-------------------|
| Discovery | Helps Google find videos | Helps Google understand videos |
| Rich results | Does not directly trigger | Can trigger video rich results |
| Implementation | XML file submitted to GSC | JSON-LD on the page |
| Maintenance | Must be kept updated | Inline with content |

**Recommendation:** Use both. Video sitemap for discovery, VideoObject schema for rich results.

---

## Self-Hosted vs YouTube vs Both

### Comparison

| Factor | YouTube | Self-Hosted | Both (Dual Strategy) |
|--------|---------|-------------|---------------------|
| Audience reach | Massive (built-in discovery) | Limited to your site's traffic | Maximum reach |
| Hosting cost | Free | $50-500+/month | Combined costs |
| Control | Limited (ads, recommendations) | Full control | Mixed |
| SEO benefit | YouTube ranks in Google | Video rich results for your domain | Both benefits |
| Analytics | YouTube Studio | Your analytics + video host | Separate systems |
| Branding | YouTube watermark, ads | Your player, your brand | Mixed |
| Content ownership | YouTube ToS apply | Full ownership | Both |

### Dual Strategy (Recommended for SEO)

1. **YouTube:** Full-length videos for discovery and YouTube search
2. **Self-hosted:** Same video (or edited version) embedded on your site for VideoObject schema and video rich results
3. **Important:** If using both, set canonical to your page (not YouTube) for the video rich result

### Self-Hosted Video Platforms

| Platform | Pricing | Best For |
|----------|---------|----------|
| Wistia | $19/month+ | Marketing videos, lead capture, SEO-friendly player |
| Vimeo Pro | $20/month+ | High-quality player, privacy controls |
| Cloudflare Stream | Pay-per-minute | Developer-friendly, CDN-integrated |
| Bunny.net Stream | $5/month+ | Budget-friendly, fast global CDN |
| Mux | Pay-per-minute | API-first, developer-focused |

### Embed Strategy

**For SEO:** Embed the video on the most relevant page on your site, with VideoObject schema. This page — not YouTube — should rank for video rich results.

**Avoid:** Embedding the same video on multiple pages on your site (creates confusion about which page should rank for video results). One video → one canonical page.

---

## Video SEO for Google Search

### How Google Indexes Video

1. Google discovers video via: page crawl, video sitemap, VideoObject schema
2. Google extracts: thumbnail, title, description, duration
3. Google may index the video for: video carousels, featured snippets, AI Overviews
4. Key Moments can appear if timestamps/chapters are provided

### Video in SERPs

| SERP Feature | How to Qualify |
|-------------|---------------|
| Video carousel | Host on YouTube + VideoObject schema |
| Video featured snippet | YouTube video matching "how to" query + timestamps |
| Video tab results | Any indexed video |
| Key Moments | Timestamps in description or Clip schema |
| Video in AI Overviews | Authoritative video content relevant to the query |

→ See `serp-features.md` for SERP feature targeting strategy.

---

## Short-Form Video SEO

### YouTube Shorts

- Vertical format (9:16), max 60 seconds
- Include keywords in title and description
- Use hashtags: `#Shorts` plus topic hashtags
- Shorts appear in YouTube search and Shorts feed
- Can drive subscribers who then watch long-form content

### Cross-Platform Short-Form

| Platform | Format | SEO Relevance |
|----------|--------|--------------|
| YouTube Shorts | Vertical, ≤60s | YouTube search, Google video results |
| TikTok | Vertical, ≤10min | TikTok search → See `search-everywhere-seo.md` |
| Instagram Reels | Vertical, ≤90s | Instagram search, limited Google indexing |

### Short-Form → Long-Form Funnel

1. Create short clips from long-form video content
2. Post clips on YouTube Shorts, TikTok, Instagram Reels
3. Reference full video in short-form descriptions
4. Short-form drives awareness → long-form drives engagement → website drives conversion

---

## Video SEO Measurement

| Metric | Source | What It Indicates |
|--------|--------|-------------------|
| YouTube search traffic | YouTube Studio → Traffic Sources → YouTube Search | YouTube SEO effectiveness |
| Google search traffic to videos | YouTube Studio → Traffic Sources → External → Google | Google video ranking success |
| Watch time per video | YouTube Studio | Content quality and engagement |
| Average view duration | YouTube Studio | Audience retention |
| CTR (impressions to views) | YouTube Studio | Thumbnail and title effectiveness |
| Video rich result impressions | GSC Enhancements → Videos | Schema markup working |
| Video page organic traffic | GA4 landing page report | Website video page performance |
| Subscriber growth | YouTube Studio | Channel authority building |

→ See `reporting-kpis.md` for full measurement framework.
→ See `schema-structured-data.md` for VideoObject implementation.
→ See `search-everywhere-seo.md` for TikTok and multi-platform video.
