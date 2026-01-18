# Plan: Updating Plans Feature for Doc-Driven Development

## Summary

Add a `plans/plans.md` file to track plan status, with one plan marked as **IN PROGRESS** at a time. Modify the `/plan` and `/update-docs` commands to manage this tracking.

## Implementation Status

All planned changes have been implemented.

## What Was Implemented

### 1. `plans/plans.md` - Plan Tracking File

Created a markdown table that tracks all plans and their status. One plan can be marked **IN PROGRESS** at a time using bold markdown syntax.

### 2. `commands/plan.md` - Plan Tracking Section

Added instructions for `/plan` to:
- Mark any existing **IN PROGRESS** plan as Completed.
- Add the new plan to `plans/plans.md` marked as **IN PROGRESS**.

### 3. `commands/update-docs.md` - Plan File Updates Section

Added instructions for `/update-docs` to:
- Find the **IN PROGRESS** plan from `plans/plans.md`.
- Update that plan with implementation details and rationale.

## Design Decisions

- **Simple markdown table**: No complex state management. The tracking file is human-readable and editable.
- **Bold marker for status**: Using `**IN PROGRESS**` makes the active plan visually distinct.
- **Single in-progress plan**: Enforcing one active plan prevents scope confusion during development.
- **Paused status**: When `/plan` runs, any existing **IN PROGRESS** plan is marked **Paused** (not Completed). This preserves work-in-progress context. Users can resume a paused plan by editing `plans/plans.md` to mark it IN PROGRESS again.
- **Manual completion**: Plans are only marked Completed when the user explicitly decides the work is done (via `/review` completion flow), not automatically when starting a new plan.

## Enhancement: Paused Status (2026-01-17)

Added **Paused** as a valid plan status to improve the plan lifecycle:

### Changes Made

1. **`commands/plan.md`**: Changed behavior from marking old plans as "Completed" to "**Paused**"
2. **`plans/plans.md` format**: Now supports three statuses: **IN PROGRESS**, **Paused**, Completed

### Rationale

Auto-completing plans when starting a new one was problematic because:
- Previous work might not actually be complete
- Context was lost when resuming interrupted work
- No way to distinguish "done" from "paused for later"

The Paused status preserves the ability to resume work later while clearly indicating the plan is not actively being worked on.
