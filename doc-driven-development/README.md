# Doc-Driven Coding Plugin

A Claude Code plugin that implements a documentation-driven development workflow. This plugin helps you plan and implement code changes by using markdown documentation as the source of truth.

## Philosophy

In doc-driven development, documentation drives code changes rather than the other way around. You update your documentation first to describe the desired functionality, then implement the code to match the documentation.

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

### Local Testing

1. Create a marketplace file at `/scratch/claude/marketplace.json`:

```json
{
  "name": "local-marketplace",
  "plugins": [
    {
      "source": "file:///scratch/claude/doc-driven-coding"
    }
  ]
}
```

2. Add the marketplace to Claude Code:
```
/plugin marketplace add /scratch/claude/marketplace.json
```

3. Install the plugin:
```
/plugin install doc-driven-coding
```

### Team Installation

1. Commit the plugin to a git repository
2. Create a marketplace.json pointing to your repository
3. Share the marketplace with your team

## Requirements

- Claude Code CLI
- Git repository (for `git diff` functionality)
- `plans/` directory in your project (created automatically)

## License

MIT

## Author

Cliff Brake (cbrake@bec-systems.com)
