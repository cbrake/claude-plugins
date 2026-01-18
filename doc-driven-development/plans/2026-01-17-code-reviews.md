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

## Enhancement: Review Storage & Completion Workflow (2026-01-17)

### Changes Made

1. **Reviews append to plan file**: Instead of creating separate `reviews/<date>-<branch>.md` files, all review output is now appended directly to the **IN PROGRESS** plan file under a `## Review (<date>)` heading. This keeps all plan-related information in one place.

2. **Commit decision flow**: After consolidating review results, the command now asks the user how to handle commits:
   - **Auto-commit**: Creates a commit with review summary
   - **Manual**: User commits manually
   - **Skip**: Don't commit yet

3. **Completion decision flow**: After commit handling, the command:
   - Displays summary of implemented vs remaining work
   - Asks if plan should be marked **Completed** or continue iteration

### Rationale

- **Single source of truth**: Having reviews in the plan file means humans only need to look at one file to understand what was implemented and what feedback was given.
- **User-controlled completion**: Plans are only marked Completed when the user decides, not automatically. This allows for iterative review cycles.

## Review (2026-01-17)

### Summary

| Category | Issues |
|----------|--------|
| Formatting | 0 (FORMAT.md created) |
| Architecture | 0 |
| Documentation | 0 |
| Potential Bugs | 8 (mostly edge cases) |
| Code Clarity | 6 minor suggestions |
| Comments | 2 minor issues |

**Critical issues**: None

**FORMAT.md was auto-generated** at `doc-driven-development/FORMAT.md`

---

### Formatting Review

- No significant formatting issues found. The changed files follow consistent formatting patterns.
- FORMAT.md was created documenting the discovered patterns.

Minor observation: The three plan statuses use different formatting (`**IN PROGRESS**`, `**Paused**` bold vs `Completed` plain) - this appears intentional to visually distinguish active states.

---

### Architectural Consistency Review

- Code follows documented architecture.
- Commands are properly placed in `commands/` directory.
- Plans correctly tracked in `plans/plans.md`.
- Single IN PROGRESS plan enforced.
- Doc-driven workflow maintained.

---

### Documentation Accuracy Review

- Documentation is accurate and consistent with the code changes.
- README.md correctly documents Paused status and transitions.
- CLAUDE.md correctly shows plugin structure without `reviews/` directory.
- CHANGELOG.md lists all new features appropriately.

---

### Potential Bugs Review

| Bug | Severity | Location | Description |
|-----|----------|----------|-------------|
| Race condition during review | Medium | review.md Step 3 | Plan may change during long review process |
| No plan file existence check | Medium | review.md Step 1 | Referenced plan file might not exist |
| Multiple IN PROGRESS possible | Low | plan.md Step 2 | Malformed plans.md could have duplicates |
| Empty plans.md handling | Low | review.md Step 1 | File might not exist |
| Agent failure handling | Medium | review.md Steps 2-3 | No explicit error handling for failed agents |
| Auto-commit without preview | Medium | review.md Step 4 | Could commit unintended changes |
| No way to resume Paused plans | Low | plan.md | Missing documentation on resumption |
| Commit/append order | Low | review.md Steps 3-4 | Review appended before commit decision |

**Suggested fixes**: Most are edge cases. Consider adding validation for plan file existence and documenting how to resume Paused plans.

---

### Code Clarity Review

**Paused Status (plan.md)**
- Advocate: Accurately represents interrupted work, allows resumption
- Critic: Should specify behavior if multiple IN PROGRESS plans exist

**Reviews in Plan File (review.md)**
- Advocate: Consolidates all feature info in one location
- Critic: Should specify timestamp format for multiple same-day reviews

**Commit Decision Flow (review.md)**
- Advocate: Good user control with clear options
- Critic: Could specify commit message format more precisely

**Completion Decision Flow (review.md)**
- Advocate: Properly separates commit from completion
- Critic: Should clarify what happens after "Continue" is selected

**IN PROGRESS Prerequisite (review.md)**
- Advocate: Ensures reviews have proper context
- Critic: Could offer fallback for quick standalone reviews

---

### Comments Review

- Typo in commands/plan.md: "has not be committed" → "has not been committed"
- Term "plan mode" in commands/plan.md is vague - could clarify what this means
- Overall documentation is well-written with good "why" explanations
