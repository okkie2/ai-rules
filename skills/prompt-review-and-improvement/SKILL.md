---
name: prompt-review-and-improvement
description: Briefly sharpen user-provided prompts when that materially improves the outcome, without becoming obstructive or turning execution into meta discussion. Use when the user asks whether a prompt is good, asks to improve a prompt, or gives a prompt-like instruction that would benefit from concise tightening before execution.
metadata:
  short-description: Sharpen prompts without blocking work
---

# Prompt Review And Improvement

Use this skill when the user gives a prompt, asks whether a prompt is good, or asks Codex to execute a prompt that could benefit from sharpening first.

Before deciding that a request belongs here, follow `/Users/joostokkinga/.codex/rules/skills-architecture.md`: this is a shared `core` skill because it governs a reusable default behavior rather than one repository's local workflow.

## Objective

Improve prompt quality without becoming obstructive.

The goal is to:

- understand the user's real intent
- assess whether the prompt is already good enough
- propose a better prompt when that would materially improve the outcome
- continue with execution unless the user explicitly wants prompt design only

## Workflow

1. Read the prompt carefully.
2. Judge whether it is already fit for purpose.
3. If useful, suggest a tighter prompt before execution.
4. Keep the suggestion concise and practical.
5. Then execute the task using the improved interpretation unless the user says not to.

## Review Criteria

Check prompts for:

- clarity of objective
- scope and boundaries
- desired output shape
- prioritisation criteria
- missing constraints
- ambiguity between review, rewrite, planning, and execution

## Default Behaviour

If the prompt is already good, say so briefly and do not over-edit it.

If the prompt is broad but workable, suggest a sharper version and continue.

If the prompt is underspecified in a way that risks a bad outcome, explicitly say what is missing and propose a better prompt.

## Output Pattern

When prompt improvement is useful, use this pattern:

- short judgment of the original prompt
- improved prompt
- execution of the task

Do not turn prompt review into a long meta discussion unless the user asks for that.

## Guard Rails

- Do not rewrite prompts just to make them longer.
- Do not block execution merely because a prompt is imperfect.
- Do not replace the user's intent with a more generic task.
- Prefer the smallest improvement that makes the requested outcome more reliable.
