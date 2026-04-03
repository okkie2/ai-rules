---
name: code-review-discipline
description: Findings-first code review for evaluate/review/assess requests. Use when the user asks for a code review, evaluation, risk assessment, PR review, or asks whether a change is safe, robust, or production-ready.
---

# Code Review Discipline

Use this skill for explicit review tasks.

## Purpose

Produce a senior-engineer review that prioritizes real defects, regressions, weak assumptions, missing tests, and operational risk.

## When To Use

Use this skill when the user asks to:
- review
- evaluate
- assess
- do a PR review
- look for risks or regressions
- check whether a change is safe or production-ready

Do not switch into full review-output mode for normal implementation tasks.
For normal coding work, do a short internal review pass before delivery and only surface findings when they are material or unresolved.

## Review Standard

Prioritize:
- correctness bugs
- behavioral regressions
- restart, recovery, concurrency, and state-management risks
- missing or weak integration coverage
- misleading config, dead abstractions, and drift between runtime truth and operator-visible status

De-prioritize:
- formatting nits
- stylistic preferences
- optional refactors unless they block safety or maintainability

## Workflow

1. Inspect the actual diff and surrounding code, not just changed lines.
2. Trace the affected runtime flow end to end.
3. Check whether tests match the real risk boundary.
4. Look for contradictions between code, docs, config, and runtime behavior.
5. Report only concrete findings you can defend from the code.

## Output Format

Present findings first, ordered by severity.
For each finding include:
- severity
- concise title
- why it matters in practice
- file and line reference
- the failure mode or regression

After findings, include only when useful:
- open questions or assumptions
- brief change summary
- residual risk if no concrete finding was found

If there are no findings, say so explicitly.
Then note the main residual risks or testing gaps.

## Rules

Do not pad reviews with praise or generic summaries.
Do not invent speculative issues without code evidence.
Prefer a small number of high-signal findings over a long weak list.
When a concern is uncertain, label it as uncertainty and explain what evidence is missing.
