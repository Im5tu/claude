# Typography Reference

This reference defines which fonts are banned, why they're banned, and how to find distinctive alternatives on Google Fonts. Consult this file before generating any typography recommendations.

---

## 1. Blocked Individual Fonts

### Tier 1 — Hard Block

Never recommend these fonts under any circumstances. They signal "no decision was made" or "an AI picked this."

| Font | Why It's Blocked |
|------|-----------------|
| **Inter** | The default sans-serif of the AI era. Choosing Inter says "I opened Google Fonts and picked the first thing." It is technically excellent but carries zero brand signal. |
| **Roboto** | Google's system font. Selecting Roboto signals "Android UI" or "Material Design template," not a deliberate brand choice. |
| **Open Sans** | The 2010s web default. It communicates "we used a WordPress theme and didn't change the font." Ubiquitous to the point of invisibility. |
| **Lato** | The "safe" choice for agencies who don't want to think about type. Friendly but generic — it blends into every SaaS landing page from 2015-2022. |
| **Montserrat** | The geometric sans that every "modern startup" template ships with. Seeing Montserrat immediately says "Canva template" or "free Figma kit." |
| **Poppins** | The rounded geometric that took over Indian and Southeast Asian tech branding, then went global. Now the #1 font on Canva and the default for "friendly SaaS." |
| **Raleway** | Thin-weight Raleway was the hallmark of 2014 startup sites. Its overuse in hero sections makes it a timestamp, not a brand choice. |
| **Source Sans Pro** | Adobe's open-source workhorse. Excellent for documentation, but choosing it for brand identity says "I picked from the Adobe defaults." |
| **Nunito** | The rounded sans-serif that every "approachable" or "friendly" brief defaults to. It's become shorthand for "we didn't dig deeper than page 1 of Google Fonts." |
| **Work Sans** | Originally distinctive, but its rapid adoption by dev-tool startups (2020-2024) has stripped it of differentiation. Now signals "developer SaaS template." |
| **Playfair Display** | The #1 AI serif default. Every model reaches for Playfair when the brief says "elegant," "premium," or "luxury." It is the typographic equivalent of saying "classy" — instantly recognizable as an AI output. |
| **Oswald** | The condensed sans-serif that every "bold" or "impactful" template uses. Overexposed in YouTube thumbnails, fitness brands, and aggressive SaaS landing pages. |
| **Merriweather** | The "readable serif" default. Every blog theme and content-heavy template ships with Merriweather. Choosing it says "I needed a serif and this was the most popular one." |
| **Quicksand** | The rounded geometric that signals "children's app" or "wellness startup." Its overuse in friendly/casual contexts has made it a cliche. |
| **Comfortaa** | Rounded, bubbly, and impossible to take seriously in a B2B context. Signals "personal project" or "hobby brand." |

### Tier 2 — Caution

Use only with strong archetype justification and explicit rationale. Never use as a default or fallback.

| Font | Why It's Flagged |
|------|-----------------|
| **DM Sans** | Rapidly becoming the new Inter. Its clean geometric forms are excellent, but adoption is accelerating so fast (2023-2026) that it will soon carry the same "default" signal. Justify with specifics if used. |
| **Sora** | Trending heavily in Web3 and fintech branding. If the brand is in either space, using Sora risks blending into the competitive landscape rather than standing out. |
| **Rubik** | A solid geometric sans, but increasingly the "second choice" when designers reject Inter or Poppins. Becoming a default-by-elimination. |
| **Manrope** | High-quality geometric grotesk gaining rapid adoption in SaaS dashboards and dev tools. Still viable but approaching saturation. |
| **Outfit** | Clean and modern, but trending sharply upward in 2025-2026 startup branding. At current adoption rate, will likely move to Tier 1 within a year. |

---

## 2. Google Fonts Evaluation Criteria

When selecting fonts, use these criteria to evaluate candidates. All recommendations must come from Google Fonts (free, no licensing friction).

### Quality Signals

| Criterion | What to Check | Minimum Standard |
|-----------|--------------|-----------------|
| **Weight range** | Available weights in the font family | Regular (400) through Bold (700) minimum. Semi-bold (600) strongly preferred. |
| **Variable font support** | Whether a variable font file is available | Strongly preferred. Reduces HTTP requests and enables fine-tuned weight/width control. |
| **Character set** | Latin Extended coverage | Full Latin Extended required for any brand that may localize to European languages. |
| **Active maintenance** | Last update date and open issues | Updated within the last 2 years. Avoid abandoned fonts with unresolved rendering bugs. |
| **Hinting quality** | Rendering at small sizes on Windows | Test at 14px-16px body size. Reject fonts that look blurry or have inconsistent stroke weight on Windows. |
| **Italic support** | True italic vs. oblique/slanted | True italics preferred for body text fonts. Oblique acceptable for display/heading only. |

### Distinctiveness Test

Ask: **"Would a designer recognise this as a deliberate choice, not a default?"**

A font passes the distinctiveness test if:
- It is not in the top 50 most popular Google Fonts by usage (check the "Trending" and "Most Popular" filters — then avoid them)
- It has at least one identifying characteristic (distinctive letter forms, unusual proportions, notable ink traps, specific historical reference)
- A knowledgeable observer could name the font or its classification from a screenshot
- It does not look interchangeable with any Tier 1 blocked font at body sizes

### Classification Guidance by Archetype

Match font classification to archetype attributes. Reference the archetype table in `design-system-patterns.md` for detailed mappings.

| Archetype Energy | Heading Classification | Body Classification | Reasoning |
|-----------------|----------------------|--------------------|-----------|
| **Precision / Authority** (Sage, Ruler) | Geometric sans-serif or rational grotesque | Humanist sans-serif or transitional serif | Geometric headings signal structure and logic; humanist body adds warmth and readability |
| **Warmth / Care** (Caregiver, Everyman) | Humanist sans-serif or soft geometric | Humanist sans-serif | Humanist forms echo handwritten warmth; avoid anything too mechanical |
| **Innovation / Magic** (Magician, Creator) | Distinctive grotesque or display sans | Clean grotesque or geometric sans | Heading font carries the personality; body stays legible and neutral |
| **Strength / Action** (Hero, Explorer) | Bold grotesque or condensed sans | Sturdy humanist or grotesque | Weight and density in headings signal confidence; body matches energy without competing |
| **Disruption / Edge** (Outlaw, Jester) | Expressive display or unconventional sans | Robust sans-serif | Display font can break convention; body anchors readability |
| **Purity / Trust** (Innocent) | Rounded geometric or soft sans | Clean geometric sans | Rounded forms signal openness and honesty; keep it simple and clear |
| **Connection / Sensuality** (Lover) | Refined serif or elegant sans | Proportional serif or humanist sans | Refinement in headings; comfortable reading experience in body |

### Performance Considerations

- **Prefer variable fonts** — single file, smaller total payload, enables `font-variation-settings` for fine control
- **Check file size** — heading font + body font combined should stay under 150KB (WOFF2 compressed) for critical path
- **Font-display strategy** — recommend `font-display: swap` for body (content visible immediately), `font-display: optional` for display/heading (avoids layout shift if font fails to load)
- **Subset if needed** — for fonts with large character sets, use `unicode-range` to load only Latin glyphs on initial page load

---

## 3. Pairing Principles

Use these principles to compose original pairings rather than relying on pre-made combinations.

### Contrast Creates Interest

The best pairings come from deliberate contrast between heading and body fonts:

- **Serif + Sans-serif** — the classic contrast axis. Works when the serif has personality and the sans is restrained (or vice versa).
- **Geometric + Humanist** — mechanical precision meets organic warmth. Strong for brands balancing professionalism with approachability.
- **Display + Text** — an expressive heading font paired with a workhorse body font. The heading carries brand personality; the body carries content.
- **Condensed + Regular width** — density contrast creates visual hierarchy without relying on size alone.

### Harmony Requirements

Contrast must exist within a framework of harmony. Check these before committing to a pairing:

| Check | What to Compare | Pass Condition |
|-------|----------------|----------------|
| **x-height alignment** | Overlay both fonts at the same point size | x-heights should be within ~5% of each other. Mismatched x-heights create an uneven texture. |
| **Optical size** | View both fonts at their intended use sizes | Heading font should look intentional at 32-48px. Body font should be comfortable at 16-18px. |
| **Weight range compatibility** | Compare available weights | Both fonts need at least Regular and Bold. Ideally both have Semi-bold for UI use. |
| **Proportion harmony** | Compare letter width and spacing rhythm | One font may be wider or narrower, but the overall rhythm should feel related, not clashing. |

### What to Avoid

- **Two fonts from the same sub-classification** — e.g., two geometric sans-serifs. They'll look like a mistake, not a choice. Exception: intentional monofamily (one font, two optical sizes).
- **Two display fonts** — display fonts fight for attention. Use one display + one text font.
- **Pairing by name** — "DM Serif Display + DM Sans" or "IBM Plex Serif + IBM Plex Sans." These pairings are lazy (chosen by brand family, not by design logic) and instantly recognizable as defaults.
- **Pairing by popularity** — if both fonts are in the top 50 on Google Fonts, the pairing will look generic regardless of contrast quality.
