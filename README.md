# Claude Code Plugins

A curated collection of Claude Code plugins to enhance your development workflow.

## Available Plugins

### Doc-Driven Coding

A documentation-driven development plugin that helps you plan and implement code changes based on markdown documentation.

**Key Features:**
- `/plan` - Create implementation plans based on documentation changes
- `/implement` - Implement code changes from documentation and plans
- `/skip` - Skip suggested edits and continue

[View Plugin Documentation](./doc-driven-development/README.md)

## Installation

### Using this Marketplace

To install plugins from this repository:

1. Add this marketplace to Claude Code:
```bash
/plugin marketplace add https://raw.githubusercontent.com/cbrake/claude-plugins/main/marketplace.json
```

2. Install a specific plugin:
```bash
/plugin install doc-driven-development
```

### Manual Installation

To install a plugin directly without the marketplace:

```bash
/plugin install https://github.com/cbrake/claude-plugins.git/doc-driven-development
```

### Local Development

For local plugin development and testing:

```bash
/plugin install file:///path/to/claude-plugins/doc-driven-development
```

## Updating

### Update Marketplace

To get the latest plugin listings and metadata:

```bash
/plugin marketplace update claude-plugins
```

This pulls the latest `marketplace.json` from GitHub, including any new plugins or updated descriptions.

### Update Plugins

To update an installed plugin to its latest version:

```bash
/plugin update doc-driven-development
```

To update all installed plugins:

```bash
/plugin update --all
```

## Plugin Development

This repository follows the standard Claude Code plugin structure:

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json          # Plugin metadata
└── commands/
    └── command-name.md      # Command definitions
```

### Key Concepts

1. **Command definitions are markdown files** - Each `.md` file in `commands/` becomes a slash command
2. **Commands are prompts** - The markdown content is given to Claude Code when invoked
3. **Plugin metadata** - The `plugin.json` defines the plugin's identity

See [CLAUDE.md](./CLAUDE.md) for detailed development guidance.

## Contributing

To add a new plugin to this repository:

1. Create a new directory with your plugin structure
2. Add plugin metadata in `.claude-plugin/plugin.json`
3. Define commands in the `commands/` directory
4. Update `marketplace.json` to include your plugin
5. Submit a pull request

## Requirements

- Claude Code CLI
- Git (for plugins that use git-based workflows)

## License

MIT

## Author

Cliff Brake (cbrake@bec-systems.com)
