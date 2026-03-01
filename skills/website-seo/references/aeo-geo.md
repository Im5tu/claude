# AEO & GEO

Answer Engine Optimization (AEO) and Generative Engine Optimization (GEO) — optimizing for AI-powered search.

---

## AEO (Answer Engine Optimization)

### What AEO Is

AEO is the practice of optimizing content to be selected as a source by AI-powered search engines: Google AI Overviews, Bing Copilot, Perplexity, ChatGPT Search, and others.

Traditional SEO → rank in blue links.
AEO → get cited as a source in AI-generated answers.

### How AI Search Engines Select Sources

AI search engines evaluate content differently from traditional ranking:

| Signal | How AI Uses It | Optimization |
|--------|---------------|-------------|
| Factual accuracy | AI cross-references multiple sources | Cite data, use verifiable claims |
| Clear structure | AI extracts information from structured content | Use headers, lists, tables, definitions |
| Authoritative sourcing | AI prefers established, trusted domains | Build E-E-A-T signals → See `entity-seo.md` |
| Concise answers | AI extracts direct answers to questions | Lead with the answer, then elaborate |
| Freshness | AI prefers current information | Update content regularly with dates |
| Unique data | AI values original information | Include proprietary data, original research |

### Content Structure for AI Citation

**The "Answer-First" pattern:**

```markdown
## What is [Topic]?

[Topic] is [concise 1-2 sentence definition]. [One sentence of context.]

### Key Details

- [Specific fact with number or data point]
- [Specific fact with source]
- [Specific fact with context]

### How It Works

[2-3 paragraph explanation with step-by-step breakdown]
```

**Why this works:** AI engines extract the concise answer from the first paragraph and use the supporting details for verification. If your content buries the answer in paragraph 5, AI engines skip to a source that leads with it.

### Optimizing for Google AI Overviews

Google AI Overviews (launched May 2024, expanded through 2025-2026) generate AI summaries at the top of search results.

**How to get cited in AI Overviews:**
- Rank on page 1 for the query (AI Overviews primarily cite top-ranking pages)
- Structure content with clear, extractable answers
- Use structured data (FAQ, HowTo, Article schema) → See `schema-structured-data.md`
- Cover the topic comprehensively — AI Overviews synthesize from multiple sources
- Include statistics and specific data points (AI prefers quantifiable information)
- Maintain E-E-A-T signals (author attribution, expertise indicators)

**AI Overview triggers:**
- Informational queries ("what is...", "how to...", "why does...")
- Comparison queries ("X vs Y")
- Multi-faceted questions requiring synthesis
- "Best of" and recommendation queries

**AI Overview does NOT typically trigger for:**
- Navigational queries (searching for a specific site)
- Simple factual queries (Knowledge Panel handles these)
- YMYL queries where AI confidence is low (medical, financial — though expanding)

---

## GEO (Generative Engine Optimization)

### Research-Backed GEO Tactics

Academic research on GEO (particularly from Georgia Tech and Princeton studies) has identified specific content characteristics that increase AI citation probability.

| Tactic | Impact on AI Citation | Implementation |
|--------|----------------------|----------------|
| Include statistics | High (+40% citation likelihood in studies) | Add specific numbers, percentages, dates |
| Cite authoritative sources | High | Reference studies, official data, expert quotes |
| Use authoritative tone | Moderate | Confident, precise language (not hedging) |
| Add direct quotes from experts | Moderate | Include named expert opinions |
| Technical terminology | Moderate | Use correct industry terms (not dumbed down) |
| Fluency optimization | Moderate | Clear, well-structured writing |
| Unique insights | High | Original analysis not found elsewhere |

### Citation Optimization

How to increase the probability your content gets cited by AI:

1. **Lead with facts** — AI extracts factual statements more easily than opinions
2. **Use specific numbers** — "increased conversion by 34%" beats "significantly improved conversion"
3. **Attribute claims** — "According to [Source], ..." gives AI a citation chain
4. **Structure for extraction** — clear headings, bullet points, definition lists
5. **Be the primary source** — original data gets cited more than aggregated data
6. **Update regularly** — AI models prefer recent information for time-sensitive topics

### Fluency Optimization

AI engines favor content that is:
- Grammatically correct and well-structured
- Logically organized with clear transitions
- Free of jargon when addressing general audiences
- Appropriately technical when addressing expert audiences
- Concise without sacrificing completeness

---

## AI Writing Detection

### Google's Stance

Google's official position (since 2023): AI-generated content is acceptable if it provides genuine value. Google's spam policies target **low-quality content at scale**, not AI-assisted content per se.

**The line:**
- Acceptable: AI helps draft content that a human expert reviews, enriches, and validates
- Not acceptable: AI generates and publishes content with no human review or expertise

→ See `core-anti-patterns.md` for full AI content quality standards.

### Common AI Content Patterns That Trigger Quality Filters

| Pattern | Why It's Flagged |
|---------|-----------------|
| Generic introductions ("In today's digital landscape...") | Lacks specificity; obvious AI pattern |
| Exhaustive lists without depth | Breadth without genuine expertise |
| Perfectly balanced prose with no opinion | Humans have perspectives; AI hedges everything |
| Lack of specific examples from experience | No first-hand experience signals |
| Repetitive sentence structures | AI has recognizable patterns |
| Over-use of transition phrases | "Furthermore," "Moreover," "Additionally" overuse |
| Missing "I" / first-person perspective | Depersonalized, generic voice |

→ See `core-anti-patterns.md` for complete AI content guidelines, including how to use AI as an assistant while maintaining quality.

---

## AI Crawler Management

### Known AI Crawlers

| Crawler | Company | User-Agent | Purpose |
|---------|---------|-----------|---------|
| GPTBot | OpenAI | `GPTBot` | Training data + ChatGPT Search |
| ChatGPT-User | OpenAI | `ChatGPT-User` | Real-time browsing in ChatGPT |
| ClaudeBot | Anthropic | `ClaudeBot` | Training data |
| PerplexityBot | Perplexity | `PerplexityBot` | Real-time search answers |
| Google-Extended | Google | `Google-Extended` | Gemini/AI training (separate from Googlebot) |
| Bytespider | ByteDance | `Bytespider` | TikTok/AI training |
| CCBot | Common Crawl | `CCBot` | Open dataset used by many AI models |
| FacebookBot | Meta | `FacebookBot` | Meta AI training |

### robots.txt for AI Crawlers

```
# Allow search engine crawlers (required for SEO)
User-agent: Googlebot
Allow: /

User-agent: Bingbot
Allow: /

# Allow AI search engines (required for AEO/GEO)
User-agent: ChatGPT-User
Allow: /

User-agent: PerplexityBot
Allow: /

# Block AI training crawlers (optional — protects content from training data)
User-agent: GPTBot
Disallow: /

User-agent: ClaudeBot
Disallow: /

User-agent: Google-Extended
Disallow: /

User-agent: CCBot
Disallow: /

User-agent: Bytespider
Disallow: /
```

### Strategic Considerations

**The tension:** Blocking AI crawlers protects your content from being used as training data, but may reduce your visibility in AI search results.

| Strategy | When to Use |
|----------|-------------|
| Allow all AI crawlers | Maximum AI visibility is the priority; content is already publicly available |
| Allow search AI, block training AI | Want to appear in AI search results but don't want content used for model training |
| Block all AI crawlers | Content protection is paramount (paywalled content, proprietary research) |
| Selective by directory | Allow AI crawlers on marketing content, block on proprietary/premium content |

**Recommendation:** For most businesses seeking SEO visibility, allow AI search crawlers (ChatGPT-User, PerplexityBot) while blocking training-only crawlers (GPTBot for training, ClaudeBot, Google-Extended). This balances visibility with content protection.

---

## Brand Presence in AI Responses

### How AI Models Represent Brands

AI models form brand "knowledge" from:
- Training data (web content, Wikipedia, social media, reviews)
- Real-time web retrieval (for search-enabled AI)
- Structured data and Knowledge Graph entities
- Review aggregation sites (G2, Trustpilot, Capterra)
- News and press coverage

### Monitoring Brand in AI

**Manual testing protocol:**
1. Ask each AI tool: "What is [Brand Name]?" — check accuracy
2. Ask: "What are the best [category] tools/services?" — check if you're mentioned
3. Ask: "Compare [Brand] vs [Competitor]" — check representation
4. Ask: "[Brand] reviews" — check sentiment accuracy
5. Document inaccuracies for correction strategy

**Test across:**
- ChatGPT (OpenAI)
- Perplexity
- Google Gemini (AI Overviews)
- Bing Copilot
- Claude (Anthropic)

### Building AI-Friendly Brand Presence

1. **Wikipedia / Wikidata** — if your brand qualifies for a Wikipedia article, it significantly improves AI brand knowledge → See `entity-seo.md`
2. **Structured data** — Organization schema, sameAs links to authoritative profiles → See `schema-structured-data.md`
3. **Consistent brand information** — same name, description, and facts across all platforms
4. **Review presence** — active profiles on relevant review platforms with genuine reviews
5. **Press/media coverage** — mentions in reputable publications improve AI training data quality
6. **Author entities** — named experts associated with your brand → See `entity-seo.md`

### Correcting AI Misinformation About Your Brand

- Update your website's about page, FAQ, and structured data with accurate information
- Claim and update Knowledge Panel in Google
- Update Wikipedia / Wikidata if applicable
- Update review platform profiles with accurate information
- Publish clear, factual content addressing common misconceptions
- AI models update their knowledge through retraining and web retrieval — corrections take time

---

## AEO/GEO Measurement

### Tracking AI Citations

| Method | Pros | Cons |
|--------|------|------|
| Manual testing | Free, immediate | Time-consuming, not scalable |
| AI search monitoring tools (emerging) | Automated, scalable | Expensive, limited coverage |
| Referral traffic in GA4 | Direct measurement of clicks | Doesn't capture visibility without clicks |
| Brand mention monitoring | Captures citations without links | Requires dedicated tools |

### Key Metrics

- AI search referral traffic (GA4 → Source: perplexity.ai, chatgpt.com, etc.)
- Brand mention frequency in AI responses (manual testing quarterly)
- Citation rate for key queries (% of target queries where you're cited)
- Accuracy of AI brand representation
- Competitor citation comparison

### AI Search Referral Tracking in GA4

AI search traffic appears as referral traffic. Look for:
- `perplexity.ai` — Perplexity referrals
- `chatgpt.com` — ChatGPT Search referrals
- Google AI Overview clicks still appear as `google / organic` in GA4

→ See `reporting-kpis.md` for full measurement framework.
→ See `serp-features.md` for AI Overview optimization.
