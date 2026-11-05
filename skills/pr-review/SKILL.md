---
name: pr-review
description: >-
  Review a pull request with the user-level reviewer and security-reviewer agents
  in parallel, then run fix rounds until both are clean. Use when asked to review a
  PR, or after an author agent opens one. Takes a PR number or URL.
---

Print "Using skill: pr-review" to the console first.

1. Get the facts with `gh pr view <pr> --json number,title,body,baseRefName,headRefName,headRefOid` and the diff range `<base>..<headRefOid>`. Don't paste the diff into your own context.
2. Write the brief from the PR description: GOAL, DONE WHEN, OUT OF SCOPE. If the PR gives no way to tell, ask the user one short question before spawning.
3. Spawn `reviewer` and `security-reviewer` in parallel, in the background, each with the brief and the diff range. They are read-only and return the reviewer contract only.
4. Sort the results:
   - DEFECTS IN DIFF with High or Critical severity go back to the author agent that owns the change, with the findings. Medium and Low defects are listed for the user.
   - ADJACENT, NOT FIXED items are listed for the user and never fixed here.
5. After a fix, run the `verifier` agent on the branch in the background. Then re-run only the reviewer that raised findings, on `<previous head>..<new head>` plus the named findings. Repeat.
6. There is no round limit. After 5 rounds without a clean result, stop. Judge the quality of the implementation yourself from the round history, and escalate to the user if you think that is needed.
7. Close-out, at most 20 lines: rounds taken, final verdict from each reviewer, Medium and Low defects, and the ADJACENT pick-list. Ask the user which adjacent items, if any, to do.
