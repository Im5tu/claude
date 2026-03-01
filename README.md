# Claude Code Configuration

Personal global configuration for [Claude Code](https://claude.ai/claude-code).

## Structure

```
.claude/
├── CLAUDE.md           # Global instructions (orchestrator behavior, style, constraints)
├── settings.json       # Permissions, plugins, and Claude Code settings
├── mcp-servers.json    # MCP server definitions (copy to ~/.claude.json)
├── agents/             # Specialized sub-agent definitions
├── commands/           # Slash command definitions (/command-name)
└── skills/             # Auto-triggered skills based on context
```

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
| `dotnet` | .NET 10 backend, Goa framework, Lambda-first, vertical slices |
| `iac` | AWS infrastructure, OpenTofu, IAM, security |
| `web` | Next.js App Router, Tailwind, accessibility |
| `uiux` | UX critique, interaction design, cognitive load |
| `copywriting` | Headlines, landing pages, developer messaging |

### Commands

Slash commands triggered by `/command-name`:

| Command | Description |
|---------|-------------|
| `/commit-all` | Review and commit all changes in logical groups |

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

This configuration is loaded automatically by Claude Code from `%USERPROFILE%\.claude\`.

Files are applied globally across all projects unless overridden by project-specific CLAUDE.md files.
