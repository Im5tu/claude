---
description: Scan AWS Lambda logs for errors and produce a triage report
---

# AWS Lambda Error Check

Scan CloudWatch log groups for Lambda errors and produce a categorised triage report.

## Workflow

1. **Read AWS profiles** — Parse `~/.aws/config` to extract all `[profile X]` names. Exclude any profile whose `endpoint_url` points to `localhost` or `127.0.0.1`, and any profile that lacks SSO configuration (`sso_start_url` or `sso_session`). Collect the remaining profiles as valid choices.

2. **Ask: profile** — Present the discovered profiles to the user via `AskUserQuestion`. If only one valid profile exists, confirm it instead of asking.

3. **Ask: environment** — Present environment choices via `AskUserQuestion`:
   - "All" — no filter, discover all `/aws/lambda/` log groups
   - "Staging" — filter log groups matching `*staging*`
   - "Production" — filter log groups matching `*prod*`
   - "Other" — ask the user to specify a custom glob pattern

4. **Ask: time window** — Present time window choices via `AskUserQuestion`:
   - 1 hour
   - 3 hours
   - 6 hours
   - 12 hours (Recommended)
   - 24 hours

   Calculate the start time as epoch milliseconds: `now minus chosen duration`.

5. **Discover log groups** — Run:
   ```bash
   MSYS_NO_PATHCONV=1 aws logs describe-log-groups \
     --log-group-name-prefix "/aws/lambda/" \
     --profile <chosen-profile>
   ```
   Filter the returned log group names by the environment pattern chosen in step 3. If no log groups match, report that and stop.

6. **Detect log format** — For each log group, fetch a small sample (1–2 events) to determine whether logs are JSON-structured or plain text. If the message body parses as JSON and contains a `level` property, treat the group as JSON-formatted. Otherwise treat it as plain text.

7. **Query each log group** — For every discovered log group, use the appropriate filter pattern based on detected format:

   **JSON logs** (has `level` property):
   ```bash
   MSYS_NO_PATHCONV=1 aws logs filter-log-events \
     --log-group-name "<group>" \
     --start-time <epoch-ms> \
     --filter-pattern "{ $.level = \"ERROR\" || $.level = \"error\" || $.level = \"FATAL\" || $.level = \"fatal\" }" \
     --profile <chosen-profile>
   ```

   **Plain text logs** (fallback):
   ```bash
   MSYS_NO_PATHCONV=1 aws logs filter-log-events \
     --log-group-name "<group>" \
     --start-time <epoch-ms> \
     --filter-pattern "?ERROR ?\"Task timed out\" ?\"Runtime.UnhandledPromiseRejection\" ?\"Runtime.ExitError\" ?\"5xx\" ?\"Exception\" ?\"FATAL\"" \
     --profile <chosen-profile>
   ```

   Collect all matching events across all log groups.

8. **Generate triage report** — If errors were found, produce a structured report:
   - **Summary stats** — total errors, log groups with errors, time window
   - **Error categories** — group errors by type (timeout, unhandled exception, 5xx, etc.), each with:
     - Count of occurrences
     - Affected log groups
     - First and last seen timestamps
     - One representative raw log snippet
   - **Recurring patterns** — identify errors that appear across multiple groups or repeat frequently
   - **Likely root causes** — brief analysis of probable causes based on error patterns

9. **No-errors path** — If no errors were found, still report:
   - Number of log groups scanned
   - Total events checked
   - Time window covered
   - Confirmation that no error signals were detected

## Rules

- Prefix every AWS CLI call with `MSYS_NO_PATHCONV=1` to prevent MSYS path mangling
- Always use `--profile <chosen-profile>` on every AWS CLI call
- This command is read-only — never modify any AWS resources
- If an AWS CLI call fails (expired credentials, access denied, etc.), report the error clearly and stop
- Only surface errors — do not include warnings, info, debug, or `REPORT` messages
- Do not cap or limit the number of events pulled — retrieve all events within the time window
