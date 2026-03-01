# Core Technical SEO

Foundational technical SEO reference. Loaded on every engagement.

---

## Crawlability & Indexation

### Robots.txt

Controls which URLs search engine crawlers can access. Located at `/robots.txt`.

```
# Example robots.txt
User-agent: *
Allow: /
Disallow: /admin/
Disallow: /api/
Disallow: /checkout/
Disallow: /account/
Disallow: /search?*
Disallow: /*?sort=
Disallow: /*?filter=

Sitemap: https://example.com/sitemap.xml
```

**Best practices:**
- Never block CSS/JS files — Googlebot needs them to render pages
- Block internal search result pages (crawl budget waste)
- Block faceted navigation parameters → See `ecommerce-seo.md` for details
- Use `Allow` directives to override broad `Disallow` rules
- Always include `Sitemap` directive
- Test with Google Search Console's robots.txt tester before deploying

**Do NOT use robots.txt to:**
- Hide pages from search results (use `noindex` instead — robots.txt blocks crawling, not indexing)
- Block sensitive content (URLs can still appear in search results via external links)

### XML Sitemaps

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://example.com/page</loc>
    <lastmod>2025-12-01</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
</urlset>
```

> **Note:** Google ignores `changefreq` and `priority` — only `lastmod` (besides `loc`) is actively used by Google. You can include them for other crawlers, but they have no effect on Google's crawl behavior.

**Sitemap types:**
- **Standard sitemap** — HTML pages
- **Image sitemap** — `xmlns:image` extension for important images
- **Video sitemap** — `xmlns:video` extension → See `video-seo.md`
- **News sitemap** — `xmlns:news` for Google News publishers
- **Sitemap index** — for sites with 50,000+ URLs (max per sitemap file)

**Best practices:**
- Include only canonical, indexable URLs (200 status, no `noindex`)
- Update `lastmod` only when content genuinely changes
- Keep under 50MB / 50,000 URLs per file — use sitemap index for larger sites
- Submit in Google Search Console and reference in robots.txt
- Exclude URLs blocked by robots.txt — contradictory signals confuse crawlers
- Auto-generate sitemaps; avoid manual maintenance

### Crawl Budget Optimization

Crawl budget matters primarily for large sites (100K+ pages). Smaller sites rarely have crawl budget issues.

**Strategies:**
- Remove or `noindex` low-value pages (tag pages with 1 post, empty category pages)
- Fix redirect chains (3+ hops waste crawl budget)
- Return proper 404/410 for removed pages — don't soft-404
- Improve server response time (faster responses = more crawling)
- Manage faceted navigation URLs → See `ecommerce-seo.md`
- Use `lastmod` in sitemaps to guide recrawl priority
- Monitor crawl stats in GSC → Settings → Crawl stats

### Canonical Tags

```html
<link rel="canonical" href="https://example.com/preferred-url" />
```

**When to use:**
- Duplicate content across multiple URLs (www vs non-www, HTTP vs HTTPS, trailing slash variants)
- Product variants that share most content
- Paginated content pointing to the "view all" or first page
- Cross-domain syndicated content pointing to original
- URL parameters creating duplicate pages

**Common mistakes:**
- Canonicalizing to a `noindex` page (contradictory)
- Canonicalizing to a 404 page
- Canonical chains (A → B → C — point directly to the final canonical)
- Relative URLs in canonical tags (use absolute URLs)
- Inconsistent canonical across mobile and desktop versions

### Index Control Directives

```html
<!-- Prevent indexing -->
<meta name="robots" content="noindex, follow">

<!-- Prevent indexing and link following -->
<meta name="robots" content="noindex, nofollow">

<!-- HTTP header alternative (for non-HTML resources) -->
X-Robots-Tag: noindex
```

**Use `noindex` for:**
- Internal search results pages
- Thank-you / confirmation pages
- Staging / preview pages
- Low-value tag/archive pages
- Duplicate content you can't consolidate with canonicals

**Do NOT `noindex`:**
- Pages you want in search results (obvious but common mistake during migrations)
- Pages with valuable backlinks (use 301 redirects instead)

### Pagination

Google no longer supports `rel="prev"` / `rel="next"`. Current approaches:

| Approach | Best For | SEO Implications |
|----------|----------|------------------|
| Paginated pages with unique content | Blog archives, category listings | Each page can rank independently; use self-referencing canonicals |
| "Load more" button | Product listings, feeds | Content is on one URL; crawlable if implemented correctly |
| Infinite scroll | Social feeds, image galleries | Must implement History API so each scroll state has a crawlable URL |
| View-all page | Small content sets (<200 items) | Single canonical target; watch for page speed issues |

---

## Core Web Vitals

Google's page experience signals. Thresholds as of 2025:

| Metric | Good | Needs Improvement | Poor |
|--------|------|-------------------|------|
| **LCP** (Largest Contentful Paint) | ≤ 2.5s | 2.5s – 4.0s | > 4.0s |
| **INP** (Interaction to Next Paint) | ≤ 200ms | 200ms – 500ms | > 500ms |
| **CLS** (Cumulative Layout Shift) | ≤ 0.1 | 0.1 – 0.25 | > 0.25 |

> **Note:** INP replaced FID (First Input Delay) in March 2024 as the responsiveness metric. Any reference to FID is outdated.

### LCP Optimization

**Common causes of poor LCP:**
- Unoptimized hero images (largest element on most pages)
- Render-blocking CSS/JS
- Slow server response time (TTFB)
- Client-side rendering delays

**Fixes:**
- Preload hero image: `<link rel="preload" as="image" href="hero.webp">`
- Use responsive images with `srcset` and `sizes` attributes
- Serve WebP/AVIF format with fallbacks
- Inline critical CSS, defer non-critical
- Use CDN for static assets
- Set `fetchpriority="high"` on LCP image element
- Avoid lazy-loading above-the-fold images

### INP Optimization

**Common causes of poor INP:**
- Long JavaScript tasks blocking the main thread
- Heavy event handlers (click, input, keydown)
- Hydration cost in frameworks (React, Next.js, Vue)
- Third-party scripts (analytics, chat widgets, ad scripts)

**Fixes:**
- Break long tasks with `scheduler.yield()` or `setTimeout`
- Use `requestIdleCallback` for non-critical work
- Debounce input handlers
- Defer third-party scripts: `<script defer>` or `<script async>`
- Use `content-visibility: auto` for off-screen content
- Minimize hydration work — use partial hydration or React Server Components

### CLS Optimization

**Common causes of poor CLS:**
- Images without `width` and `height` attributes
- Ads/embeds without reserved space
- Web fonts causing layout shift (FOIT/FOUT)
- Dynamically injected content above existing content

**Fixes:**
- Always set `width` and `height` on `<img>` and `<video>` elements
- Use `aspect-ratio` CSS for responsive containers
- Reserve space for ads with `min-height` on containers
- Use `font-display: optional` or `font-display: swap` with `size-adjust`
- Avoid inserting content above existing content after load

### Field Data vs Lab Data

| Source | Type | What It Measures |
|--------|------|-----------------|
| CrUX (Chrome UX Report) | Field | Real user data, 28-day rolling average — this is what Google uses for ranking |
| PageSpeed Insights | Both | Shows field data (CrUX) + lab data (Lighthouse) |
| Lighthouse | Lab | Simulated conditions — useful for debugging, not used for ranking |
| Web Vitals JS library | Field | Collect your own RUM data |

**Always prioritize field data.** Lab scores can be "perfect" while real users experience poor performance.

---

## Mobile SEO

### Mobile-First Indexing

Google uses the mobile version of your site for indexing and ranking. Fully rolled out since 2023.

**Requirements:**
- Mobile and desktop must have the same content (no hiding content on mobile)
- Structured data must be present on mobile version
- Meta tags (robots, canonical, hreflang) must match on both versions
- Images must have alt text on mobile version

### Mobile UX Signals

- **Viewport configured:** `<meta name="viewport" content="width=device-width, initial-scale=1">`
- **Readable font size:** minimum 16px base font
- **Tap targets:** minimum 48×48px with 8px spacing between targets
- **No horizontal scroll** at any viewport width
- **No intrusive interstitials** (popups that cover main content on mobile)

---

## HTTPS & Security

HTTPS is a confirmed ranking signal (lightweight, but a baseline requirement).

**Checklist:**
- [ ] Valid SSL/TLS certificate (not expired, correct domain)
- [ ] All HTTP URLs 301 redirect to HTTPS
- [ ] No mixed content (HTTP resources on HTTPS pages)
- [ ] HSTS header enabled: `Strict-Transport-Security: max-age=31536000; includeSubDomains`
- [ ] Internal links use HTTPS URLs (not protocol-relative)
- [ ] Canonical tags use HTTPS URLs
- [ ] Sitemap URLs use HTTPS

**Security headers (not ranking factors, but trust signals):**
- `Content-Security-Policy` — prevents XSS
- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: DENY` or `SAMEORIGIN`
- `Referrer-Policy: strict-origin-when-cross-origin`

---

## Site Architecture

### Hierarchy Depth

- Keep important pages within 3 clicks of the homepage
- Flat architecture (broad categories) aids crawl distribution
- Deep architecture (narrow subcategories) aids topical relevance
- Most sites benefit from a hybrid: broad top-level categories with 2-3 levels of depth

### Internal Linking Architecture

- Every page should receive at least one internal link
- Distribute link equity from high-authority pages (homepage, popular content) to priority pages
- Use descriptive anchor text (not "click here")
- Contextual links within content carry more weight than navigation links
- Monitor for orphan pages (pages with zero internal links) in crawl audits

### Breadcrumbs

```html
<nav aria-label="Breadcrumb">
  <ol itemscope itemtype="https://schema.org/BreadcrumbList">
    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
      <a itemprop="item" href="/"><span itemprop="name">Home</span></a>
      <meta itemprop="position" content="1" />
    </li>
    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
      <a itemprop="item" href="/category"><span itemprop="name">Category</span></a>
      <meta itemprop="position" content="2" />
    </li>
  </ol>
</nav>
```

> **Note:** This breadcrumb example uses Microdata (`itemscope`/`itemprop`) for inline HTML markup. JSON-LD is Google's recommended approach for structured data. → See `schema-structured-data.md` for JSON-LD BreadcrumbList implementation.

---

## JavaScript Rendering & SEO

### How Googlebot Renders JavaScript

Googlebot uses a two-phase process:
1. **Crawl phase** — downloads HTML, discovers links in raw HTML
2. **Render phase** — executes JavaScript in a headless Chromium instance, indexes rendered content

The render phase has a delay (seconds to days). Content only in JavaScript may be indexed slower.

### Rendering Strategies

| Strategy | SEO Impact | Best For |
|----------|-----------|----------|
| **SSG** (Static Site Generation) | Excellent — HTML ready at crawl time | Content sites, blogs, marketing pages |
| **SSR** (Server-Side Rendering) | Excellent — HTML generated per request | Dynamic content, personalized pages |
| **ISR** (Incremental Static Regeneration) | Excellent — static + periodic updates | Large sites with frequent content changes |
| **CSR** (Client-Side Rendering) | Risky — depends on render queue delay | SPAs (avoid for SEO-critical pages) |

**If using CSR/SPA:**
- Implement dynamic rendering as fallback for bots (serve pre-rendered HTML to crawlers)
- Use `history.pushState` for unique URLs per view
- Ensure all content is accessible without JavaScript for graceful degradation
- Test rendering with Google's URL Inspection tool

### Lazy Loading & SEO

- Use `loading="lazy"` on below-fold images — browser-native, SEO-safe
- Do NOT lazy-load above-fold / LCP images
- Lazy-loaded content via intersection observer is fine if it loads on scroll (Googlebot scrolls)
- Infinite scroll must use History API for crawlable URLs

---

## Performance Optimization

### Image Optimization

| Format | Best For | Browser Support |
|--------|----------|----------------|
| **WebP** | Photos and illustrations | All modern browsers |
| **AVIF** | Photos (better compression than WebP) | Chrome, Firefox, Safari 16.4+ |
| **SVG** | Icons, logos, simple illustrations | Universal |
| **PNG** | Screenshots, images needing transparency | Universal |

- Use `<picture>` element for format fallbacks
- Implement responsive images with `srcset` for different viewport sizes
- Compress images: target <200KB for hero images, <100KB for content images
- Use image CDN (Cloudflare Images, Imgix, Cloudinary) for automatic format/size optimization

### Font Loading

```html
<!-- Preload critical fonts -->
<link rel="preload" href="/fonts/main.woff2" as="font" type="font/woff2" crossorigin>
```

```css
@font-face {
  font-family: 'MainFont';
  src: url('/fonts/main.woff2') format('woff2');
  font-display: swap; /* Shows fallback immediately, swaps when loaded */
}
```

- Limit to 2-3 font families maximum
- Use `woff2` format (best compression)
- Subset fonts to include only needed characters
- Consider `font-display: optional` for non-critical fonts (eliminates layout shift)

### Critical Rendering Path

1. Inline critical CSS (above-fold styles) in `<head>`
2. Defer non-critical CSS: `<link rel="stylesheet" href="styles.css" media="print" onload="this.media='all'">`
3. Defer JavaScript: `<script defer src="app.js"></script>`
4. Preconnect to critical origins: `<link rel="preconnect" href="https://cdn.example.com">`

### Server & CDN

- Target TTFB (Time to First Byte) under 200ms
- Use CDN for global distribution (Cloudflare, Fastly, AWS CloudFront)
- Enable Brotli compression (better than gzip for text)
- Implement HTTP/2 or HTTP/3
- Use edge caching for static pages
- Consider edge-side rendering for dynamic content

---

## Redirects

### Redirect Types

| Code | Type | When to Use |
|------|------|-------------|
| **301** | Permanent | Page permanently moved — passes ~95% link equity |
| **302** | Temporary | Page temporarily moved (A/B test, maintenance) |
| **308** | Permanent (preserves method) | API endpoints changing permanently |
| **307** | Temporary (preserves method) | API endpoints temporarily moved |

**Redirect best practices:**
- Avoid redirect chains (A → B → C) — go directly to final destination
- Maximum 2 hops before content
- 301 redirect HTTP → HTTPS, non-www → www (or vice versa) — pick one and be consistent
- Redirect old URLs to the most relevant new URL (not all to homepage)
- Monitor redirect chains in crawl audits
- Implement redirects at server level (faster than JavaScript redirects)

### Site Migration Redirects

- Map every old URL to its new equivalent
- Implement 301 redirects for all changed URLs
- Monitor 404 errors in GSC after migration
- Keep redirects active for at least 1 year (ideally permanently)
- Test with small batch first before full migration

---

## Structured Data

→ See `schema-structured-data.md` for complete implementation reference with JSON-LD examples.

**Quick checklist:**
- [ ] Organization schema on homepage
- [ ] BreadcrumbList on all pages with breadcrumbs
- [ ] Article/BlogPosting on blog posts
- [ ] Product on product pages → See `ecommerce-seo.md`
- [ ] LocalBusiness on location pages → See `local-seo.md`
- [ ] FAQPage where FAQ content exists
- [ ] VideoObject on pages with video → See `video-seo.md`

---

## International Technical Setup

→ See `international-seo.md` for full hreflang implementation, domain strategy, and regional search engine optimization.

**Quick reference — hreflang tag format:**

```html
<link rel="alternate" hreflang="en-us" href="https://example.com/page" />
<link rel="alternate" hreflang="en-gb" href="https://example.com/uk/page" />
<link rel="alternate" hreflang="fr" href="https://example.com/fr/page" />
<link rel="alternate" hreflang="x-default" href="https://example.com/page" />
```

---

## Technical SEO Audit Checklist

Use this for quick technical health checks:

**Crawlability:**
- [ ] robots.txt allows crawling of important pages
- [ ] XML sitemap submitted in GSC and contains only indexable URLs
- [ ] No orphan pages (all important pages have internal links)
- [ ] Redirect chains resolved (max 2 hops)
- [ ] No soft 404s (thin/empty pages returning 200)

**Indexation:**
- [ ] Important pages are indexed (`site:` search or GSC Coverage report)
- [ ] Canonical tags are correct and consistent
- [ ] No unintended `noindex` tags
- [ ] Duplicate content resolved with canonicals or redirects

**Performance:**
- [ ] Core Web Vitals pass (LCP ≤ 2.5s, INP ≤ 200ms, CLS ≤ 0.1)
- [ ] TTFB under 200ms
- [ ] Images optimized (WebP/AVIF, responsive, compressed)
- [ ] Fonts preloaded with swap/optional display

**Mobile:**
- [ ] Viewport meta tag present
- [ ] Content parity between mobile and desktop
- [ ] Tap targets ≥ 48px
- [ ] No intrusive interstitials

**Security:**
- [ ] HTTPS everywhere with valid certificate
- [ ] No mixed content
- [ ] HSTS header enabled
