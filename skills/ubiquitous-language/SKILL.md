---
name: ubiquitous-language
description: Keep domain terminology consistent across product, code, and documentation. Use when Codex is adding, renaming, or removing important domain concepts, labels, statuses, relation types, workflow terms, or glossary entries and should align implementation with the project's canonical language.
---

# Ubiquitous Language

## Purpose

Keep core domain terminology aligned across the product, codebase, and documentation.

Use this skill whenever important concepts are introduced, renamed, removed, or clarified.

## Workflow

1. Find the canonical source
Locate the repository's glossary, terminology files, or other canonical domain-language source.

2. Check proposed terminology
Before adding or renaming important concepts, compare the proposed terms against the canonical source.

3. Align implementation and language
Keep user-facing labels, domain model names, statuses, relation types, workflow terms, and documentation aligned unless there is a documented reason to differ.

4. Update the glossary with the change
When a concept is added, changed, or removed in the product, update the canonical terminology source in the same change when practical.

5. Surface deliberate exceptions
If a term must differ across contexts, document the reason clearly and keep the difference intentional.

## Rules

Treat the repository's canonical glossary or terminology source as authoritative for core concepts.

Before changing important terms in the UI, domain model, documentation, or workflow descriptions, consult the canonical source.

If a concept is used in the product but missing from the glossary, add it before or alongside the implementation when practical.

Prefer consistent terminology across:
- UI labels
- domain objects
- statuses and relation types
- workflow steps
- documentation
- validation and feedback messages

Do not introduce near-synonyms for core concepts without a deliberate reason.

When renaming a concept, update the affected code and documentation together when practical to avoid partial drift.

## Output Expectations

When this skill is used, Codex should:
- identify the canonical terminology source
- check whether the proposed language matches existing domain terms
- update glossary entries when needed
- keep code, UI, and docs aligned around the same concepts
