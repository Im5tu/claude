# Claude Code Configuration

Personal global configuration for [Claude Code](https://claude.ai/claude-code).

## Structure

```
.claude/
├── CLAUDE.md           # Global instructions (orchestrator behavior, style, constraints)
├── settings.json       # Permissions, plugins, and Claude Code settings
├── agents/             # Specialized sub-agent definitions
├── commands/           # Slash command definitions (/command-name)
├── hooks/              # Scripts invoked by settings.json hooks
└── skills/             # Auto-triggered skills based on context
```

> **Note:** MCP servers are not tracked here as a `mcp-servers.json` file; see
> [Setup → MCP Servers](#mcp-servers) for the `claude mcp add-json` commands.

## Components

### CLAUDE.md

Global instructions that apply to all Claude Code sessions. Defines:
- Orchestrator role and behavior
- Decision-making constraints
- Interaction style
- Project-specific notes

### Agents

Specialized sub-agents invoked via the Task tool for domain-specific work:

| Agent | Purpose |
|-------|---------|
| `dotnet` | .NET 10 backend, Goa framework, Lambda-first, vertical slices, AOT |
| `iac` | AWS infrastructure, OpenTofu, least-privilege IAM, cost-conscious design |
| `mobile` | Flutter/Dart, Riverpod state, typed networking boundaries |

### Commands

Slash commands triggered by `/command-name`:

| Command | Description |
|---------|-------------|
| `/aws-check` | Scan AWS Lambda logs for errors and produce a triage report |
| `/commit-all` | Review and commit all changes in logical groups |
| `/next-work` | Triage open ReadyForWork issues and recommend what to work on next |

### Hooks

Scripts referenced by `settings.json`:

| Hook | Event | Purpose |
|------|-------|---------|
| `fable-mode-autoload.py` | `SessionStart` | Auto-activates the `fable-mode` skill when the session model is not Fable |

`settings.json` also registers a `PreToolUse` hook on `Bash` that shells out to `rtk hook claude`
(see [RTK](https://github.com/Im5tu/rtk)); `rtk` must be on `PATH` for it to be a no-op-safe.

### Skills

Context-aware capabilities auto-triggered when relevant:

| Skill | Purpose |
|-------|---------|
| `dotnet-aot-analysis` | Analyzes AOT compatibility |
| `dotnet-centralise-packages` | Central Package Management |
| `dotnet-enable-autocomplete` | CLI tab autocomplete |
| `dotnet-enable-testing-platform` | New testing platform |
| `dotnet-json-polymorphic` | Polymorphic JSON serialization |
| `dotnet-source-gen-json` | JSON source generation |
| `dotnet-source-gen-logging` | LoggerMessage source gen |
| `dotnet-source-gen-options-validation` | Options validation source gen |
| `dotnet-source-gen-regex` | Regex source generation |
| `dotnet-update-packages` | NuGet package updates |
| `dart-drift` | drift/SQLite for non-Flutter Dart (CLI, server) |
| `flutter-adaptive-ui` | Responsive/adaptive layouts across form factors |
| `flutter-animations` | Implicit, explicit, hero, staggered, physics animations |
| `flutter-architecture` | MVVM + feature-first project structure |
| `flutter-drift` | drift/SQLite in Flutter apps |
| `flutter-duit-bdui` | Duit backend-driven UI integration |
| `flutter-internationalization` | gen-l10n / intl localization |
| `flutter-navigation` | Navigator, go_router, deep linking |
| `flutter-networking` | HTTP, WebSockets, auth, error handling |
| `flutter-testing` | Unit, widget, and integration tests |
| `brand-design` | Greenfield brand identity systems |
| `competitor-alternatives` | Competitor comparison / alternative pages |
| `copywriting` | Marketing copy for landing and product pages |
| `launch-strategy` | Product launch and go-to-market planning |
| `marketing-psychology` | Mental models applied to marketing |
| `website-design` | Astro + SolidJS + Tailwind v4 multi-page sites |
| `website-seo` | SEO strategy, technical SEO, schema, reporting |
| `fable-mode` | Fable-style planning, verification, and reporting habits |
| `plan-feature` | In-depth interview to produce a detailed feature spec |
| `reprompt` | Restructure a prompt into Goal/Constraints/Format/Failure |
| `using-git-worktrees` | Isolated worktrees for feature work |

Many skills from:
- https://skills.sh/
- https://github.com/Im5tu/dotnet-skills

## Setup

### MCP Servers

The `mcp-servers.json` file contains MCP server definitions that need to be merged into your `~/.claude.json`. To install them, run each server via the Claude CLI:

```cmd
claude mcp add-json -s user sequential-thinking "{\"command\":\"cmd\",\"args\":[\"/c\",\"npx\",\"-y\",\"@modelcontextprotocol/server-sequential-thinking\"]}"
claude mcp add-json -s user playwright "{\"command\":\"cmd\",\"args\":[\"/c\",\"npx\",\"-y\",\"@playwright/mcp@latest\"]}"
claude mcp add-json -s user aws-knowledge-mcp-server "{\"type\":\"http\",\"url\":\"https://knowledge-mcp.global.api.aws\"}"
claude mcp add-json -s user aws-documentation-mcp-server "{\"command\":\"cmd\",\"args\":[\"/c\",\"uvx\",\"awslabs.aws-documentation-mcp-server@latest\"],\"env\":{\"FASTMCP_LOG_LEVEL\":\"ERROR\",\"AWS_DOCUMENTATION_PARTITION\":\"aws\"}}"
```

Prerequisites:
- Node.js / npm (for `npx`-based servers)
- Python 3.10+ / uv (for `uvx`-based servers)

Verify with:

```cmd
claude mcp list
```

## Usage

This configuration is loaded automatically by Claude Code from `~/.claude/`
(`%USERPROFILE%\.claude\` on Windows).

Files are applied globally across all projects unless overridden by project-specific CLAUDE.md files.

### Keeping a checkout in sync

Rather than copying files back and forth, symlink the tracked directories from `~/.claude`
into a checkout of this repo:

```sh
git clone https://github.com/Im5tu/claude ~/projects/.claude
mv ~/.claude/skills ~/.claude/skills.bak && ln -s ~/projects/.claude/skills ~/.claude/skills
mv ~/.claude/agents ~/.claude/agents.bak && ln -s ~/projects/.claude/agents ~/.claude/agents
```

**Caveat:** the symlink itself survives `git checkout`, but the *contents* do not — switching
branches rewrites your live skills and agents, and any tracked file absent from the target branch
is deleted from the working tree. Files matched by `.gitignore` (e.g. the `skills/ads/` bundle)
are left untouched. Commit or stash before switching branches.

`CLAUDE.md`, `settings.json`, `commands/`, and `hooks/` are **not** symlinked and must be copied
manually after pulling.
