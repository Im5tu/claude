# Programmatic SEO

Template-driven pages at scale — 12 playbooks with quality guardrails.

---

## What is Programmatic SEO?

Programmatic SEO is the practice of creating search-targeted pages at scale using templates + structured data. Instead of manually writing each page, you build templates that populate with data to produce hundreds or thousands of unique pages.

**When it works:** Unique, valuable data mapped to genuine search intent — each page provides information users can't get elsewhere.

**When it fails:** Thin, template-driven pages where only a keyword or city name changes — no unique value per page.

**Risk level:** High. Programmatic SEO is the most common trigger for Google's "scaled content abuse" penalty when done poorly.

→ See `core-anti-patterns.md` for banned practices around scaled content.

---

## Quality Guardrails — Read Before Any Playbook

### Non-Negotiable Requirements

Every programmatically generated page MUST:

1. **Provide unique value** — information on this page that isn't on other pages in the set
2. **Match genuine search intent** — people actually search for this query
3. **Pass the human review test** — would a human visitor find this page useful?
4. **Have substantial content** — not just a keyword swapped into a template (minimum 200+ words of unique content per page)
5. **Be factually accurate** — data must be current and verified

### Quality Assurance Process

| Check | Frequency | Method |
|-------|-----------|--------|
| Human spot-check | Before launch + monthly | Randomly review 5% of generated pages |
| Unique content audit | Before launch | Verify each page has data/content not on sibling pages |
| Thin content scan | Weekly | Automated check for pages below minimum content threshold |
| Indexation monitoring | Weekly | GSC Coverage report — watch for pages being de-indexed |
| User engagement | Monthly | GA4 — bounce rate, time on page per template type |
| SERP sampling | Monthly | Search 10-20 representative queries to check rankings |

### Google's "Scaled Content Abuse" Policy

Google's March 2024 spam update explicitly targets:
- Content produced at scale where the primary purpose is manipulating search rankings
- Pages with auto-generated content that adds no original value
- Mass-producing pages by varying only keywords/locations without unique information

**The test:** If you removed all the unique data and left only the template, would the pages be nearly identical? If yes, you're at risk.

### Canonical Strategy for Programmatic Pages

- Each page should self-canonicalize (point to itself)
- Similar but not identical pages (e.g., "plumber in Austin" vs "plumber in Austin, TX") should canonical to one version
- Faceted/filtered versions of programmatic pages should canonical to the base page
- Cross-reference with `core-technical-seo.md` for canonical best practices

---

## 12 Programmatic SEO Playbooks

### Playbook 1: Location Pages

**Pattern:** `[Service] in [City/Area]`
**Example:** "Emergency Plumber in Austin, TX"

**Template structure:**
- H1: [Service] in [City], [State]
- Local team members serving this area (names, photos, certifications)
- Location-specific pricing/rates
- Local regulations, codes, or requirements
- Area-specific case studies or testimonials
- Local statistics (demographics, housing data, climate data affecting the service)
- Map embed with service area highlighted
- FAQs specific to this location

**Unique data requirements per page:**
- Local pricing data (must vary by location)
- At least one location-specific case study or testimonial
- Local regulatory information
- Team member(s) serving this area

**Schema:** `LocalBusiness` + `Service` → See `schema-structured-data.md`

→ See `local-seo.md` for location page best practices.

### Playbook 2: Comparison Pages

**Pattern:** `[Product A] vs [Product B]`
**Example:** "Notion vs Obsidian: Which Note-Taking App?"

**Template structure:**
- H1: [Product A] vs [Product B]: [Value Proposition]
- Quick verdict (answer-first for featured snippets)
- Side-by-side comparison table (features, pricing, ratings)
- Category-by-category detailed comparison
- Use case recommendations ("Choose A if... Choose B if...")
- User reviews/ratings from both products
- FAQ section

**Unique data requirements per page:**
- Genuine product comparison data (not copied from product sites)
- Original analysis and recommendations
- Use-case-specific verdicts

**Schema:** `Product` (for each compared product) + `FAQPage`

### Playbook 3: Integration Pages

**Pattern:** `[Product] + [Integration] Integration`
**Example:** "Slack + Jira Integration Guide"

**Template structure:**
- H1: How to Connect [Product] with [Integration]
- Integration overview and benefits
- Step-by-step setup guide with screenshots
- Configuration options
- Use cases and workflow examples
- Troubleshooting common issues
- Alternative integration methods

**Unique data requirements per page:**
- Actual integration steps (verified and current)
- Screenshots of the setup process
- Real workflow examples

### Playbook 4: Statistics/Data Pages

**Pattern:** `[Topic] Statistics [Year]`
**Example:** "Remote Work Statistics 2026"

**Template structure:**
- H1: [XX] [Topic] Statistics for [Year]
- Key statistics with source citations
- Data visualizations (charts, graphs)
- Trend analysis (year-over-year comparisons)
- Industry breakdown
- Regional/demographic breakdown
- Methodology section

**Unique data requirements per page:**
- Sourced, verified statistics (not fabricated)
- Original visualizations
- Trend analysis with commentary
- Annual updates required

**High link-earning potential** — statistics pages naturally attract citations.

### Playbook 5: Glossary/Definition Pages

**Pattern:** `What is [Term]?`
**Example:** "What is INP (Interaction to Next Paint)?"

**Template structure:**
- H1: What is [Term]? Definition & Guide
- Concise definition (40-60 words — featured snippet target)
- Detailed explanation
- Examples and use cases
- Related terms (internal links to other glossary entries)
- FAQ section

**Unique data requirements per page:**
- Clear, accurate definition
- Practical examples specific to the term
- Visual explanations where applicable

**Schema:** `DefinedTerm` + `FAQPage`

### Playbook 6: Tool/Calculator Pages

**Pattern:** `[Type] Calculator` or `[Type] Generator`
**Example:** "Mortgage Payment Calculator"

**Template structure:**
- H1: Free [Type] Calculator
- Interactive tool (functional, not a mockup)
- How to use the tool (brief instructions)
- How the calculation works (methodology)
- Related content and resources
- FAQ section

**Unique data requirements per page:**
- Functional, accurate tool
- Transparent methodology
- Up-to-date data inputs

→ See `free-tool-strategy.md` for comprehensive tool strategy.

**Schema:** `WebApplication` + `FAQPage`

### Playbook 7: Directory Pages

**Pattern:** `Best [Service] in [Location]` or `Top [Type] Companies`
**Example:** "Best Coffee Shops in Portland"

**Template structure:**
- H1: [XX] Best [Service/Business] in [Location] ([Year])
- Curated list with genuine evaluation criteria
- Each entry: name, description, what makes it special, ratings, address/link
- Selection methodology disclosed
- Map of locations
- FAQ section

**Unique data requirements per page:**
- Genuine, curated listings (not auto-scraped)
- Evaluation criteria and methodology
- Regularly updated (quarterly minimum)

**Risk:** Directory pages easily become thin content. Every listing must have a genuine description explaining why it's included.

### Playbook 8: Template/Example Pages

**Pattern:** `[Type] Template` or `[Type] Example`
**Example:** "Marketing Plan Template"

**Template structure:**
- H1: Free [Type] Template / [XX] [Type] Examples
- Downloadable or copyable template
- How to use the template
- Customization tips
- Examples of completed templates
- Related templates

**Unique data requirements per page:**
- Actually usable, downloadable template
- Guidance on customization
- Real-world examples

**Schema:** `HowTo` or `CreativeWork`

### Playbook 9: Competitor & Alternative Pages

Competitor and alternative pages capture high-intent search traffic from users actively evaluating options. This playbook covers four page formats that, together, blanket the competitive search landscape. Each format targets different intent and funnel stages.

#### Core Principles

1. **Honesty builds trust** — Acknowledge competitor strengths, be accurate about your limitations. Readers are actively comparing and will verify every claim.
2. **Depth over surface** — Go beyond feature checklists. Explain *why* differences matter with use cases and scenarios. Show, don't just tell.
3. **Help them decide** — Different tools fit different needs. Be clear about who you are best for *and* who the competitor is best for. Reduce evaluation friction.

#### Content Architecture: Centralized Competitor Data

Create a single source of truth for each competitor in structured data files (YAML or JSON):

```
competitor_data/
├── notion.yaml
├── airtable.yaml
├── monday.yaml
└── ...
```

Each file should contain: positioning and target audience, pricing (all tiers with hidden costs), feature ratings by category, strengths and weaknesses (be honest), best-for and not-ideal-for profiles, common complaints from review sites (G2, Capterra, TrustRadius), and migration notes.

All four page formats below pull from this centralized data. Update competitor pricing once and it propagates to every page. Add a new feature comparison once and it appears everywhere. This is the only way to maintain accuracy at scale.

---

#### Format 1: Singular Alternative — `/alternative-to-[competitor]`

**Pattern:** `Alternative to [Competitor]`
**Example:** "Alternative to Notion for Project Management"

**Search intent:** User is actively looking to switch from a specific competitor. Highest conversion intent of all four formats.

**Target keywords:** "[Competitor] alternative", "alternative to [Competitor]", "switch from [Competitor]", "replace [Competitor]"

**Template structure:**
- H1: The Best Alternative to [Competitor] for [Use Case]
- TL;DR comparison box (key differences in 2-3 sentences — featured snippet target)
- Why people look for alternatives (validate their pain with specific, common complaints from review mining)
- Summary: You as the alternative (quick positioning paragraph, not a sales pitch)
- Paragraph-form comparison by category (features, ease of use, support, integrations — write a paragraph per dimension explaining differences and when each matters, not just a table)
- Side-by-side pricing comparison (tier-by-tier table, what is included at each level, hidden costs, total cost calculation for a sample team size)
- Who should switch and who should not (be explicit — if the competitor is better for certain use cases, say so)
- Migration and switching guide (what transfers, what needs reconfiguration, support offered, timeline estimate)
- Social proof from customers who switched (quotes with names, roles, companies, and specific outcomes)
- CTA

**Unique data requirements per page:**
- Specific pain points sourced from real competitor reviews
- Accurate, current pricing for both products
- At least one testimonial from a customer who switched
- Migration details verified against current product capabilities

---

#### Format 2: Plural Alternatives — `/[competitor]-alternatives`

**Pattern:** `[Competitor] Alternatives`
**Example:** "Best Slack Alternatives for Small Teams"

**Search intent:** User is researching options, earlier in the evaluation journey. They want a landscape view, not just your product.

**Target keywords:** "[Competitor] alternatives", "best [Competitor] alternatives", "tools like [Competitor]", "apps similar to [Competitor]"

**Template structure:**
- H1: [XX] Best [Competitor] Alternatives ([Year])
- TL;DR comparison box (quick summary of the top alternatives and who each is best for)
- Why people look for alternatives (common pain points from review mining)
- What to look for in an alternative (evaluation criteria framework — helps readers and establishes your expertise)
- List of alternatives (you first, but include 4-7 genuine alternatives — being helpful builds trust and ranks better)
- Summary comparison table (not just checkmarks — use descriptive cells like "Full support with unlimited history" vs "Basic support, 90-day limit")
- Detailed breakdown of each alternative (2-3 paragraphs each covering strengths, weaknesses, pricing, and ideal user)
- Recommendation by use case ("Choose X if you need..., Choose Y if you need...")
- CTA

**Unique data requirements per page:**
- Genuine, researched descriptions of each alternative (not copied from product sites)
- Honest strengths and weaknesses for every option listed, including yourself
- Current pricing for all products compared
- Use-case-specific recommendations

**Important:** Including real alternatives is not optional. Pages that list only your product as the "alternative" fail the quality test and will not rank.

---

#### Format 3: You vs Competitor — `/[you]-vs-[competitor]`

**Pattern:** `[You] vs [Competitor]`
**Example:** "Basecamp vs Asana: Which Project Management Tool?"

**Search intent:** User is directly comparing you to a specific competitor. They are mid-funnel and narrowing their shortlist.

**Target keywords:** "[You] vs [Competitor]", "[Competitor] vs [You]", "[You] compared to [Competitor]"

**Template structure:**
- H1: [You] vs [Competitor]: [Value-Focused Subtitle]
- TL;DR comparison box (key differences in 2-3 sentences, answer-first for featured snippets)
- At-a-glance comparison table (organize by category: core features, collaboration, integrations, security, support)
- Paragraph-form comparison by category (for each dimension, write a full paragraph explaining the differences, why they matter, and when each approach is better — this is the substance that tables alone cannot provide)
- Pricing comparison (tier-by-tier table with total cost calculation for sample team sizes)
- Who [You] is best for (specific use cases, team types, workflows)
- Who [Competitor] is best for (be honest — this is what builds credibility)
- What customers say (testimonials from users who evaluated both or switched)
- Migration and switching guide (what transfers, what needs setup, timeline, support available)
- CTA

**Unique data requirements per page:**
- Original analysis with specific use-case verdicts
- Accurate feature and pricing data for both products
- Paragraph-form comparisons (not just tables) for at least 4 categories
- Honest "best for" sections for both products

---

#### Format 4: Competitor vs Competitor — `/[competitor-a]-vs-[competitor-b]`

**Pattern:** `[Competitor A] vs [Competitor B]`
**Example:** "Notion vs Airtable: Which Is Better for Your Team?"

**Search intent:** User is comparing two competitors, not you directly. They may not know you exist yet. This format captures traffic for competitor brand terms and positions you as a knowledgeable third option.

**Target keywords:** "[Competitor A] vs [Competitor B]", "[Competitor B] vs [Competitor A]", "[A] or [B]"

**Template structure:**
- H1: [Competitor A] vs [Competitor B]: Honest Comparison ([Year])
- TL;DR comparison box (quick verdict on key differences)
- Overview of both products (positioning, target audience, approach)
- Paragraph-form comparison by category (features, pricing, ease of use, support — write substantive paragraphs, not just tables)
- Who [Competitor A] is best for
- Who [Competitor B] is best for
- The third option: introduce yourself (position naturally — "If neither fully fits, here is another approach")
- Three-way comparison table (all three products side by side)
- CTA

**Unique data requirements per page:**
- Genuinely useful, balanced comparison of both competitors (this is not a hit piece)
- Fair assessment of who each competitor is best for
- Your product introduced naturally, not forced
- Accurate data for all three products

**Why this works:** Captures search traffic for competitor brand terms you would otherwise never rank for, and positions you as an authoritative voice in the space.

---

#### SEO Keyword Targeting by Format

| Format | Primary Keywords | Secondary Keywords | Funnel Stage |
|--------|-----------------|-------------------|--------------|
| Singular alternative | "[Competitor] alternative", "alternative to [Competitor]" | "switch from [Competitor]", "replace [Competitor]" | Bottom (ready to switch) |
| Plural alternatives | "[Competitor] alternatives", "best [Competitor] alternatives" | "tools like [Competitor]", "apps similar to [Competitor]" | Middle (researching options) |
| You vs competitor | "[You] vs [Competitor]", "[Competitor] vs [You]" | "[You] compared to [Competitor]", "[You] or [Competitor]" | Middle (shortlist comparison) |
| Competitor vs competitor | "[A] vs [B]", "[B] vs [A]" | "[A] or [B]", "[A] compared to [B]" | Top-Middle (landscape research) |

#### Essential Sections Checklist

Every competitor/alternative page should include these sections. The depth varies by format, but none should be omitted:

1. **TL;DR comparison box** — Key differences in 2-3 sentences at the top of the page. This is your featured snippet target. Keep it honest and specific.
2. **Paragraph-form comparisons** — For each major dimension (features, UX, support, integrations), write a full paragraph explaining the differences and when each matters. Tables summarize; paragraphs persuade and inform.
3. **Pricing comparison** — Tier-by-tier table showing what is included, hidden costs, and total cost calculation for a sample team size (e.g., 10 users). Do not just list prices; explain value differences.
4. **Migration and switching guide** — What transfers, what needs reconfiguration, timeline estimate, and support available. Include quotes from customers who have switched if available.
5. **"Who it's best for" summary** — Explicit recommendation for each product. Be specific: team size, use case, workflow, budget. Honest recommendations for competitors build trust and convert better than one-sided pitches.

**Schema:** `Product` (for each compared product) + `FAQPage`

### Playbook 10: Cost/Pricing Pages

**Pattern:** `How Much Does [Service] Cost?`
**Example:** "How Much Does a Kitchen Remodel Cost in 2026?"

**Template structure:**
- H1: [Service] Cost in [Year]: Complete Price Guide
- Average cost range (featured snippet target)
- Factors affecting price (detailed breakdown)
- Regional price variations
- Cost calculator (interactive if possible)
- How to save money
- FAQ section

**Unique data requirements per page:**
- Real pricing data (sourced or from experience)
- Regional variations when applicable
- Annual updates with current market data

### Playbook 11: Job/Career Pages

**Pattern:** `[Role] Salary in [Location]`
**Example:** "Software Engineer Salary in Austin, TX"

**Template structure:**
- H1: [Role] Salary in [Location] ([Year])
- Average salary range (featured snippet target)
- Experience level breakdown (junior, mid, senior)
- Company comparisons in the area
- Benefits and compensation trends
- Career growth path
- Job listings integration

**Schema:** `Occupation` + `MonetaryAmount`

### Playbook 12: Regulation/Compliance Pages

**Pattern:** `[Regulation] Requirements in [State/Country]`
**Example:** "GDPR Compliance Requirements for E-Commerce"

**Template structure:**
- H1: [Regulation] Requirements in [Jurisdiction]
- Summary of requirements (featured snippet target)
- Detailed requirement breakdown
- Penalties for non-compliance
- Step-by-step compliance checklist
- Jurisdiction-specific variations
- Recent updates/changes

**High E-E-A-T requirement** — YMYL content. Must be reviewed by qualified professionals.

---

## Technical Implementation

### Template Engine Design

**Principles:**
- Templates should be flexible enough to handle missing data gracefully
- Conditional sections: only show sections when data exists (avoid empty sections)
- Data validation: reject or flag entries that don't meet minimum content thresholds
- Version control templates separately from data

### Implementation Approaches

| Approach | Best For | Examples |
|----------|----------|---------|
| CMS + custom fields | Content teams, marketers | WordPress + ACF, Webflow CMS |
| Static site generator + data files | Developer teams, high performance | Next.js + JSON/CSV, Astro + markdown |
| Database-driven | Large-scale, frequently updated data | Custom app with API + template engine |
| Headless CMS | Teams needing editorial workflow + scale | Contentful, Sanity, Strapi |

### URL Structure

```
Good:
  /tools/roi-calculator/
  /compare/notion-vs-obsidian/
  /locations/austin-tx/
  /glossary/interaction-to-next-paint/

Bad:
  /p/12345/
  /page/?id=8842&type=location
  /generated/notion-vs-obsidian-comparison-page/
```

### Internal Linking Automation

- Programmatic pages should link to:
  - Related programmatic pages (e.g., other cities, other comparisons)
  - Hub/category pages (parent in the hierarchy)
  - Relevant blog/guide content
- Automate internal linking based on data relationships
- Limit to 5-10 contextual internal links per programmatic page

### XML Sitemap Management

For thousands of programmatic pages:
- Split into sitemaps of 10,000-50,000 URLs each
- Use sitemap index file
- Only include indexed, canonical URLs
- Update `lastmod` when page data changes
- Monitor indexation rate in GSC

→ See `core-technical-seo.md` for sitemap and crawl budget details.

---

## Scaling Quality Assurance

### Automated Quality Checks

Run these checks before deploying new programmatic pages:

| Check | Pass Criteria | Tool |
|-------|--------------|------|
| Unique content length | ≥200 words of unique content per page | Custom script |
| Duplicate content | <30% content overlap with sibling pages | Content comparison tool |
| Broken links | Zero broken internal links | Link checker |
| Schema validation | Valid JSON-LD on every page | Schema validator |
| Title/meta uniqueness | No duplicate titles or meta descriptions | Crawl tool |
| Image alt text | All images have descriptive alt text | Crawl tool |
| Page load speed | LCP ≤ 2.5s | Lighthouse batch testing |

### De-Indexation Monitoring

Watch for signs that Google is de-indexing programmatic pages:
- GSC Coverage → "Discovered, currently not indexed" increase
- GSC Coverage → "Crawled, currently not indexed" increase
- Dropping impressions for programmatic page URLs in GSC Performance
- Manual action notifications in GSC

**If de-indexation occurs:**
1. Audit content quality on affected pages
2. Add more unique data/content per page
3. Remove the thinnest pages entirely
4. Resubmit to GSC after improvements

---

## Programmatic SEO Measurement

| Metric | How to Track | What It Indicates |
|--------|-------------|-------------------|
| Pages indexed / pages generated | GSC Coverage | Indexation health |
| Impressions per template type | GSC, filtered by URL pattern | Search visibility |
| Average organic traffic per page | GA4, segmented by URL pattern | Per-page SEO value |
| Conversion rate by template | GA4 with URL grouping | Business impact |
| Thin content rate | Automated content length audit | Quality threshold compliance |
| De-indexation trend | GSC Coverage over time | Google's quality assessment |

→ See `reporting-kpis.md` for full measurement framework.
→ See `core-anti-patterns.md` for quality guardrails.
→ See `local-seo.md` for location page specifics.
→ See `ecommerce-seo.md` for product/category programmatic pages.
