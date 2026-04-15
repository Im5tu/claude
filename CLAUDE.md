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
- Any time a plan file is being worked on, use sequential-thinking on the plan prior to presenting it to the user
- Skill usage:
  * plan-feature: remove ambiguity and ensure plan completeness

# Execution
- Run in 4 phases, according to risk level:
    1. Code authoring (risks: all)
    2. Code Review (risks: medium/high)
    3. Security Reviewer (risks: medium/high)
    4. Test Implementation (risks: all)
- If Code Review or Security Reviewer returns High or Critical issues:
    * Route back to Code Author with required fixes.
    * Re-run only the affected review phases.
- Maximum 2 correction cycles before escalating to user.
- Each phase runs in an isolated sub-agent and reports results to parent
- If a relevant sub-agent doesn't exist, prompt the user to create
- Code authors must not review or critique their own code
- Run code authoring in parallel using agent teams where possible
- Output to console when a skill is used so the user track usage

# Commit
- Where possible commit parts of files in the related chunks over whole files
- Never use a co-author statement