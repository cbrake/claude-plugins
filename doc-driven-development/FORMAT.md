# Formatting Standards

This document defines the formatting patterns used in this repository.

## Markdown Files

### Headings

- Use ATX-style headings (`#`, `##`, `###`).
- Leave one blank line before and after headings.
- Use sentence case for headings (capitalize first word only, except proper nouns).
- README.md uses emoji prefixes for top-level sections (e.g., `## Commands`).

### Lists

- Use `-` (hyphen) for unordered lists.
- Use `1.` for ordered lists (all items numbered `1.` for auto-numbering).
- Capitalize the first word of each list item.
- End list items that are sentences (or near-sentences) with a period.
- Indent continuation lines to align with the first character of the list item text (3 spaces for `-` items, 3 spaces for `1.` items).

### Code

- Use triple backticks for code blocks with language identifier (e.g., ` ```markdown`, ` ```python`).
- Use single backticks for inline code (commands, filenames, variables).
- Use inline code for:
  - File paths (e.g., `plans/plans.md`)
  - Command names (e.g., `/plan`, `/review`)
  - Git commands (e.g., `git diff`)
  - Status values (e.g., `**IN PROGRESS**`)

### Emphasis

- Use `**bold**` for emphasis and status indicators.
- Use `**IN PROGRESS**`, `**Paused**`, and `Completed` for plan statuses.

### Tables

- Use standard markdown tables with header separator.
- Align columns with pipes.
- Example:
  ```markdown
  | Column 1 | Column 2 |
  |----------|----------|
  | Value    | Value    |
  ```

### Line Length

- Wrap prose at approximately 80 characters for readability.
- Do not wrap within code blocks, URLs, or table rows.

## Command Files (`commands/*.md`)

### Structure

- Start with a brief description (1-2 sentences) of what the command does.
- Use numbered steps for sequential operations.
- Use headings (`##`) for major sections.
- Use subheadings (`###`) for subsections or agents.

### Naming

- File name becomes the command name (e.g., `plan.md` becomes `/plan`).
- Use lowercase with hyphens for multi-word commands (e.g., `update-docs.md`).

## Plan Files (`plans/*.md`)

### Naming Convention

- Format: `<YYYY-MM-DD>-<description>.md`
- Replace spaces with hyphens in description.
- Use lowercase for description.

### Structure

- Start with `# Plan: <Title>` heading.
- Include `## Summary` section.
- Include `## What Was Implemented` or `## Implementation Status` section.
- Include `## Design Decisions` section for rationale.
- Use `## Enhancement: <name> (<date>)` for subsequent enhancements.

### Status Tracking

- Plans are tracked in `plans/plans.md`.
- Use a markdown table with `Plan` and `Status` columns.
- Valid statuses: `**IN PROGRESS**`, `**Paused**`, `Completed`.

## README.md

### Structure

- Use emoji prefixes for major sections in the main README.
- Commands section uses `###` for each command with emoji.
- Examples section uses `### Example N: Title` format.

### Content

- Be concise; avoid verbose AI-generated documentation.
- Do not add trivial examples users can figure out.
- Avoid duplicated information.
