Find and execute inline instructions or pseudo code marked with special tags in code or documentation.

First, use `git diff` to identify recently changed files that may contain instruction markers.

Look for instruction markers in the following formats:
- `@CLAUDE: <instruction or pseudo code>` - Single line instruction
- `@CLAUDE-START` / `@CLAUDE-END` - Multi-line instruction or pseudo code blocks
- In code comments: `// @CLAUDE:`, `# @CLAUDE:`, `/* @CLAUDE: */`, `<!-- @CLAUDE: -->`
- In markdown: Lines starting with `> @CLAUDE:` or within code blocks labeled with `@CLAUDE`

The markers can contain:
- Direct instructions (e.g., "Add error handling here", "Refactor this to use async/await")
- Pseudo code describing what should be implemented
- Implementation notes or TODO-like directives

When you find instruction markers:
1. Extract the complete instruction or pseudo code text
2. Execute/implement the instruction or pseudo code as described
3. After successfully completing the work, remove the marker tags completely
4. If a plan file exists in `plans/` that is uncommitted (check with `git status`), update it to reflect what was done

The instruction markers are meant for surgical, targeted changes. Focus on:
- The specific instruction or pseudo code provided
- The immediate context around the marker
- Keeping changes minimal and focused

If "$ARGUMENTS" are provided, use them to filter which markers to execute (e.g., file path, keyword).
If no arguments provided, process all instruction markers found in uncommitted changes.

After completing all instructions, provide a summary of what was executed and what was changed.
