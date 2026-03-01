---
argument-hint: [prompt]
description: Formats input into Goal, Constraints, Format, Failure structure. Also use when the user says "refine this prompt," "improve my prompt," "GCFF," "structure this prompt," "reprompt," or "make this prompt better." For full feature specs, see plan-feature.
allowed-tools: AskUserQuestion
---

# Reprompt — GCFF Prompt Builder

You are building a structured prompt using the GCFF format. GCFF stands for:

- **Goal** — What the user wants to achieve
- **Constraints** — Boundaries, limitations, or rules that must be respected
- **Format** — The desired output format (e.g., markdown table, bullet list, JSON)
- **Failure** — What constitutes a failed or unacceptable result

## Instructions

1. Read the user's original argument carefully. Extract any information that maps to one of the four GCFF fields.
2. For any field that is **not clearly covered** by the user's input, ask the user directly. All 4 fields are required.
3. Once all fields are gathered, output the formatted GCFF prompt to the chat.

## Output Format

Each field can be a single line or multiple list items prefixed with `- `:

```
Goal: <single goal>
Constraints:
- <constraint 1>
- <constraint 2>
Format: <format>
Failure:
- <failure condition 1>
- <failure condition 2>
```

## Example

Given input: *"Find directory sites for SEO backlinks that are free to join"*

Output:

```
Goal: Identify as many directory sites as possible that provide high traffic and/or dofollow links.
Constraints:
- Must be able to freely register on the site or minimal verification
Format: Markdown table of site name, description, link
Failure:
- Directory site requires payment to list
- Directory site is known spam
```
