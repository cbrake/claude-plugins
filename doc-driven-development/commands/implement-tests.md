Implement tests for the **IN PROGRESS** plan, creating logical git commits for
each unit of work.

## Step 1: Find the Active Plan

1. Read `plans/plans.md` to find the plan marked **IN PROGRESS**.
2. If no plan is in progress, inform the user and suggest running `/plan` first.
3. Read the plan file to understand what tests are needed.

## Step 2: Plan Test Units

Analyze the plan and break tests into logical units. Each unit should be:

- Tests for a single function, method, or component
- A cohesive test suite for related functionality
- Small enough to understand in one commit

## Step 3: Implement and Commit Each Unit

For each test unit:

1. Write the tests for that unit.
2. Stage the changes with `git add`.
3. Create a commit using conventional commit format:
   - `test:` for new tests
   - `test: fix` for fixing broken tests
4. Capture the commit hash using `git rev-parse --short HEAD`.
5. Add the commit to the plan file's `## Commits` section.

The `## Commits` section in the plan file uses this format:

```markdown
## Commits

| Hash | Description |
|------|-------------|
| abc1234 | test: add authentication module tests |
| def5678 | test: add login form component tests |
```

## Step 4: Finalize

Update the plan file with any test implementation details. Keep the plan status
as **IN PROGRESS** (tests alone don't complete a plan).

Note: Documentation drives test code changes in this workflow, not the other way
around.
