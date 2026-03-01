# Core Anti-Patterns

Banned practices and outdated tactics. This file is the guardrail — every recommendation in other reference files must pass through this filter. Loaded on every engagement.

---

## Banned Practices — Never Recommend

These will result in manual actions or algorithmic penalties. Do not recommend under any circumstances.

### Content Manipulation
- **Keyword stuffing** — cramming keywords unnaturally, including hidden text (white-on-white, font-size: 0, positioned off-screen)
- **Cloaking** — showing different content to search engines than to users
- **Doorway pages** — thin pages targeting similar keyword variations that funnel to the same destination
- **Sneaky redirects** — redirecting users to a different page than what the search engine indexed
- **Auto-generated content at scale without value** — mass-producing content with no editorial oversight, unique value, or human expertise ("scaled content abuse")
- **Scraped/copied content** — reproducing content from other sites without adding original value
- **Aggregation without original value** — compiling information from multiple sources without unique analysis, perspective, or first-hand experience

### Link Manipulation
- **Buying/selling links** that pass PageRank
- **Private Blog Networks (PBNs)** — networks of sites created solely for link building
- **Excessive link exchanges** ("I'll link to you if you link to me" at scale)
- **Automated link building** (software-generated links, comment spam)
- **Link schemes** of any kind — any pattern designed to manipulate PageRank

> Note: Link building is out of scope for this skill entirely. These are listed as hard boundaries, not tactics to evaluate.

### Site Reputation Abuse
- **Parasite SEO / site reputation abuse** — publishing third-party content on a high-authority domain to exploit its rankings (Google's March 2024 update explicitly targets this)
- **Expired domain abuse** — buying expired domains for their backlink profile and repurposing for unrelated content
- **Coupon/review subdomain schemes** — hosting third-party coupon or review sites on subdomains of reputable sites

### Technical Manipulation
- **Hidden text or links** — text or links invisible to users but readable by crawlers
- **Structured data spam** — marking up content that doesn't appear on the page, fake reviews, misleading schema
- **Hacked content** — content injected by attackers that creates spam pages

---

## Outdated Tactics — No Longer Effective

These won't cause penalties, but they waste time and resources. Do not recommend as strategies.

| Tactic | Why It's Outdated |
|--------|-------------------|
| Exact-match domain names | No longer a significant ranking advantage since EMD Update (2012) |
| Meta keywords tag | Google has ignored this tag since 2009 |
| Keyword density targets (e.g., "aim for 2%") | Google uses NLP/semantic understanding, not keyword counting |
| Reciprocal link building as primary strategy | Heavily discounted since Penguin |
| Article spinning | Produces low-quality content that violates content quality guidelines |
| Comment spam for links | All major platforms use `nofollow`; zero SEO value |
| Web 2.0 properties for links | Blogger, Tumblr, etc. — no meaningful link equity |
| Press release links | `nofollow` on all major distribution networks |
| Excessive footer/sidebar links | Sitewide links heavily discounted; can appear manipulative |
| Submitting to hundreds of directories | No value; most directories are themselves low-quality |
| Exact-match anchor text at scale | Over-optimization trigger since Penguin |
| Building links before fixing technical issues | Technical foundation must come first |

---

## AI Content Quality Standards

Google's official stance (2023-present): AI-generated content is acceptable **if it provides genuine value to users.** The method of creation matters less than the quality of the output.

### What Triggers "Scaled Content Abuse"

Google's March 2024 spam policies define scaled content abuse as producing content at scale — whether by AI or other automated methods — where the primary purpose is manipulating search rankings rather than helping users.

**Red flags:**
- High volume of content with no editorial review
- Template-driven content with minimal variation between pages
- Content that aggregates information without adding unique analysis or perspective
- No author attribution or expertise signals
- Content on topics outside the site's established expertise
- Factual errors or outdated information not caught by review
- Generic content that could describe any business in the industry

### First-Hand Experience Requirement

Google's 2024–2026 updates increasingly prioritize content demonstrating genuine first-hand experience. This is the "Experience" in E-E-A-T.

**Content MUST demonstrate:**
- The author has actually done/used/experienced what they're writing about
- Original observations, data, or insights not available through aggregation
- Specific details that only someone with real experience would know
- Personal methodology, process, or approach (not just regurgitated best practices)

**Content MUST NOT be:**
- Pure aggregation of what other sources say
- Generic advice that could be generated by anyone without expertise
- "Best X" lists compiled without actually testing the products
- Advice on topics the author/organization has no genuine experience with

### Acceptable AI-Assisted Content Practices

| Acceptable | Not Acceptable |
|-----------|---------------|
| AI helps draft content that a human expert reviews and enriches with first-hand experience | AI generates content published without human review |
| AI assists research that a human synthesizes with original analysis | AI rewrites competitor content with no new perspective |
| AI handles formatting, grammar, structure while human provides expertise | AI produces content on topics outside the site's expertise |
| AI generates initial outlines that humans fill with original insights | AI mass-produces location/keyword variants with swapped city names |

### AI Writing Detection Signals

Google has not confirmed using AI detection tools, but quality signals that distinguish expert-written from pure-AI content include:
- Specific examples from personal experience
- Nuanced opinions with supporting reasoning
- References to internal data or proprietary methodologies
- Unique frameworks or mental models
- Acknowledgment of limitations, tradeoffs, or "it depends" answers
- Industry jargon used correctly and precisely (not generically)

---

## Gray Area Tactics — Use with Extreme Caution

These tactics are legitimate when done well and spammy when done poorly. The line is thin.

### Topical Authority Through Volume

- **Legitimate:** Publishing 50 deeply researched articles on a topic you have genuine expertise in, each adding unique value
- **Spam:** Publishing 200 thin articles across random topics to appear authoritative
- **Test:** Would an expert in this field find each individual article valuable? If no, it's spam

### Programmatic SEO

→ See `programmatic-seo.md` for full quality guardrails.

- **Legitimate:** Location pages with unique local data, pricing, regulations, and team info per location
- **Spam:** Location pages where only the city name changes and all other content is identical
- **Test:** Does each page provide unique information a user couldn't get from another page in the set?

### Guest Posting

- **Legitimate:** Sharing genuine expertise on relevant, editorial-quality publications
- **Spam:** Writing mediocre content solely for the author bio link
- **Note:** This is out of scope for this skill (link building), but mentioned because clients may ask

### Content Syndication

- **Legitimate:** Republishing your content on Medium, LinkedIn, etc. with proper canonical pointing to original
- **Spam:** Republishing without canonicals, creating duplicate content issues
- **Requirement:** Always use `rel="canonical"` pointing to the original URL

### Testimonial/Review Solicitation

- **Legitimate:** Asking satisfied customers for honest reviews
- **Spam:** Incentivizing positive reviews, gating (only asking likely-positive customers), fake reviews
- **Note:** Google's review policies are strict — any form of review manipulation is a violation

---

## Audit False Positives

Things that SEO tools flag as "issues" but are often not problems. Do not automatically recommend fixes for these.

| Tool Flag | Reality |
|-----------|---------|
| "Missing meta description" | Google writes its own in ~70% of cases. Worth adding for key pages, but not an error on every page |
| "Missing H1 tag" | Only an issue if the page genuinely lacks a main heading. Semantic HTML5 sections can have multiple headings |
| "Multiple H1 tags" | Valid in HTML5 sectioning model. Only problematic if headings don't reflect content hierarchy |
| "Low word count" | Transactional pages (product, pricing, contact) don't need 2,000 words. Length should match intent |
| "Orphan pages" | Landing pages, campaign pages, and tool pages may be intentionally not in navigation |
| "Too many on-page links" | Google's old "100 links per page" guideline is obsolete. Link as many as make sense for users |
| "Missing alt text on decorative images" | Decorative images should have `alt=""` — empty alt is correct, not missing |
| "Mixed content warning" | Only relevant if HTTP resources are on HTTPS pages — check before flagging |
| "Redirect chains" | A single 301 redirect is fine. Chains of 3+ are worth fixing, but one hop is not an issue |

**Rule:** Never recommend a fix solely because a tool flagged it. Every fix must have a clear user or ranking benefit.

---

## Authenticity Signals — What Google Rewards

The opposite of anti-patterns — these are the signals that build lasting SEO value.

### Original Research & Data
- Proprietary studies, surveys, and experiments
- Data visualizations from original datasets
- Industry benchmarks based on real analysis
- Case studies with specific metrics and methodology

### First-Hand Experience
- "I tested X and here's what happened" content
- Process documentation from real projects
- Lessons learned from actual failures (not hypothetical)
- Behind-the-scenes content showing real work

### Unique Perspectives
- Contrarian viewpoints backed by evidence
- Framework or methodology that can't be found elsewhere
- Expert synthesis connecting disparate ideas
- Industry insider knowledge not available in generic content

### Genuine Expertise Signals
- Author pages with verifiable credentials
- Consistent publication in the topic area over time
- Speaking engagements, awards, publications (verifiable)
- Community engagement (forums, social, conferences)

### Transparency
- Clear editorial standards and correction policies
- Disclosed methodology for tests, reviews, and comparisons
- Honest disclosure of limitations and conflicts of interest
- Regular content updates when information changes

→ See `content-strategy.md` for how to build these signals into your content process.
→ See `entity-seo.md` for strategic authority building.
