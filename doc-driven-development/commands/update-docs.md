Update any relevant documentation to accurately reflect the current code changes
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

A user may specify a plan file as an argument. Update this plan file by
reviewing the codebase (git diff origin main, if needed) and confirming the most
recent form of the code is reflected in the content of the plan file. Do not add
excessive examples to the plan file. Do explain the rationale behind technical
decisions that were made.
