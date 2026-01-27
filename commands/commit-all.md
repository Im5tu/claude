---
description: Review and commit all changes in logical groups
---

# Commit All Changes

Review all pending changes and commit them in logical groups.

## Workflow

1. **Check git status** - Run `git status` to identify modified and untracked files

2. **Exclude files** - Never stage or commit these patterns:
   - `**/settings.local.json`
   - `**/notes.txt`
   - `**/.claude/`

3. **Read diffs** - Review the actual changes using `git diff` to understand modifications

4. **Group changes logically** - Organize files into coherent commit groups by:
   - Feature area (backend, mobile, iac, frontend, etc.)
   - Related functionality
   - Logical dependency

5. **Present groupings** - Show numbered proposal:
   ```
   Group 1: [Area/Feature]
   - path/to/file1
   - path/to/file2
   Commit message: "Summary of changes"

   Group 2: [Area/Feature]
   ...
   ```

6. **Wait for approval** - ALWAYS require explicit "yes" from user before committing

7. **Commit each group** - Execute commits using HEREDOC format:
   ```bash
   git add <files>
   git commit -m "$(cat <<'EOF'
   Commit message here
   EOF
   )"
   ```

8. **Report results** - Show commit hashes for each completed commit

## Rules

- Never commit excluded files under any circumstances
- Never add co-author statements to commits
- Never proceed without user approval
- If no meaningful changes exist, report that and stop
- If groupings are unclear, ask for clarification
