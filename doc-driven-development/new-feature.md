# Updating Plans for Doc Driven Development
Doc-driven-development works great for updating documentation like README's and CHANGELOGs, but we never actually update plans as we develop. Often, development exposes problems, and plans evolve. For this reason, it is favorable that we track which plans are in progress, so we can update them as we develop.

For Doc-Driven-Development, this change is quite simple. In the plans directory, we add a plans.md file, and we create a table that tracks the names of plans created. One of these plans at any given time may be labeled **IN PROGRESS**. This is an indicator for Claude that all code on this branch should be accounted for in that plan file.

This addition to the Doc-Driven-Development flow is simple:

- Describe the feature you would like Claude to create, giving it the context it requires
- run /doc-driven-development:plan
	- Claude should ensure there are no plans labeled **IN PROGRESS** in plans.md
	- When finished planning, claude should label the new plan **IN PROGRESS**
- run /doc-driven-development:implement
- run /doc-driven-development:implement-tests
- run /doc-driven-development:update-docs
	- Claude should update the plan labeled **IN PROGRESS**

Now, when we run update-docs, Claude will be prompted to check the plans.md file to determine which plan needs to be updated based on the changes made in the codebase. Claude will update this plan accordingly. Then, a user can push to github. This completes one cycle of doc-driven-development.
