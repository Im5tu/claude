# Design System Patterns Reference

This reference maps concrete design system values to the 12 Jungian archetypes for SaaS brand generation. Every section provides specific numbers, CSS values, and archetype associations.

---

## Archetype Quick Reference

| # | Archetype | Core Trait | Design Tendency |
|---|-----------|------------|-----------------|
| 1 | Innocent | Optimism, simplicity | Light, clean, spacious |
| 2 | Sage | Knowledge, wisdom | Structured, typographic, restrained |
| 3 | Explorer | Freedom, discovery | Open, dynamic, unconventional |
| 4 | Outlaw | Disruption, rebellion | Dark, angular, high contrast |
| 5 | Magician | Transformation, vision | Layered, gradient, immersive |
| 6 | Hero | Mastery, courage | Bold, structured, strong hierarchy |
| 7 | Lover | Passion, intimacy | Warm, rounded, sensory |
| 8 | Jester | Joy, playfulness | Colorful, rounded, bouncy |
| 9 | Everyperson | Belonging, trust | Familiar, neutral, accessible |
| 10 | Caregiver | Service, protection | Soft, warm, generous spacing |
| 11 | Ruler | Control, authority | Rigid, premium, dark/gold palettes |
| 12 | Creator | Innovation, expression | Eclectic, asymmetric, expressive |

---

## 1. Spacing Scale Patterns

### 4px Base System

Best for: interfaces requiring fine-grained control, data-dense layouts, developer tools.

```
Token    Value
4xs      4px
3xs      8px
2xs      12px
xs       16px
sm       20px
md       24px
lg       32px
xl       40px
2xl      48px
3xl      64px
4xl      80px
5xl      96px
6xl      128px
```

Use the 4px system when the product has:
- Dense data tables or dashboards
- Code editors or terminal-style interfaces
- Complex forms with many fields
- Compact navigation with many items

### 8px Base System

Best for: marketing-forward SaaS, simpler interfaces, content-heavy products.

```
Token    Value
xs       8px
sm       16px
md       24px
lg       32px
xl       48px
2xl      64px
3xl      96px
4xl      128px
```

Use the 8px system when the product has:
- Content-focused layouts
- Marketing landing pages
- Onboarding flows
- Consumer-facing dashboards

### Named Spacing Tokens (Recommended Default)

For most SaaS design systems, use the 4px base with these semantic aliases:

```
--space-none:     0px
--space-px:       1px
--space-0.5:      2px
--space-1:        4px
--space-1.5:      6px
--space-2:        8px
--space-3:        12px
--space-4:        16px
--space-5:        20px
--space-6:        24px
--space-8:        32px
--space-10:       40px
--space-12:       48px
--space-16:       64px
--space-20:       80px
--space-24:       96px
--space-32:       128px
```

### Archetype Spacing Tendencies

**Tight spacing (favor smaller tokens, denser layouts):**
- Outlaw — compressed energy, claustrophobic intensity
- Hero — efficient, no wasted space, military precision
- Sage — information density, academic rigor
- Ruler — controlled, every pixel deliberate

**Moderate spacing (balanced, conventional):**
- Everyperson — standard, comfortable, familiar
- Creator — varies by context, functional
- Explorer — adaptive, changes with viewport

**Spacious layouts (generous whitespace, breathing room):**
- Innocent — open, airy, nothing to hide
- Caregiver — gentle, unhurried, approachable
- Lover — luxurious, sensory, indulgent
- Magician — immersive, theatrical, cinematic
- Jester — bouncy, room for playful elements

**Variable/Asymmetric spacing:**
- Creator — deliberately uneven for visual interest
- Explorer — breaks grid to suggest movement
- Outlaw — tension through inconsistency

---

## 2. Type Scale Ratios

### Ratio Reference Table

| Ratio | Name | Multiplier | Character | Best For |
|-------|------|-----------|-----------|----------|
| Minor Second | 1.067 | Very tight | Compact UI, data-dense apps | Dense dashboards |
| Major Second | 1.125 | Tight, subtle | Functional interfaces | Admin panels, tools |
| Minor Third | 1.200 | Moderate, versatile | General purpose | Most SaaS products |
| Major Third | 1.250 | Balanced, popular | Clear hierarchy | Marketing + product hybrid |
| Perfect Fourth | 1.333 | Bold, clear | Strong hierarchy | Landing pages, hero sections |
| Augmented Fourth | 1.414 | Dramatic | High contrast | Editorial, statement brands |
| Perfect Fifth | 1.500 | Very dramatic | Maximum range | Magazine-style layouts |
| Golden Ratio | 1.618 | Maximal contrast | Extreme hierarchy | Artistic, experimental |

### Scale Example (base 16px, Major Third 1.250)

```
Step -2:  10.24px  (0.64rem)   — fine print, labels
Step -1:  12.80px  (0.80rem)   — captions, metadata
Step  0:  16.00px  (1.00rem)   — body text (base)
Step  1:  20.00px  (1.25rem)   — large body, lead text
Step  2:  25.00px  (1.563rem)  — h4 / subheading
Step  3:  31.25px  (1.953rem)  — h3
Step  4:  39.06px  (2.441rem)  — h2
Step  5:  48.83px  (3.052rem)  — h1
Step  6:  61.04px  (3.815rem)  — display
Step  7:  76.29px  (4.768rem)  — hero
```

### Archetype-to-Ratio Mapping

**Tight scales (Minor Second 1.067 / Major Second 1.125):**
- Sage — hierarchy through weight and spacing, not size. Prefers intellectual restraint.
- Everyperson — subtle, unpretentious, functional.
- Ruler — controlled, understated authority. Hierarchy through weight and color, not scale jumps.

**Moderate scales (Minor Third 1.200 / Major Third 1.250):**
- Innocent — friendly, readable, not overwhelming.
- Caregiver — accessible, warm, easy to scan.
- Hero — structured and clear without being showy.
- Explorer — practical, adapts well to varied content.
- Creator — flexible enough for expressive typography.

**Dramatic scales (Perfect Fourth 1.333 and above):**
- Outlaw — aggressive size contrast, disrupts expectations. Favor Perfect Fourth or Augmented Fourth.
- Magician — theatrical scale jumps create wonder. Favor Perfect Fourth or Perfect Fifth.
- Lover — sensuous, large display type creates emotional impact. Favor Major Third to Perfect Fourth.
- Jester — big, playful headlines against smaller body. Favor Perfect Fourth.
- Ruler (display contexts) — when Ruler brands need gravitas in marketing, jump to Perfect Fourth for hero sections only.

**Maximal scales (Perfect Fifth 1.500 / Golden Ratio 1.618):**
- Reserved for editorial layouts, hero sections, or experimental brands.
- Creator in experimental mode.
- Magician for immersive storytelling.
- Rarely used for full product UI — only marketing and onboarding.

### Recommended Base Sizes

| Context | Base Size | Reasoning |
|---------|-----------|-----------|
| Product UI (desktop) | 14px or 16px | Readability at scan distance |
| Product UI (mobile) | 16px | Prevents iOS zoom, meets WCAG |
| Marketing pages | 18px or 20px | Comfortable reading, premium feel |
| Data-dense dashboards | 13px or 14px | Maximizes information density |
| Documentation | 16px or 18px | Long-form reading comfort |

---

## 3. Border Radius Conventions by Archetype

### Radius Categories

#### Sharp (0-2px)
```css
--radius-sharp: 0px;
--radius-xs: 2px;
```
**Archetypes:** Ruler, Outlaw, Hero
- Ruler: precision, authority, no softness. Sharp corners signal control.
- Outlaw: aggressive, edgy. Square corners feel confrontational.
- Hero: disciplined, strong. Geometric clarity.

#### Subtle (4-6px)
```css
--radius-sm: 4px;
--radius-md: 6px;
```
**Archetypes:** Sage, Everyperson, Explorer
- Sage: slight softening without frivolity. Intellectual but approachable.
- Everyperson: familiar, like every standard UI. Not too sharp, not too soft.
- Explorer: practical, adaptable, unremarkable radius lets content lead.

#### Moderate (8-12px)
```css
--radius-lg: 8px;
--radius-xl: 12px;
```
**Archetypes:** Innocent, Caregiver, Creator, Magician
- Innocent: friendly, safe, approachable.
- Caregiver: soft, welcoming, non-threatening.
- Creator: enough roundness for warmth, enough structure for function.
- Magician: polished, modern, refined without being aggressive.

#### Rounded (16-24px)
```css
--radius-2xl: 16px;
--radius-3xl: 24px;
```
**Archetypes:** Jester, Lover
- Jester: playful, bouncy, toy-like quality.
- Lover: sensuous curves, organic feel, inviting.

#### Pill / Full (999px)
```css
--radius-full: 999px;
```
**Archetypes:** Jester, Innocent (buttons and tags only)
- Best used selectively on buttons, badges, and tags.
- Full pill on containers looks unserious for most SaaS contexts.
- Jester can use pill shapes extensively.
- Innocent can use pill buttons for a friendly CTA.

### Mixed Radius Systems

Many strong design systems combine radius values strategically:

| Pattern | Container | Button | Input | Badge | Best For |
|---------|-----------|--------|-------|-------|----------|
| Sharp + Pill | 0px | 999px | 0px | 999px | Outlaw, Hero (contrast creates tension) |
| Subtle + Moderate | 4px | 8px | 4px | 12px | Sage, Everyperson (slight progression) |
| Moderate uniform | 8px | 8px | 8px | 8px | Innocent, Caregiver (consistent friendliness) |
| Moderate + Rounded | 8px | 16px | 8px | 999px | Creator, Magician (progressive softening) |
| Rounded uniform | 16px | 16px | 16px | 999px | Jester, Lover (fully soft) |

### Recommended Token Set

```css
--radius-none: 0px;
--radius-sm: 2px;
--radius-md: 4px;
--radius-lg: 8px;
--radius-xl: 12px;
--radius-2xl: 16px;
--radius-3xl: 24px;
--radius-full: 999px;
```

---

## 4. Shadow / Elevation Systems

### Approach by Archetype

#### Flat (no shadows)
```css
box-shadow: none;
```
**Archetypes:** Outlaw, Sage, Ruler (in minimal mode)
- Outlaw: flat design reinforces stark, brutalist aesthetic. Separation via color/border.
- Sage: intellectual clarity, no decorative fluff. Separation via whitespace and borders.
- Ruler: sometimes uses flat to convey absolute control — elements are placed, not floating.

#### Subtle Shadows (soft, diffused)
```css
--shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
--shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.07), 0 2px 4px -2px rgba(0, 0, 0, 0.05);
--shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.08), 0 4px 6px -4px rgba(0, 0, 0, 0.04);
--shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.08), 0 8px 10px -6px rgba(0, 0, 0, 0.03);
```
**Archetypes:** Innocent, Caregiver, Everyperson
- Innocent: gentle lift, nothing harsh. Shadows whisper, not shout.
- Caregiver: warm, soft depth. Feels protective, layered gently.
- Everyperson: standard, familiar elevation. Like every well-made SaaS product.

#### Material-Style Elevation (layered, progressive)
```css
--elevation-1: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.08);
--elevation-2: 0 3px 6px rgba(0, 0, 0, 0.12), 0 2px 4px rgba(0, 0, 0, 0.08);
--elevation-3: 0 10px 20px rgba(0, 0, 0, 0.12), 0 3px 6px rgba(0, 0, 0, 0.08);
--elevation-4: 0 15px 25px rgba(0, 0, 0, 0.12), 0 5px 10px rgba(0, 0, 0, 0.06);
--elevation-5: 0 20px 40px rgba(0, 0, 0, 0.15), 0 8px 16px rgba(0, 0, 0, 0.08);
```
**Archetypes:** Hero, Explorer, Creator
- Hero: clear z-index hierarchy, structured layering. Actions rise above content.
- Explorer: depth suggests terrain, landscape, dimensionality.
- Creator: layered canvases, tools floating above workspace.

#### Colored / Brand Shadows
```css
/* Example using a brand blue */
--shadow-brand-sm: 0 2px 8px rgba(59, 130, 246, 0.15);
--shadow-brand-md: 0 4px 14px rgba(59, 130, 246, 0.20);
--shadow-brand-lg: 0 8px 24px rgba(59, 130, 246, 0.25);
--shadow-brand-xl: 0 12px 36px rgba(59, 130, 246, 0.30);
```
**Archetypes:** Magician, Lover, Jester
- Magician: colored shadows create otherworldly glow, like light bending around objects.
- Lover: warm-toned shadows (rose, amber) add emotional depth.
- Jester: playful colored shadows reinforce brand personality.

#### Neumorphism-Adjacent (soft inner/outer)
```css
/* Light mode */
--shadow-neu-raised: 6px 6px 12px rgba(0, 0, 0, 0.08), -6px -6px 12px rgba(255, 255, 255, 0.80);
--shadow-neu-inset: inset 4px 4px 8px rgba(0, 0, 0, 0.06), inset -4px -4px 8px rgba(255, 255, 255, 0.70);

/* Dark mode */
--shadow-neu-raised-dark: 6px 6px 12px rgba(0, 0, 0, 0.40), -6px -6px 12px rgba(255, 255, 255, 0.03);
--shadow-neu-inset-dark: inset 4px 4px 8px rgba(0, 0, 0, 0.30), inset -4px -4px 8px rgba(255, 255, 255, 0.02);
```
**Archetypes:** Magician, Creator (sparingly)
- Use with extreme caution. Neumorphism has significant accessibility concerns.
- Only apply to decorative or non-critical interactive elements.
- Never use on primary actions, form inputs, or navigation.

### Shadow Token Set (Recommended Default)

```css
--shadow-xs: 0 1px 2px rgba(0, 0, 0, 0.05);
--shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.10), 0 1px 2px rgba(0, 0, 0, 0.06);
--shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.10), 0 2px 4px -2px rgba(0, 0, 0, 0.06);
--shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.10), 0 4px 6px -4px rgba(0, 0, 0, 0.05);
--shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.10), 0 8px 10px -6px rgba(0, 0, 0, 0.04);
--shadow-2xl: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
--shadow-inner: inset 0 2px 4px rgba(0, 0, 0, 0.06);
```

---

## 5. Component Pattern Taxonomy

### Button Styles by Archetype

#### Shape Mapping

| Archetype | Shape | Fill Style | Hover Behavior |
|-----------|-------|------------|----------------|
| Innocent | Rounded (8-12px) or Pill | Solid, soft colors | Lighten bg, gentle scale(1.02) |
| Sage | Subtle (4px) | Outline primary, Ghost secondary | Underline or bg-fill on hover |
| Explorer | Moderate (8px) | Solid with icon-forward | Translate-x or arrow animation |
| Outlaw | Sharp (0px) | Solid high-contrast, thick borders | Invert colors, hard state change |
| Magician | Moderate (8-12px) | Gradient fill | Shimmer, glow, or gradient shift |
| Hero | Sharp to Subtle (0-4px) | Solid, bold colors | Darken bg, scale(1.01), strong press |
| Lover | Rounded (12-16px) | Soft gradient or solid warm tones | Warm glow, bg intensifies |
| Jester | Pill (999px) | Solid bright colors | Bounce, wiggle, color rotate |
| Everyperson | Subtle (4-6px) | Solid neutral | Standard darken, familiar |
| Caregiver | Moderate (8px) | Solid warm tones | Gentle darken, no jarring change |
| Ruler | Sharp (0-2px) | Solid dark/gold, outline luxury | Subtle brightness shift, no motion |
| Creator | Mixed (varies) | Experimental, gradient or textured | Unique per-brand animation |

#### Button Variants Every System Needs

```
Primary    — main CTA, filled with brand color
Secondary  — outlined or ghost, lower emphasis
Tertiary   — text-only or ghost, minimal
Danger     — destructive actions, red-toned
Ghost      — transparent bg, text + optional icon
Link       — styled as inline link, no button chrome
```

### Card Patterns

| Pattern | CSS Approach | Archetypes |
|---------|-------------|------------|
| Bordered | `border: 1px solid var(--border-color)` | Sage, Everyperson, Ruler |
| Shadowed | `box-shadow: var(--shadow-md)` | Innocent, Caregiver, Hero |
| Background Shift | `background: var(--surface-raised)` (slightly different from page bg) | Explorer, Outlaw, Sage |
| Gradient Accent | Top or left border with gradient, or subtle gradient bg | Magician, Lover, Creator |
| Glass / Frosted | `backdrop-filter: blur(12px); background: rgba(255,255,255,0.7)` | Magician, Creator |
| Elevated + Border | Shadow combined with subtle border | Everyperson, Hero (belt-and-suspenders, very common) |

#### Card Hover States

- Sage: border-color intensifies
- Innocent: shadow deepens slightly, translateY(-2px)
- Outlaw: border goes bright, bg inverts
- Magician: glow effect, gradient shifts
- Jester: tilt or bounce, playful transform
- Ruler: subtle gold/accent border appears

### Input Field Styles

| Style | Description | Archetypes |
|-------|-------------|------------|
| Outlined | Border all around, visible at rest | Everyperson, Sage, Hero, Ruler |
| Filled | Background color, no visible border at rest | Innocent, Caregiver, Explorer |
| Underline | Bottom border only | Magician, Creator, Lover |
| Floating Label | Label animates from placeholder to above on focus | Any archetype, adds polish |

#### Focus State Conventions

```css
/* Standard - works for most archetypes */
--focus-ring: 0 0 0 2px var(--color-background), 0 0 0 4px var(--color-primary);

/* Soft - Innocent, Caregiver */
--focus-ring-soft: 0 0 0 3px rgba(var(--color-primary-rgb), 0.25);

/* Sharp - Outlaw, Ruler */
--focus-ring-sharp: 0 0 0 2px var(--color-primary);

/* Glow - Magician */
--focus-ring-glow: 0 0 0 2px var(--color-primary), 0 0 12px rgba(var(--color-primary-rgb), 0.30);
```

### Navigation Patterns

| Pattern | Description | Archetypes |
|---------|-------------|------------|
| Top bar (horizontal) | Classic SaaS header with logo, nav, user menu | Everyperson, Innocent, Sage |
| Sidebar (persistent) | Vertical nav, collapsible, icon + label | Hero, Ruler, Creator, Explorer |
| Sidebar (overlay) | Slides in from left, overlays content | Caregiver, Lover (mobile-friendly) |
| Command palette | Cmd+K triggered, search-based navigation | Sage, Creator, Magician (power-user) |
| Tab bar (bottom) | Mobile pattern, 4-5 primary actions | Jester, Innocent (mobile contexts) |
| Mega menu | Expanded dropdown with categorized links | Ruler, Hero (enterprise) |

---

## 6. Grid Systems

### 12-Column Grid (Default Recommendation)

The industry standard for SaaS layouts. Maximum flexibility for subdivision (1, 2, 3, 4, 6, 12 columns).

```css
.grid-12 {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: var(--space-6); /* 24px default gutter */
}
```

Common column spans:
- Full width: `span 12`
- Half: `span 6`
- Third: `span 4`
- Quarter: `span 3`
- Two-thirds: `span 8`
- Sidebar + Main: `span 3` + `span 9` or `span 4` + `span 8`

### 8-Column Grid

Better for content-heavy products where the 12-column grid creates too many narrow columns.

```css
.grid-8 {
  display: grid;
  grid-template-columns: repeat(8, 1fr);
  gap: var(--space-8); /* 32px gutter, wider for readability */
}
```

Best for: documentation sites, blog-forward SaaS, Sage and Caregiver archetypes.

### CSS Grid Named Areas (Dashboard Pattern)

```css
.dashboard {
  display: grid;
  grid-template-areas:
    "header  header  header"
    "sidebar main    aside"
    "sidebar main    aside";
  grid-template-columns: 240px 1fr 300px;
  grid-template-rows: auto 1fr;
  min-height: 100vh;
}
```

### Auto-Fill Responsive Pattern

```css
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: var(--space-6);
}
```

This pattern is archetype-agnostic and works universally for card layouts.

### Max-Width Conventions

| Max Width | Use Case | Archetypes |
|-----------|----------|------------|
| 1024px | Content-focused, reading-heavy | Sage, Caregiver |
| 1152px | Balanced content + UI | Innocent, Everyperson |
| 1280px | Standard SaaS product | Most archetypes (default) |
| 1440px | Dashboard-heavy, data-dense | Hero, Ruler, Creator |
| 1600px | Full enterprise dashboards | Ruler, Hero |
| None (full width) | Immersive experiences | Magician, Explorer, Outlaw |

### Content Width vs Full-Bleed

```css
/* Content constrained, page full bleed */
.page { width: 100%; }
.content { max-width: 1280px; margin: 0 auto; padding: 0 var(--space-6); }

/* Full-bleed section within constrained layout */
.full-bleed {
  width: 100vw;
  margin-left: calc(-50vw + 50%);
}

/* Prose/reading width constraint */
.prose { max-width: 65ch; } /* ~720px at 16px base */
```

Archetype guidance:
- Innocent, Sage, Caregiver: constrain content width for readability. Generous `max-width: 65ch` for body copy.
- Outlaw, Magician, Explorer: use full-bleed sections for impact, constrain only where readability requires it.
- Ruler: constrain with precision, centered content implies order.

---

## 7. Responsive Breakpoint Conventions

### Standard Breakpoints (Tailwind-Aligned)

```css
/* Mobile-first approach: no prefix = mobile */
--breakpoint-sm:  640px;   /* Large phone / small tablet */
--breakpoint-md:  768px;   /* Tablet portrait */
--breakpoint-lg:  1024px;  /* Tablet landscape / small desktop */
--breakpoint-xl:  1280px;  /* Desktop */
--breakpoint-2xl: 1536px;  /* Large desktop */
```

```css
/* Usage */
@media (min-width: 640px)  { /* sm */ }
@media (min-width: 768px)  { /* md */ }
@media (min-width: 1024px) { /* lg */ }
@media (min-width: 1280px) { /* xl */ }
@media (min-width: 1536px) { /* 2xl */ }
```

### Container Queries vs Media Queries

**Use media queries for:**
- Overall page layout shifts (sidebar collapse, navigation changes)
- Global typography scaling
- Full-page responsive behavior

**Use container queries for:**
- Component-level responsiveness (cards that reflow inside different contexts)
- Reusable components placed in varying container widths
- Dashboard widgets that must adapt to their panel size

```css
/* Container query setup */
.card-container {
  container-type: inline-size;
  container-name: card;
}

@container card (min-width: 400px) {
  .card { flex-direction: row; }
}

@container card (max-width: 399px) {
  .card { flex-direction: column; }
}
```

### Common SaaS Responsive Patterns

#### Sidebar Collapse

```
Desktop (lg+):  [Sidebar 240px] [Main Content]
Tablet (md):    [Sidebar 64px icons-only] [Main Content]
Mobile (<md):   [Main Content] + [Hamburger → Overlay Sidebar]
```

#### Data Table to Cards

```
Desktop (lg+):  Full table with all columns
Tablet (md):    Table with horizontal scroll or hidden columns
Mobile (<md):   Stacked cards, one per row
```

#### Dashboard Grid Reflow

```
Desktop (xl+):  4 columns of KPI cards
Tablet (lg):    2 columns
Mobile (<md):   1 column, stacked
```

#### Navigation Transformation

```
Desktop (lg+):  Horizontal top nav with dropdowns
Tablet (md):    Condensed nav, overflow into "More" menu
Mobile (<md):   Hamburger menu → full-screen overlay or bottom sheet
```

#### Form Layout

```
Desktop (lg+):  2-column form (labels left, inputs right) or multi-column
Tablet (md):    Single column, labels above inputs
Mobile (<md):   Full-width inputs, larger touch targets (min 44px height)
```

---

## 8. Icon Style Classifications with Archetype Mapping

### Line / Outline Icons

**Character:** Clean, modern, minimal. Equal visual weight. Professional without being heavy.

**Stroke weight:** 1.5px - 2px (1.5px preferred for most SaaS).

**Archetypes:**
- Sage — intellectual clarity, precision, no excess
- Everyperson — standard, universally understood, familiar
- Innocent — clean, lightweight, unintimidating
- Explorer — open, airy, suggests possibility
- Caregiver — gentle, non-aggressive

**Recommended libraries:**
- Lucide (MIT, 1.5px stroke, consistent, actively maintained)
- Phosphor (MIT, multiple weights available, excellent coverage)
- Tabler Icons (MIT, 2px stroke, 5400+ icons, very complete)

### Filled / Solid Icons

**Character:** Bold, confident, high visual weight. Strong presence. Commands attention.

**Archetypes:**
- Hero — strength, solidity, unmissable
- Outlaw — heavy, imposing, no subtlety
- Ruler — authoritative, definitive, weighty

**Recommended libraries:**
- Phosphor Fill variant (toggle from outline to filled within same library)
- Remix Icon (Apache 2.0, comprehensive fill set)
- Tabler Icons Filled (companion to outline set)

**Usage note:** Use filled icons for active/selected states paired with outline for inactive. This outline-to-filled toggle is a strong interaction pattern for navigation items and toggles.

### Duotone Icons

**Character:** Expressive, layered, distinctive. Two tonal layers create depth and personality.

**Stroke weight:** Primary layer at full opacity, secondary layer at 20-40% opacity.

**Archetypes:**
- Magician — depth, layering, visual intrigue
- Creator — expressive, distinctive, artistic
- Lover — rich, textured, emotionally resonant
- Jester — colorful duotone adds playfulness when combined with bright palettes

**Recommended libraries:**
- Phosphor Duotone (best duotone implementation, MIT, consistent secondary layer)
- Remix Icon (select duotone variants available)

### Thin Line Icons

**Character:** Elegant, premium, delicate. Whisper rather than shout. Luxury feel.

**Stroke weight:** 1px - 1.25px

**Archetypes:**
- Ruler — premium, refined, exclusive
- Lover — delicate, sensuous, intimate
- Magician — ethereal, almost disappearing

**Recommended libraries:**
- Phosphor Thin variant (1px stroke, MIT)
- Custom sets — thin icons often require bespoke work for brand differentiation

**Accessibility warning:** Thin icons below 1px stroke can fail contrast requirements, especially on low-resolution displays. Always test at 100% zoom on standard displays. Minimum recommended: 1px stroke with sufficient color contrast against background.

### Icon Sizing Scale

```
--icon-xs:   12px  (inline text, badges)
--icon-sm:   16px  (compact UI, table rows)
--icon-md:   20px  (standard inline, buttons)
--icon-lg:   24px  (navigation, primary actions)
--icon-xl:   32px  (feature highlights, empty states)
--icon-2xl:  40px  (onboarding, hero sections)
--icon-3xl:  48px  (illustration-adjacent, marketing)
```

### Icon Style Decision Matrix

| Need | Choose | Why |
|------|--------|-----|
| Maximum readability at small sizes | Line 1.5px | Clean at 16-20px |
| Strong selected/unselected states | Line + Filled toggle | Clear binary state |
| Brand differentiation | Duotone | Distinctive, memorable |
| Premium / luxury positioning | Thin 1px | Elegant restraint |
| Data-dense dashboards | Line 1.5px at 16px | Minimal visual noise |
| Marketing / landing pages | Duotone or Filled at 32px+ | Visual impact at scale |
| Mobile navigation | Filled at 24px | Touch-friendly, high contrast |

### Libraries to Avoid (Overused)

The following are technically fine but extremely common, reducing brand differentiation:
- Font Awesome — ubiquitous, instantly recognizable as "generic"
- Material Icons — strongly associated with Google's design language
- Feather Icons — no longer actively maintained, limited set

Prefer Phosphor, Lucide, or Tabler for a balance of quality, coverage, and distinctiveness.

---

## Cross-Reference: Archetype Design System Summary

| Archetype | Spacing | Type Ratio | Radius | Shadow | Icons |
|-----------|---------|------------|--------|--------|-------|
| Innocent | Spacious | Minor Third (1.200) | Moderate (8-12px) | Subtle | Line 1.5px |
| Sage | Tight-Moderate | Major Second (1.125) | Subtle (4px) | Flat or Subtle | Line 1.5px |
| Explorer | Moderate-Variable | Minor Third (1.200) | Subtle (4-6px) | Material | Line 1.5px |
| Outlaw | Tight | Perfect Fourth (1.333) | Sharp (0px) | Flat | Filled |
| Magician | Spacious | Perfect Fourth (1.333) | Moderate (8-12px) | Colored/Glow | Duotone |
| Hero | Tight-Moderate | Minor Third (1.200) | Sharp-Subtle (0-4px) | Material | Line/Filled |
| Lover | Spacious | Major Third (1.250) | Rounded (12-16px) | Colored | Duotone/Thin |
| Jester | Spacious | Perfect Fourth (1.333) | Rounded-Pill (16-999px) | Colored | Duotone |
| Everyperson | Moderate | Major Second (1.125) | Subtle (4-6px) | Subtle | Line 1.5px |
| Caregiver | Spacious | Minor Third (1.200) | Moderate (8px) | Subtle | Line 1.5px |
| Ruler | Tight | Major Second (1.125) | Sharp (0-2px) | Flat or Subtle | Thin/Filled |
| Creator | Variable | Minor Third (1.200) | Mixed | Material | Duotone |
