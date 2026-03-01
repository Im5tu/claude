# Core On-Page SEO

On-page optimization reference. Loaded on every engagement.

---

## Title Tags

The `<title>` element is one of the strongest on-page ranking signals and the most visible element in search results.

### Character & Pixel Limits

- **Display limit:** ~580px on desktop, ~480px on mobile (~55-60 characters)
- **No hard character limit** — Google truncates based on pixel width
- Titles beyond the display limit are truncated with "..."
- Put important keywords and brand differentiation in the first 50 characters

### Title Tag Formulas by Page Type

| Page Type | Formula | Example |
|-----------|---------|---------|
| Homepage | `Primary Keyword — Brand Differentiator \| Brand` | `Wealth Management for Tech Founders \| Apex Financial` |
| Product | `Product Name — Key Attribute \| Brand` | `Titanium Trail Runners — Ultralight \| Peak Gear` |
| Category | `Category — Modifier \| Brand` | `Women's Running Shoes — Free Shipping \| Peak Gear` |
| Blog Post | `Topic: Specific Angle (Year)` | `Core Web Vitals: Complete Optimization Guide (2026)` |
| Location | `Service in City — Brand` | `Emergency Plumber in Austin, TX — QuickFix` |
| Comparison | `Product A vs Product B: Honest Comparison (Year)` | `Notion vs Obsidian: Honest Comparison (2026)` |

### Common Title Tag Mistakes

- **Keyword stuffing:** "SEO Tools, Best SEO Tools, Free SEO Tools, SEO Software"
- **Too generic:** "Home" or "Services" or "Products"
- **Missing brand:** Omitting brand name on all pages
- **Duplicate titles:** Multiple pages with identical titles
- **Boilerplate-heavy:** "Brand Name | Brand Name Official Site | Brand Name" — brand once is enough

### When Google Rewrites Your Title

Google rewrites titles in ~33% of cases. Common triggers:
- Title doesn't match page content
- Title is too long or too short
- Title is keyword-stuffed
- H1 is more descriptive than the title
- Query-specific rewriting (Google may show a different title for different queries)

**Prevention:** Write concise, accurate, unique titles that genuinely describe the page content.

---

## Meta Descriptions

Not a direct ranking factor, but directly impacts click-through rate — which is a user engagement signal.

### Character Limits

- **Display limit:** ~920px on desktop, ~680px on mobile (~150-160 characters)
- Google frequently rewrites meta descriptions (~70% of the time for long-tail queries)
- Still worth writing — they serve as your "ad copy" in search results

### Meta Description Templates

| Page Type | Template |
|-----------|----------|
| Product | `[Product benefit]. [Key feature]. [Social proof]. [CTA].` |
| Blog Post | `[What you'll learn]. [Why it matters]. [Credibility signal].` |
| Service | `[Service outcome]. [Differentiator]. [Trust signal]. [CTA].` |
| Category | `[Browse/shop X]. [Selection breadth]. [Shipping/price signal].` |

### CTR Optimization Techniques

- Include a clear value proposition (what the user gets)
- Add a call-to-action ("Learn how," "Get started," "Compare options")
- Use power words: "proven," "complete," "step-by-step," "free"
- Include numbers or data points when relevant
- Match search intent — informational queries need different hooks than transactional
- Avoid clickbait — high CTR with high bounce rate is worse than moderate CTR

### When to Skip Meta Descriptions

For pages targeting many long-tail queries (large category pages, comprehensive guides), letting Google auto-generate descriptions from page content can actually match more queries. This is a legitimate strategy, not a mistake.

---

## Heading Hierarchy

### H1 Best Practices

- **One H1 per page** (semantic best practice, though multiple H1s are valid HTML5)
- Include the primary keyword naturally
- H1 should describe the page's core topic — not repeat the title tag verbatim
- H1 should be visible on the page (not hidden with CSS)
- Avoid using H1 for site name/logo on every page (use semantic markup instead)

### Heading Structure

```
H1: Main Topic
  H2: Subtopic A
    H3: Detail under A
    H3: Detail under A
  H2: Subtopic B
    H3: Detail under B
  H2: Subtopic C
```

- Use headings semantically — H2 is a subtopic of H1, H3 is a subtopic of H2
- Don't skip levels (H1 → H3 without H2) — confuses accessibility tools
- Headings are mild ranking signals — include relevant keywords naturally
- Use headings for scannability and user experience, not just SEO
- Structure headings to match search intent and enable featured snippet extraction

### Headings for Featured Snippets

- Use question-format H2s to target PAA (People Also Ask)
- Follow question-H2 with a concise 40-60 word answer paragraph
- Use H2/H3 to structure list-type snippets (H2: "Steps to...", H3s for each step)
- Tables under a descriptive H2 can trigger table featured snippets

→ See `serp-features.md` for detailed featured snippet targeting.

---

## Content Optimization

### Keyword Placement

**Natural integration** — keywords should appear where they logically belong:
- Title tag (strong signal)
- H1 heading (strong signal)
- First 100 words of body content (moderate signal)
- H2/H3 headings where topically relevant (moderate signal)
- Image alt text when describing the image (mild signal)
- URL slug (mild signal)
- Meta description (not a ranking signal, but affects CTR)

**Avoid:**
- Forced repetition (keyword density targets are outdated)
- Exact-match keyword cramming — use semantic variations naturally
- Keyword insertion that breaks readability

### Semantic Variations & Entity Coverage

Google understands topics, not just keywords. Cover related entities and concepts:
- Synonyms and related terms
- Co-occurring entities (people, places, brands associated with the topic)
- Question variations users ask about the topic
- Use tools like "People Also Ask" and "Related Searches" for semantic expansion

### Content Length by Intent

| Search Intent | Typical Content Length | Notes |
|--------------|----------------------|-------|
| Navigational | Minimal | User looking for a specific site — just be findable |
| Transactional | 300-800 words | Product/service pages — enough to convert, not more |
| Commercial Investigation | 1,000-2,500 words | Comparison/review content — thoroughness matters |
| Informational | 1,500-4,000+ words | Guides, tutorials — depth wins, but only if valuable |

**Length should match depth, not word count targets.** A 500-word answer that perfectly addresses the query beats a 3,000-word article padded with filler.

### Content Freshness

- **Evergreen content** needs updates every 6-12 months (check for outdated stats, links, advice)
- **Time-sensitive content** (stats, trends, "best of year") needs annual updates
- Update the `<lastmod>` in sitemap and visible "last updated" date when content genuinely changes
- Don't change dates without changing content — Google detects this

### E-E-A-T On-Page Signals

Implementation-level trust signals (strategic E-E-A-T → See `entity-seo.md`):

**Experience signals:**
- Author byline with link to author page
- First-person language ("In my experience...", "When I tested this...")
- Original photos, screenshots, data from actual experience
- Case studies with specific results

**Expertise signals:**
- Author bio with relevant credentials
- Detailed methodology sections
- Technical depth appropriate to the topic
- Citations and references to primary sources

**Authority signals:**
- About page with company history and credentials
- "Reviewed by" or "Fact-checked by" attribution for YMYL content
- Industry awards, certifications, affiliations displayed

**Trust signals:**
- Contact information easily accessible
- Privacy policy and terms of service
- HTTPS (baseline)
- Clear editorial policy / correction process

---

## Image SEO

### Alt Text

```html
<!-- Good: Descriptive and keyword-aware -->
<img src="blue-trail-runner.webp" alt="Blue titanium trail running shoe on rocky mountain terrain" width="800" height="600">

<!-- Bad: Keyword stuffed -->
<img src="shoe.jpg" alt="trail running shoe best trail shoe buy trail running shoes">

<!-- Bad: Non-descriptive -->
<img src="shoe.jpg" alt="image" width="800" height="600">

<!-- Acceptable: Decorative image -->
<img src="divider.svg" alt="" role="presentation">
```

**Alt text rules:**
- Describe what the image shows — be specific and concise (125 characters max)
- Include relevant keywords when they naturally describe the image
- Use empty alt (`alt=""`) for purely decorative images
- Don't start with "Image of..." or "Photo of..." — screen readers already announce it's an image
- Every informational image must have alt text (accessibility requirement, SEO benefit)

### File Naming

- Use descriptive, hyphenated filenames: `blue-trail-runner-side-view.webp`
- Avoid generic names: `IMG_4521.jpg`, `photo1.png`
- Mild ranking signal, but helps with image search and Google Images

### Image Compression

- Target: hero images <200KB, content images <100KB, thumbnails <30KB
- Use WebP or AVIF for photographs
- Use SVG for icons and logos
- Implement responsive images with `srcset`:

```html
<img src="photo-800.webp"
     srcset="photo-400.webp 400w, photo-800.webp 800w, photo-1200.webp 1200w"
     sizes="(max-width: 600px) 400px, (max-width: 1000px) 800px, 1200px"
     alt="Description" width="1200" height="800" loading="lazy">
```

---

## Internal Linking

### Principles

- **Every important page should be reachable within 3 clicks** from the homepage
- Use descriptive anchor text that indicates the target page's topic
- Contextual links (within body content) carry more weight than navigation/footer links
- Link from high-authority pages to priority pages to distribute link equity
- Related content links at the end of articles improve engagement and crawl depth

### Anchor Text Optimization

| Type | Example | Usage |
|------|---------|-------|
| Exact match | "content strategy guide" → content strategy page | Use sparingly — over-optimization risk |
| Partial match | "our guide to building content strategy" | Natural and effective |
| Branded | "read more on the Apex blog" | Good for brand pages |
| Generic | "click here," "read more" | Avoid — wastes anchor text signal |

- Vary anchor text — don't use the same exact phrase every time
- Over-optimization warning: if 80%+ of internal links to a page use the same exact anchor text, Google may view it as manipulative

### Hub Page Internal Linking

For topic clusters (→ See `content-strategy.md`):
- Hub page links out to all spoke articles
- Every spoke article links back to hub page
- Spoke articles cross-link to related spokes
- Hub page is the canonical "best page" for the primary topic keyword

### Orphan Page Detection

Pages with zero internal links are invisible to crawlers following links. Check for:
- New pages not yet linked from existing content
- Pages removed from navigation but still live
- Deep pages only accessible through internal search

---

## URL Optimization

### URL Structure Best Practices

```
Good:  /running-shoes/trail-runners/
Good:  /blog/core-web-vitals-guide/
Bad:   /category.php?id=42&sort=price
Bad:   /p/12345
Bad:   /the-ultimate-comprehensive-complete-guide-to-everything-about-trail-running-shoes-2026/
```

- Keep URLs short and descriptive (3-5 words in the slug)
- Use hyphens to separate words (not underscores)
- Lowercase only — URLs are case-sensitive
- Include primary keyword when natural
- Avoid URL parameters for content pages (use clean URLs)
- Maintain consistent URL structure across the site
- Trailing slash — pick one convention and be consistent. Configure redirects for the other

### URL Changes & Redirects

- Changing URLs requires 301 redirects from old → new
- Update internal links to point to new URLs (don't rely solely on redirects)
- Monitor 404 errors in GSC after URL changes
- Never change URLs without a clear SEO benefit — the redirect tax is real
