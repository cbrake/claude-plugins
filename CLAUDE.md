# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Repository Overview

This is a Claude Code plugin repository for "doc-driven-coding" - a plugin that
implements documentation-driven development workflow where markdown
documentation drives code implementation rather than the reverse.

## Architecture

### Plugin Structure

Claude Code plugins follow a specific directory structure:

```
doc-driven-development/
├── .claude-plugin/
│   └── plugin.json          # Plugin metadata (name, version, description, author)
└── commands/
    ├── plan.md              # /plan command definition
    ├── implement.md         # /implement command definition
    ├── implement-tests.md   # /implement-tests command definition (TDD)
    ├── update-docs.md       # /update-docs command definition
    └── skip.md              # /skip command definition
```

**Key architectural points:**

1. **Command definitions are markdown files** - Each `.md` file in `commands/`
   becomes a slash command. The filename becomes the command name (e.g.,
   `plan.md` → `/plan`)

2. **Commands are prompts** - The markdown content is the prompt given to Claude
   Code when the command is invoked. Commands use `$ARGUMENTS` to access user
   input.

3. **Plugin metadata** - The `.claude-plugin/plugin.json` file defines the
   plugin's identity and must include: name, version, description, author
   fields, and optional keywords.

## Doc-Driven Development Workflow

The plugin implements a three-phase workflow:

1. **Documentation First** - Users update markdown files (README.md, design
   docs) to describe desired functionality
2. **Planning** - `/plan <description>` creates a plan file in
   `plans/<YYYY-MM-DD>-<description>.md` by analyzing git diff and documentation
3. **Implementation** - `/implement` reads documentation changes and plans, then
   implements corresponding code

**Important:** In this workflow, documentation drives code changes, not vice
versa. When implementing, prioritize what's documented over existing code
patterns.

## Local Plugin Development

To test plugins locally during development:

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

2. Add marketplace: `/plugin marketplace add /scratch/claude/marketplace.json`
3. Install plugin: `/plugin install doc-driven-coding`

## Git Integration

Commands rely on `git diff` to detect documentation changes. The repository must
be a git repository for the `/plan` and `/implement` commands to function
properly.
