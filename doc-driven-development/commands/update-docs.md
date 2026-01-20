Check for the starting hash of the **IN PROGRESS** command in `plans/plans.md`. Update any relevant documentation to accurately reflect the current code changes
(`git diff`) and fill in any missing information. Some guidelines:

- Be concise. AI tends to generate very verbose/wordy documentation. Don't do
  that.
- Don't add trivial examples that users can easily figure out.
- Avoid duplicated information when possible.
- The first word in a list item should always be capitalized.
- Sentences (or close to it) in a list should always end with a period.

Update `CLAUDE.md` with any architectural or technical details.

Also, update the `CHANGELOG.md` to describe changes as benefits to the user. It
should not include technical details of the change - that is what `git log` is
for.

## Plan File Updates

Check `plans/plans.md` to find the plan marked **IN PROGRESS**. Update that plan
file to reflect the current state of the code based on `git diff`. The plan
should document:

- What was implemented.
- Technical decisions and their rationale.
- Any deviations from the original plan.

Do not add excessive examples to the plan file.
