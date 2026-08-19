# Stack adapter: Astro + SolidJS + Tailwind CSS v4

The component and animation references in this skill are framework-agnostic specs. This file is the one place that binds them to a concrete stack. Use it for greenfield projects with no stated stack preference. For a project with an existing stack, skip this file and implement the specs in that stack's idioms instead.

## Stack

- Astro (file-based routing in `src/pages/`, layouts in `src/layouts/`)
- SolidJS for interactive islands only, hydrated via `client:visible` (preferred), `client:idle`, or `client:load` (above-the-fold interactive only)
- Tailwind CSS v4 via `@tailwindcss/vite`
- TypeScript (strict)
- `lucide-solid` for icons inside islands; raw SVG or `astro-icon` in `.astro` files

## Install

```bash
pnpm add -D tailwindcss@latest @tailwindcss/vite@latest
pnpm add solid-js @astrojs/solid-js lucide-solid

# Animation escape hatch — install ONLY if a specific section genuinely needs JS animation
# pnpm add motion
```

## Configure

`astro.config.mjs`:

```js
import { defineConfig } from "astro/config";
import solid from "@astrojs/solid-js";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  integrations: [solid()],
  vite: { plugins: [tailwindcss()] },
});
```

`src/styles/global.css`, from the Color System in the generated visual brief:

```css
@import "tailwindcss";

@theme {
  /* colors, fonts, spacing derived from the visual brief */
}
```

Import it once from `src/layouts/BaseLayout.astro`. Fonts: `@fontsource-variable/*` packages imported in `BaseLayout.astro` before `global.css`, or Google Fonts `<link>` tags with preconnect (see `core-typography.md`).

## Mapping the specs to Astro

| Spec element | Astro home |
|---|---|
| Static component (structure + CSS only) | `.astro` file in `src/components/sections/` or `ui/`; spec CSS in a scoped `<style>` block |
| Component with `## Behavior` | Solid island `.tsx` in `src/components/islands/`, hydrated with the minimum `client:*` directive; WAAPI animations created on mount and cancelled in `onCleanup` |
| Page-to-page transitions | `<ClientRouter />` from `astro:transitions` in `BaseLayout.astro` `<head>`, plus `transition:name` on matched elements |
| Global animation tokens/keyframes | `src/styles/animations.css`, imported once from `global.css` |

## File structure

```
src/
├── layouts/
│   └── BaseLayout.astro        ← Root layout (fonts, <ClientRouter />, NoiseOverlay, analytics script)
├── pages/
│   ├── index.astro             ← Homepage
│   ├── about.astro             ← (on request)
│   ├── auth/                   ← (auth engagements only)
│   │   ├── sign-in.astro
│   │   ├── sign-up.astro
│   │   └── verify.astro
│   └── api/
│       └── auth/[...all].ts    ← (auth engagements only)
├── components/
│   ├── layout/                 ← Navbar.astro, Footer.astro
│   ├── sections/               ← Page-specific .astro sections
│   ├── ui/                     ← Shared primitives (Button, GlassCard, NoiseOverlay)
│   └── islands/                ← SolidJS interactive islands (.tsx)
├── lib/                        ← auth.ts, auth-client.ts (auth engagements only)
└── styles/
    ├── global.css              ← Tailwind v4 @theme + imports
    └── animations.css          ← @keyframes, scroll-timeline utilities, reduced-motion
```

## Analytics (always): datafa.st

No npm package — a plain script tag inside `<head>` of `BaseLayout.astro`:

```html
<script defer data-website-id="dfid_REPLACE_ME" data-domain="your_domain.com" src="https://datafa.st/js/script.js"></script>
```

Replace both placeholders with the client's real values. datafa.st auto-disables on localhost. Never install a `@datafast/*` package.

## Auth (only when the engagement asks for it): BetterAuth

**Prerequisite the static default does not satisfy:** the auth API route needs a server. Add an SSR adapter and switch the relevant routes to server output before building auth:

```bash
pnpm add better-auth @astrojs/node
```

```js
// astro.config.mjs — additions for auth builds
import node from "@astrojs/node";
export default defineConfig({
  output: "static",                          // pages stay static by default
  adapter: node({ mode: "standalone" }),     // serves the API routes
  integrations: [solid()],
  vite: { plugins: [tailwindcss()] },
});
```

Mark `src/pages/api/auth/[...all].ts` with `export const prerender = false;` so it runs on the server. (Swap `@astrojs/node` for the host's adapter — Vercel, Cloudflare — when the deploy target is known.)

**Plugins:** always-on `admin`, `organization`, `polar`, `twoFactor`, `passkey`, `lastLoginMethod`; per-engagement opt-ins `mcp`, `apiKey`, `jwt` (import paths: `better-auth/plugins/{mcp,api-key,jwt}`). Default login UI: email magic link + Google + Apple + passkey; the `last-login-method` value drives a "Continue with {provider}" hint above the provider buttons.

**Files:**
- `src/lib/auth.ts` — BetterAuth server instance with the plugin set above
- `src/lib/auth-client.ts` — browser client matching the server plugins
- `src/pages/api/auth/[...all].ts` — API route delegating to `auth.handler`
- `src/pages/auth/sign-in.astro`, `sign-up.astro`, `verify.astro` — login UI
- `src/pages/account.astro` + `src/pages/admin/index.astro` — minimal shells gated by session / admin role

**Env vars** (document in `.env.example`): `BETTER_AUTH_SECRET`, `BETTER_AUTH_URL`, `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `APPLE_CLIENT_ID`, `APPLE_CLIENT_SECRET`, `APPLE_KEY_ID`, `APPLE_TEAM_ID`, `APPLE_PRIVATE_KEY`, `RESEND_API_KEY` (or equivalent magic-link sender), `POLAR_ACCESS_TOKEN`.

## Stack-specific checklist additions

- [ ] `pnpm astro build` succeeds
- [ ] No TypeScript `any`
- [ ] Islands use the minimum hydration directive (`client:visible` > `client:idle` > `client:load`)
- [ ] No `"use client"`, `next/*`, or `src/app/` references anywhere
- [ ] Auth builds only: SSR adapter configured, `prerender = false` on the auth API route
