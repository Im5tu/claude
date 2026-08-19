#!/usr/bin/env python3
"""SessionStart hook: inject the fable-mode skill when the session model isn't Fable.

Reads the SessionStart JSON from stdin. If the `model` field contains "fable",
does nothing. Otherwise (including when `model` is absent) it injects the body
of ~/.claude/skills/fable-mode/SKILL.md as additionalContext so non-Fable
models pick up Fable's operating habits automatically.

Never blocks session start: any error exits 0 with no output.
"""
import json
import sys
from pathlib import Path

SKILL_PATH = Path.home() / ".claude" / "skills" / "fable-mode" / "SKILL.md"


def strip_frontmatter(text: str) -> str:
    if text.startswith("---"):
        parts = text.split("---", 2)
        if len(parts) == 3:
            return parts[2].strip()
    return text.strip()


def main() -> None:
    try:
        payload = json.load(sys.stdin)
    except Exception:
        payload = {}

    model = str(payload.get("model", "")).lower()
    if "fable" in model:
        return  # Fable already has these habits natively

    body = strip_frontmatter(SKILL_PATH.read_text(encoding="utf-8"))
    context = (
        "Auto-activated fable-mode (session model is not Fable): follow these "
        "operating habits for this entire session.\n\n" + body
    )
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "SessionStart",
            "additionalContext": context,
        }
    }))


if __name__ == "__main__":
    try:
        main()
    except Exception:
        pass  # never break session start
    sys.exit(0)
