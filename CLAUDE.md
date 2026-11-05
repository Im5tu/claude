# General
- Only work on explicitly what's asked for, ask the user if you feel the scope should be extended
- Make the minimum viable change. If a request has more than one reasonable reading, ask the user first (short multiple choice, with a recommended default) before planning or spawning anything.
- Every brief to a sub-agent states GOAL, DONE WHEN and OUT OF SCOPE. At the end, list extras that were noticed and ask which to do. Never do them unprompted.

# Risks
- For each change, classify risk into one of three:
    1. low:
        * Formatting
        * Minor refactor
        * Small bug fix
    2. medium:
        * Multi-file feature
        * Business logic change
    3. high:
        * Security changes
        * Infrastructure changes
        * Public API changes
        * Data model changes

# Planning
- Enter Planning Mode when risk is: medium or high
- Spawn a planning sub-agent
- Write any decision made to the plan file after the decision is made
- Any time a plan file is being worked on, think through the plan step-by-step, logically, and from first principles prior to presenting it to the user

# Execution
- Run in phases, according to risk level:
    1. Code authoring (risks: all. Use TDD)
    2. Verify (risks: all) - the `verifier` agent runs analysis, build and affected tests in the background
    3. Code Review (risks: medium/high) - `reviewer`, which runs the built-in `/code-review` skill
    4. Security Review (risks: medium/high) - `security-reviewer`, which runs the built-in `/security-review` skill
- Each phase runs in an isolated sub-agent and reports results to parent
- Use named agents: `mobile`, `dotnet`, `iac`, `go`, `ts`, `rust` or `l10n` to author; `verifier`; `reviewer`; `security-reviewer`; `explorer`; `researcher`; `ci-watcher`. Don't use `general-purpose` for these jobs. If a relevant sub-agent doesn't exist, prompt the user to create one
- Models: the main thread is Opus. Every sub-agent is Sonnet, except `explorer` and `ci-watcher`, which are Haiku. Never pass `model` when spawning a named agent, because each agent pins its own and a passed value overrides it. Use `explorer`, never the built-in `Explore`. The built-in `Plan` pins no model, so spawn it with `model: sonnet`. A sub-agent that needs to fan out spawns `explorer` or another Haiku agent only. A task that needs Opus is spawned with `model: opus` when the user asks
- If Code Review or Security Review returns High or Critical issues:
    * Route back to Code Author with required fixes.
    * Re-run only the affected review phases, on the changes since the previous round plus the named findings.
- No limit on review rounds. After 5 rounds without a clean result, the reviewer reports to the parent. The parent judges the quality of the implementation and escalates to the user if it thinks that is needed.
- Code authors must not review or critique their own code
- Run code authoring in parallel on disjoint files, one worktree each (agent teams where useful)
- Authors run only affected tests. Only `verifier` runs wider suites, in the background. CI runs the full suite for medium and high risk work
- Never block on a command expected to exceed 60 seconds. Use `run_in_background` and wait for the notification. No `sleep` or `until` loops in the foreground
- Sub-agents return as little as possible: outcome, pointers (branch, file paths) and open questions. No logs, diffs, glossaries or restated briefs; longer detail goes in a file and the return gives its path. A brief must never ask an agent for a longer return than its own rule allows
- Output to console when a skill is used so the user can track usage

# Worktrees
- When starting feature work that needs isolation from the current workspace, use a git worktree (the EnterWorktree tool where available)
- Directory priority for manual worktrees: existing `.worktrees/` > existing `worktrees/` > project CLAUDE.md preference > ask the user
- Before creating a project-local worktree, verify the directory is gitignored (`git check-ignore`); if it is not, stop and ask - never auto-commit a .gitignore change
- Never auto-run dependency installs (`npm install`, `pip install`, etc.) in a new worktree without approval
- Author agents use `isolation: worktree`. The parent removes each author's worktree after integrating its branch

# Writing
- Always apply the `unslop` skill to prose you produce: docs, READMEs, reports, commit messages, and any user-facing writing

# Commit
- Where possible commit parts of files in the related chunks over whole files
- Never use a co-author statement
