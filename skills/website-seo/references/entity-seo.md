# Entity SEO

Knowledge Graph, topical authority, semantic SEO, E-E-A-T strategy, and brand SERP management.

**Scope boundary:** This file covers strategic/architectural authority building. For on-page implementation-level trust signals (author bylines, about pages), → See `core-on-page-seo.md`.

---

## Knowledge Graph Fundamentals

### What the Knowledge Graph Is

Google's Knowledge Graph is a database of billions of entities (people, places, businesses, concepts) and the relationships between them. When Google recognizes your brand as a Knowledge Graph entity, it can display a Knowledge Panel and better understand your content's relevance.

### How Entities Are Created

Google builds entity knowledge from:
- **Wikipedia / Wikidata** — primary structured knowledge source
- **Official websites** — Organization schema, About pages
- **Authoritative databases** — CrunchBase, Bloomberg, government registries
- **Consistent brand mentions** — across media, publications, and platforms
- **Google Business Profile** — for local entities
- **Structured data** — Organization, Person, Brand schema

### Entity Attributes

Every entity has:
- **Name** — the canonical name
- **Type** — Organization, Person, Product, Place, etc.
- **Description** — one-line summary
- **Properties** — founding date, location, industry, social profiles
- **Relationships** — founder, subsidiary, competitor, etc.

### How to Get Your Entity into the Knowledge Graph

1. **Create or update your Wikipedia article** (if your brand meets Wikipedia's notability requirements)
2. **Add/update Wikidata entry** (easier than Wikipedia — no notability requirement, just verifiability)
3. **Implement Organization schema** with complete attributes → See `schema-structured-data.md`
4. **Use `sameAs`** to link your entity to authoritative profiles (Wikipedia, LinkedIn, CrunchBase)
5. **Maintain consistent NAP and brand information** across all platforms
6. **Build press/media mentions** in reputable publications (organic, not link building)
7. **Claim Google Knowledge Panel** when it appears

**Timeline:** Entity recognition can take 3-12 months of consistent signals. There's no shortcut.

---

## Topical Authority Building

### What Topical Authority Means

Topical authority is Google's assessment of how comprehensively and expertly a site covers a topic area. Sites with strong topical authority rank more easily for queries within their topic.

### How Google Determines Topical Authority

| Signal | Weight | How to Build |
|--------|--------|-------------|
| Content depth on the topic | High | Comprehensive coverage across subtopics |
| Content volume on the topic | Moderate | Multiple articles covering different angles |
| Internal linking structure | Moderate | Topic clusters with hub & spoke architecture |
| Author expertise signals | Moderate | Expert bylines, credentials, author pages |
| Time covering the topic | Moderate | Consistent publication over months/years |
| External mentions/citations | Low-Moderate | Being referenced by others in the space (organic) |
| User engagement | Moderate | Time on page, pages per session for topic content |

### Building Topical Authority — Strategy

1. **Choose 2-3 core topics** (not 20). Authority comes from depth, not breadth
2. **Create hub pages** for each core topic → See `content-strategy.md`
3. **Build spoke content** covering every significant subtopic
4. **Interlink comprehensively** — every piece in the cluster connects
5. **Demonstrate expertise** through first-hand experience, original data, case studies
6. **Publish consistently** — regular cadence signals ongoing investment
7. **Update existing content** — freshness within your topic area matters
8. **Cover adjacent topics** only after establishing authority in core topics

### Depth vs Breadth

| Approach | Outcome |
|----------|---------|
| 50 articles across 15 topics | No authority anywhere — thin coverage |
| 50 articles across 3 topics | Strong authority in 3 areas — deep coverage |
| 100 articles in 1 topic | Dominant authority — but may miss adjacent opportunities |

**Recommendation:** Start narrow (2-3 topics), go deep, then expand once you've established authority.

### Realistic Timeline for Topical Authority

| Phase | Timeline | What Happens |
|-------|----------|-------------|
| Foundation | Month 1-3 | Hub pages created, initial spoke content, schema implemented |
| Building | Month 3-9 | Content volume grows, internal linking matures, early rankings appear |
| Authority | Month 9-18 | Google begins treating site as authoritative for the topic |
| Dominance | Month 18+ | New content ranks faster, featured snippets, Knowledge Panel appearance |

---

## Semantic SEO

### Entity-Based Search vs Keyword-Based Search

Google evolved from matching keywords to understanding entities and intent:

| Old (Keyword-Based) | New (Entity-Based) |
|---------------------|-------------------|
| Match exact keywords in content | Understand the topic/entity being discussed |
| Keyword density as a signal | Topic coverage and entity relationships as signals |
| One keyword per page | One entity/topic per page, many related terms naturally |
| Synonyms needed explicitly | Google understands synonyms automatically |

### NLP and How Google Understands Content

Google uses BERT, MUM, and other NLP models to:
- Understand the meaning of content, not just the words
- Identify entities mentioned and their relationships
- Determine search intent behind queries
- Match content to intent, not just keywords

### Entity Mentions and Co-occurrence

When writing about a topic, naturally include related entities:

**Example — writing about "content marketing":**
- Related entities: SEO, social media, blog posts, editorial calendar, buyer persona, content strategy, B2B, lead generation
- Related people: Joe Pulizzi, Ann Handley, Neil Patel
- Related tools: HubSpot, WordPress, Semrush, Ahrefs

You don't need to force these — if your content genuinely covers the topic, related entities appear naturally. If they don't, your content might not be comprehensive enough.

### Topic Modeling

Tools can analyze top-ranking content for entity coverage:
- What entities do top-ranking pages mention?
- What subtopics do they cover?
- What questions do they answer?
- Where are the gaps?

Use this analysis to ensure your content covers the topic at least as comprehensively as the competition, plus adds unique value through first-hand experience.

---

## E-E-A-T Strategy

### What E-E-A-T Is

E-E-A-T (Experience, Expertise, Authoritativeness, Trustworthiness) comes from Google's Search Quality Rater Guidelines. It is NOT a direct ranking factor — it's a framework raters use to evaluate search quality. Google's algorithms approximate E-E-A-T signals.

### YMYL and Heightened E-E-A-T Requirements

**YMYL (Your Money Your Life)** topics require the highest E-E-A-T standards:
- Health and medical information
- Financial advice and products
- Legal information
- News and current events
- Safety-critical information
- Government and civic information

For YMYL content, Google applies significantly stricter quality standards. Author credentials, institutional backing, and factual accuracy are critical.

### Strategic E-E-A-T Building

**Experience (the first E):**
- Demonstrate that content creators have actually done/experienced what they write about
- Include original photos, screenshots, and documentation from real experience
- Share specific results, timelines, and lessons learned
- Document processes and methodologies from actual practice

**Expertise:**
- Hire or partner with genuine subject matter experts
- Display credentials, qualifications, and professional background
- Build author pages with verifiable expertise signals
- Contribute to industry publications, conferences, standards bodies

**Authoritativeness:**
- Build topical authority through comprehensive content coverage (see above)
- Earn mentions and citations in industry publications (organic, not paid)
- Participate in industry standards and associations
- Get recognized by peers (awards, speaking invitations, expert quotes)

**Trustworthiness (the foundation):**
- Maintain factual accuracy in all content
- Have clear editorial standards and correction processes
- Display contact information, about page, privacy policy
- Use HTTPS, ensure site security
- Disclose conflicts of interest, sponsorships, affiliate relationships
- Respond to and correct errors publicly

### E-E-A-T Implementation Checklist

- [ ] Every content page has a named author with an author page
- [ ] Author pages display relevant credentials and experience
- [ ] About page exists with company history, mission, and team
- [ ] Editorial standards / fact-checking process documented
- [ ] Contact information easily accessible
- [ ] Privacy policy and terms of service present
- [ ] HTTPS with valid certificate
- [ ] Content reviewed by qualified individuals (especially YMYL)
- [ ] Sources cited for factual claims
- [ ] Correction process in place for errors

→ See `core-on-page-seo.md` for implementation-level E-E-A-T signals (bylines, about pages, on-page trust elements).

---

## Brand SERP Management

### What is Brand SERP?

Your brand SERP is the search results page for your brand name. It's the first thing people see when they Google you.

### Typical Brand SERP Components

| Position | Element | How to Influence |
|----------|---------|-----------------|
| Top | Knowledge Panel | Organization schema, Google Business Profile, Wikipedia |
| 1 | Official website | Basic SEO on homepage |
| 2-3 | Key pages (About, Products) | Internal pages with strong titles |
| 4-5 | Social profiles | Active, optimized social media profiles |
| 6-7 | Third-party mentions | PR, reviews, industry mentions |
| Images | Brand visuals | Optimized images on site + social profiles |
| PAA | Common brand questions | FAQ content on your site |

### Brand SERP Optimization

1. **Audit current brand SERP:** Google your brand name and document everything that appears
2. **Claim all real estate:**
   - Homepage (optimize title and meta for brand query)
   - Key subpages (About, Products/Services, Blog, Contact)
   - Social profiles (LinkedIn, Twitter/X, Facebook, Instagram, YouTube, GitHub)
   - Google Business Profile
   - Industry review platforms (G2, Capterra, Trustpilot, etc.)
3. **Knowledge Panel:** Claim, verify, and optimize
4. **Manage third-party results:** Monitor for negative or inaccurate listings
5. **Create FAQ content:** Target PAA boxes for brand-related questions

### Managing Negative Results

- You cannot remove legitimate negative content from Google
- Push down negative results by strengthening positive presence
- Respond professionally to negative reviews (shows transparency)
- Address legitimate complaints publicly and constructively
- Create comprehensive, authoritative content that earns top positions

---

## Entity Disambiguation

### When Disambiguation Matters

If your brand name is common or shared with other entities:
- "Mercury" — planet, car brand, element, technology companies
- "Notion" — productivity app, restaurant, philosophical concept

### Signals for Disambiguation

| Signal | How to Implement |
|--------|-----------------|
| `sameAs` in schema | Link to Wikipedia, Wikidata, CrunchBase, social profiles |
| Consistent naming | Use the exact same brand name everywhere |
| Official website declaration | Organization schema with definitive `url` |
| Branded search behavior | Users clicking your result for brand queries reinforces association |
| Context signals | Content that clearly associates your brand with your industry |

---

## Author Entity Building

### Why Author Entities Matter

Google increasingly evaluates content quality through author signals. Building author entities helps all content by that author rank better.

### Author Entity Strategy

1. **Author pages on your site:** Dedicated page per author with bio, credentials, published works, social links
2. **Author schema:** `Person` schema with `sameAs` links to authoritative profiles
3. **Google Scholar profile** (if academic/research-oriented)
4. **Consistent bylines** across all publications (your site + guest content)
5. **Social proof:** Speaking engagements, awards, certifications linked from author page
6. **Cross-publication presence:** Guest articles on authoritative sites in your field (genuine expertise sharing, not link building)

### Author Schema Example

```json
{
  "@context": "https://schema.org",
  "@type": "Person",
  "name": "Jane Smith",
  "url": "https://www.example.com/authors/jane-smith",
  "jobTitle": "Senior Performance Engineer",
  "worksFor": {
    "@type": "Organization",
    "name": "Example Corp"
  },
  "sameAs": [
    "https://twitter.com/janesmith",
    "https://www.linkedin.com/in/janesmith",
    "https://scholar.google.com/citations?user=XXXXX"
  ],
  "knowsAbout": ["Web Performance", "Core Web Vitals", "JavaScript Optimization"]
}
```

---

## Brand Mentions and Implied Links

### Brand Mentions as Signals

Google's patents reference "implied links" — brand mentions without hyperlinks that still serve as authority signals.

**What counts:**
- Your brand mentioned in news articles, blog posts, forums
- Your brand discussed on Reddit, Quora, industry forums
- Your products/services referenced in comparison content
- Expert quotes attributed to your team members

**Note:** This is NOT about building mentions (that would be link building/PR, which is out of scope). It's about understanding that organic brand mentions are a ranking signal and that building genuine brand awareness across channels contributes to SEO.

---

## Entity SEO Measurement

| Metric | How to Track | What It Indicates |
|--------|-------------|-------------------|
| Knowledge Panel presence | Monthly brand name search | Entity recognition |
| Brand search volume | Google Trends + GSC | Brand awareness growth |
| Entity mentions in AI | Quarterly manual testing | AI brand representation |
| Topical authority growth | Rankings for cluster keywords | Authority building progress |
| Author visibility | GSC by author content | Individual author entity strength |
| SERP real estate | Brand SERP audit quarterly | Brand search dominance |
| E-E-A-T proxy metrics | Content scores, user engagement | Quality perception |

→ See `reporting-kpis.md` for full measurement framework.
→ See `aeo-geo.md` for AI brand presence monitoring.
→ See `schema-structured-data.md` for Organization, Person, and Brand schema.
