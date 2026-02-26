---
name: refactor-simplify
description: Analyze code changes against main to identify and tighten input assumptions, verify consistency across modules and functions, and simplify over-generic implementations through iterative passes. Use when the user wants refactor guidance or edits driven by git diff with explicit assumption checks and user clarification on uncertainty.
---

# Refactor Simplify

## Workflow

1. Resolve diff scope relative to `main`.
- If `main` is missing locally, ask the user to confirm the base branch.
- Compute merge-base from `HEAD` to `main`.
- Collect changed files from the merge-base diff.
- Include referenced call sites or collaborator modules required to validate assumptions.

2. Run three passes over the same scoped changes.

### Pass 1: Module-level contracts
- Inspect each changed module and how it interacts with neighboring modules.
- Identify implied contracts about data shape, ownership, lifecycle, and responsibilities.
- Flag cross-module assumption mismatches.

### Pass 2: Function-level contracts
- For each changed function, list assumptions about types, nullability, ranges, ordering, side effects, and invariants.
- Check whether callers and sibling functions follow the same assumptions.
- Mark each assumption as `explicit`, `implicit`, or `conflicting`.

### Pass 3: Simplification synthesis
- Infer stronger shared assumptions that are defensible from surrounding code.
- Propose simplifications that remove unnecessary genericity, branching, indirection, or adapters.
- Preserve intended behavior under the inferred contracts and call out risk when confidence is low.

3. Use hybrid execution by default.
- First provide a proposal before touching files.
- Ask for approval before applying edits.
- After approval, apply coherent minimal edits and re-check affected paths.

4. Handle uncertainty strictly.
- If any assumption is uncertain, ask the user before applying edits.
- Ask concise, decision-driving questions tied to specific modules or functions.

5. Return output in this structure every run.
- Findings: assumptions and inconsistencies.
- Concrete edits: proposed or applied changes.
- Open questions: unresolved assumptions that block safe simplification.
- Test suggestions: focused tests that validate tightened assumptions.

## Guardrails

- Prefer clearer contracts over defensive generic wrappers.
- Do not broaden behavior unless explicitly requested.
- Keep edits scoped to changed files and referenced collaborators.
- If simplification requires broad refactors, propose staged follow-ups instead of risky partial rewrites.
