---
name: structural-analysis-writing
description: Write analytical articles, memos, and essays that explain structural patterns, document constrained decisions, or explore emerging spaces without bluffing certainty. Use when the user wants disciplined reasoning, evidence-aware writing, and a validated argument spine before full drafting.
metadata:
  short-description: Write disciplined structural analysis
---

# Structural Analysis Writing

Use this skill for serious analytical writing where the value lies in causal clarity, explicit trade-offs, and strong paragraph discipline.

Before deciding that a request belongs here, follow `/Users/joostokkinga/.codex/rules/skills-architecture.md`: this is a shared `contexts` skill for reusable analytical writing patterns rather than repo-local guidance.

## Core Rules

- Classify the piece type before drafting.
- Build and validate the spine before writing the article.
- Preserve one idea per paragraph.
- Prefer mechanism, constraint, and consequence over commentary.
- State uncertainty when evidence is weak.
- Do not hide trade-offs.
- Do not substitute section completeness for logical flow.

## Piece Types

Choose one first:

- structural: explains a generalisable pattern
- decision: records a real choice under constraint
- exploration: investigates an emerging space without full conclusions

If the type is unclear and the distinction matters, say so instead of bluffing a structure.

## Evidence Model

Use an evidence mix appropriate to the piece:

- external precedent
- structural reasoning
- field evidence when available

For decision pieces, field evidence is strongly preferred. If evidence is weak, say so plainly.

## Mandatory Analytical Spine

Every piece must show:

- what is happening
- why it happens
- what it breaks, constrains, or changes
- what it implies for design, policy, or action

Order may vary, but all four must be present.

## Spine Preview Workflow

Before drafting the article, produce a spine preview.

The spine is a linear sequence of paragraphs.
Each line contains:

- the core idea of the paragraph in one sentence
- its role in the argument

Format:

1. [Role] Core idea
2. [Role] Core idea
3. [Role] Core idea

Rules:

- maximum 8 paragraphs unless the user asks for a longer piece
- no prose elaboration in the spine
- no decorative sectioning
- the spine must carry the full causal arc

If the user is collaborating interactively, stop after the spine and wait for approval before drafting the full piece.
If the user clearly wants a complete draft in one pass, provide the spine first and then the article, but keep the spine visible.

## Type-Specific Requirements

### Structural

Must include:

- a clear claim
- the underlying mechanism
- at least one grounding example when practical
- the implication for design, governance, or system choice

### Decision

Must include:

- the initial situation
- the relevant dependency or constraint
- options considered
- explicit trade-offs
- final choice
- residual risk

This is not a product review or retrospective puff piece. It is a record of constrained choice.

### Exploration

Must include:

- what is being tested or examined
- why it matters structurally
- what is known versus unknown
- early signals without fake certainty

## Paragraph Discipline

The paragraph is the primary unit of reasoning.

Each paragraph must:

- express one idea only
- open with a clear sentence that establishes the point
- develop that point through tightly connected sentences
- close by locking the idea or creating forward pressure

If a paragraph introduces multiple independent ideas, rewrite it.

## Flow Rules

- each paragraph must follow logically from the previous one
- each paragraph must deepen the current idea or advance the argument by one step
- if paragraphs can be reordered without damage, the structure is too weak
- remove sentences that open new branches without being paid off

## Language Rules

- precise and non-performative
- no slogans unless they are testable and earned
- no filler
- no fake completeness sections
- write for a capable reader who is sceptical and short on time

## Output Contract

Default output:

- spine preview
- finished draft only when appropriate for the user's request
- short note on evidence strength and key assumptions

Optional additions when useful:

- alternative spine with a different emphasis
- explicit trade-off table for decision pieces
- list of missing evidence that would materially strengthen the piece

## Failure Conditions

Reject or rewrite the draft if:

- there is no usable spine
- the causal chain contains jumps
- paragraphs carry multiple ideas
- the structure is section-driven rather than reasoning-driven
- trade-offs are implied but not stated
- the piece is purely abstract without grounding
- the piece performs certainty it has not earned
