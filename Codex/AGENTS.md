# Repository Guidelines

## General Instructions

Work from the repository root unless a task requires a specific subdirectory.
Read existing documentation before changing behavior or adding new structure.
Keep changes small, purposeful, and easy to review.

When adding files, use names that describe their purpose and avoid temporary
placeholders unless the task explicitly asks for them. Do not introduce new
dependencies, build tools, or frameworks without documenting why they are needed
and how to use them.

Preserve user work already present in the tree. If a change depends on an
unclear assumption, state the assumption in the relevant document or pull request
description.

## Project Structure & Module Organization

This repository is currently lightweight and documentation-focused. Keep top-level
project documents in the repository root, such as `SPEC.md` and `AGENTS.md`.

Recommended structure as the project grows:

- `src/` for application or library source code.
- `tests/` for automated tests.
- `assets/` for images, fixtures, examples, or static files.
- `docs/` for longer design notes, user guides, and architecture references.

Avoid placing generated files, dependency folders, or temporary outputs in the
root unless they are intentionally tracked.

## Build, Test, and Development Commands

No project-specific build or test tooling is currently defined. Add commands here
when a package manager, build system, or test framework is introduced.

Suggested examples once tooling exists:

- `npm install` installs JavaScript dependencies.
- `npm test` runs the test suite.
- `npm run lint` checks formatting and style.
- `npm run build` creates a production build.

If commands are added, document them in this file and in the project README.

## Coding Style & Naming Conventions

Use clear, descriptive names and keep files focused on one purpose. Prefer
lowercase, hyphen-separated names for Markdown and documentation files, except
for conventional root files such as `README.md`, `SPEC.md`, and `AGENTS.md`.

For code added later, follow the formatter and linter configured for that
language. If no formatter exists, use consistent indentation within each file and
avoid broad style-only rewrites in unrelated files.

## Testing Guidelines

There is no test framework configured yet. When source code is added, include
tests for behavior that affects users, public APIs, or data handling.

Recommended conventions:

- Put tests under `tests/` or beside source files using the project language's
  common pattern.
- Name tests after the behavior being verified, such as
  `task-counter.test.js` or `test_task_counter.py`.
- Cover normal behavior, edge cases, and failure paths.

## Commit & Pull Request Guidelines

Use short, imperative commit messages that describe the change clearly, such as
`Add contributor guide` or `Document task counter requirements`.

Pull requests should include:

- A brief summary of the change.
- Any relevant issue or task link.
- Testing performed, or a note explaining why tests were not run.
- Screenshots only when the change affects visible UI or rendered documents.

Keep pull requests focused. Separate unrelated documentation, formatting, and
feature changes when practical.

## Agent-Specific Instructions

Before editing, inspect the relevant files and preserve existing user changes.
Keep edits scoped to the requested task. Prefer small, readable documentation
updates over broad restructuring unless the repository has established patterns
that justify it.
