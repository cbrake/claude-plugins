Create a plan file named `plans/<current date>-"$ARGUMENTS".md`. Replace spaces
with '-' in the filename.

If a plan already exists that has not be committed, then update that plan.

Then switch to plan mode and create a plan for coding the current changes and
untracked files (start with `git diff` and `git status`) described in the
README.md and other documentation files. Note, in this phase, we are using
documentation to drive the code, not the other way around. When the plan is
complete, write it to the plan file.

The documentation may be written in past tense as if the feature already exists.
Assume any changes that have not been committed have not been implemented yet,
even though they are described as already implemented. This is a side effect of
documentation driven development.

## Plan Tracking

After the plan is finalized, update `plans/plans.md`:

1. If `plans/plans.md` does not exist, create it with a table header.
2. Change any existing **IN PROGRESS** plan to **Paused**.
3. Add the new plan marked as **IN PROGRESS**.

The `plans/plans.md` file uses this format:

```markdown
# Plans

| Plan | Status |
|------|--------|
| 2026-01-17-new-feature.md | **IN PROGRESS** |
| 2026-01-16-paused-feature.md | **Paused** |
| 2026-01-15-old-feature.md | Completed |
```
