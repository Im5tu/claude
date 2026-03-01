# EnhancedFooter

Full-featured footer with brand column, navigation columns, newsletter signup, system status indicator, and legal bar. This is the **required footer implementation** for all sites. The simplified footer pattern is deprecated.

```
// Always use EnhancedFooter.
// showNewsletter: include for product, SaaS, and content businesses.
//   Skip for service businesses where the footer's primary role is navigation.
// showSystemStatus: include for SaaS and technical products only.
//   Skip for service businesses, artisan brands, and any site where real-time operational status is irrelevant.
// The social proof line is optional but recommended if the business has a credible proof point.
```

```tsx
"use client";
import { useState, type ReactNode } from "react";

interface FooterColumn {
  heading: string;
  links: { label: string; href: string }[];
}

interface EnhancedFooterProps {
  brand: string;
  tagline: string;
  columns: FooterColumn[];
  socials?: { icon: ReactNode; href: string; label: string }[];
  /** e.g., "Trusted by 500+ businesses" or "Join 12,000 subscribers" */
  socialProofLine?: string;
  showNewsletter?: boolean;
  showSystemStatus?: boolean;
}

export function EnhancedFooter({
  brand,
  tagline,
  columns,
  socials,
  socialProofLine,
  showNewsletter = true,
  showSystemStatus = true,
}: EnhancedFooterProps) {
  const [email, setEmail] = useState("");
  const [submitted, setSubmitted] = useState(false);

  return (
    <footer className="bg-neutral-950 text-neutral-300 rounded-t-[2rem] mt-20">
      {/* Social proof strip */}
      {socialProofLine && (
        <div className="border-b border-neutral-800">
          <div className="mx-auto max-w-7xl px-6 py-4">
            <p className="text-center text-xs font-medium uppercase tracking-wider text-neutral-500">
              {socialProofLine}
            </p>
          </div>
        </div>
      )}

      <div className="mx-auto max-w-7xl px-6 pt-16 pb-10">
        {/* Main grid */}
        <div className="grid grid-cols-1 gap-12 md:grid-cols-2 lg:grid-cols-5">
          {/* Brand column */}
          <div className="lg:col-span-2">
            <a href="/" className="text-xl font-display font-bold text-white">
              {brand}
            </a>
            <p className="mt-3 text-sm leading-relaxed text-neutral-400 max-w-[30ch]">
              {tagline}
            </p>
            {socials && socials.length > 0 && (
              <div className="mt-6 flex gap-4">
                {socials.map((s) => (
                  <a
                    key={s.href}
                    href={s.href}
                    className="text-neutral-500 transition-colors hover:text-white"
                    aria-label={s.label}
                  >
                    {s.icon}
                  </a>
                ))}
              </div>
            )}
          </div>

          {/* Navigation columns */}
          {columns.map((col) => (
            <div key={col.heading}>
              <h3 className="text-xs font-semibold uppercase tracking-wider text-neutral-500">
                {col.heading}
              </h3>
              <ul className="mt-4 space-y-3">
                {col.links.map((link) => (
                  <li key={link.href}>
                    <a
                      href={link.href}
                      className="text-sm text-neutral-400 transition-colors hover:text-white"
                    >
                      {link.label}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        {/* Newsletter */}
        {showNewsletter && (
          <div className="mt-12 border-t border-neutral-800 pt-8">
            <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
              <div>
                <p className="text-sm font-medium text-white">Stay in the loop</p>
                <p className="mt-1 text-xs text-neutral-500">No spam. Unsubscribe anytime.</p>
              </div>
              {submitted ? (
                <p className="text-sm text-accent">Thanks for subscribing.</p>
              ) : (
                <form
                  onSubmit={(e) => { e.preventDefault(); setSubmitted(true); }}
                  className="flex w-full max-w-sm gap-2"
                >
                  <input
                    type="email"
                    required
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="you@email.com"
                    aria-label="Email for newsletter"
                    className="flex-1 rounded-lg border border-neutral-800 bg-neutral-900 px-4 py-2.5 text-sm text-white placeholder:text-neutral-600 outline-none transition-colors focus:border-accent focus:ring-1 focus:ring-accent/30"
                  />
                  <button
                    type="submit"
                    className="shrink-0 rounded-lg bg-accent px-5 py-2.5 text-sm font-medium text-white transition-all hover:bg-accent-light hover:scale-[1.02] active:scale-[0.98]"
                  >
                    Subscribe
                  </button>
                </form>
              )}
            </div>
          </div>
        )}

        {/* Bottom bar */}
        <div className="mt-8 flex flex-col items-center justify-between gap-4 border-t border-neutral-800 pt-8 sm:flex-row">
          <div className="flex items-center gap-6">
            <p className="text-xs text-neutral-500">
              &copy; {new Date().getFullYear()} {brand}. All rights reserved.
            </p>
            {showSystemStatus && (
              <div className="flex items-center gap-2">
                <span className="relative flex h-1.5 w-1.5" aria-hidden="true">
                  <span className="absolute inline-flex h-full w-full animate-ping rounded-full bg-emerald-400 opacity-75" />
                  <span className="relative inline-flex h-1.5 w-1.5 rounded-full bg-emerald-500" />
                </span>
                <span className="font-mono text-[10px] uppercase tracking-wider text-neutral-600">
                  All systems operational
                </span>
              </div>
            )}
          </div>
          <div className="flex gap-6 text-xs text-neutral-500">
            <a href="/privacy" className="transition-colors hover:text-neutral-300">Privacy</a>
            <a href="/terms" className="transition-colors hover:text-neutral-300">Terms</a>
          </div>
        </div>
      </div>
    </footer>
  );
}
```
