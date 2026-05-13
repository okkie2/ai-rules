---
name: todo-roadmap-prioritization
description: Organize `TODO.md` and `ROADMAP.md` into NOW/NEXT/LATER sections and rank related items by benefit divided by effort.
metadata:
  short-description: Structure TODO and ROADMAP by time horizon and priority
---

# TODO and ROADMAP Prioritization

## Purpose

Keep planning files useful as working queues rather than loose idea dumps.

Use this skill when the change is about priority, ordering, or time horizon inside planning files.

Use this skill when adding, editing, or reordering items in:

- `TODO.md`
- `ROADMAP.md`

## Default Structure

Organize each file into three time horizons:

- `NOW`: items that should be worked on immediately or are already in progress
- `NEXT`: items that are the next best candidates after `NOW`
- `LATER`: items that are valuable but should not be tackled soon

For `TODO.md`, keep items concrete and near-term.
For `ROADMAP.md`, keep items at a higher-level, longer-horizon abstraction.

Do not use this skill for README, changelog, or AGENTS.md maintenance unless the planning change depends on those files.

## Actionability Rule

`TODO.md` items must describe a concrete action that can be implemented in the repository. They should read like something you can do, verify, and complete.

If a proposed `TODO.md` item is phrased as a policy, boundary, or preservation statement, rewrite it into an action before adding it. In particular, avoid queue items that start with or depend on wording such as `keep`, `leave`, `avoid`, `pause`, `protect`, `hide from`, or `ignore`. Convert those into explicit tasks like `audit`, `remove`, `rename`, `split`, `move`, `add`, `rewrite`, or `enforce`.

When an idea is not directly actionable, place it in `ROADMAP.md` or repository docs instead of `TODO.md`.

## Workflow

1. Estimate benefit and effort
   Give each candidate item a rough relative score for:

   - benefit
   - effort

   Use the smallest useful scale for the repository. A simple `1-5` range is enough.

2. Compute priority
   Treat `priority = benefit / effort`.

   Higher values mean the item should appear earlier in its section.

3. Group related items
   Keep closely related items together as a set when they belong to the same feature wave or decision cluster.

   Rank sets by their overall benefit/cost first, then order the items inside each set.

4. Order within each horizon
   Within `NOW`, `NEXT`, and `LATER`, sort from highest to lowest priority.

   When two items are close:

   - prefer the item that unblocks other work
   - prefer the smaller item if the benefit is similar
   - keep related items grouped only when the grouping does not hide priority

5. Insert new items in place
   Do not append new work to the bottom by default.
   Place it where its priority and horizon belong, then adjust nearby items if needed.

6. Keep the files actionable
   `TODO.md` should stay focused on concrete next steps.
   `ROADMAP.md` should stay focused on larger direction and deferred work.

If an item is too vague to rank, clarify it first or move it to a more suitable note.

## Repository Default

For this repository:

- every new `TODO.md` or `ROADMAP.md` item should be ranked against the existing items in that file
- the default workflow is to update the relevant list in priority order as part of the same change
- if the ranking is not obvious, use a short rationale in the surrounding work rather than leaving the item unranked
