Implement code changes for the **IN PROGRESS** plan, creating logical git commits
for each unit of work.

## Step 1: Find the Active Plan

1. Read `plans/plans.md` to find the plan marked **IN PROGRESS**.
2. If no plan is in progress, inform the user and suggest running `/plan` first.
3. Read the plan file to understand what needs to be implemented.

## Step 2: Plan Implementation Units

Analyze the plan and break the implementation into logical units. Each unit
should be:

- A single function, method, or component
- A cohesive set of related changes
- Small enough to understand in one commit

Create a table in the **IN PROGRESS** plan file that tracks these logical units, what has or has not been implemented, and the hash if it has been implemented, so that you can see what needs to be done.

## Step 3: Implement and Commit Each Unit

For each implementation unit:

1. Make the code changes for that unit.
2. Stage the changes with `git add`.
3. Create a commit using conventional commit format:
   - `feat:` for new features
   - `fix:` for bug fixes
   - `refactor:` for code restructuring
   - `docs:` for documentation changes
4. Capture the commit hash using `git rev-parse --short HEAD`.
5. Add the commit to the plan file's `## Commits` section.

The `## Commits` section in the plan file uses this format:

```markdown
## Commits

| Hash | Description | Status |
|------|-------------|--------|
| abc1234 | feat: add user authentication module | Implemented|
| def5678 | feat: add login form component |Not Implemented|
```

## Step 4: Finalize

1. Update the plan file with any implementation details or deviations.
2. Change the status in the plan file to `Implemented`.

Note: Documentation drives code changes in this workflow, not the other way
around.
