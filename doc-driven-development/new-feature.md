# Code Reviews with doc-driven-development
 It's important we enforce quality PR reviews when utilizing doc-driven-development. A few things matter when doing code reviews of AI generated code:
- Formatting
- Architectural Consistencies
- Accurate Documentation
- Potential Bugs
- Clear and Concise Code
- Useful Comments
By using /doc-driven-development:review, Claude will launch a number of agents whose sole purpose are to attack one of the issues defined above. The following agents will be utilized:
- Formatting Agent: A single agent responsible for confirming that new code is consistent with the formatting habits of the repository. The repo should have a FORMAT.md file that describes how code should be formatted, but if this is missing, or if other formatting consistencies are identified through analysis of the codebase, Claude should auto-create this file and document the best practices of the codebase for future use.
- Architectural Consistencies: A single agent that reviews relevant documentation in the README of the application and confirm that new code follows the architectural decisions of the codebase. This includes things like memory access consistencies, how variables pass through the system, where sleeps are or are not used, ISR consistencies, and the like.
- Accurate Documentation: A single agent that reviews the code written and confirms the documentation that has been added to the README, CHANGELOG, and associated plan files are the most up to date.
- Potential Bugs: A single agent that reviews the code written and outlines potential bugs that may exist. These should be appended to the plan file so that in human code reviews, these bugs can be discussed.
- Clear and Concise code: Two agents that work in unison. One agent should justify why the code is written the way it was, the other agent should either validate the decisions or provide suggestions on how this code can be improved. This is a continuing dialogue until all code has been reviewed.
- Useful comments: An agent that reviews the comments left throughout the code changes and confirms that they are useful to humans that will be reviewing the codebase. This includes both function declarations and general comments.
These agents allow us to confirm that all changes are sustainable for future development within the codebase.
