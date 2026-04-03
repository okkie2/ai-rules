# Skills Inventory

## Purpose

This note is the maintained inventory of the current Codex skill system.

It makes the architecture in `skills-architecture.md` operational by listing:

- curated shared skills maintained by the user
- runtime `.system` skills provided for Codex operation
- plugin-contributed skills coming from installed plugins

Use this note to reduce drift, decide where new skills belong, and keep the distinction between global shared behavior, context skills, runtime skills, and plugin skills explicit.

## Classes

### Curated Shared Skills

Skills under `~/.codex/skills/` that represent the user's intended reusable operating system.

### Runtime System Skills

Skills under `~/.codex/skills/.system/` that support the Codex runtime itself.
These should not be treated as part of the user's curated taxonomy unless explicitly adopted into it.

### Plugin Skills

Skills shipped through plugin bundles under `~/.codex/plugins/`.
These are available capabilities, but they are not part of the curated shared-skill architecture.

## Curated Shared Skills

| Skill | Category | Status | Rationale |
|---|---|---|---|
| `agents-governance` | `decision-rules` | active | Governs what belongs in shared skills versus repo-local `AGENTS.md`. |
| `application-development` | `contexts` | active, new | Reusable coding context for application implementation across stacks without tying behavior to one language or framework. |
| `application-docs` | `contexts` | active, new | Reusable context for resumes, cover letters, and job-application positioning. |
| `bdd-regression` | `workflows` | active | Repeatable regression workflow for Gherkin/BDD coverage and checks. |
| `change-safety` | `core` | active | Cross-repo discipline for validating behavioral changes and reporting residual risk. |
| `cli-entrypoint-conventions` | `workflows` | active, borderline | Standardizes a repeatable CLI onboarding pattern; could later move if a clearer category emerges. |
| `code-review-discipline` | `core` | active | Findings-first review behavior and risk-oriented evaluation. |
| `commit-discipline` | `core` | active | Commit scoping and message quality across repositories. |
| `delivery-routine` | `workflows` | active | Multi-step delivery workflow after a logical unit of work. |
| `ai-rules-sync` | `workflows` | active, new | Governs safe repo-to-runtime sync and limited runtime-to-repo recovery for curated shared skills and rules. |
| `repo-health-review` | `workflows` | active, new | Reusable small and broad review routine for checking documentation, QA, architecture, planning, and operational drift after feature waves. |
| `model-routing-rules` | `decision-rules` | active | Cost-aware routing, escalation, and delegation policy for model use. |
| `observability-defaults` | `core` | active | Default logging and operational observability discipline. |
| `prompt-review-and-improvement` | `core` | active, new | Reusable default behavior for briefly tightening prompts before execution without becoming obstructive. |
| `readme-maintenance` | `core` | active | Keeps README files aligned with the live product or repository behavior. |
| `repo-hygiene` | `core` | active | Maintains changelog, todo, cleanliness, and end-of-work hygiene. |
| `skill-governance-review` | `decision-rules` | active | Reviews durable convention changes and updates the right governance layer. |
| `structural-analysis-writing` | `contexts` | active, new | Reusable context for spine-first analytical articles, memos, and decision writing. |
| `ubiquitous-language` | `core` | active | Keeps naming and domain terminology aligned across code, docs, and product language. |
| `writing-shortform` | `contexts` | active, new | Reusable context for LinkedIn posts, short opinion pieces, and compressed public writing. |

## Runtime System Skills

| Skill | Working Classification | Status | Notes |
|---|---|---|---|
| `.system/imagegen` | runtime capability | active | Useful system skill, but not part of the curated taxonomy by default. |
| `.system/openai-docs` | `platforms` | active | Runtime and platform support for OpenAI product and documentation help. |
| `.system/plugin-creator` | runtime capability | active | Tooling for creating plugins; keep separate from curated shared skills. |
| `.system/skill-creator` | runtime capability | active | Tooling for creating and revising skills; consults `skills-architecture.md`. |
| `.system/skill-installer` | runtime capability | active | Runtime support for installing skills; not part of the curated shared taxonomy. |

## Plugin Skills

### GitHub Plugin

| Skill | Classification | Status | Notes |
|---|---|---|---|
| `github` | `platforms` | active | General GitHub triage and orientation. |
| `gh-address-comments` | `platforms` | active | Review-thread and PR-comment handling workflow. |
| `gh-fix-ci` | `platforms` | active | GitHub Actions and CI debugging workflow. |
| `yeet` | `platforms` | active | Publish local changes to GitHub and open a PR. |

### Google Drive Plugin

| Skill | Classification | Status | Notes |
|---|---|---|---|
| `google-drive` | `platforms` | active | General Drive, Docs, Sheets, and Slides entrypoint. |
| `google-docs` | `platforms` | active | Google Docs inspection and editing. |
| `google-sheets` | `platforms` | active | General Google Sheets analysis and editing. |
| `google-sheets-chart-builder` | `platforms` | active | Sheets chart construction workflow. |
| `google-sheets-formula-builder` | `platforms` | active | Sheets formula design and repair workflow. |
| `google-slides` | `platforms` | active | General Google Slides inspection and editing. |
| `google-slides-import-presentation` | `platforms` | active | Import local presentation files into Slides. |
| `google-slides-template-migration` | `platforms` | active | Rebuild a deck on a target template. |
| `google-slides-template-surgery` | `platforms` | active | Structural deck rework. |
| `google-slides-visual-iteration` | `platforms` | active | Thumbnail-driven visual cleanup loop for decks. |

## Gaps And Current Direction

Current strengths:

- strong `core`
- clear `decision-rules`
- useful `workflows`
- growing `contexts`
- healthy plugin-based `platforms`

Current gap:

- `contexts` is still the thinnest curated category, though it is now established

Current promising context backlog:

- `client-engagement`
- `typescript-postgres-app`
- `flask-sqlite-app` only if recurrence proves it deserves to be shared

## Maintenance Rules

- Update this inventory when a new curated shared skill is added, removed, or reclassified.
- Update this inventory when a skill clearly changes category.
- Keep runtime `.system` skills separate from curated shared skills unless explicitly adopted.
- Keep plugin skills listed separately from curated shared skills.
- When repeated local guidance appears across repositories, evaluate whether it should move into the curated shared inventory.
