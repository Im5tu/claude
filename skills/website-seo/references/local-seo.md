# Local SEO

Google Business Profile, local ranking factors, NAP/citations, reviews, and service area pages.

---

## Google Business Profile (GBP) Optimization

### Claiming & Verifying

1. Go to business.google.com
2. Search for your business or add a new one
3. Verify ownership (postcard, phone, email, or instant verification for some businesses)
4. Complete all profile fields — completeness is a ranking factor

### Complete Profile Setup

| Field | Optimization |
|-------|-------------|
| Business name | Exact legal name — no keyword stuffing ("Acme Plumbing" not "Acme Plumbing — Best Austin Plumber") |
| Address | Exact match to what's on your website and all citations |
| Phone | Local number preferred over toll-free; trackable call tracking number acceptable |
| Website | Link to relevant location page (not just homepage for multi-location) |
| Hours | Accurate, including holiday hours and special hours |
| Description | 750 characters. Include primary services, location, differentiators. Natural keyword inclusion |
| Attributes | Fill in all applicable attributes (wheelchair accessible, free Wi-Fi, etc.) |

### Category Selection

- **Primary category:** Most specific match to your main service (use "Plumber" not "Home Service")
- **Secondary categories:** Add all that genuinely apply (max 9 additional)
- Categories directly affect which searches your listing appears for
- Google updates available categories periodically — check for new relevant ones

### Photos & Visual Content

- Add at least 10+ high-quality photos
- Include: exterior (from street view angle), interior, team members, products/services in action
- Photo optimization: geo-tag photos, use descriptive file names
- Update photos quarterly minimum — freshness signals activity
- Add videos (30 seconds to 5 minutes) for additional engagement
- Cover photo and logo affect first impression in search results

### Google Posts

- **Post types:** Updates, Offers, Events, Products
- Post 1-2 times per week for maximum impact
- Include a CTA button (Learn More, Call Now, Book, etc.)
- Posts don't expire — they remain visible but are pushed down by newer posts. Offer posts expire at their set end date, and Event posts expire after the event date
- Include relevant keywords naturally
- Add images to every post (750×750px minimum)

### Q&A Management

- Monitor and answer questions promptly
- Seed common questions with accurate answers (you can ask and answer on your own listing)
- Upvote helpful answers (community can also answer questions)
- Include keywords naturally in answers

### Products & Services

- Add all products/services with descriptions and pricing
- Use categories to organize
- Include images for products
- Link to relevant website pages

---

## Local Ranking Factors

### The Three Pillars

| Factor | Weight | Description |
|--------|--------|-------------|
| **Relevance** | High | How well your listing matches the search query |
| **Distance** | High | How close your business is to the searcher |
| **Prominence** | High | How well-known and authoritative your business is |

### Ranking Signal Categories

**GBP Signals (most important for local pack):**
- Profile completeness
- Primary category relevance
- Keyword in business name (natural, not stuffed)
- Review quantity, quality, and recency
- Photo quantity and recency
- Google Post activity
- Q&A engagement

**On-Page Signals:**
- NAP consistency on website
- City + state in title tags, H1, content
- Location pages with unique, valuable content
- Embedded Google Map
- Schema markup (LocalBusiness) → See `schema-structured-data.md`
- Mobile-friendliness

**Citation Signals:**
- NAP consistency across all citations
- Citation volume from authoritative directories
- Industry-specific citation presence

**Review Signals:**
- Review count (velocity and total)
- Review rating (average stars)
- Review diversity (multiple platforms)
- Review recency (recent reviews weight more)
- Owner response rate and quality

**Behavioral Signals:**
- Click-through rate from local results
- Mobile clicks to call
- Driving directions requests
- Check-ins
- Dwell time (time spent on your listing)

---

## NAP Consistency & Citations

### What NAP Is

**N**ame, **A**ddress, **P**hone number — must be identical across every platform and directory where your business is listed.

### Why Consistency Matters

Inconsistent NAP confuses search engines about your business identity. Even small variations can cause problems:

| Consistent (Good) | Inconsistent (Bad) |
|-------------------|-------------------|
| Acme Plumbing LLC | Acme Plumbing |
| 123 Main Street, Suite 200 | 123 Main St #200 |
| (512) 555-0123 | 512-555-0123 |

**Standardize format and use it everywhere.**

### Primary Citation Sources

| Platform | Priority | Notes |
|----------|----------|-------|
| Google Business Profile | Critical | Your primary local listing |
| Apple Maps / Apple Business Connect | High | iOS Maps and Siri results |
| Bing Places | High | Bing search results |
| Facebook Business Page | High | Social + search presence |
| Yelp | High | Often ranks in Google results |
| Data aggregators (Data Axle, Neustar Localeze, Foursquare) | High | Feed data to hundreds of directories |

### Industry-Specific Citations

| Industry | Key Directories |
|----------|----------------|
| Healthcare | Healthgrades, Vitals, WebMD, Zocdoc |
| Legal | Avvo, FindLaw, Justia, Lawyers.com |
| Real Estate | Zillow, Realtor.com, Trulia |
| Restaurants | Yelp, TripAdvisor, OpenTable |
| Home Services | Angi, HomeAdvisor, Thumbtack |
| Automotive | Cars.com, AutoTrader, CarGurus |

### Citation Building Strategy

> **Note:** Citations are directory listings with your NAP data — not link building. This is in scope.

1. Start with the 4-5 major data aggregators (they feed downstream directories)
2. Add industry-specific directories
3. Add local directories (chamber of commerce, local business associations)
4. Audit for inconsistencies quarterly
5. Use a citation management tool for monitoring at scale

---

## Review Management

### Review Acquisition Strategy

**Ethical approaches only** (→ See `core-anti-patterns.md` for what NOT to do):

- Ask customers after a positive experience (in person, email follow-up, receipt link)
- Make it easy: direct link to your Google review page
- Train staff to mention reviews naturally
- Include review request in post-service follow-up emails
- Use QR codes at physical locations linking to review page

**Never:**
- Offer incentives for reviews (violates Google's policies)
- Gate reviews (only asking likely-positive customers)
- Buy fake reviews
- Ask for reviews only from happy customers while suppressing unhappy ones

### Review Response Best Practices

**Positive reviews:**
- Respond within 24-48 hours
- Thank the reviewer by name
- Reference specific details from their review
- Keep it genuine — no keyword stuffing in responses

**Negative reviews:**
- Respond within 24 hours
- Acknowledge the issue professionally
- Take the conversation offline ("Please call us at...") for resolution
- Never argue or get defensive
- Follow up after resolution
- Learn from patterns in negative reviews

### Review Schema

```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Acme Plumbing",
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": 4.8,
    "bestRating": 5,
    "reviewCount": 127
  }
}
```

→ See `schema-structured-data.md` for complete LocalBusiness schema with reviews.

**Important:** Google's guidelines restrict self-serving review markup. Only mark up reviews from genuine customers collected on your own site or from third-party review platforms.

---

## Service Area Pages

### Location Page vs Service Area Page

| Type | When to Use | URL Pattern |
|------|------------|-------------|
| Location page | Business has a physical location customers visit | `/locations/austin/` |
| Service area page | Business serves an area but customers don't visit a physical location | `/service-areas/austin/` |

### Location Page Template

Each location page must contain unique, valuable content — not just a city name swap.

**Required elements:**
- H1 with service + location: "Plumbing Services in Austin, TX"
- Unique description of services at this location (150+ words of unique content)
- Team members at this location (photos, bios)
- Location-specific testimonials/reviews
- Address, phone, hours for this location
- Embedded Google Map
- Driving directions / parking information
- LocalBusiness schema specific to this location
- Unique photos of this location

**Unique content ideas per location:**
- Local pricing information
- Location-specific case studies
- Local regulations or requirements
- Community involvement at this location
- Nearby landmarks and neighborhoods served
- Local team member spotlights
- FAQs specific to this area

### Avoiding Thin Content Across Locations

**The #1 programmatic SEO failure for local businesses** is creating hundreds of location pages where only the city name changes.

→ See `programmatic-seo.md` for location page quality guardrails.

**Quality test:** Would a visitor from [City] find information on this page that they couldn't find on another city's page? If no, the page is thin content.

**Minimum unique content per location page:** 200+ words of genuinely unique, location-specific content (not just the city name swapped into a template).

---

## "Near Me" Search Optimization

### How "Near Me" Works

"Near me" queries are proximity-based — Google uses the searcher's device location to determine results. You cannot optimize your way into "near me" results for locations far from your business.

### What You CAN Optimize

- GBP accuracy and completeness (primary factor)
- NAP consistency (so Google knows where you are)
- Reviews (quantity and quality boost visibility)
- On-page local signals (city, neighborhood, landmarks in content)
- Mobile experience (most "near me" searches are mobile)
- Schema with GeoCoordinates → See `schema-structured-data.md`

### Voice Search and Local SEO

Voice searches are disproportionately local. Optimize for:
- Conversational, question-format headings
- Concise answers (voice assistants read brief responses)
- Speakable content markup → See `schema-structured-data.md`
- FAQ content addressing common local questions

---

## Multi-Location Management

### GBP for Multiple Locations

- Each location gets its own GBP listing
- Use bulk management for 10+ locations
- Assign unique phone numbers per location (for tracking)
- Link each listing to its specific location page (not homepage)
- Maintain unique photos per location

### URL Structure for Multi-Location

```
example.com/locations/              ← Locations index page
example.com/locations/austin/       ← Austin location page
example.com/locations/dallas/       ← Dallas location page
example.com/locations/houston/      ← Houston location page
```

### Internal Linking for Multi-Location

- Homepage links to locations index
- Locations index links to all individual location pages
- Individual location pages link to:
  - Other nearby locations
  - Service pages with location context
  - Location-specific blog content

---

## Local SEO Measurement

| Metric | Source | What It Indicates |
|--------|--------|-------------------|
| GBP views | GBP Insights | Profile visibility |
| GBP actions (calls, directions, website) | GBP Insights | User engagement |
| Local pack rankings | Rank tracker with local tracking | Local search visibility |
| Local keyword positions | GSC + rank tracker | Organic local performance |
| Review count and average rating | GBP + review platforms | Social proof strength |
| Citation accuracy score | Citation audit tool | NAP consistency health |
| Local organic sessions | GA4, filtered by location pages | Website traffic from local SEO |
| Conversion from local pages | GA4 goal tracking | Business impact |

→ See `reporting-kpis.md` for full measurement framework.
