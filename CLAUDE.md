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
- Skill usage:
  * plan-feature: remove ambiguity and ensure plan completeness

# Execution
- Run in 4 phases, according to risk level:
    1. Code authoring (risks: all)
    2. Code Review (risks: medium/high) - run the built-in `/code-review` skill in an isolated sub-agent
    3. Security Review (risks: medium/high) - run the built-in `/security-review` skill in an isolated sub-agent
    4. Test Implementation (risks: all)
- If Code Review or Security Review returns High or Critical issues:
    * Route back to Code Author with required fixes.
    * Re-run only the affected review phases.
- Maximum 2 correction cycles before escalating to user.
- Each phase runs in an isolated sub-agent and reports results to parent
- If a relevant sub-agent doesn't exist, prompt the user to create one
- Code authors must not review or critique their own code
- Run code authoring in parallel using agent teams where possible
- Output to console when a skill is used so the user can track usage

# Worktrees
- When starting feature work that needs isolation from the current workspace, use a git worktree (the EnterWorktree tool where available)
- Directory priority for manual worktrees: existing `.worktrees/` > existing `worktrees/` > project CLAUDE.md preference > ask the user
- Before creating a project-local worktree, verify the directory is gitignored (`git check-ignore`); if it is not, stop and ask - never auto-commit a .gitignore change
- Never auto-run dependency installs (`npm install`, `pip install`, etc.) in a new worktree without approval

# Writing
- Always apply the `unslop` skill to prose you produce: docs, READMEs, reports, commit messages, and any user-facing writing

# Commit
- Where possible commit parts of files in the related chunks over whole files
- Never use a co-author statement

@RTK.md
