# E-Commerce SEO

Site architecture, product/category pages, faceted navigation, product schema, and inventory management.

---

## E-Commerce Site Architecture

### Category Hierarchy Design

```
Homepage
├── Category (e.g., "Running Shoes")
│   ├── Subcategory (e.g., "Trail Running Shoes")
│   │   ├── Product page
│   │   └── Product page
│   └── Subcategory (e.g., "Road Running Shoes")
│       ├── Product page
│       └── Product page
├── Category (e.g., "Hiking Gear")
│   └── ...
└── Blog / Guides
    └── Buying guides, comparison content
```

**Design principles:**
- Keep hierarchy depth to 3 levels maximum (Category → Subcategory → Product)
- Every product reachable within 3 clicks from homepage
- Category pages are SEO power pages — invest in their content
- Use breadcrumbs for navigation and schema → See `schema-structured-data.md`

### URL Structure

```
Good:
  /running-shoes/
  /running-shoes/trail-runners/
  /running-shoes/trail-runners/titanium-trail-pro/

Bad:
  /products/cat-42/subcat-117/prod-8842/
  /shop/index.php?category=shoes&type=trail&id=8842
```

- Descriptive, keyword-rich URLs
- Consistent hierarchy reflecting site structure
- Hyphens between words, lowercase only
- No session IDs, tracking parameters, or query strings in canonical URLs

### Cross-Sell and Internal Linking

- "Related products" section on product pages
- "Customers also bought" recommendations
- "Complete the look" / "Frequently bought together" sections
- Category pages link to relevant buying guides
- Blog/guide content links to relevant products and categories
- Each of these is an internal linking opportunity — use descriptive anchor text

### Pagination for Product Listings

When a category has many products (50+):

| Approach | Implementation | SEO Impact |
|----------|---------------|------------|
| Traditional pagination | `/category/?page=2`, `/category/?page=3` | Each page can rank; use self-referencing canonicals |
| "Load more" button | JavaScript-loaded content on same URL | Single URL gets all ranking signals; ensure crawlable |
| Infinite scroll | Continuous loading | Must use History API for crawlable states |
| View all | Single page with all products | Best for SEO if page speed holds (<200 products) |

**Recommendation:** Traditional pagination with self-referencing canonicals for large catalogs. "Load more" for smaller catalogs (<200 products).

---

## Product Page SEO

### Product Title Optimization

**Formula:** `Brand + Product Name + Key Attribute`

```
Good: "Peak Gear Titanium Trail Runner Pro — Ultralight Men's Trail Shoe"
Bad:  "Trail Running Shoe" (too generic)
Bad:  "Peak Gear Titanium Trail Runner Pro Running Shoe Best Trail Shoes Men's" (keyword stuffed)
```

- Include brand name for branded search
- Include primary keyword for non-branded search
- Include a differentiating attribute (material, use case, audience)
- Keep under 60 characters for full SERP display

### Product Descriptions

**Never use manufacturer copy verbatim.** Duplicate manufacturer descriptions provide zero unique value and create duplicate content across every retailer selling that product.

**Product description structure:**
1. **Opening sentence:** What the product is + primary benefit (50 words)
2. **Key features:** 3-5 bullet points with feature → benefit format
3. **Detailed description:** Use case, materials, specifications (100-200 words)
4. **Social proof:** Customer quote or review highlight
5. **FAQ:** 2-3 common questions about the product

**Feature → Benefit format:**
```
Bad:  "Made with recycled polyester fabric"
Good: "Made with recycled polyester — dries 3x faster than cotton, reducing mid-run discomfort"
```

### Product Image Optimization

- **Multiple angles:** At least 4-6 photos per product
- **Alt text:** Descriptive, keyword-aware: `"Blue titanium trail runner side view showing Vibram sole"`
- **File names:** `titanium-trail-runner-blue-side.webp` (not `IMG_4521.jpg`)
- **Format:** WebP or AVIF for compression, PNG for transparent backgrounds
- **Image sitemap:** Include product images in XML sitemap
- **Zoom functionality:** High-resolution source images (1200px+ wide)

→ See `core-on-page-seo.md` for image SEO fundamentals.

### Out-of-Stock Product Handling

| Scenario | SEO Action |
|----------|-----------|
| Temporarily out of stock | Keep page live, add "notify me" signup, update Offer schema to `OutOfStock` |
| Seasonal product (returning) | Keep page live year-round, indicate seasonal availability |
| Permanently discontinued | 301 redirect to closest alternative product or category page |
| Discontinued with no alternative | Return 410 (Gone) after redirecting any backlink equity |

**Never:** 404 a product page that has backlinks, rankings, or traffic. Always redirect.

### Product Variants (Colors, Sizes)

| Approach | When to Use | Implementation |
|----------|------------|---------------|
| Single URL with selector | Variants share description and images | Use canonical to self, JavaScript selector, `ProductGroup` schema |
| Separate URLs per variant | Variants have unique images/descriptions | Canonical to primary variant OR self-referencing canonicals |

**ProductGroup schema for variants:**

```json
{
  "@context": "https://schema.org",
  "@type": "ProductGroup",
  "name": "Titanium Trail Runner Pro",
  "variesBy": ["https://schema.org/color", "https://schema.org/size"],
  "hasVariant": [
    {
      "@type": "Product",
      "name": "Titanium Trail Runner Pro — Blue",
      "color": "Blue",
      "sku": "TRP-BLU",
      "image": "https://example.com/trp-blue.jpg",
      "offers": {
        "@type": "Offer",
        "price": "189.99",
        "priceCurrency": "USD",
        "availability": "https://schema.org/InStock"
      }
    }
  ]
}
```

→ See `schema-structured-data.md` for complete Product schema.

---

## Category Page SEO

### Category Page Content Strategy

Category pages are often the highest-value SEO pages on an e-commerce site. They target broader keywords with higher search volume.

**Above-the-fold:**
- H1 with category keyword: "Trail Running Shoes"
- Brief intro paragraph (50-100 words) with value proposition
- Filter/sort options
- Product grid

**Below product grid:**
- Extended category description (200-500 words)
- Buying guide snippet linking to full guide
- FAQ section (targets PAA)
- Related categories

### Category Title & Meta

```
Title: Trail Running Shoes — Shop Men's & Women's Trail Runners | Brand
Meta: Shop trail running shoes from top brands. Free shipping on orders $75+.
      Find ultralight, waterproof, and cushioned trail runners. 500+ options in stock.
```

- Include category keyword in title
- Add modifiers that improve CTR (free shipping, in stock, number of products)
- Meta description should include a CTA and value proposition

### Subcategory Strategy

- Create subcategories when there are 20+ products in a natural grouping
- Each subcategory gets its own optimized page
- Subcategories target more specific keywords ("waterproof trail running shoes")
- Link subcategories from parent category page

---

## Faceted Navigation SEO

### The Problem

Faceted navigation (filters for size, color, price, brand, material, etc.) creates unique URLs for every filter combination. A category with 5 filter types and 10 options each can generate 100,000+ URLs.

**The risk:**
- Crawl budget waste (Googlebot crawling thousands of filter URLs)
- Duplicate/near-duplicate content (same products, different filter URLs)
- Index bloat (thousands of low-value pages indexed)

### Solution Approaches

| Approach | How It Works | Best For |
|----------|-------------|----------|
| **AJAX filtering** | Filters don't change the URL | Small catalogs, mobile-first sites |
| **Canonical to category** | Filter URLs canonical to unfiltered category | Most common approach |
| **Selective indexing** | Index valuable filter combos, noindex others | Large catalogs with keyword-rich filters |
| **robots.txt blocking** | Block filter parameters | Simple but loses potential indexable pages |
| **Meta robots noindex** | `<meta name="robots" content="noindex, follow">` on filter pages | Preserve crawling of links but prevent indexation |

### Which Filter Combinations to Index

**Index these (they match real searches):**
- Brand + category: `/shoes/nike/` — people search "Nike running shoes"
- Key attribute + category: `/shoes/waterproof/` — people search "waterproof running shoes"
- Gender + category: `/shoes/womens/` — people search "women's running shoes"

**Do NOT index these (no search volume):**
- Price range filters: `/shoes/?price=50-100`
- Sort order: `/shoes/?sort=price-low`
- Multi-filter combinations: `/shoes/?color=blue&size=10&brand=nike`
- Pagination + filters: `/shoes/nike/?page=3`

### Implementation Recommendations

**For most e-commerce sites:**

1. Use AJAX for filters by default (no URL change)
2. Create static SEO-friendly URLs for valuable filter combinations:
   - `/running-shoes/nike/` (brand filter)
   - `/running-shoes/waterproof/` (attribute filter)
   - `/running-shoes/womens/` (gender filter)
3. Add `noindex, follow` to any filter URLs that do get generated
4. Block parameter patterns in robots.txt as a safety net:
   ```
   Disallow: /*?sort=
   Disallow: /*?price=
   Disallow: /*&color=
   ```
5. Use canonical tags pointing to the unfiltered category on all filter URLs

→ See `core-technical-seo.md` for crawl budget management.

---

## E-Commerce Content Strategy

### Buying Guides

- Target "[category] buying guide" keywords
- Link from category pages to relevant buying guides
- Include product recommendations with internal links to product pages
- Structure for featured snippet targeting (comparison tables, step-by-step selection)
- Update annually or when product lines change

### Product Comparison Content

- "[Product A] vs [Product B]" pages
- Target commercial investigation keywords
- Include comparison tables with features, pricing, ratings
- Provide clear recommendation based on use case
- Schema: use Product schema for each compared product

### User-Generated Content

- Product reviews on product pages (unique content + social proof)
- Customer Q&A sections
- Customer photos ("See how customers style this")
- UGC provides unique, keyword-rich content that's hard for competitors to replicate

### Video Content

- Product demo videos on key product pages
- "How to choose" videos on category pages
- VideoObject schema on pages with embedded video
- → See `video-seo.md` for optimization

---

## E-Commerce Technical SEO

### Site Speed for E-Commerce

E-commerce sites face unique performance challenges:

| Challenge | Solution |
|-----------|---------|
| Large product image catalogs | Image CDN with automatic WebP/AVIF, lazy loading |
| Complex product pages | Critical CSS inlining, deferred JavaScript |
| Third-party scripts (reviews, chat, analytics) | Load async, defer non-critical scripts |
| Cart/checkout JavaScript | Code split — don't load checkout code on browse pages |
| Large product catalogs | Server-side filtering, paginated API calls |

**CWV targets for e-commerce:**
- LCP ≤ 2.5s (hero product image is usually LCP element)
- INP ≤ 200ms (filter/sort interactions, add-to-cart buttons)
- CLS ≤ 0.1 (product images need width/height, lazy-loaded content needs reserved space)

### XML Sitemap Strategy for Large Catalogs

For sites with 10,000+ products:

```xml
<!-- Sitemap index -->
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <sitemap>
    <loc>https://example.com/sitemap-products-1.xml</loc>
    <lastmod>2026-02-20</lastmod>
  </sitemap>
  <sitemap>
    <loc>https://example.com/sitemap-products-2.xml</loc>
    <lastmod>2026-02-20</lastmod>
  </sitemap>
  <sitemap>
    <loc>https://example.com/sitemap-categories.xml</loc>
    <lastmod>2026-02-15</lastmod>
  </sitemap>
</sitemapindex>
```

- Separate sitemaps by content type (products, categories, blog, images)
- Max 50,000 URLs per sitemap file
- Only include indexable, canonical URLs
- Exclude out-of-stock products that return 404
- Update `lastmod` when product data changes (price, availability)

### Secure Checkout & Trust Signals

- HTTPS everywhere (especially checkout flow)
- Trust badges (SSL seal, payment logos, satisfaction guarantee)
- Clear return/shipping policies
- Contact information easily accessible
- These are UX/conversion signals that also impact SEO through user behavior

---

## E-Commerce Measurement

| Metric | Source | What It Indicates |
|--------|--------|-------------------|
| Organic revenue | GA4 ecommerce reports | SEO bottom-line impact |
| Organic transactions | GA4 | Conversion volume from organic |
| Revenue per organic session | GA4 | Traffic quality |
| Product page organic traffic | GA4 landing page report | Product-level SEO performance |
| Category page organic traffic | GA4 landing page report | Category-level SEO performance |
| Add-to-cart rate from organic | GA4 ecommerce events | Intent matching quality |
| Average order value (organic) | GA4 | Purchase quality comparison vs other channels |
| Product search impression share | GSC by URL pattern | Product visibility in search |
| Product rich result CTR | GSC Enhancements | Schema markup effectiveness |

→ See `reporting-kpis.md` for full measurement framework.
→ See `schema-structured-data.md` for Product schema implementation.
→ See `international-seo.md` for multi-country e-commerce.
