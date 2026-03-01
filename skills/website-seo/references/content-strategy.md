# Content Strategy

Topic clusters, hub & spoke architecture, content types, gap analysis, and editorial planning.

---

## Topic Clusters & Hub-and-Spoke Architecture

### What is a Topic Cluster?

A topic cluster organizes content around a central **hub page** (pillar page) that broadly covers a topic, supported by multiple **spoke articles** that cover specific subtopics in depth. Internal links connect them, signaling topical authority to search engines.

```
                    ┌─────────────────┐
                    │   Hub Page      │
                    │ "Content Marketing│
                    │    Guide"       │
                    └───────┬─────────┘
           ┌────────────────┼────────────────┐
           ▼                ▼                ▼
    ┌──────────┐    ┌──────────┐    ┌──────────┐
    │  Spoke:  │    │  Spoke:  │    │  Spoke:  │
    │ Blog     │    │ Content  │    │ Editorial│
    │ Strategy │    │ Calendar │    │ Workflow │
    └──────────┘    └──────────┘    └──────────┘
```

### Hub Page Design

**What makes a strong hub page:**
- Covers the entire topic at a high level (2,500-5,000 words)
- Links out to every spoke article in the cluster
- Targets the broadest keyword in the topic ("content marketing" not "content marketing for B2B SaaS startups")
- Updated regularly as new spoke content is published
- Provides standalone value — useful even without reading spoke articles
- Serves as the canonical "best page" for the primary keyword

**Hub page structure:**
1. Overview / definition section
2. Why it matters (context and stakes)
3. Subtopic sections (each linking to its spoke article for depth)
4. Summary / getting started section
5. FAQ section (PAA targeting opportunity → See `serp-features.md`)

### Spoke Content Design

- Each spoke covers one specific subtopic in depth
- Targets a long-tail keyword related to the hub topic
- Links back to the hub page (anchor text = hub keyword or close variant)
- Cross-links to related spokes within the same cluster
- 1,000-3,000 words depending on intent and depth required
- Can rank independently for its specific keyword

### Cluster Mapping Methodology

1. **Identify seed topic** — broad term with high search volume
2. **Keyword research** — find all related long-tail queries (use GSC, PAA, keyword tools)
3. **Group by subtopic** — cluster keywords into logical subtopics
4. **Map to content** — one spoke per subtopic group
5. **Identify gaps** — subtopics with no existing content
6. **Prioritize** — create content for highest-opportunity gaps first
7. **Link architecture** — plan hub → spoke and spoke → spoke links before writing

### Internal Linking Within Clusters

- Hub page links to every spoke (contextual links within relevant sections, not just a list at the bottom)
- Every spoke links back to hub page within the first 2-3 paragraphs
- Related spokes link to each other (e.g., "Blog Strategy" links to "Editorial Workflow")
- Cross-cluster links connect related topics across different clusters
- Use descriptive anchor text — not "click here" or "read more"

---

## Content Types & Their SEO Purpose

| Content Type | Search Intent | SEO Purpose | Typical Length |
|-------------|--------------|-------------|----------------|
| Blog posts / guides | Informational | Organic traffic, topical authority | 1,500-4,000 words |
| Landing pages | Commercial / transactional | Conversions, targeted keywords | 500-1,500 words |
| Comparison pages | Commercial investigation | High-intent traffic, decision support | 1,500-3,000 words |
| Glossary / definition pages | Informational | Featured snippets, PAA | 300-800 words each |
| Case studies | Trust / proof | E-E-A-T, first-hand experience | 1,000-2,500 words |
| Data / research pages | Informational | Link-worthy content, authority | 2,000-5,000 words |
| Tool pages | Transactional | Lead gen, links → See `free-tool-strategy.md` | Varies |
| FAQ pages | Informational | PAA targeting, schema → See `serp-features.md` | 1,000-2,000 words |
| Product / service pages | Transactional | Conversions | 500-1,500 words |
| Category pages | Commercial | Navigation, mid-funnel | 300-1,000 words |

### Choosing Content Types by Business Stage

**Early-stage (0-50 pages):**
- Focus on hub pages for 2-3 core topic clusters
- Product/service pages with strong on-page SEO
- 1 data/research piece for link attraction
- FAQ content with schema

**Growth-stage (50-200 pages):**
- Expand spoke content within clusters
- Add comparison and alternative pages
- Case studies demonstrating expertise
- Glossary for long-tail coverage

**Mature (200+ pages):**
- Content refresh and optimization of existing pages
- Programmatic content for scalable coverage → See `programmatic-seo.md`
- Tools and calculators → See `free-tool-strategy.md`
- Data journalism and original research

---

## Content Gap Analysis

### Competitive Content Analysis

1. **Identify competitors** — sites ranking for your target keywords
2. **Map their content** — what topics they cover, content types, depth
3. **Find gaps** — topics they rank for that you don't cover
4. **Find weaknesses** — topics they cover poorly that you can do better
5. **Assess your unique angle** — what can you say that they can't? (first-hand experience, proprietary data, unique methodology)

### SERP Analysis for Content Opportunities

For each target keyword:
- What content type ranks? (listicle, guide, product page, video)
- What SERP features appear? (PAA, featured snippet, video carousel)
- What's the content quality? (depth, freshness, expertise)
- What's missing? (outdated info, lack of visuals, no first-hand experience)
- What intent does Google think this keyword has? (match your content to it)

### Intent Alignment

| If Google shows... | The intent is... | Create... |
|-------------------|-----------------|-----------|
| Product pages, shopping results | Transactional | Product/service page |
| Comparison articles, reviews | Commercial investigation | Comparison or review content |
| How-to guides, tutorials | Informational | Comprehensive guide |
| Local pack, maps | Local | Location-optimized page → See `local-seo.md` |
| Video carousels | Video-preferred | Video content → See `video-seo.md` |
| Mixed results | Mixed intent | Multiple content types or a comprehensive page |

---

## Content Brief Template

Use this template for every content piece. Fill in before writing.

```markdown
# Content Brief: [Working Title]

## Target Keyword
Primary: [keyword] (volume: X, difficulty: X)
Secondary: [keyword 1], [keyword 2], [keyword 3]

## Search Intent
[ ] Informational  [ ] Commercial  [ ] Transactional  [ ] Navigational

## SERP Analysis
- Current #1 result: [URL] — [what it does well / poorly]
- Featured snippet present: [yes/no] — [type: paragraph/list/table]
- PAA questions: [list 3-5 relevant PAA questions]
- Content type that ranks: [guide / listicle / product page / etc.]

## Content Plan
- Content type: [blog post / guide / comparison / etc.]
- Format: [how-to / listicle / narrative / data-driven]
- Target length: [word count range]
- Heading structure: [H1, H2s, H3s outline]

## Unique Value Proposition
What makes this better than what currently ranks?
- [ ] First-hand experience angle: [specific experience to reference]
- [ ] Original data/research: [what data we have]
- [ ] Unique perspective: [our contrarian or unique take]
- [ ] Better depth: [what the competition misses]
- [ ] Better format: [visual, interactive, downloadable]

## Internal Linking
- Links TO this content from: [list pages that should link here]
- Links FROM this content to: [list pages to link to, including hub page]
- Hub page: [which cluster does this belong to?]

## Schema Markup
- [ ] Article / BlogPosting
- [ ] FAQPage (if FAQ section included)
- [ ] HowTo (if step-by-step instructions)
- [ ] VideoObject (if video embedded)
- [ ] Other: [specify]

## On-Page SEO
- Title tag: [draft]
- Meta description: [draft]
- URL slug: [draft]

## Measurement
- Primary KPI: [what success looks like]
- Target: [specific metric and timeline]
```

---

## Editorial Calendar Framework

### Content Velocity by Business Type

| Business Type | Recommended Frequency | Focus |
|--------------|----------------------|-------|
| Early-stage startup | 2-4 posts/month | Hub pages and core spoke content |
| Growing SaaS | 4-8 posts/month | Cluster expansion, comparison content |
| E-commerce | 4-12 posts/month | Category content, buying guides, seasonal |
| Local business | 2-4 posts/month | Local content, case studies, seasonal |
| Media / publisher | Daily+ | Volume with quality standards |

### Seasonal Content Strategy

- Plan seasonal content 2-3 months before the season (Google needs time to index and rank)
- Update seasonal content annually (don't create new pages each year — update existing)
- Examples: "[Industry] trends [year]", "Black Friday [category] deals", "Summer [topic] guide"
- Evergreen content with seasonal updates is more efficient than annual recreations

### Content Update Cadence

- **Monthly:** Check GSC for declining pages — update if traffic drops >20%
- **Quarterly:** Review top 20 pages for accuracy, freshness, competitive positioning
- **Annually:** Full content audit — identify underperforming content for update, consolidation, or removal
- **Trigger-based:** Update immediately when industry changes make content inaccurate

---

## Content Scoring Formula

Rate each content piece on this rubric before publishing:

| Criterion | Weight | Score (0-5) |
|-----------|--------|-------------|
| Search intent match | 25% | Does it match what the searcher actually wants? |
| Depth & comprehensiveness | 20% | Does it fully answer the query? |
| First-hand experience signals | 20% | Does it demonstrate genuine expertise? |
| Technical SEO optimization | 15% | Title, meta, headings, schema, internal links? |
| Visual/media enrichment | 10% | Images, charts, videos, diagrams? |
| Unique value | 10% | Does it add something competitors don't have? |

**Minimum score to publish:** 3.5/5.0 weighted average
**Target score for hub pages:** 4.5/5.0

---

## First-Hand Experience Strategy

Google's authenticity updates (2024-2026) make first-hand experience a strategic imperative, not just a nice-to-have.

### What Counts as First-Hand Experience

- **Product reviews:** Actually using the product, with original photos/screenshots
- **How-to guides:** Writing from experience of actually doing the thing
- **Industry analysis:** Drawing on proprietary data or direct industry involvement
- **Case studies:** Documenting real projects with real results
- **Tutorials:** Teaching from actual practice, not just documentation rewording
- **Comparisons:** Testing both products yourself, not just comparing spec sheets

### How to Incorporate First-Hand Experience

1. **Start with what you've done** — every content piece should begin from real experience
2. **Show your work** — screenshots, original photos, data from real experiments
3. **Name specifics** — specific tools, exact numbers, real timelines, actual mistakes
4. **Acknowledge limitations** — "I only tested X in this context" is more credible than universal claims
5. **Include process** — show your methodology, not just your conclusions
6. **Update from experience** — when you learn something new, update the content with dated notes

### Building First-Hand Experience When You Don't Have It

- Interview subject matter experts and attribute their experience
- Run small experiments and document results
- Partner with practitioners for co-authored content
- Use "Reviewed by [Expert]" attribution with genuine expert review
- Commission original research (surveys, data analysis)

→ See `core-anti-patterns.md` for what NOT to do with AI-generated content.
→ See `entity-seo.md` for strategic authority building.
