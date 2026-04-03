---
name: writing-shortform
description: Write strong short-form public writing such as LinkedIn posts, brief blog posts, and compact opinion pieces. Use when the user wants a concise post with a clear argument, sharp framing, strong compression, and audience-aware tone instead of longform exposition.
metadata:
  short-description: Write sharp short-form pieces
---

# Writing Shortform

Use this skill for short public-facing writing where the unit of value is a compact argument, not exhaustive coverage.

Before deciding that a request belongs here, follow `/Users/joostokkinga/.codex/rules/skills-architecture.md`: this is a shared `contexts` skill for reusable short-form writing patterns rather than repo-local guidance.

## Core Rules

- Choose the pattern before drafting.
- Propose a spine before drafting full copy.
- Refine the opening line or headline last for attention and conversion.
- Make one core claim only.
- Expose the mechanism underneath the claim instead of stacking opinions.
- Prefer compression, contrast, and consequence over completeness.
- Write for a capable reader who is sceptical and short on time.
- End with a rule, implication, or sharp closing line that reduces wiggle room.
- Do not pad with slogans, vague uplift, or decorative abstraction.

## Inputs

Required:

- the topic or thesis
- the target channel if known, such as LinkedIn, newsletter, short blog, or internal note

Optional:

- audience
- preferred tone
- constraints on length
- source material or examples
- house style or brand voice
- request for image support

If the brief is thin, infer a plausible default structure and state assumptions after drafting.

## Workflow

1. Identify the single idea that the piece must land.
2. Choose the best structural pattern before writing.
3. Propose a short spine before drafting the full piece.
4. Draft to one clear argumentative arc that follows the spine.
5. Cut anything that does not sharpen the claim, mechanism, or implication.
6. Ensure the ending closes the thought rather than fading out.
7. Refine the opening line or headline last for maximum relevant attention and conversion.

## Spine

The spine is a short sequence of lines that captures the movement of the piece before full drafting.

Default format:

1. Hook or setup
2. Reframe or reveal
3. Mechanism or consequence
4. Rule, implication, or close

Keep the spine short and linear. Do not draft the full post until the movement is clear.

## Pattern Selection

Use a simple high-level pattern such as:

- belief -> breakdown -> rule
- surface -> hidden layer -> consequence
- frame -> reframe -> heuristic
- goal -> anti-goal -> mirror
- continuum -> threshold -> regime change
- asset -> dependency -> control test
- signal -> metric -> behaviour

Choose one pattern only unless the user explicitly asks for variants.

For concrete prompts and examples, read `references/patterns.md`.

## Drafting Guidance

- The opening should create immediate orientation or tension.
- The first line should be refined after the body is stable, so it optimizes for attention without distorting the argument.
- The middle should reveal why the obvious framing is incomplete or wrong.
- The close should compress the argument into an actionable rule, sharper framing, or durable implication.
- Prefer concrete nouns and causal verbs.
- Use examples when they clarify the mechanism, not as decoration.
- Keep the number of moving parts low.

## Channel Notes

### LinkedIn

- Strong hook in the first line.
- Visible line breaks are allowed if they improve scanability.
- Keep the argument compact enough to read quickly on mobile.
- Do not drift into thread-like over-explanation.

### Short Blog Post

- Allow slightly more setup than a LinkedIn post.
- Still optimize for one idea and one arc.
- Avoid turning a short piece into a disguised longform article.

## Optional Image Support

If the user wants a companion concept image, keep the writing and image tightly coupled around one central metaphor.

For reusable visual guidance, read `references/editorial-concept-images.md`.

## Output Contract

Default output:

- a short proposed spine
- one finished draft
- one-line note naming the chosen pattern
- short note on any assumption made because the brief was thin

If helpful, also provide:

- 2 or 3 alternate hooks
- 2 or 3 alternate closing lines
- a compact image concept prompt aligned to the same thesis

## Boundaries

- Do not turn the piece into longform analysis unless the user asks.
- Do not present rhetorical certainty where the underlying claim is exploratory.
- Do not hide the real mechanism under motivational language.
- Do not add broad lists or section scaffolding that weaken the compression.
