Perform a comprehensive code review on uncommitted changes using specialized review agents.

## Step 1: Gather Context

First, verify the current directory is a git repository. If not, inform the user and exit.

Run `git diff HEAD` (to capture both staged and unstaged changes) and `git status` to identify all uncommitted changes. Also determine:
- The current branch name (sanitize by replacing `/` with `-` for use in filenames)
- The **IN PROGRESS** plan from `plans/plans.md` (this is an index file that tracks which plan is currently active)
- Whether a `FORMAT.md` file exists in the repository root

If there are no uncommitted changes, inform the user and exit.

If no **IN PROGRESS** plan exists in `plans/plans.md`, inform the user and suggest running `/doc-driven-development:plan` first to create one.

## Step 2: Launch Review Agents

Use the Task tool to spawn the following review agents **in parallel**. Each agent analyzes the git diff output and provides findings.

### Agent 1: Formatting Review

**Focus**: Code formatting consistency

Instructions:
1. Check if `FORMAT.md` exists in the repository root.
2. If missing, analyze the codebase to identify formatting patterns (indentation, naming conventions, bracket styles, line lengths). Before creating `FORMAT.md`, check again that it doesn't exist to avoid race conditions with concurrent reviews.
3. Review all changed code against the formatting standards.
4. Report any formatting inconsistencies.

Output format:
```
## Formatting Review
- [List of formatting issues found, or "No issues found"]
- [If FORMAT.md was created, note this]
```

### Agent 2: Architectural Consistency Review

**Focus**: Adherence to documented architecture

Instructions:
1. Read README.md and any architecture documentation (ARCHITECTURE.md, DESIGN.md, CLAUDE.md).
2. Identify documented architectural decisions (module boundaries, patterns, conventions).
3. Review changed code for violations of these patterns.
4. Report any architectural inconsistencies.

Output format:
```
## Architectural Consistency Review
- [List of architectural concerns, or "Code follows documented architecture"]
```

### Agent 3: Documentation Accuracy Review

**Focus**: Ensuring documentation matches code

Instructions:
1. Compare code changes to README.md, CHANGELOG.md, and the **IN PROGRESS** plan file.
2. Identify any code functionality not reflected in documentation.
3. Identify any documentation claims not supported by the code.
4. Note missing or outdated documentation.

Output format:
```
## Documentation Accuracy Review
- [List of documentation gaps or inconsistencies, or "Documentation is accurate"]
```

### Agent 4: Potential Bugs Review

**Focus**: Identifying potential bugs and edge cases

Instructions:
1. Analyze changed code for common bug patterns.
2. Look for: null/undefined handling, boundary conditions, race conditions, resource leaks, error handling gaps.
3. Consider edge cases that may not be handled.
4. Note any security concerns.

Output format:
```
## Potential Bugs Review
- [List of potential bugs with severity and location]
- [Each bug should include: description, location, suggested fix]
```

### Agent 5: Code Clarity Review

**Focus**: Code clarity and design decisions

Instructions:
1. For each significant code change, first justify why the code is structured this way. Significant changes include: new functions/methods, modified logic flow, new classes/modules, or changes exceeding 10 lines. Exclude trivial changes like import reordering, whitespace, or simple renames.
2. Then critically evaluate: validate the reasoning or suggest improvements with rationale.
3. Alternate between advocate and critic perspectives until all significant code is reviewed.

Output format:
```
## Code Clarity Review

### [File/Function Name]
**Advocate**: [Justification for code design]
**Critic**: [Validation or improvement suggestion]
```

### Agent 6: Comments Review

**Focus**: Quality and usefulness of code comments

Instructions:
1. Review all comments in changed code (function docs, inline comments).
2. Assess whether comments add value beyond what code already expresses.
3. Identify missing comments where complexity warrants explanation.
4. Flag redundant or misleading comments.

Output format:
```
## Comments Review
- [List of comment improvements needed, or "Comments are appropriate"]
```

## Step 3: Consolidate Results

After all agents complete, append all review output to the **IN PROGRESS** plan file under a `## Review (<current-date>)` heading. Include:

1. A summary of issues found per category
2. All agent outputs in full
3. Highlight any critical issues requiring immediate attention
4. Note if FORMAT.md was auto-generated

## Step 4: Commit Decision

Ask the user how they want to handle committing changes:

1. **Auto-commit** - Create a commit with a summary of the review findings
2. **Manual** - Let the user commit manually
3. **Skip** - Don't commit yet

If auto-commit is selected, create a commit with a message summarizing what was implemented and key review findings.

## Step 5: Completion Decision

After handling the commit decision:

1. Display a summary of what was implemented vs what remains in the plan
2. Ask the user if the plan should be:
   - **Completed** - Mark the plan as Completed in `plans/plans.md` (implementation is done)
   - **Continue** - Keep the plan as **IN PROGRESS** for further iteration

If Completed is selected, update `plans/plans.md` to change the plan status from **IN PROGRESS** to Completed.
