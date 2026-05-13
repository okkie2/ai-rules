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
| `agents-governance` | `decision-rules` | active | Places repository instruction changes in the right layer between shared skills and `AGENTS.md`. |
| `application-development` | `contexts` | active, new | Reusable coding context for application implementation across stacks without tying behavior to one language or framework. |
| `application-docs` | `contexts` | active, new | Reusable context for resumes, cover letters, and job-application positioning. |
| `bdd-regression` | `workflows` | active | Repeatable regression workflow for Gherkin/BDD coverage and checks. |
| `change-safety` | `core` | active | Cross-repo discipline for validating behavioral changes and reporting residual risk. |
| `cli-entrypoint-conventions` | `workflows` | active, borderline | Standardizes a repo-local CLI onboarding pattern for projects that expose a `menu` entrypoint. |
| `code-review-discipline` | `core` | active | Findings-first review behavior and risk-oriented evaluation. |
| `commit-discipline` | `core` | active | Commit scoping and message quality across repositories. |
| `delivery-routine` | `workflows` | active | Multi-step delivery workflow after a logical unit of work. |
| `ai-rules-sync` | `workflows` | active, new | Syncs curated shared skills and rules safely between the source repo and the live Codex runtime. |
| `repo-health-review` | `workflows` | active, new | Runs small and broad repository-health reviews after meaningful feature waves or durable document changes. |
| `model-routing-rules` | `decision-rules` | active | Cost-aware routing, escalation, and delegation policy for model use. |
| `observability-defaults` | `core` | active | Default logging and operational observability discipline. |
| `prompt-review-and-improvement` | `core` | active, new | Sharpens user prompts before execution when that materially improves the outcome. |
| `devops-concept-feedback` | `contexts` | active, new | Reusable context for reviewing DevOps terminology, concept distinctions, and learning prompts. |
| `readme-maintenance` | `core` | active | Keeps README files accurate and structurally consistent after repository changes. |
| `repo-hygiene` | `core` | active | Maintains changelog, todo, commit readiness, and end-of-work cleanliness. |
| `skill-governance-review` | `decision-rules` | active | Decides where durable convention changes belong across shared skills, repo guidance, and docs. |
| `structural-analysis-writing` | `contexts` | active, new | Reusable context for disciplined structural analysis, memos, and decision writing. |
| `ubiquitous-language` | `core` | active | Keeps domain terminology consistent across code, docs, and product language. |
| `writing-shortform` | `contexts` | active, new | Reusable context for concise public writing with a sharp argument and clear framing. |

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

## Runtime Local Exceptions To Rehome

These skills currently live only in the runtime `~/.codex/skills/` set and should remain separate from the curated shared inventory unless they are intentionally promoted later.

| Skill | Current Status | Suggested Home | Reason |
|---|---|---|---|
| `offgridos-single-local-instance` | archived runtime-local exception | `~/.codex/archive/skills/local-exceptions/offgridos-single-local-instance` | Encodes one repository's local runtime rule for a single app and canonical localhost URL. |
| `sqlite-neon-sync-safety` | archived runtime-local exception | `~/.codex/archive/skills/local-exceptions/sqlite-neon-sync-safety` | Encodes one repository's SQLite/Neon sync rule and database recency gate. |
| `inzagerecht-chat-log` | archived runtime-local exception | `~/.codex/archive/skills/local-exceptions/inzagerecht-chat-log` | Encodes one workspace-specific logging rule for the Inzagerecht folder. |
| `git-dual-push` | archived runtime-local exception | `~/.codex/archive/skills/local-exceptions/git-dual-push` | Encodes one exact dual-remote setup and should stay local unless the pattern generalizes. |

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
- Keep runtime-local exceptions listed separately until they are deliberately promoted into the curated shared set or intentionally archived out of the active runtime load path.
- When repeated local guidance appears across repositories, evaluate whether it should move into the curated shared inventory.
