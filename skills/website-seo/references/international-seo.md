# International SEO

Domain strategy, hreflang implementation, multi-language content, and regional search engines.

---

## Domain Strategy

### Options

| Strategy | Example | Geo Signal | Domain Authority | Cost/Complexity |
|----------|---------|-----------|-----------------|-----------------|
| **ccTLDs** | example.fr, example.de | Strongest | Separate per TLD | Highest |
| **Subdirectories** | example.com/fr/, example.com/de/ | Strong (with hreflang + GSC targeting) | Single domain | Lowest |
| **Subdomains** | fr.example.com, de.example.com | Moderate | Partially separate | Moderate |

### Decision Framework

**Use ccTLDs when:**
- You have a large budget and dedicated teams per country
- Brand recognition varies significantly by country
- Legal/regulatory requirements mandate local domains
- You're a major enterprise with established local presence

**Use subdirectories when (recommended for most businesses):**
- You want to consolidate domain authority
- You're a small-to-mid business expanding internationally
- You want simpler management and lower cost
- SEO resources are limited

**Use subdomains when:**
- You need some separation but not full domain independence
- Different tech stacks per region (uncommon but valid)
- Hosting requirements differ by region

### gTLD with Geotargeting

If using a gTLD (.com, .org) with subdirectories:
1. Set up hreflang tags (see below)
2. Set geographic targeting in Google Search Console per subdirectory
3. Use local language content
4. Host on a CDN with local edge nodes (improves speed, not geotargeting)

---

## Hreflang Implementation

### What Hreflang Does

Hreflang tells Google which language/region version of a page to show to which users. Without hreflang, Google may show the wrong language version in search results.

### Syntax

```
hreflang="[language]-[region]"
```

- `en` — English (any region)
- `en-us` — English for US
- `en-gb` — English for UK
- `fr` — French (any region)
- `fr-ca` — French for Canada
- `x-default` — fallback / language selector page

### Implementation Methods

**Method 1: HTML `<link>` tags (recommended for most sites)**

```html
<head>
  <link rel="alternate" hreflang="en-us" href="https://example.com/page/" />
  <link rel="alternate" hreflang="en-gb" href="https://example.com/uk/page/" />
  <link rel="alternate" hreflang="fr" href="https://example.com/fr/page/" />
  <link rel="alternate" hreflang="de" href="https://example.com/de/page/" />
  <link rel="alternate" hreflang="x-default" href="https://example.com/page/" />
</head>
```

**Method 2: HTTP headers (for non-HTML files — PDFs, etc.)**

```
Link: <https://example.com/page/>; rel="alternate"; hreflang="en-us",
      <https://example.com/uk/page/>; rel="alternate"; hreflang="en-gb",
      <https://example.com/fr/page/>; rel="alternate"; hreflang="fr"
```

**Method 3: XML sitemap (for large sites with many language versions)**

```xml
<url>
  <loc>https://example.com/page/</loc>
  <xhtml:link rel="alternate" hreflang="en-us" href="https://example.com/page/" />
  <xhtml:link rel="alternate" hreflang="en-gb" href="https://example.com/uk/page/" />
  <xhtml:link rel="alternate" hreflang="fr" href="https://example.com/fr/page/" />
  <xhtml:link rel="alternate" hreflang="x-default" href="https://example.com/page/" />
</url>
```

### Common Hreflang Mistakes

| Mistake | Problem | Fix |
|---------|---------|-----|
| Missing `x-default` | No fallback for unsupported languages | Always include `x-default` |
| Non-reciprocal tags | Page A declares B as alternate, but B doesn't declare A | Every page in the set must reference all other pages AND itself |
| Missing self-referencing tag | Page doesn't include itself in the hreflang set | Every page must reference itself |
| Pointing to non-canonical URLs | Hreflang points to a URL that has a canonical to another URL | Hreflang must point to canonical URLs |
| Wrong language/region codes | Using `uk` instead of `en-gb`, or `jp` instead of `ja` | Use ISO 639-1 (language) + ISO 3166-1 (region) |
| Inconsistent URL patterns | Mixing with/without trailing slashes | Standardize URL format |

### Hreflang Validation

- **Google Search Console:** Check for hreflang errors in the Indexing and Enhancement reports (the standalone International Targeting report has been removed)
- **Hreflang testing tools:** Validate tag consistency across all pages
- **Crawl audit:** Ensure every page in every language references all its alternates

---

## Multi-Language Content

### Translation vs Transcreation

| Approach | What It Is | When to Use |
|----------|-----------|-------------|
| **Translation** | Direct language conversion | Technical documentation, legal content, product specs |
| **Transcreation** | Cultural adaptation of messaging | Marketing copy, slogans, CTAs, landing pages |
| **Localization** | Full cultural adaptation (dates, currency, imagery, examples) | E-commerce, service pages, local landing pages |

**Never rely solely on machine translation for SEO content.** Machine translation can be a starting point, but human review is essential for:
- Natural keyword integration (keyword research must be done per language)
- Cultural appropriateness
- Idiomatic expressions
- Local search intent matching

### Language-Specific Keyword Research

**Critical:** Keywords don't translate 1:1. The #1 keyword in English may not be the equivalent of the #1 keyword in French.

- Conduct keyword research independently in each target language
- Use native speakers for keyword validation
- Check search volume per market (GSC provides country-level data)
- Consider how search behavior differs culturally (e.g., Germans may search more formally)

### RTL Language Considerations

For Arabic, Hebrew, Persian, and Urdu:
- Use `dir="rtl"` on the `<html>` element
- CSS must support RTL layout (use logical properties: `margin-inline-start` not `margin-left`)
- Numbers remain left-to-right within RTL text
- UI elements (navigation, breadcrumbs) should mirror for RTL
- Test thoroughly — RTL layout bugs are common and affect usability

---

## Multi-Region Content

### Same Language, Different Regions

For sites serving US English, UK English, and Australian English:

- Don't just copy US content to UK/AU — localize:
  - Spelling (color → colour)
  - Currency ($ → £/AU$)
  - Measurements (miles → kilometers)
  - Cultural references
  - Legal/regulatory differences
  - Local testimonials and case studies
- Each regional version should have meaningful differences (not just spelling changes)
- Use hreflang to differentiate (`en-us`, `en-gb`, `en-au`)

### Regional Product/Service Differences

- Pricing in local currency
- Local availability and shipping information
- Region-specific promotions and offers
- Local compliance and regulatory information
- Payment methods popular in the region
- Local customer support information

---

## Regional Search Engines

### Baidu (China)

Baidu dominates China's search market (~65-70% share). Significant differences from Google:

| Requirement | Detail |
|-------------|--------|
| **ICP license** | Required to host a website in China — without it, your site may be blocked |
| **Content language** | Simplified Chinese only (not Traditional) |
| **Hosting** | Mainland China hosting strongly preferred (CDN with China PoPs is acceptable) |
| **Baidu Webmaster Tools** | Register and submit sitemap |
| **Meta tags** | Baidu uses `meta keywords` tag (unlike Google) |
| **JavaScript rendering** | Baidu has limited JavaScript rendering — SSR/SSG recommended |
| **Speed** | Domestic hosting critical — Great Firewall adds latency to foreign hosts |

**Baidu-specific SEO differences:**
- Meta keywords tag is still used
- Page load speed is a stronger factor (due to infrastructure)
- Baidu prefers Chinese-hosted content
- Social signals from Weibo, WeChat, Zhihu are relevant

### Yandex (Russia)

Yandex is the leading search engine in Russia (market share varies by device and demographic; verify current figures before planning).

| Feature | Yandex Difference |
|---------|-------------------|
| **Behavioral signals** | Yandex weighs user behavior signals (dwell time, bounce rate) more heavily than Google |
| **JavaScript** | Limited JS rendering — avoid CSR |
| **Yandex Webmaster Tools** | Register, submit sitemap, set region targeting |
| **Commercial intent** | Yandex has separate ranking factors for commercial queries |
| **Turbo pages** | Yandex's AMP equivalent — accelerated mobile pages |

### Naver (South Korea)

Naver is the leading search platform in South Korea (market share varies by device and demographic; verify current figures before planning).

**Key difference:** Naver is a platform ecosystem, not just a search engine. Results prioritize:
- Naver Blog content
- Naver Cafe (forums) content
- Naver Knowledge iN (Q&A)
- Naver Shopping

**Strategy for Naver:**
- Create official Naver Blog
- Participate in Naver Cafe communities
- Register with Naver Search Advisor
- Create Naver Shopping product listings (for e-commerce)

### Yahoo! Japan

Yahoo! Japan has used Google's search technology since 2010. Optimizing for Google effectively covers Yahoo! Japan as well.

- Japanese language content essential
- Mobile optimization especially important (high mobile usage in Japan)

---

## International Technical Setup

### Server Location & CDN

Server location is NOT a ranking factor, but affects page speed:
- Use a CDN with Points of Presence (PoPs) in target markets
- Edge caching reduces latency for international users
- Consider edge-side rendering for dynamic content

### Geotargeting in Google Search Console

Google removed the standalone "International Targeting" feature from Search Console. Current guidance:

- **Hreflang errors** now surface in the Indexing and Enhancement reports within GSC — check those for hreflang-related issues
- **Country targeting for gTLD properties** is no longer configurable as a separate GSC setting; rely on hreflang tags, localized content, and ccTLDs or subdirectory structures to signal geographic intent
- Add each international section as a separate property in GSC for per-market monitoring

**Note:** ccTLDs are automatically geotargeted and don't need additional GSC configuration.

### Language Detection & Redirects

**Warning:** Auto-redirecting users based on IP or browser language is risky.

| Approach | Risk Level | Recommendation |
|----------|-----------|----------------|
| Auto-redirect based on IP | High | Avoid — Googlebot crawls from US IPs, may only see English version |
| Auto-redirect based on Accept-Language | Moderate | Avoid — same Googlebot issue |
| Banner suggesting alternate language | Low | Recommended — user-initiated, doesn't block crawlers |
| `x-default` language selector page | None | Best practice — let users choose |

**If you must redirect:**
- Use 302 (temporary) redirects, not 301
- Never redirect Googlebot — check user-agent and exempt crawlers
- Allow users to override the redirect with language selector
- Include hreflang tags on all versions so Google can discover all language versions

---

## International Content Strategy

### Content Localization Workflow

1. **Keyword research per market** (language-specific, not translated)
2. **Content prioritization** per market (top 20 pages first)
3. **Professional translation/transcreation** (not just machine translation)
4. **Local review** by native speaker for cultural accuracy
5. **On-page SEO optimization** in target language
6. **Schema markup** with language-appropriate content
7. **Launch and monitor** per-market performance

### Market Priority Selection

| Factor | Evaluation |
|--------|-----------|
| Market size | Search volume for target keywords in the language |
| Competition | How competitive are the SERPs in that language? |
| Business readiness | Can you serve customers in that market? |
| Content investment | Cost and effort to produce quality localized content |
| ROI potential | Revenue potential vs. localization cost |

**Recommendation:** Launch one market at a time. Establish organic visibility before expanding to the next. Simultaneous multi-market launches dilute effort.

---

## International SEO Measurement

| Metric | Source | Per-Market |
|--------|--------|-----------|
| Organic sessions by country | GA4 geo report | Yes |
| Keyword rankings by language | Rank tracker (multi-location) | Yes |
| Impressions/clicks by country | GSC Performance filter | Yes |
| Hreflang coverage | GSC Indexing & Enhancement reports | All markets |
| Index coverage per language | GSC per property | Yes |
| CWV by region | CrUX data by country | Yes |
| Conversion rate by market | GA4 with country segmentation | Yes |

→ See `reporting-kpis.md` for full measurement framework.
→ See `core-technical-seo.md` for hreflang technical implementation.
→ See `ecommerce-seo.md` for multi-country e-commerce.
