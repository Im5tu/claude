# Component CTA — Index

The final section before the footer. Its job: convert the page. Pick one — never two — and tune to the direction.

| Component | File kind | Best for |
|---|---|---|
| CTABanner | `.astro` | Classic closing banner with headline + primary CTA |
| ContactGateway | `.astro` | Contact form + supporting info (address, hours, alt channels) |
| Manifesto | `.astro` | Philosophy-led brands; word-by-word reveal of a power statement |
| NewsletterCapture | `.astro` shell + Solid island form | Content-heavy or editorial sites |

## Selection

| Dimensional position | First pick |
|---|---|
| Dark + restrained | Manifesto or CTABanner |
| Dark + expressive | CTABanner |
| Light + restrained + editorial | Manifesto or NewsletterCapture |
| Light + moderate + technical | ContactGateway |
| Light + expressive | CTABanner |
| Consumer | NewsletterCapture |

## Rules

- Manifesto must use word-by-word CSS reveal (`TextReveal` from `core-animation.md`). Static paragraph = not a manifesto.
- ContactGateway must show at least one non-form channel (email, phone, address) — never a form in isolation.
- NewsletterCapture form must be a Solid island so submit states (loading, success, error) can render without a page reload.

## Component files

- [CTABanner](component-cta-ctabanner.md)
- [ContactGateway](component-cta-contactgateway.md)
- [Manifesto](component-cta-manifesto.md)
- [NewsletterCapture](component-cta-newslettercapture.md)
