# Documentation Guidelines

This nested `AGENTS.md` applies to files inside the `docs/` directory and its
subdirectories. Use it together with the repository-level `AGENTS.md`.

## Scope

Use this folder for longer-form documentation, design notes, architecture
overviews, user guides, and project references. Keep short repository-wide
instructions in the root-level files, such as `README.md`, `SPEC.md`, and
`AGENTS.md`.

## Writing Style

Write documentation in clear, direct language. Prefer short sections, descriptive
headings, and examples that readers can apply immediately.

Use Markdown consistently:

- Start each document with a single `#` title.
- Use `##` and `###` headings to organize topics.
- Use fenced code blocks for commands and examples.
- Use relative links when linking to other repository files.

## File Naming

Use lowercase, hyphen-separated filenames for documentation in this folder.

Examples:

- `architecture-overview.md`
- `setup-guide.md`
- `release-checklist.md`

Avoid vague names such as `notes.md`, `misc.md`, or `new-doc.md` unless the file
is temporary and clearly marked.

## Change Guidelines

Keep documentation changes focused on the requested topic. If a document needs a
larger rewrite, preserve useful existing content and explain the structural
change in the pull request description.

When adding setup steps, commands, or requirements, make sure they are specific
enough for a new contributor to follow without guessing.

