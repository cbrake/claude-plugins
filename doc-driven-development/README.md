# Doc-Driven Coding

A documentation-driven development plugin for Claude Code. Write your
documentation first, then let Claude implement the code to match.

The goal is to embed AI in a normal development workflow, not create new
AI-specific workflows that humans would not use (such as spec-driven
development).

## Philosophy

Documentation drives code, not the reverse. Update your markdown files to
describe desired functionality, then use this plugin to generate implementation
plans and code that match your documentation.

The byproduct of this workflow is that your documentation:

- Is always fairly complete, up to date, and usable by humans
- Precedes coding, which helps in the design/thinking process
- Does not have to be done as an unpleasant afterthought

## Commands

### `/plan <description>`

Creates a plan file in the `plans/` directory with the current date and your
description. The command will:

1. Create a new file: `plans/<YYYY-MM-DD>-<description>.md` (spaces replaced
   with hyphens)
2. Switch to plan mode
3. Analyze current changes using `git diff`
4. Review README.md and other documentation files
5. Generate a detailed implementation plan
6. Write the plan to the plan file

### `/implement-tests`

Implements tests for features described in the documentation and plans directory
using Test-Driven Development (TDD). This command:

- Analyzes documentation changes from `git diff` of `*.md` files
- Reviews plans in the `plans/` directory
- Creates tests **before** implementing the actual code
- Follows TDD principles where tests drive the implementation

Use this command when you want to follow a strict TDD workflow where tests are
written first based on the documented requirements.

### `/execute`

Finds and executes inline instructions or pseudo code marked with special tags
in your code or documentation. This enables surgical, targeted changes without
needing full documentation rewrites.

The command looks for instruction markers in these formats:

- `@CLAUDE: <instruction>` - Single line instruction
- `@CLAUDE-START` / `@CLAUDE-END` - Multi-line instruction blocks
- In code comments: `// @CLAUDE:`, `# @CLAUDE:`, `/* @CLAUDE: */`,
  `<!-- @CLAUDE: -->`
- In markdown: Lines starting with `> @CLAUDE:` or within code blocks

**How it works:**

1. Searches uncommitted changes (from `git diff`) for instruction markers
2. Executes each instruction or pseudo code as described
3. Removes the marker tags after successful completion
4. Updates any uncommitted plan files to reflect what was done

**Example usage:**

Add an instruction marker in your code:

```python
# @CLAUDE: Add error handling for network timeouts
def fetch_data(url):
    response = requests.get(url)
    return response.json()
```

Run `/execute` to implement the instruction and remove the marker.

Use this command for quick, focused changes like adding error handling,
refactoring specific functions, or implementing small improvements.

### `/implement`

Implements code changes based on:

- Documentation changes shown in `git diff` of `*.md` files
- Plans in the `plans/` directory

The command reads all documentation updates and systematically implements the
corresponding code changes.

### `/update-docs`

Updates documentation to reflect code changes detected by `git diff`. This is
the inverse of `/implement` - use it when you've written code and need to update
your documentation to match.

The command focuses on user-facing benefits rather than technical implementation
details.

### `/skip`

Tells Claude to skip the current edit or command and continue with the next
task. Useful when you want to bypass a suggested change.

## Workflow

The typical doc-driven workflow:

1. **Update documentation** - Describe desired functionality in markdown files
2. **Create a plan** - Run `/plan <feature-name>`
3. **Inspected plan**
4. **Implement tests first** - Run `/implement-tests` to create tests based on
   documentation
5. **Run tests** - Verify tests fail as expected
6. **Inspect tests**
7. **Implement code** - Run `/implement` to implement the actual functionality
   - _Alternative_: For quick, targeted changes, add `@CLAUDE:` markers in code
     and run `/execute` instead
8. **Verify** - Ensure all tests pass
9. **Make sure docs match code** - Run `/update-docs` to make sure the docs are
   complete and match the code that was implemented

## Installation

See the [main repository README](https://github.com/cbrake/claude-plugins) for
installation instructions.

## Requirements

- Git repository (the plugin uses `git diff` to detect documentation and code
  changes)
- `plans/` directory in your project (created automatically by the plugin)

## Examples

### Example 1: Adding a New Feature

1. Update your README.md to describe the new feature:

```markdown
## Authentication

Users can log in using email/password or OAuth providers (Google, GitHub).
Sessions last 7 days by default.
```

2. Create a plan:

```bash
/plan authentication-system
```

Inspect plan.

3. Implement the plan:

```bash
/implement
```

### Example 2: Refactoring

1. Update documentation to reflect new architecture
2. Create a plan: `/plan api-refactor`
3. Review the plan file in `plans/`
4. Run `/implement` when ready

### Example 3: Test-Driven Development

1. Update your README.md to describe a new feature:

```markdown
## Payment Processing

The system supports credit card payments via Stripe. Users can save multiple
payment methods and set a default. All transactions are logged for audit
purposes.
```

2. Create a plan:

```bash
/plan payment-processing
```

Inspect plan.

3. Implement tests first:

```bash
/implement-tests
```

Inspect tests.

4. Run tests to verify they fail (red phase)

5. Implement the code:

```bash
/implement
```

6. Run tests to verify they pass (green phase)

7. Update the docs to accurately reflect implementation

```bash
/update-docs
```

## Tips

- Don't commit documentation or code changes until the feature is complete. The
  commands use `git diff` to see what is new in the documentation and code.
- Use `/skip` if Claude suggests a change you don't want.
- Review plan files before implementing - they're just markdown files you can
  edit.
- Review tests before implementing code.
- The `plans/` directory serves as a history of your implementation decisions.
