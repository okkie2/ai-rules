---
name: observability-defaults
description: Apply default observability discipline for user-facing failures and important operations. Use when Codex adds or changes UI or server behavior and should ensure that errors and key events are logged with enough structured context to support debugging and operational follow-up.
---

# Observability Defaults

## Purpose

Make important failures and operationally relevant behavior visible enough to diagnose later.

Use this skill whenever code changes can affect user-facing failures, integrations, background work, or other important operational paths.

## Workflow

1. Identify the user-visible or operationally important behavior
Find the actions, workflows, and failure paths that matter for debugging or support.

2. Check current observability
Determine what is already logged, emitted, or measured for the relevant path.

3. Add structured context
When adding or changing logging, include the fields that make later debugging possible.

4. Cover user-facing failures
Any error shown to a user should also be logged with enough context to investigate it later.

5. Keep signals useful
Prefer structured, factual, low-noise signals over verbose or duplicated logs.

## Rules

Any error surfaced to a user should also be captured in an operational signal such as structured logs or the repository's standard error-reporting path.

Prefer structured context over free-form text when the stack supports it.

Include relevant context where possible, such as:
- action or operation name
- user-visible workflow step
- internal entity identifiers
- external identifiers
- environment or integration name
- error code or category
- language or locale when relevant

Log enough to debug the issue later, but do not leak secrets, credentials, tokens, or unnecessary personal data.

Prefer consistent logging patterns within a repository instead of one-off formats.

When a repository already defines standard log sinks, event files, or error-reporting conventions, follow those conventions rather than inventing a new path.

Do not treat console-only output as sufficient if the repository has a more durable observability mechanism.

## Output Expectations

When this skill is used, Codex should:
- identify the relevant failure and event paths
- ensure user-visible failures are logged or reported
- add structured debugging context where practical
- follow the repository's existing observability conventions
- mention any remaining observability gaps or limits
