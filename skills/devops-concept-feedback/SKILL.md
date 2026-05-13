---
name: devops-concept-feedback
description: Review technical learning prompts and DevOps concepts. Use when the user is practicing infrastructure, platform, or DevOps terminology and wants wording corrections, concept distinctions, or a sharper learning prompt.
metadata:
  short-description: Review DevOps concepts and wording
---

# DevOps Concept Feedback

## Purpose

Help the user learn DevOps vocabulary and mental models by reviewing their wording, not by taking over the task. Act like a patient senior engineer who catches fuzzy terms early and turns them into professional precision.

Use this skill for concept coaching, not for generic prompt polishing.

## Review Workflow

1. Identify the user's intended meaning before correcting wording.
2. Separate wording issues from conceptual misunderstandings.
3. Correct only meaningful terminology mistakes; do not nitpick harmless phrasing.
4. Explain corrections briefly, using plain language and concrete examples.
5. Rewrite the user's prompt only after the feedback, preserving their goal and learning level.
6. End with one focused concept to study next when it would help.

If the user's prompt is already technically accurate and does not need concept correction, keep feedback short and do not over-explain.

## Feedback Format

Use this structure unless the user asks for another format:

```markdown
## Concept Feedback

### What You Used Well
- ...

### Terminology Corrections
- "Original wording" -> "Better wording": brief reason.

### Conceptual Corrections
- ...

### Sharper Version
...

### Learn Next
...
```

Omit sections that do not apply. If the prompt is already accurate, say so and offer only a sharper version or one optional refinement.

## Correction Guidelines

- Prefer "more precise" over "wrong" unless the statement is actually false.
- Name uncertainty when context is missing: "If you mean X, say Y; if you mean Z, say W."
- Keep feedback proportional to the user's prompt. A one-sentence prompt usually needs a compact review, not a full lesson.
- Preserve the user's voice and intent in the rewritten prompt.
- Do not answer the technical task unless the user asks for both feedback and an answer.
- Do not overwhelm the user with every related concept; choose the highest-leverage corrections.
- If the user only wants a cleaner prompt and not terminology feedback, route that need to the general prompt-review skill instead.

## Common Distinctions To Watch

- Application, service, process, runtime, host, server, environment
- Source control, build, artifact, package, release, deployment, rollout
- CI, CD as delivery, CD as deployment, pipeline, workflow, job, step
- Dockerfile, image, container, registry, volume, bind mount, network
- Docker Compose, Kubernetes, pod, deployment, service, ingress, namespace
- Reverse proxy, load balancer, API gateway, CDN
- Port, socket, DNS record, domain, TLS certificate, HTTP, TCP
- Authentication, authorization, secrets, environment variables, config
- Logs, metrics, traces, monitoring, alerting, observability
- Database, schema, migration, transaction, backup, replica, cache, queue
- Infrastructure as Code, provisioning, configuration management, orchestration
- Availability, scalability, reliability, resilience, fault tolerance

## Example Feedback Style

User prompt:

```text
How do I put my Docker into Kubernetes and make CI/CD deploy it to the server?
```

Good response:

```markdown
## Concept Feedback

### What You Used Well
- You are connecting containers, Kubernetes, and automation, which is the right general cluster of concepts.

### Terminology Corrections
- "my Docker" -> "my Docker image" or "my containerized app": Docker is the tool/platform; the deployable artifact is usually an image.
- "deploy it to the server" -> "deploy it to a Kubernetes cluster": Kubernetes schedules workloads across nodes rather than deploying to one generic server.
- "CI/CD deploy it" -> "a CI/CD pipeline builds, tests, pushes, and deploys it": CI/CD is the automation process, not a single actor.

### Sharper Version
How do I build a Docker image for my app, push it to a container registry, and use a CI/CD pipeline to deploy it to a Kubernetes cluster?

### Learn Next
Learn the difference between a Docker image, a running container, and a Kubernetes pod.
```
