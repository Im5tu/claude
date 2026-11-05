#!/bin/bash
# PreToolUse hook for Bash. Blocks foreground polling loops (until/while ... sleep).
# Exit 2 blocks the call. Any other exit lets it through, so stay dependency-free (no jq).
input=$(cat)

# Pull out the command string. Falls back to the whole payload if the pattern misses.
re='"command"[[:space:]]*:[[:space:]]*"(([^"\\]|\\.)*)"'
cmd="$input"
if [[ "$input" =~ $re ]]; then cmd="${BASH_REMATCH[1]}"; fi

# Background runs are fine.
if [[ "$input" =~ \"run_in_background\"[[:space:]]*:[[:space:]]*true ]]; then exit 0; fi

# until/while loop whose body sleeps. The keyword must start a command (after ; & | ( { a quote or a
# newline), so the word "while" in prose or a heredoc doesn't match. Newlines arrive as the two characters \n.
sq="'"
pre="(^|[;&|({\"]|\\\\n|${sq})[[:space:]]*"
loop="${pre}(until|while)[[:space:]].*(;|\\\\n)[[:space:]]*do[[:space:]\\\\n].*sleep"
if [[ "$cmd" =~ $loop ]]; then
  echo "Blocked: foreground polling loop. Re-run it with run_in_background and wait for the completion notification, or use Monitor for a stream." >&2
  exit 2
fi
exit 0
