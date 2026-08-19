---
description: Triage open ReadyForWork issues and recommend what to work on next
---

Look at all open GitHub issues in this repo with the label **ReadyForWork** and tell me what is the single most important thing to work on next. Target branch: **staging** (unless I say otherwise).

## How to run

1. `gh issue list --label "ReadyForWork" --state open --limit 100 --json number,title,labels,milestone,updatedAt,assignees` and format it readably.
2. Read the body of the strongest candidates (`gh issue view <n>`) — do not rank on titles alone.
3. Rank by, in order:
   - **Explicit priority labels** (`priority:p1` > `priority:p2` > unlabelled).
   - **Time-sensitivity / decay** — launch or announcement assets, PR-campaign-tied work, and factual-record corrections lose value fastest; weight them up.
   - **Blocking / dependency position** — an audit or foundational slice that unblocks several downstream issues outranks a leaf.
   - **Assignment** — deprioritise issues already assigned to someone; prefer unassigned work to avoid collisions.
   - **My current context** — note the branch I'm on and don't recommend work that collides with an in-flight track someone else owns.
4. Give **one** clear recommendation with the reason, then a short ranked runner-up list (2-4 items). Group the rest by track so I can see the shape of the backlog.

## Output

- Lead with the recommendation in one line.
- Then: why it wins over the runners-up (time-sensitivity, dependencies, priority).
- Then: a compact ranked list of the next few, plus any that are blocked/assigned and should be skipped.
- Do not start implementing. This is triage only unless I then ask you to pick one up (e.g. via the `work-issue` skill).
