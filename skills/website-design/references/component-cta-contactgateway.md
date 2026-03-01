# ContactGateway

CTA section for service businesses where the conversion goal is a consultation or discovery call. Shows contact details and booking CTA — no embedded form. Links out to Calendly, a contact page, or a mailto. Generous whitespace, centered, calm authority.

```markdown
---
component: ContactGateway
category: cta
subtype: service-consultation-cta

dimension-fit:
  contrast-dark: high
  contrast-light: high
  energy-restrained: high
  energy-moderate: medium
  energy-energetic: medium
visual-weight: light
content-density: sparse
trend-alignment: evergreen
motion-profile: none

use-when:
  - Service business where the conversation is the conversion (consulting, legal, design, finance)
  - Booking link (Calendly, TidyCal, or similar) exists
  - Page is service- or team-focused and ends with "let's talk"

avoid-when:
  - Product/SaaS (use CTABanner instead — self-serve signup is the CTA, not a call)
  - E-commerce (no consultation model)
  - Already have CTABanner on the same page (one primary CTA per page)

pairs-well-with: [EnhancedFooter, Manifesto]
pairs-poorly-with: [CTABanner, NewsletterCapture]
---
```

```tsx
import { cn } from "@/lib/utils";

interface ContactGatewayProps {
  headline: string;
  subline?: string;
  email?: string;
  phone?: string;
  /** Primary CTA — typically a Calendly link or /contact */
  cta: { label: string; href: string };
  /** Optional secondary CTA — e.g., "Send a message" → mailto: or contact form */
  secondaryCta?: { label: string; href: string };
  /** Optional availability note — e.g., "Currently accepting Q3 clients" */
  availability?: string;
}

export function ContactGateway({
  headline,
  subline,
  email,
  phone,
  cta,
  secondaryCta,
  availability,
}: ContactGatewayProps) {
  return (
    <section className="py-24 lg:py-32">
      <div className="mx-auto max-w-3xl px-6 text-center">
        {/* Availability badge */}
        {availability && (
          <p className="mb-6 inline-block rounded-full border border-accent/30 px-4 py-1.5 text-xs font-medium text-accent tracking-wider">
            {availability}
          </p>
        )}

        {/* Headline */}
        <h2 className="font-display font-bold text-[clamp(2rem,4vw,3.5rem)] leading-[1.1] tracking-tight text-primary">
          {headline}
        </h2>

        {/* Subline */}
        {subline && (
          <p className="mx-auto mt-6 max-w-[45ch] text-body-lg text-secondary leading-relaxed">
            {subline}
          </p>
        )}

        {/* Contact details row */}
        {(email || phone) && (
          <div className="mt-8 flex flex-wrap items-center justify-center gap-6 text-sm text-secondary">
            {email && (
              <a
                href={`mailto:${email}`}
                className="flex items-center gap-2 transition-colors hover:text-primary"
              >
                <span className="text-accent" aria-hidden="true">—</span>
                {email}
              </a>
            )}
            {email && phone && (
              <span className="text-border" aria-hidden="true">|</span>
            )}
            {phone && (
              <a
                href={`tel:${phone.replace(/\s/g, "")}`}
                className="flex items-center gap-2 transition-colors hover:text-primary"
              >
                <span className="text-accent" aria-hidden="true">—</span>
                {phone}
              </a>
            )}
          </div>
        )}

        {/* CTAs */}
        <div className="mt-10 flex flex-wrap items-center justify-center gap-4">
          <a
            href={cta.href}
            className={cn(
              "inline-flex items-center rounded-lg bg-accent px-8 py-4 text-base font-medium text-white",
              "transition-all duration-200 hover:bg-accent-light hover:scale-[1.02] active:scale-[0.98]",
              "shadow-sm hover:shadow-md",
            )}
            target={cta.href.startsWith("http") ? "_blank" : undefined}
            rel={cta.href.startsWith("http") ? "noopener noreferrer" : undefined}
          >
            {cta.label}
          </a>
          {secondaryCta && (
            <a
              href={secondaryCta.href}
              className={cn(
                "inline-flex items-center rounded-lg border border-border px-8 py-4 text-base font-medium text-primary",
                "transition-all duration-200 hover:bg-surface-secondary hover:border-border-strong",
              )}
            >
              {secondaryCta.label}
            </a>
          )}
        </div>
      </div>
    </section>
  );
}
```

**Usage:**
```tsx
<ContactGateway
  headline="Let's build something that matters"
  subline="We work with founders and leadership teams on strategy, systems, and the decisions that shape what comes next."
  email="hello@studiomake.co"
  phone="+44 20 7946 0234"
  availability="Accepting new clients from September 2026"
  cta={{ label: "Schedule a conversation", href: "https://calendly.com/studiomake/discovery" }}
  secondaryCta={{ label: "Send a message", href: "mailto:hello@studiomake.co" }}
/>
```
