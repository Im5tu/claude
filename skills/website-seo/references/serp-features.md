# SERP Features

Featured snippets, PAA, knowledge panels, rich results, AI Overviews, and zero-click strategy.

---

## Featured Snippets

### Types of Featured Snippets

| Type | Trigger | Content Format | Optimal Length |
|------|---------|---------------|----------------|
| Paragraph | "What is...", definitions, explanations | Concise paragraph | 40-60 words |
| Ordered list | "How to...", steps, processes, rankings | Numbered steps | 5-8 steps |
| Unordered list | "Types of...", "best...", collections | Bullet points | 5-8 items |
| Table | Comparisons, pricing, specifications | HTML table | 3-5 columns, 4-8 rows |
| Video | "How to..." (visual topics) | YouTube video with timestamps | 5-15 minutes |

### How to Structure Content for Snippets

**Paragraph snippet targeting:**
```markdown
## What is [Topic]?

[Topic] is [concise 40-60 word definition that directly answers the question.
Include the key details a searcher needs. Be specific and factual.]
```

**List snippet targeting:**
```markdown
## How to [Process]

1. **Step one title** — brief description
2. **Step two title** — brief description
3. **Step three title** — brief description
```

**Table snippet targeting:**
```markdown
## [Topic] Comparison

| Feature | Option A | Option B | Option C |
|---------|----------|----------|----------|
| Price   | $X/mo    | $Y/mo    | $Z/mo    |
| Feature | Yes      | No       | Yes      |
```

### Featured Snippet Optimization Strategy

1. **Identify snippet opportunities:** Search target keywords — is there already a snippet? Can you create better content?
2. **Match the format:** If the current snippet is a list, create a list. If it's a paragraph, write a concise paragraph
3. **Place the answer immediately after the H2/H3 question heading** — don't build up to it
4. **Include the question in the heading** — match the query format
5. **Use structured HTML** — proper `<ol>`, `<ul>`, `<table>` tags (not just visual formatting)
6. **Rank on page 1 first** — snippets almost exclusively come from page 1 results

### Is It Worth Targeting Snippets?

**Pros:**
- Position 0 visibility (above all organic results)
- Brand authority and trust signal
- Voice search default answer
- Higher CTR than standard organic results in most cases

**Cons:**
- Can reduce CTR if the snippet fully answers the query (zero-click)
- Volatile — Google changes snippets frequently
- Requires ongoing maintenance

**Verdict:** Target snippets for queries where the answer leads to deeper engagement (partial answers), not for simple factual queries (fully answered in the snippet).

---

## People Also Ask (PAA)

### How PAA Works

- PAA boxes appear in ~65-80% of search results
- Each PAA answer links to a source page
- Clicking a PAA expands the answer and loads additional questions
- PAA questions are dynamically generated based on the query

### Targeting PAA

1. **Research PAA questions:** Search your target keywords and document the PAA questions
2. **Include PAA questions as H2/H3 headings** in your content
3. **Answer each question concisely** in the paragraph immediately following the heading
4. **Use FAQ schema** to increase eligibility → See `schema-structured-data.md`

### PAA Content Strategy

- Create dedicated FAQ sections addressing PAA questions
- Structure: question as H3 → concise answer (40-80 words) → detailed elaboration
- Cover related questions from the same PAA cluster
- Update regularly — PAA questions shift with search trends

---

## Knowledge Panels

### How Knowledge Panels Are Generated

Knowledge Panels appear for entities Google recognizes in its Knowledge Graph:
- Businesses, organizations, brands
- People (public figures, authors, executives)
- Products, creative works, locations

**Sources:**
- Google Business Profile (for local businesses)
- Wikipedia / Wikidata
- Authoritative websites
- Structured data (Organization schema)
- Official social profiles

### Claiming and Optimizing Your Knowledge Panel

1. Search your brand name — does a Knowledge Panel appear?
2. If yes, click "Claim this knowledge panel" at the bottom
3. Verify through official channels (website, social profiles)
4. Suggest edits for incorrect information
5. Add/update: logo, description, social profiles, founding date

### Knowledge Panel Optimization

→ See `entity-seo.md` for comprehensive Knowledge Graph and entity strategy.

**Quick wins:**
- Ensure Organization schema is on your homepage → See `schema-structured-data.md`
- Maintain consistent brand information across all platforms
- Create/update Wikipedia article if brand qualifies (notability requirement)
- Link official social profiles from website and structured data

---

## Rich Results

Rich results are enhanced SERP displays powered by structured data.

### Rich Result Types and Requirements

| Rich Result | Schema Required | Visual Enhancement |
|-------------|----------------|-------------------|
| Review stars | `AggregateRating`, `Review` | Star rating in SERP listing |
| FAQ | `FAQPage` | Expandable Q&A below listing |
| HowTo | `HowTo` | Step-by-step with images |
| Recipe | `Recipe` | Image, rating, cook time, calories |
| Event | `Event` | Date, location, ticket info |
| Job posting | `JobPosting` | Salary, location, company in Google Jobs |
| Product | `Product` + `Offer` | Price, availability, rating |
| Video | `VideoObject` | Thumbnail, duration in SERP |
| Breadcrumb | `BreadcrumbList` | Hierarchical path instead of URL |
| Sitelinks search | `WebSite` + `SearchAction` | Search box in brand SERP |

→ See `schema-structured-data.md` for JSON-LD implementation of all types.

### Rich Result Eligibility

- Content must actually exist on the page (not just in schema)
- Must follow Google's structured data guidelines
- No spammy or misleading markup
- Page must be indexable (not blocked by robots.txt or noindex)
- Test with Google's Rich Results Test before deployment

---

## Video Features in SERPs

### Types of Video SERP Features

| Feature | Where It Appears | How to Qualify |
|---------|-----------------|----------------|
| Video carousel | Top of SERP for video-intent queries | Host on YouTube, use VideoObject schema |
| Video featured snippet | Position 0 | YouTube video with relevant title + timestamps |
| Video tab results | Google Videos tab | Any indexed video |
| Key Moments | Within video result | Timestamps in description or SeekToAction schema |
| Video in AI Overviews | AI Overview section | Relevant, authoritative video content |

→ See `video-seo.md` for complete video optimization.

---

## Local Pack / Map Pack

The local 3-pack appears for queries with local intent ("near me", "[service] in [city]", etc.).

### How to Appear in Local Pack

- Claimed and optimized Google Business Profile
- Strong NAP consistency across citations
- Positive review profile (quantity, quality, recency)
- Proximity to searcher location
- Relevance of business category to query

→ See `local-seo.md` for comprehensive local SEO strategy.

---

## Image Pack

Image packs appear when Google detects visual intent.

### Optimizing for Image Pack

- Use descriptive, keyword-aware alt text
- Use descriptive file names (not IMG_4521.jpg)
- Include images in relevant context (next to related text content)
- Use high-quality, original images (stock photos rarely appear)
- Implement image sitemaps for important images
- Ensure images are crawlable (not blocked by robots.txt, not lazy-loaded without fallback)

→ See `core-on-page-seo.md` for image SEO details.

---

## Google AI Overviews

### What AI Overviews Are

AI Overviews (formerly SGE — Search Generative Experience) are AI-generated summaries that appear at the top of select Google search results. Launched May 2024, expanded significantly through 2025-2026.

### AI Overview Impact on CTR

- AI Overviews appear in an estimated 15-30% of searches (growing — verify current rate)
- When present, organic CTR drops by ~60-70% for the queries affected
- ~83% of searches with AI Overviews result in zero clicks
- Informational queries most affected; transactional queries less so

Sources are primarily drawn from pages already ranking on page 1 with strong E-E-A-T signals, clear structure, and specific data points.

→ See `aeo-geo.md` for comprehensive AI Overview optimization strategies, including source selection criteria and citation tactics.

---

## Zero-Click Search Strategy

### The Zero-Click Reality

~58.5% of US Google searches end without a click to any website (2025 data). This is not a new trend — it's been growing for years and accelerating with AI Overviews.

### Types of Zero-Click Queries

| Type | Example | Strategy |
|------|---------|----------|
| Direct answer | "weather in NYC" | Not worth targeting — no click opportunity |
| Knowledge Panel | "Microsoft CEO" | Optimize for brand/entity presence → See `entity-seo.md` |
| Featured snippet (full answer) | "What is SEO?" | Brand visibility benefit even without click |
| AI Overview (full answer) | "How to optimize Core Web Vitals" | Get cited for authority signal |
| Local Pack (call/directions) | "pizza near me" | Optimize GBP → See `local-seo.md` |
| Calculator / unit conversion | "100 USD to EUR" | Not worth targeting |

### When to Optimize for Visibility (Not Clicks)

**Optimize for visibility when:**
- The query is frequently zero-click (definitions, facts, simple how-tos)
- Your brand benefits from being the cited authority
- Featured snippet ownership builds brand trust
- The visibility drives branded search (people search your name after seeing your brand in results)

**Optimize for clicks when:**
- The query has commercial or transactional intent
- The answer requires depth the snippet can't provide
- The user needs to interact with a tool, form, or product
- The content leads to a conversion path

### Visibility → Branded Search → Conversion

The modern SEO conversion path:

```
User searches [generic query]
  → Sees your brand in AI Overview / Featured Snippet / SERP
  → Doesn't click (zero-click)
  → Later searches [your brand name]
  → Clicks through and converts

This is why brand search volume growth is a key SEO KPI.
```

→ See `reporting-kpis.md` for visibility-first measurement.

---

## SERP Feature Targeting Strategy

### Step 1: Identify Available Features

For each target keyword:
1. Search the keyword on desktop and mobile
2. Document which SERP features appear (snippets, PAA, images, videos, local pack, AI Overview)
3. Note which competitors own each feature
4. Assess difficulty of capturing each feature

### Step 2: Prioritize Features

| Priority | Feature Type | Why |
|----------|-------------|-----|
| High | Featured snippets for your keywords | Direct visibility, voice search default |
| High | FAQ/PAA for your content | Multiple SERP real estate opportunities |
| High | Rich results you can implement | Low effort, high visual impact |
| Medium | Video features (if you create video) | Growing importance, dual-platform value |
| Medium | Image pack (if visual content) | Additional SERP presence |
| Low | Knowledge Panel (requires entity authority) | Long-term play |

### Step 3: Implement and Monitor

- Implement one SERP feature type at a time
- Track feature ownership in rank tracker
- Monitor changes (Google frequently adjusts which features appear)
- A/B test different content formats for snippet targeting
- Measure impact on impressions, CTR, and branded search volume
