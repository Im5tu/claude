# Reporting & KPIs

SEO measurement, reporting, ROI tracking, and visibility-first metrics.

---

## Google Search Console (GSC)

The primary source of truth for SEO performance data.

### Key Reports

| Report | What It Shows | How to Use |
|--------|--------------|-----------|
| Performance → Search results | Clicks, impressions, CTR, position by query/page/country/device | Track keyword rankings and traffic trends |
| Performance → Discover | Traffic from Google Discover feed | Monitor Discover visibility for content-heavy sites |
| Indexing → Pages | Index coverage, errors, warnings, excluded pages | Find and fix indexation issues |
| Experience → Core Web Vitals | CWV pass rates for mobile and desktop | Monitor site performance health |
| Enhancements | Rich result validation for structured data types | Verify schema implementation |
| Links | External links, internal links, top linked pages | Understand link profile (read-only — no building) |

### Query Analysis: Branded vs Non-Branded

**Critical segmentation.** Filter GSC queries:
- **Branded queries** (contain brand name): measure brand awareness
- **Non-branded queries** (no brand name): measure SEO effectiveness

**Why this matters:** If organic traffic grows 50% but it's all branded queries, SEO isn't driving it — brand marketing is. Non-branded organic traffic is the true measure of SEO success.

**How to segment:**
- GSC → Performance → Filter queries → Exclude queries containing "[brand name]"
- Track non-branded impressions, clicks, and CTR separately

### CTR Optimization Using GSC Data

1. Find queries with high impressions but low CTR (>1,000 impressions, <2% CTR)
2. Check the page's title tag and meta description for these queries
3. Rewrite to better match the query intent and add compelling hooks
4. Monitor CTR change over 4-8 weeks

**Expected CTR benchmarks by position (organic, non-branded):**

| Position | Desktop CTR | Mobile CTR |
|----------|------------|------------|
| 1 | ~30% | ~25% |
| 2 | ~15% | ~13% |
| 3 | ~10% | ~9% |
| 4-5 | ~5-7% | ~4-6% |
| 6-10 | ~2-4% | ~2-3% |

CTR varies significantly by SERP features present (AI Overviews, featured snippets, PAA reduce organic CTR).

### URL Inspection Tool

- Check if a specific URL is indexed
- See how Googlebot rendered the page
- Request indexing for new or updated pages
- Diagnose crawl/index issues for individual pages

### GSC API for Automated Reporting

For automated dashboards, use the GSC API (or Google Sheets integration) to pull:
- Daily impressions and clicks by query
- Weekly position changes for target keywords
- Monthly page-level performance
- Index coverage changes

---

## Google Analytics 4 (GA4)

### SEO-Relevant GA4 Reports

| Report / Exploration | How to Use for SEO |
|---------------------|-------------------|
| Acquisition → Traffic acquisition | Filter by "Organic Search" — clicks, sessions, engagement |
| Engagement → Landing page | See which pages organic users land on — find top performers and underperformers |
| Engagement → Pages and screens | Pageviews, time on page, scroll depth |
| Monetization → Ecommerce purchases | Revenue attributed to organic traffic |
| Explore → Free form | Custom explorations segmented by organic traffic |
| Explore → Path exploration | User flow from organic landing pages |

### Organic Traffic Segmentation

Create a segment in GA4:
- **Session source / medium** contains "google / organic" (or "organic" for all engines)
- Apply to any report to see only SEO-driven behavior

### Conversion Tracking for SEO

1. Define conversions in GA4 (form submissions, purchases, signups, demo requests)
2. Segment conversions by traffic source = organic
3. Track conversion rate for organic vs. other channels
4. Calculate revenue per organic session
5. Monitor landing page conversion rates for optimization

### GA4 Key Metrics for SEO

| Metric | What It Means | Good Benchmark |
|--------|--------------|----------------|
| Engagement rate | % of sessions with meaningful interaction | >60% |
| Engaged sessions per user | Repeat engagement depth | >1.5 |
| Average engagement time | Time actively viewing content | >1 minute for content pages |
| Conversions | Goal completions from organic | Depends on business |
| Revenue | Revenue attributed to organic sessions | Track month-over-month growth |

---

## KPI Framework

### Primary KPIs (Measure Directly)

These are the outcomes that prove SEO is working.

| KPI | How to Measure | Target Setting |
|-----|---------------|----------------|
| Non-branded organic sessions | GA4, filtered by organic, exclude brand queries | +X% quarter-over-quarter |
| Organic conversions | GA4 conversions filtered by organic source | +X% quarter-over-quarter |
| Organic revenue | GA4 ecommerce data filtered by organic | +X% quarter-over-quarter |
| Keyword visibility (share of voice) | Rank tracking tool — % of total SERP visibility for target keywords | Increase quarter-over-quarter |
| Indexed pages | GSC Index Coverage report | Monitored, not targeted (more isn't always better) |
| Core Web Vitals pass rate | GSC Experience → CWV | >75% of pages passing |

### Secondary KPIs (Leading Indicators)

These predict future primary KPI performance.

| KPI | How to Measure | What It Indicates |
|-----|---------------|-------------------|
| Non-branded impressions | GSC Performance, filtered | Growing search visibility |
| Average CTR for target keywords | GSC Performance | Title/meta effectiveness |
| Average position for target keywords | GSC Performance | Ranking trend direction |
| Pages crawled per day | GSC Settings → Crawl stats | Crawl health |
| New content published | Internal tracking | Content velocity |
| Content refresh rate | Internal tracking | Freshness maintenance |

### Visibility-First Metrics (Zero-Click Era)

Traditional click-based KPIs miss significant SEO value in 2025-2026, where 58%+ of US searches end without a click and AI Overviews show ~83% zero-click rates.

| Metric | How to Measure | Why It Matters |
|--------|---------------|----------------|
| Impressions growth | GSC Performance | Visibility even without clicks |
| Brand search volume | Google Trends, GSC branded queries | SEO-driven brand awareness |
| Featured snippet ownership | Rank tracker with SERP feature data | Dominant SERP presence |
| Knowledge Panel presence | Manual check + brand SERP monitoring | Entity recognition |
| AI Overview citations | Manual monitoring, emerging tools | Visibility in AI search |
| Share of SERP features | Rank tracker — feature ownership vs competitors | Competitive visibility |
| Brand mentions in AI responses | Manual testing across ChatGPT, Perplexity, Gemini | AI brand representation |

→ See `serp-features.md` for SERP feature targeting strategy.
→ See `aeo-geo.md` for AI citation tracking.

---

## Rank Tracking

### Tool Selection Considerations

- Track at least weekly (daily for competitive keywords)
- Track mobile AND desktop separately
- Track from the correct geographic location
- Include SERP feature tracking (not just blue links)
- Monitor competitors' positions for the same keywords

### What to Track

| Track | Frequency | Granularity |
|-------|-----------|-------------|
| Primary target keywords (20-50) | Daily | Position, SERP features, URL ranking |
| Secondary keywords (100-500) | Weekly | Position, URL |
| Competitor keywords (50-100) | Weekly | Position comparison |
| Featured snippet ownership | Weekly | Own vs competitor for each keyword |
| Local pack rankings | Weekly (if local business) | Position in local 3-pack |

### Mobile vs Desktop Tracking

Rankings differ between mobile and desktop. Always track both:
- Mobile rankings are the primary signal (mobile-first indexing)
- Desktop rankings still matter for B2B and professional audiences
- SERP features differ between devices (mobile has more AI Overviews, voice results)

---

## Reporting Dashboard Design

### Weekly Report (Internal, 5-Minute Review)

```
SEO Weekly Snapshot — Week of [Date]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Organic Sessions:     [X,XXX] ([+/-X%] vs last week)
Non-Brand Impressions:[X,XXX] ([+/-X%])
Avg Position:         [X.X]   ([+/-X.X])
Conversions:          [XX]    ([+/-X%])

Top Movers (position changes):
  ↑ "keyword" — #X → #X (+X positions)
  ↑ "keyword" — #X → #X (+X positions)
  ↓ "keyword" — #X → #X (-X positions)

Issues:
  [Any crawl errors, index drops, or CWV failures]
```

### Monthly Executive Summary

```
SEO Monthly Report — [Month Year]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Performance vs. Last Month:
  Organic Sessions:  [X,XXX] ([+/-X%] MoM, [+/-X%] YoY)
  Organic Revenue:   [$X,XXX] ([+/-X%] MoM)
  Conversions:       [XXX]   ([+/-X%] MoM)
  Keywords in Top 10:[XXX]   ([+/-XX] MoM)

Key Wins:
  • [Achievement 1 with specific metric]
  • [Achievement 2 with specific metric]

Work Completed:
  • [Content published / pages optimized / technical fixes]

Next Month Focus:
  • [Priority 1]
  • [Priority 2]
  • [Priority 3]
```

### Quarterly Business Review

- YoY comparison (quarter vs same quarter last year)
- Progress against annual targets
- ROI calculation (see below)
- Strategic adjustments based on data
- Competitive landscape changes
- Algorithm update impact analysis

---

## ROI Calculation

### Organic Traffic Value

**Formula:** Value = Organic Clicks × (Equivalent CPC of those keywords)

This estimates what you would pay in Google Ads for the same traffic. Use rank tracking tools that include CPC data.

### SEO ROI Formula

```
SEO ROI = (Revenue from Organic - SEO Investment) / SEO Investment × 100

Where:
  Revenue from Organic = GA4 organic revenue (or conversion value)
  SEO Investment = Agency/team costs + tools + content production costs
```

### Attribution Considerations

- **First-touch attribution:** Credits organic if the first visit was organic
- **Last-touch attribution:** Credits organic only if the converting session was organic
- **Data-driven attribution (GA4):** Uses machine learning to distribute credit across touchpoints
- **Recommendation:** Use data-driven attribution in GA4 as default, but report first-touch organic as well (SEO often starts the customer journey)

### Payback Period

SEO investment typically shows returns in 4-12 months:
- **Month 1-3:** Technical fixes and quick wins show fastest results
- **Month 3-6:** Content starts ranking, organic traffic grows
- **Month 6-12:** Compound growth as topical authority builds
- **Month 12+:** Maintenance mode — high ROI as organic traffic compounds

**Set expectations:** SEO is not instant. Show leading indicators (impressions, position changes) in months 1-3 while waiting for traffic and conversion growth.

---

## Zero-Click SEO Measurement

### The Zero-Click Challenge

~58% of Google searches end without a click to any website. AI Overviews make this worse (~83% zero-click rate when present). Traditional click-based SEO metrics miss the majority of search visibility.

### What to Measure Instead

| Metric | Proxy For | How to Track |
|--------|-----------|-------------|
| GSC Impressions | Search visibility | GSC Performance report |
| Brand search volume | Brand awareness from search | Google Trends + GSC branded queries |
| Direct traffic growth | Brand recognition | GA4 Direct traffic segment |
| Share of voice | Competitive visibility | Rank tracker with SERP feature data |
| Featured snippet ownership | Dominant SERP position | Rank tracker |
| AI citation tracking | AI search visibility | Manual testing + emerging tools |

### Strategy Shift

**Old model:** Impression → Click → Conversion → Revenue
**New model:** Impression → Brand Recognition → Future Branded Search → Conversion

SEO success increasingly means making your brand visible in search results, even when users don't click through. Brand search volume growth is often the best proxy for SEO-driven brand awareness.

→ See `serp-features.md` for zero-click strategy.
→ See `aeo-geo.md` for AI search visibility measurement.

---

## Reporting Anti-Patterns

**Don't report:**
- Vanity metrics without context (total pageviews without source segmentation)
- Rankings for keywords you don't care about
- Backlink counts (link building is out of scope; backlinks are observed, not built)
- "Domain authority" or similar third-party scores as primary KPIs
- Raw keyword counts without position or impression data

**Always report:**
- Context: month-over-month AND year-over-year comparison
- Business impact: tie SEO metrics to revenue or conversions
- Leading indicators alongside lagging indicators
- Competitive context: how you perform relative to competitors
- Honest setbacks: ranking drops, algorithm impact, missed targets
