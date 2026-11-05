#!/bin/bash
# PreToolUse hook for Bash, declared in author agents only. Blocks whole-suite test runs.
# Authors run affected tests by file, package or filter. The verifier agent has no such hook.
# Override: put ALLOW_FULL_SUITE=1 in the command. Exit 2 blocks. No jq dependency.
input=$(cat)

re='"command"[[:space:]]*:[[:space:]]*"(([^"\\]|\\.)*)"'
cmd="$input"
if [[ "$input" =~ $re ]]; then cmd="${BASH_REMATCH[1]}"; fi

case "$cmd" in *ALLOW_FULL_SUITE=1*) exit 0 ;; esac

# "<tool> test" followed only by flags (no path, package or filter), then the end or a shell operator.
# A flag followed by a value, for example "--filter X" or "-p crate", leaves a bare word and does not match.
flags='([[:space:]]+-{1,2}[A-Za-z][A-Za-z0-9=_.:-]*)*[[:space:]]*($|[;&|])'
block=0
[[ "$cmd" =~ (^|[^A-Za-z])flutter[[:space:]]+test$flags ]] && block=1
[[ "$cmd" =~ (^|[^A-Za-z])dotnet[[:space:]]+test$flags ]] && block=1
[[ "$cmd" =~ (^|[^A-Za-z])cargo[[:space:]]+(nextest[[:space:]]+run|test)$flags ]] && block=1
[[ "$cmd" =~ (^|[^A-Za-z])(pnpm|npm|yarn)[[:space:]]+(run[[:space:]]+)?test$flags ]] && block=1
gore='(^|[^A-Za-z])go[[:space:]]+test[^;&|]*[.][/][.][.][.]'
cargore='(^|[^A-Za-z])cargo[[:space:]]+test[^;&|]*--workspace'
[[ "$cmd" =~ $gore ]] && block=1
[[ "$cmd" =~ $cargore ]] && block=1

if [ "$block" = 1 ]; then
  echo "Blocked: whole-suite test run. Run only the affected tests (by file, package or filter) using the repo CLAUDE.md Verification section. The verifier agent runs wider suites. Put ALLOW_FULL_SUITE=1 in the command only if the brief says so." >&2
  exit 2
fi
exit 0
