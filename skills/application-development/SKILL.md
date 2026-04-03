---
name: application-development
description: Build software applications with disciplined implementation habits that are not tied to one language or framework. Use when coding work involves application behavior, interfaces, workflows, data boundaries, or maintainability concerns and Codex should favor clear slices, simple designs, coherent boundaries, and practical verification over stack-specific dogma.
metadata:
  short-description: Build apps cleanly across stacks
---

# Application Development

Use this skill for software implementation work where the goal is to build or change an application cleanly, safely, and without overengineering.

Before deciding that a request belongs here, follow `/Users/joostokkinga/Code/ai-rules/rules/skills-architecture.md`: this is a shared `contexts` skill because it covers a recurring kind of project context, but is not universal enough to be a `core` rule.

## Objective

Deliver application changes that are:

- clearly scoped
- easy to understand
- consistent with existing architecture
- safe to verify
- maintainable after the current task

This skill is intentionally not tied to one language, framework, or stack.

## Core Rules

- Prefer the simplest design that satisfies the current requirement.
- Slice work by behavior and responsibility, not by abstract purity.
- Keep boundaries clear between UI, application logic, data access, and integration edges when those layers exist.
- Avoid introducing new abstractions unless they remove real repetition, risk, or complexity.
- Let the repository's existing architecture win unless it is clearly harmful.
- Keep implementation and verification aligned: if behavior changed, verification should change too.
- Make state changes, failure paths, and data flow easy to trace.

## Default Workflow

1. Identify the behavioral change.
2. Locate the relevant boundary:
   - UI
   - application logic
   - data access
   - integration edge
   - workflow orchestration
3. Choose the smallest coherent implementation slice.
4. Reuse existing patterns unless they are actively causing problems.
5. Add or adjust verification at the behavior boundary that changed.
6. Leave the changed area more understandable than before.

## Implementation Heuristics

### Scope The Change Cleanly

- prefer one clear responsibility per change
- avoid mixing feature work, refactors, and broad cleanup unless they are inseparable
- if a task touches multiple layers, keep the reason for each touched layer explicit

### Respect Existing Structure

- follow current naming, folder, and module boundaries unless there is a strong reason not to
- do not introduce a new pattern just because it is fashionable
- if the repository already has a local way of doing things, fit into it first

### Keep Data Flow Legible

- make inputs, transformations, writes, and outputs easy to follow
- avoid hidden side effects
- avoid spreading one logical change across too many files without a good reason

### Be Careful With Abstractions

Good reasons to add an abstraction:

- real duplication exists
- a boundary needs to become explicit
- testing or replacement becomes materially easier
- the abstraction reduces present complexity

Bad reasons to add an abstraction:

- theoretical future reuse only
- style preference
- copying architecture from another stack without a local need

## Design Bias

Bias toward:

- explicit behavior
- clear interfaces
- stable naming
- low-surprise control flow
- practical maintainability

Bias away from:

- speculative architecture
- hidden indirection
- abstraction layers with no current payoff
- large rewrites when a local repair will do

## Verification Expectations

This skill does not replace `change-safety`, but it should push work toward verifiable slices.

When using this skill:

- identify the changed behavior boundary
- prefer verification that matches that boundary
- avoid finishing implementation in a state that is hard to test or reason about

## Output Expectations

When this skill is used, Codex should:

- name the implementation slice clearly
- explain which boundary is being changed
- prefer simple, readable changes over stack-specific cleverness
- avoid unnecessary abstraction
- leave behavior and verification aligned

## Boundaries

- Do not turn this skill into framework-specific advice.
- Do not use this skill to override stronger repo-local architecture rules.
- Do not use this skill as a substitute for testing, review, commit, or delivery workflows owned by other skills.
