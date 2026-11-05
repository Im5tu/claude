#!/bin/bash
# PreToolUse hook for the Agent tool, declared in Sonnet author and reviewer agents.
# Sonnet agents may fan out only to Haiku. Exit 2 blocks. No jq dependency.
input=$(cat)

model=""; type=""
re_model='"model"[[:space:]]*:[[:space:]]*"([^"]*)"'
re_type='"subagent_type"[[:space:]]*:[[:space:]]*"([^"]*)"'
if [[ "$input" =~ $re_model ]]; then model="${BASH_REMATCH[1]}"; fi
if [[ "$input" =~ $re_type ]]; then type="${BASH_REMATCH[1]}"; fi

# Explicit Haiku model on the call.
case "$model" in *haiku*|*Haiku*) exit 0 ;; esac

# Roster agents whose own definition pins Haiku, called without a model override.
if [ -z "$model" ]; then
  case "$type" in explorer|ci-watcher) exit 0 ;; esac
fi

echo "Blocked: Sonnet agents may only spawn Haiku agents. Use the explorer agent, or pass model haiku. Anything bigger goes back to the parent in your report." >&2
exit 2
