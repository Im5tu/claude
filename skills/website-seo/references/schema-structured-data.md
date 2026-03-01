# Schema & Structured Data

Complete structured data implementation reference with copy-paste-ready JSON-LD examples.

---

## Fundamentals

### What Structured Data Is

Structured data is code added to web pages that helps search engines understand the content. It enables rich results (enhanced SERP displays) and provides context for AI search engines.

### Format Recommendation

**Use JSON-LD.** Google explicitly recommends JSON-LD over Microdata and RDFa.

```html
<!-- Place in <head> or <body> — Google supports both -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "...",
  ...
}
</script>
```

### Testing & Validation Tools

| Tool | URL | Purpose |
|------|-----|---------|
| Google Rich Results Test | search.google.com/test/rich-results | Test if markup qualifies for rich results |
| Schema Markup Validator | validator.schema.org | Validate against full Schema.org vocabulary |
| GSC Enhancements | GSC → Enhancements | Monitor structured data issues at scale |

### Common Implementation Mistakes

- Marking up content that doesn't exist on the page (spam)
- Using incorrect `@type` for the content
- Missing required properties
- Incorrect nesting of schema objects
- Self-serving reviews (reviewing your own product/service)
- Inconsistent data between structured data and visible content

---

## Organization Schema

Use on the homepage. Establishes the business entity.

```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Acme Corp",
  "url": "https://www.acme.com",
  "logo": {
    "@type": "ImageObject",
    "url": "https://www.acme.com/logo.png",
    "width": 600,
    "height": 200
  },
  "description": "Acme Corp provides cloud infrastructure for enterprise teams.",
  "foundingDate": "2018",
  "sameAs": [
    "https://twitter.com/acmecorp",
    "https://www.linkedin.com/company/acmecorp",
    "https://github.com/acmecorp"
  ],
  "contactPoint": {
    "@type": "ContactPoint",
    "telephone": "+1-555-123-4567",
    "contactType": "customer service",
    "availableLanguage": ["English"]
  },
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "123 Tech Ave",
    "addressLocality": "San Francisco",
    "addressRegion": "CA",
    "postalCode": "94105",
    "addressCountry": "US"
  }
}
```

→ See `entity-seo.md` for Knowledge Graph strategy using Organization schema.

---

## LocalBusiness Schema

Use on location pages for businesses with physical addresses.

```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Acme Plumbing — Austin",
  "image": "https://www.acmeplumbing.com/austin/storefront.jpg",
  "url": "https://www.acmeplumbing.com/austin/",
  "telephone": "+1-512-555-0123",
  "priceRange": "$$",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "456 Main St",
    "addressLocality": "Austin",
    "addressRegion": "TX",
    "postalCode": "78701",
    "addressCountry": "US"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": 30.2672,
    "longitude": -97.7431
  },
  "openingHoursSpecification": [
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
      "opens": "08:00",
      "closes": "18:00"
    },
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": "Saturday",
      "opens": "09:00",
      "closes": "14:00"
    }
  ],
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": 4.8,
    "bestRating": 5,
    "reviewCount": 127
  },
  "areaServed": {
    "@type": "GeoCircle",
    "geoMidpoint": {
      "@type": "GeoCoordinates",
      "latitude": 30.2672,
      "longitude": -97.7431
    },
    "geoRadius": "30 mi"
  }
}
```

**Use specific LocalBusiness subtypes when applicable:**
`Restaurant`, `Dentist`, `Attorney`, `AutoRepair`, `HealthClub`, `RealEstateAgent`, etc.

→ See `local-seo.md` for multi-location implementation and GBP optimization.

---

## Service Schema

Use on service pages, especially for service-area businesses and location + service landing pages.

```json
{
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "Web Design",
  "description": "Custom web design and development services",
  "provider": {
    "@type": "LocalBusiness",
    "name": "Your Business Name"
  },
  "serviceType": "Web Design",
  "areaServed": {
    "@type": "City",
    "name": "Austin"
  },
  "hasOfferCatalog": {
    "@type": "OfferCatalog",
    "name": "Web Design Services",
    "itemListElement": [
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "Custom Website Design"
        }
      }
    ]
  }
}
```

→ See `programmatic-seo.md` Playbook 1 for generating location + service pages at scale using Service schema.

---

## Product Schema

Use on product pages for e-commerce sites.

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Titanium Trail Runner Pro",
  "image": [
    "https://www.peakgear.com/products/trail-runner-pro-1.jpg",
    "https://www.peakgear.com/products/trail-runner-pro-2.jpg"
  ],
  "description": "Ultralight titanium-reinforced trail running shoe with Vibram sole.",
  "sku": "TRP-2025-BLU",
  "mpn": "TRP2025BLU",
  "brand": {
    "@type": "Brand",
    "name": "Peak Gear"
  },
  "offers": {
    "@type": "Offer",
    "url": "https://www.peakgear.com/products/trail-runner-pro",
    "priceCurrency": "USD",
    "price": "189.99",
    "priceValidUntil": "2026-12-31",
    "availability": "https://schema.org/InStock",
    "itemCondition": "https://schema.org/NewCondition",
    "seller": {
      "@type": "Organization",
      "name": "Peak Gear"
    },
    "shippingDetails": {
      "@type": "OfferShippingDetails",
      "shippingRate": {
        "@type": "MonetaryAmount",
        "value": "0",
        "currency": "USD"
      },
      "deliveryTime": {
        "@type": "ShippingDeliveryTime",
        "handlingTime": {
          "@type": "QuantitativeValue",
          "minValue": 0,
          "maxValue": 1,
          "unitCode": "DAY"
        },
        "transitTime": {
          "@type": "QuantitativeValue",
          "minValue": 3,
          "maxValue": 7,
          "unitCode": "DAY"
        }
      },
      "shippingDestination": {
        "@type": "DefinedRegion",
        "addressCountry": "US"
      }
    },
    "hasMerchantReturnPolicy": {
      "@type": "MerchantReturnPolicy",
      "applicableCountry": "US",
      "returnPolicyCategory": "https://schema.org/MerchantReturnFiniteReturnWindow",
      "merchantReturnDays": 30,
      "returnMethod": "https://schema.org/ReturnByMail",
      "returnFees": "https://schema.org/FreeReturn"
    }
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": 4.6,
    "bestRating": 5,
    "reviewCount": 89
  },
  "review": {
    "@type": "Review",
    "reviewRating": {
      "@type": "Rating",
      "ratingValue": 5
    },
    "author": {
      "@type": "Person",
      "name": "Sarah M."
    },
    "reviewBody": "Best trail runners I've ever owned. Light, grippy, and durable."
  }
}
```

**Product variants** — use `ProductGroup` for items with variants:

```json
{
  "@context": "https://schema.org",
  "@type": "ProductGroup",
  "name": "Titanium Trail Runner Pro",
  "productGroupID": "TRP-2025",
  "variesBy": ["https://schema.org/color", "https://schema.org/size"],
  "hasVariant": [
    {
      "@type": "Product",
      "name": "Titanium Trail Runner Pro — Blue, Size 10",
      "color": "Blue",
      "size": "10",
      "sku": "TRP-2025-BLU-10",
      "offers": { "@type": "Offer", "price": "189.99", "priceCurrency": "USD" }
    }
  ]
}
```

→ See `ecommerce-seo.md` for e-commerce SEO strategy.

---

## Article Schema

Use on blog posts, news articles, and editorial content.

```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Core Web Vitals: Complete Optimization Guide for 2026",
  "description": "Step-by-step guide to optimizing LCP, INP, and CLS for better search rankings.",
  "image": "https://www.example.com/blog/cwv-guide/hero.jpg",
  "author": {
    "@type": "Person",
    "name": "Jane Smith",
    "url": "https://www.example.com/authors/jane-smith",
    "jobTitle": "Senior Performance Engineer"
  },
  "publisher": {
    "@type": "Organization",
    "name": "Example Corp",
    "logo": {
      "@type": "ImageObject",
      "url": "https://www.example.com/logo.png"
    }
  },
  "datePublished": "2026-01-15",
  "dateModified": "2026-02-20",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://www.example.com/blog/cwv-guide/"
  }
}
```

**Subtypes:**
- `BlogPosting` — for blog content
- `NewsArticle` — for timely news content (eligible for Google News features)
- `TechArticle` — for technical documentation

**Author markup matters for E-E-A-T.** Include `url` pointing to an author page with credentials.

---

## FAQ Schema

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is Core Web Vitals?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Core Web Vitals are a set of three performance metrics (LCP, INP, CLS) that Google uses to measure user experience on web pages."
      }
    },
    {
      "@type": "Question",
      "name": "How do Core Web Vitals affect rankings?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Core Web Vitals are a confirmed Google ranking factor as part of the page experience signals. Pages that pass CWV thresholds may receive a minor ranking boost."
      }
    }
  ]
}
```

**When to use FAQ schema:**
- Pages with genuine FAQ sections that answer user questions
- Content targeting PAA queries → See `serp-features.md`

**When NOT to use:**
- Pages without visible FAQ content (schema must match visible content)
- Every page on the site (overuse dilutes impact)

---

## HowTo Schema

```json
{
  "@context": "https://schema.org",
  "@type": "HowTo",
  "name": "How to Optimize LCP for Better Page Speed",
  "description": "Step-by-step guide to improving your Largest Contentful Paint score.",
  "totalTime": "PT30M",
  "estimatedCost": {
    "@type": "MonetaryAmount",
    "currency": "USD",
    "value": "0"
  },
  "tool": [
    { "@type": "HowToTool", "name": "PageSpeed Insights" },
    { "@type": "HowToTool", "name": "Chrome DevTools" }
  ],
  "step": [
    {
      "@type": "HowToStep",
      "name": "Identify the LCP element",
      "text": "Open Chrome DevTools, go to Performance panel, and record a page load. The LCP element will be highlighted.",
      "image": "https://www.example.com/guides/lcp/step1.jpg"
    },
    {
      "@type": "HowToStep",
      "name": "Optimize the LCP image",
      "text": "Convert the image to WebP format, add width and height attributes, and implement preloading.",
      "image": "https://www.example.com/guides/lcp/step2.jpg"
    }
  ]
}
```

---

## VideoObject Schema

```json
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "Core Web Vitals Optimization Tutorial",
  "description": "Learn how to optimize LCP, INP, and CLS for better Google rankings.",
  "thumbnailUrl": "https://www.example.com/video/cwv-thumb.jpg",
  "uploadDate": "2026-01-15",
  "duration": "PT12M30S",
  "contentUrl": "https://www.example.com/video/cwv-tutorial.mp4",
  "embedUrl": "https://www.youtube.com/embed/abc123",
  "interactionStatistic": {
    "@type": "InteractionCounter",
    "interactionType": { "@type": "WatchAction" },
    "userInteractionCount": 15420
  }
}
```

→ See `video-seo.md` for video optimization strategy and video sitemaps.

---

## BreadcrumbList Schema

```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://www.example.com/"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Blog",
      "item": "https://www.example.com/blog/"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "SEO Guides",
      "item": "https://www.example.com/blog/seo/"
    },
    {
      "@type": "ListItem",
      "position": 4,
      "name": "Core Web Vitals Guide"
    }
  ]
}
```

The last item in the breadcrumb should NOT have an `item` URL (it's the current page).

---

## Event Schema

```json
{
  "@context": "https://schema.org",
  "@type": "Event",
  "name": "SEO Summit 2026",
  "description": "Annual conference for SEO professionals.",
  "startDate": "2026-09-15T09:00:00-05:00",
  "endDate": "2026-09-16T17:00:00-05:00",
  "eventAttendanceMode": "https://schema.org/MixedEventAttendanceMode",
  "eventStatus": "https://schema.org/EventScheduled",
  "location": [
    {
      "@type": "Place",
      "name": "Austin Convention Center",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "500 E Cesar Chavez St",
        "addressLocality": "Austin",
        "addressRegion": "TX",
        "postalCode": "78701",
        "addressCountry": "US"
      }
    },
    {
      "@type": "VirtualLocation",
      "url": "https://www.seosummit.com/livestream"
    }
  ],
  "offers": {
    "@type": "Offer",
    "price": "499",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock",
    "validFrom": "2026-03-01",
    "url": "https://www.seosummit.com/tickets"
  },
  "organizer": {
    "@type": "Organization",
    "name": "SEO Summit Inc",
    "url": "https://www.seosummit.com"
  }
}
```

---

## WebSite Schema with SearchAction

Enables the sitelinks search box in brand SERPs.

```json
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "Acme Corp",
  "url": "https://www.acme.com",
  "potentialAction": {
    "@type": "SearchAction",
    "target": {
      "@type": "EntryPoint",
      "urlTemplate": "https://www.acme.com/search?q={search_term_string}"
    },
    "query-input": "required name=search_term_string"
  }
}
```

Only works for sites with internal search functionality.

---

## SpeakableSpecification

Marks content eligible for voice assistant readback (Google Assistant, etc.).

**Eligibility requirements:** English-language news publishers enrolled in Google News, US only. For general voice search optimization, Featured Snippet and FAQ schema optimization are more effective than Speakable markup.

```json
{
  "@context": "https://schema.org",
  "@type": "WebPage",
  "name": "Core Web Vitals Guide",
  "speakable": {
    "@type": "SpeakableSpecification",
    "cssSelector": [".article-summary", ".key-takeaways"]
  }
}
```

Use on news content from Google News-enrolled publishers (English, US only). For non-news sites, prioritize FAQ schema and Featured Snippet optimization for voice search visibility instead.

---

## Multi-Schema Implementation (@graph Pattern)

When a page needs multiple schema types, use the `@graph` pattern:

```json
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "Organization",
      "@id": "https://www.acme.com/#organization",
      "name": "Acme Corp",
      "url": "https://www.acme.com",
      "logo": "https://www.acme.com/logo.png"
    },
    {
      "@type": "WebSite",
      "@id": "https://www.acme.com/#website",
      "name": "Acme Corp",
      "url": "https://www.acme.com",
      "publisher": { "@id": "https://www.acme.com/#organization" }
    },
    {
      "@type": "WebPage",
      "@id": "https://www.acme.com/blog/cwv-guide/#webpage",
      "url": "https://www.acme.com/blog/cwv-guide/",
      "name": "Core Web Vitals Guide",
      "isPartOf": { "@id": "https://www.acme.com/#website" }
    },
    {
      "@type": "Article",
      "headline": "Core Web Vitals: Complete Guide",
      "mainEntityOfPage": { "@id": "https://www.acme.com/blog/cwv-guide/#webpage" },
      "author": { "@type": "Person", "name": "Jane Smith" },
      "publisher": { "@id": "https://www.acme.com/#organization" },
      "datePublished": "2026-01-15"
    }
  ]
}
```

**Key principles:**
- Use `@id` to create references between schema objects
- Reference with `{ "@id": "..." }` instead of duplicating data
- Place Organization and WebSite schema on every page
- Add page-specific schema (Article, Product, etc.) per page type

---

## Schema Validation & Debugging

### Common Validation Errors

| Error | Cause | Fix |
|-------|-------|-----|
| Missing required field | Schema type requires specific properties | Add the required property (check Google's docs) |
| Invalid value for field | Wrong data type or format | Fix format (e.g., ISO 8601 for dates) |
| Markup not visible on page | Schema describes content not on the page | Either add the content or remove the schema |
| Self-serving reviews | Business reviewing its own products | Only mark up third-party reviews |
| Invalid URL | Relative URL or malformed URL | Use absolute URLs in all schema |

### Monitoring in GSC

- **GSC → Enhancements:** Shows structured data validation by type
- Check for errors, warnings, and valid items
- Errors prevent rich results — fix immediately
- Warnings don't prevent rich results but indicate potential issues

---

## CMS-Specific Implementation

### WordPress
- **Yoast SEO:** Auto-generates Organization, Article, BreadcrumbList; FAQ/HowTo blocks
- **RankMath:** Similar auto-generation with more schema types
- **Custom:** Add JSON-LD to `wp_head` action or use `wp_json_ld` plugin

### Shopify
- Most themes include Product schema by default
- Use Shopify's structured data API for customization
- Add custom JSON-LD via theme.liquid `{% if template == 'product' %}` blocks

### Next.js / React
```tsx
// app/layout.tsx or page.tsx
export default function Page() {
  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Article',
    headline: 'Article Title',
    // ... other properties
  };

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      {/* Page content */}
    </>
  );
}
```

### Static HTML
Place `<script type="application/ld+json">` in the `<head>` or at the end of `<body>`.
