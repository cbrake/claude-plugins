# Doc-Driven Coding

A documentation-driven development plugin for Claude Code. Write your documentation first, then let Claude implement the code to match.

## Philosophy

Documentation drives code, not the reverse. Update your markdown files to describe desired functionality, then use this plugin to generate implementation plans and code that match your documentation.

## Commands

### `/plan <description>`

Creates a plan file in the `plans/` directory with the current date and your description. The command will:

1. Create a new file: `plans/<YYYY-MM-DD>-<description>.md` (spaces replaced with hyphens)
2. Switch to plan mode
3. Analyze current changes using `git diff`
4. Review README.md and other documentation files
5. Generate a detailed implementation plan
6. Write the plan to the plan file

**Example:**
```
/plan user authentication
```

Creates `plans/2025-10-29-user-authentication.md` with a detailed plan.

### `/implement`

Implements code changes based on:
- Documentation changes shown in `git diff` of `*.md` files
- Plans in the `plans/` directory

The command reads all documentation updates and systematically implements the corresponding code changes.

**Example:**
```
/implement
```

### `/skip`

Tells Claude to skip the current edit or command and continue with the next task. Useful when you want to bypass a suggested change.

**Example:**
```
/skip
```

## Workflow

The typical doc-driven workflow:

1. **Update documentation** - Edit your README.md, design docs, or other markdown files to describe the desired changes
2. **Create a plan** - Run `/plan <feature-name>` to generate an implementation plan
3. **Implement changes** - Run `/implement` to have Claude implement the code based on the documentation and plan
4. **Review and iterate** - Review the changes, update documentation as needed, and repeat

## Installation

See the [main repository README](https://github.com/cbrake/claude-plugins) for installation instructions.

Quick install:
```bash
/plugin marketplace add https://raw.githubusercontent.com/cbrake/claude-plugins/main/marketplace.json
/plugin install doc-driven-coding
```

## Requirements

- Git repository (the plugin uses `git diff` to detect documentation changes)
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

3. Implement the plan:
```bash
/implement
```

### Example 2: Refactoring

1. Update documentation to reflect new architecture
2. Create a plan: `/plan api-refactor`
3. Review the plan file in `plans/`
4. Run `/implement` when ready

## Tips

- Commit documentation changes separately so `git diff` shows only what needs to be implemented
- Use `/skip` if Claude suggests a change you don't want
- Review plan files before implementing - they're just markdown files you can edit
- The `plans/` directory serves as a history of your implementation decisions
