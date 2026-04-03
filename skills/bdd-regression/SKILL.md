---
name: bdd-regression
description: Run and maintain the Gherkin/BDD regression test suite. Use when adding or changing CRUD routes, when asked to run regression tests, or when new features need test coverage added to the feature files.
---

# BDD Regression

## Purpose

Keep the Gherkin feature files and their step definitions in sync with the application's actual behavior. BDD tests serve two purposes at once: they are a readable specification (anyone can read the `.feature` files) and a runnable regression suite.

## When to apply this skill

- A new Flask route is added or an existing one changes its behavior
- A CRUD operation is added, removed, or renamed
- The user asks to "run the tests" or "check for regressions"
- After any work session where `app.py` routes were changed

## How to run

```bash
python3 -m pytest tests/step_defs/ -v
```

All scenarios must pass before the work is considered done. A failing scenario means either the code is broken or the test needs updating — determine which before moving on.

To run alongside the full existing suite:

```bash
python3 -m pytest tests/ -v
```

## How to maintain the feature files

### When a new route is added

1. Identify which entity and operation it affects (statement, source, relation).
2. Open the relevant `.feature` file in `tests/features/`.
3. Add one Scenario per meaningful behavior:
   - The happy path (operation succeeds)
   - The main error path (missing field, duplicate, blocked in read-only)
   - Any cascade or side-effect (e.g. delete removes relations)
4. Add the matching step definitions in `tests/step_defs/`.
5. Run the suite and confirm the new scenarios pass.

### When a route changes behavior

Update or replace the affected Scenario. Do not leave stale scenarios that no longer reflect what the app does — they become misleading documentation.

### When a step definition is missing

pytest-bdd reports `StepDefinitionNotFoundError` with the exact line from the feature file. Write the step function in the relevant `test_*.py` file using the exact phrasing from the error message.

## Structure of this project's BDD suite

```
tests/
  features/
    statement_crud.feature   # Create, read, update, delete for statements
    source_crud.feature      # Create, read, update, delete for source links
  step_defs/
    conftest.py              # Function-scoped test_db: each scenario gets a fresh DB
    test_statement_crud.py   # Step definitions for statement_crud.feature
    test_source_crud.py      # Step definitions for source_crud.feature
  conftest.py                # Shared client and readonly_client fixtures
```

## Rules

Never leave a new CRUD route without at least one Scenario covering its happy path.

Each Scenario must be independently runnable — no scenario may depend on state left by a previous one. The function-scoped `test_db` fixture enforces this: each scenario starts from a clean seed.

Step definitions must use `ctx["db_path"]` (not `flask_module.DB`) when querying the database directly, so the correct test database is always used.

When two `@when` or `@then` step patterns could match the same feature line, make the patterns distinct. Use clearly different phrasing rather than relying on parser greediness.

Keep Gherkin readable: steps should read like plain sentences, not like code. If a step is hard to read, rewrite the phrasing.

## Gherkin style guide (for novice developers)

**Given** sets up the world before the action. Usually just one line:
```gherkin
Given the app is running with the test fixture
```

**When** describes the single action being tested. One action per scenario:
```gherkin
When I delete item "EU-02.01"
```

**Then** describes what should be true after. Use multiple `And` lines for multiple assertions:
```gherkin
Then I am redirected to item "EU-02"
And item "EU-02.01" no longer exists in the database
And no relations remain for the deleted item in the database
```

**Background** (optional): steps that repeat in every scenario in a feature can be moved to a `Background:` block at the top. This project uses inline `Given` instead, which is fine for a small suite.

Do not put assertions in `When` steps or actions in `Then` steps. The separation makes failures easier to diagnose.
