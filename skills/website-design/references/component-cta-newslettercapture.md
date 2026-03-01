# NewsletterCapture

Inline newsletter signup section for content-first businesses. This is the primary conversion for media sites, newsletters, and content creators — not a secondary opt-in. Not a footer variant. Must feel like a genuine value offer, not a mailchimp widget.

```markdown
---
component: NewsletterCapture
category: cta
subtype: email-capture-inline

dimension-fit:
  contrast-dark: low
  contrast-light: high
  energy-restrained: high
  energy-moderate: medium
  energy-energetic: low
visual-weight: light
content-density: sparse
trend-alignment: evergreen
motion-profile: none

use-when:
  - Content-first business where the newsletter is the primary conversion goal
  - Editorial, media, or creator sites (newsletter > contact form)
  - Placed mid-page after demonstrating value (not at top)

avoid-when:
  - Service business (the footer already handles newsletter — don't duplicate)
  - dark-luxury (BANNED — email capture undermines exclusivity positioning)
  - E-commerce (email capture belongs in footer or exit-intent popup, not standalone section)
  - Page already has CTABanner or ContactGateway (one CTA per page)

pairs-well-with: [EnhancedFooter, Manifesto]
pairs-poorly-with: [CTABanner, ContactGateway]
---
```

```tsx
"use client";
import { useState } from "react";
import { cn } from "@/lib/utils";

interface NewsletterCaptureProps {
  headline: string;
  subline?: string;
  /** Proof line: "Join 12,400 subscribers" */
  proof?: string;
  /** Placeholder text in the email input */
  placeholder?: string;
  /** Submit button label */
  ctaLabel?: string;
  /** Confirmation message after submit */
  successMessage?: string;
  /** Layout orientation */
  layout?: "centered" | "split";
}

export function NewsletterCapture({
  headline,
  subline,
  proof,
  placeholder = "your@email.com",
  ctaLabel = "Subscribe",
  successMessage = "You're in. Check your inbox for a confirmation.",
  layout = "centered",
}: NewsletterCaptureProps) {
  const [email, setEmail] = useState("");
  const [submitted, setSubmitted] = useState(false);
  const [error, setError] = useState("");

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!email.includes("@")) {
      setError("Please enter a valid email address.");
      return;
    }
    // Wire up to your email provider here (Resend, ConvertKit, Mailchimp, etc.)
    setSubmitted(true);
  };

  if (layout === "split") {
    return (
      <section className="py-16 lg:py-24 border-y border-border">
        <div className="mx-auto max-w-7xl px-6">
          <div className="flex flex-col gap-8 lg:flex-row lg:items-center lg:justify-between">
            <div className="max-w-[40ch]">
              <h2 className="font-display font-bold text-h2 text-primary">{headline}</h2>
              {subline && (
                <p className="mt-3 text-body text-secondary leading-relaxed">{subline}</p>
              )}
              {proof && (
                <p className="mt-4 text-xs text-disabled">{proof}</p>
              )}
            </div>
            <div className="lg:max-w-sm w-full">
              {submitted ? (
                <p className="text-body text-accent">{successMessage}</p>
              ) : (
                <form onSubmit={handleSubmit} className="flex gap-2">
                  <input
                    type="email"
                    required
                    value={email}
                    onChange={(e) => { setEmail(e.target.value); setError(""); }}
                    placeholder={placeholder}
                    aria-label="Email address"
                    aria-invalid={!!error}
                    className={cn(
                      "flex-1 rounded-lg border bg-surface-primary px-4 py-3 text-sm text-primary",
                      "placeholder:text-disabled outline-none transition-all duration-200",
                      error
                        ? "border-error focus:ring-2 focus:ring-error/20"
                        : "border-border focus:border-accent focus:ring-2 focus:ring-accent/20",
                    )}
                  />
                  <button
                    type="submit"
                    className="shrink-0 rounded-lg bg-accent px-5 py-3 text-sm font-medium text-white transition-all hover:bg-accent-light hover:scale-[1.02] active:scale-[0.98]"
                  >
                    {ctaLabel}
                  </button>
                </form>
              )}
              {error && <p className="mt-2 text-xs text-error" role="alert">{error}</p>}
            </div>
          </div>
        </div>
      </section>
    );
  }

  // Default: centered layout
  return (
    <section className="py-16 lg:py-24">
      <div className="mx-auto max-w-xl px-6 text-center">
        <h2 className="font-display font-bold text-h2 text-primary">{headline}</h2>
        {subline && (
          <p className="mx-auto mt-4 text-body text-secondary leading-relaxed">{subline}</p>
        )}
        {proof && (
          <p className="mt-3 text-xs text-disabled">{proof}</p>
        )}
        <div className="mt-8">
          {submitted ? (
            <p className="text-body text-accent">{successMessage}</p>
          ) : (
            <form onSubmit={handleSubmit} className="flex flex-col gap-3 sm:flex-row">
              <input
                type="email"
                required
                value={email}
                onChange={(e) => { setEmail(e.target.value); setError(""); }}
                placeholder={placeholder}
                aria-label="Email address"
                aria-invalid={!!error}
                className={cn(
                  "flex-1 rounded-lg border bg-surface-primary px-4 py-3 text-sm text-primary",
                  "placeholder:text-disabled outline-none transition-all duration-200",
                  error
                    ? "border-error focus:ring-2 focus:ring-error/20"
                    : "border-border focus:border-accent focus:ring-2 focus:ring-accent/20",
                )}
              />
              <button
                type="submit"
                className="shrink-0 rounded-lg bg-accent px-6 py-3 text-sm font-medium text-white transition-all hover:bg-accent-light hover:scale-[1.02] active:scale-[0.98]"
              >
                {ctaLabel}
              </button>
            </form>
          )}
          {error && <p className="mt-2 text-xs text-error text-left" role="alert">{error}</p>}
        </div>
        <p className="mt-4 text-xs text-disabled">No spam. Unsubscribe anytime.</p>
      </div>
    </section>
  );
}
```

**Usage:**
```tsx
<NewsletterCapture
  headline="The weekly brief on independent practice"
  subline="Strategy, tools, and case studies for solo practitioners. Every Tuesday."
  proof="Join 8,200 subscribers"
  ctaLabel="Get the brief"
  layout="split"
/>
```
