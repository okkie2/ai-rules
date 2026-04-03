# USERMANUAL

## Purpose

This manual explains:

- how `ai-rules` is set up
- how it relates to the live Codex runtime under `~/.codex`
- how to sync changes safely
- what each curated shared skill does
- an example prompt for each skill

## Mental Model

Use this split:

- `~/Code/ai-rules` = versioned source of truth
- `~/.codex` = live runtime used by Codex

Default workflow:

1. edit shared skills or rules in `~/Code/ai-rules`
2. commit the change there
3. run a dry run of the sync
4. sync from repo to `~/.codex`
5. verify behavior in the live runtime

Do not treat `~/.codex` as the long-term source of truth.

## Repository Layout

- `skills/`
  - curated shared skills you maintain
- `rules/`
  - architecture notes and maintained inventories for the skill system
- `scripts/`
  - sync helpers between `ai-rules` and the live Codex runtime
- `README.md`
  - short repo entrypoint
- `DOALWAYS.md`
  - standing rules that always apply in this repository
- `USERMANUAL.md`
  - this practical guide
- `AGENTS.md`
  - repo-local operating guidance for maintaining this repo
- `CHANGELOG.md`
  - completed meaningful changes
- `TODO.md`
  - next actions
- `ROADMAP.md`
  - larger future direction

## Setup

### 1. Use This Repo As Canonical

Work in:

- `~/Code/ai-rules`

Keep the runtime separate:

- `~/.codex`

### 2. Keep Runtime-Managed Content Out Of Scope

This repo is for curated shared content only.

Do not manage here:

- `~/.codex/skills/.system`
- plugin cache content
- repo-local project guidance from other repositories

### 3. Sync Safely

Available scripts:

- [scripts/sync-to-codex.sh](scripts/sync-to-codex.sh)
- [scripts/sync-from-codex.sh](scripts/sync-from-codex.sh)

Normal path:

```bash
zsh ~/Code/ai-rules/scripts/sync-to-codex.sh --dry-run
zsh ~/Code/ai-rules/scripts/sync-to-codex.sh
```

Recovery path only:

```bash
zsh ~/Code/ai-rules/scripts/sync-from-codex.sh --dry-run
zsh ~/Code/ai-rules/scripts/sync-from-codex.sh
```

Use `sync-from-codex.sh` only when live runtime edits happened first by accident or during bootstrap.

### 4. Typical Maintenance Flow

```bash
cd ~/Code/ai-rules
git status
# edit files
git add .
git commit -m "..."
zsh ~/Code/ai-rules/scripts/sync-to-codex.sh --dry-run
zsh ~/Code/ai-rules/scripts/sync-to-codex.sh
git push origin main
```

## Standing Rules

See [DOALWAYS.md](DOALWAYS.md) for the rules that always apply in this repository.

## Curated Shared Skills

Below is the current curated shared skill set, grouped by category.

### Core

`change-safety`
- what it does: chooses sensible verification for behavior changes and reports residual risk
- example: `Use $change-safety to verify whether this UI change has enough regression coverage.`

`code-review-discipline`
- what it does: enforces findings-first review instead of vague commentary
- example: `Use $code-review-discipline to review this change for bugs and missing tests.`

`commit-discipline`
- what it does: keeps commits small, coherent, and well messaged
- example: `Use $commit-discipline to decide whether these staged changes belong in one commit.`

`observability-defaults`
- what it does: adds logging and operational observability where user-facing changes need it
- example: `Use $observability-defaults to check whether this new failure path logs enough context.`

`prompt-review-and-improvement`
- what it does: briefly sharpens prompts when useful without blocking execution
- example: `Use $prompt-review-and-improvement to assess this prompt and tighten it only if it helps.`

`readme-maintenance`
- what it does: keeps `README.md` useful, narrative, and aligned with current behavior
- example: `Use $readme-maintenance to update the README after this repo structure change.`

`repo-hygiene`
- what it does: keeps changelog, todo, and repo state clean after meaningful work
- example: `Use $repo-hygiene to update the housekeeping docs after this feature wave.`

`ubiquitous-language`
- what it does: keeps naming and canonical terminology consistent
- example: `Use $ubiquitous-language to check whether this new term conflicts with existing vocabulary.`

### Decision-Rules

`agents-governance`
- what it does: decides what belongs in shared skills versus repo-local `AGENTS.md`
- example: `Use $agents-governance to decide whether this new rule belongs globally or in the repo.`

`model-routing-rules`
- what it does: guides model choice, reasoning effort, and delegation strategy
- example: `Use $model-routing-rules to choose the cheapest viable model path for this task.`

`skill-governance-review`
- what it does: updates the right governance layer when durable conventions change
- example: `Use $skill-governance-review to reflect this new documentation convention in the right place.`

### Workflows

`ai-rules-sync`
- what it does: governs safe sync between `ai-rules` and the live Codex runtime
- example: `Use $ai-rules-sync to deploy the latest shared skill changes from ai-rules to ~/.codex.`

`bdd-regression`
- what it does: runs and maintains BDD/Gherkin regression coverage
- example: `Use $bdd-regression to add and run coverage for this new CRUD flow.`

`cli-entrypoint-conventions`
- what it does: standardizes discoverable local CLI entrypoints such as `menu`
- example: `Use $cli-entrypoint-conventions to design a root-level interactive command menu for this CLI repo.`

`delivery-routine`
- what it does: guides the last-mile delivery workflow after a logical change set is ready
- example: `Use $delivery-routine to prepare this branch for delivery.`

`parallel-git-workflow`
- what it does: coordinates safe multi-agent git work with branch ownership, worktrees, and integration rules
- example: `Use $parallel-git-workflow to split this feature across three agents without merge chaos.`

`repo-health-review`
- what it does: runs small or broad repository-health reviews after meaningful feature waves
- example: `Use $repo-health-review to check whether the last feature wave left docs or QA drift behind.`

### Contexts

Current implemented contexts:

`application-development`
- what it does: guides software implementation in a language-agnostic way, with clear boundaries, simple designs, and practical verification
- example: `Use $application-development to implement this application change cleanly without overengineering it.`

`application-docs`
- what it does: creates tailored resumes and cover letters for job applications
- example: `Use $application-docs to tailor my resume and cover letter to this vacancy.`

`structural-analysis-writing`
- what it does: writes spine-first analytical articles, memos, and decision notes
- example: `Use $structural-analysis-writing to draft a decision memo with explicit trade-offs and residual risk.`

`writing-shortform`
- what it does: writes compact public pieces such as LinkedIn posts or short blog posts
- example: `Use $writing-shortform to draft a LinkedIn post about AI skills.`

Important missing context family:

- deeper coding contexts beyond the new generic application-development layer

Planned high-value coding contexts:

- `typescript-postgres-app`
- `flask-sqlite-app` if recurrence proves it deserves to be shared

## Runtime And Plugin Skills

This repo focuses on curated shared skills.

Other live skill surfaces exist, but are not the same thing:

- runtime `.system` skills under `~/.codex/skills/.system`
- plugin-provided skills in plugin caches

Do not treat those as curated shared source unless you explicitly decide to vendor them.

## When To Add A New Shared Skill

A new skill is a good candidate when:

- it recurs across multiple repos or sessions
- it is specific enough to change outcomes
- it keeps getting re-explained
- it is not better expressed as a short repo-local rule

Before creating or revising one, make an explicit placement decision:

- global shared skill
- context shared skill
- repo-local guidance
- temporary local exception

## Related Documents

- [README.md](/Users/joostokkinga/Code/ai-rules/README.md)
- [AGENTS.md](/Users/joostokkinga/Code/ai-rules/AGENTS.md)
- [rules/skills-architecture.md](/Users/joostokkinga/Code/ai-rules/rules/skills-architecture.md)
- [rules/skills-inventory.md](/Users/joostokkinga/Code/ai-rules/rules/skills-inventory.md)
- [scripts/sync-to-codex.sh](/Users/joostokkinga/Code/ai-rules/scripts/sync-to-codex.sh)
- [scripts/sync-from-codex.sh](/Users/joostokkinga/Code/ai-rules/scripts/sync-from-codex.sh)
