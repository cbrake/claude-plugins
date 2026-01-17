# Plan: Code Review Command for Doc-Driven Development

## Status: Implemented

## Summary

Add a `/review` command that launches multiple specialized agents to perform comprehensive code review on uncommitted changes. The agents will review formatting, architecture, documentation accuracy, potential bugs, code clarity, and comments.

## What Was Implemented

### `commands/review.md`

Created the new `/review` command with:

1. **Step 1 - Gather Context**: Verifies git repository, runs `git diff HEAD` (staged + unstaged), sanitizes branch name, finds **IN PROGRESS** plan from `plans/plans.md` index, and checks for `FORMAT.md`.

2. **Step 2 - Launch 6 Review Agents in Parallel**:
   - **Formatting Agent**: Checks code formatting, auto-creates `FORMAT.md` if missing
   - **Architectural Consistency Agent**: Verifies code follows documented architecture
   - **Documentation Accuracy Agent**: Ensures docs match code
   - **Potential Bugs Agent**: Identifies bugs, edge cases, security concerns
   - **Code Clarity Agent**: Alternates advocate/critic perspectives on code design
   - **Comments Agent**: Reviews comment quality and usefulness

3. **Step 3 - Consolidate Results**: Creates `reviews/<date>-<branch>.md` and appends bugs to the plan file.

4. **Step 4 - Summary Output**: Reports issue counts and highlights critical issues.

### `plans/plans.md`

Updated to mark the previous "update-plans" plan as Completed and this plan as **IN PROGRESS**.

### Documentation Updates

- `README.md`: Added `/review` command section.
- `CHANGELOG.md`: Added `/review` to the Unreleased section.
- `CLAUDE.md`: Added review.md to the plugin structure and Code Review architecture section.

## Design Decisions

1. **Single Code Clarity Agent**: Combined the advocate/critic dialogue into a single agent that alternates perspectives, simplifying coordination.

2. **Structured Output Formats**: Each agent has a defined output format to ensure consistent review consolidation.

3. **Early Exit**: Command exits early if no uncommitted changes exist.

4. **Follows Existing Patterns**: Command structure mirrors `execute.md` (multi-step) and `update-docs.md` (plan file updates)

## Review Findings - Potential Bugs (2026-01-17)

All bugs have been fixed in `commands/review.md`:

| Bug | Severity | Status |
|-----|----------|--------|
| Missing plan fallback | High | Fixed - suggests running `/doc-driven-development:plan` |
| Ambiguous plan location | High | Fixed - clarifies plans.md is an index file |
| Branch name sanitization | Medium | Fixed - sanitizes `/` to `-` |
| FORMAT.md race condition | Medium | Fixed - double-checks before creating |
| Staged changes missed | Medium | Fixed - uses `git diff HEAD` |
| Missing git repo check | Low | Fixed - verifies git repo first |
| Undefined "significant" | Low | Fixed - defines as >10 lines, new functions/logic |
