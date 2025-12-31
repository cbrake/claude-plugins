Create a plan file named `plans/<current date>-"$ARGUMENTS".md`. Replace spaces
with '-' in the filename.

If a plan already exists that has not be committed, then update that plan.

Then switch to plan mode and create a plan for coding the current changes and
untracked files (start with `git diff` and `git status`) described in the
README.md and other documentation files. Note, in this phase, we are using
documentation to drive the code, not the other way around. When the plan is
complete, write it to the plan file.

The documentation may be written in past tense as if the feature already exists.
Assume any changes that have not been committed have not been implemented yet,
even though they are described as already implemented. This is a side effect of
documentation driven development.
