# Changelog

## [Unreleased]

### Added
- `/review` command for comprehensive code review using specialized parallel agents.
- Plan tracking via `plans/plans.md` to track which plan is currently in progress.
- `/update-docs` now updates the in-progress plan with implementation details.
- **Paused** status for plans - when starting a new plan, existing IN PROGRESS plans are paused instead of auto-completed.
- Commit decision flow in `/review` - choose auto-commit, manual, or skip.
- Completion decision flow in `/review` - mark plan as Completed or continue iterating.
- "Started At" column in `plans/plans.md` to record the commit hash when a plan is created.
- Commit tracking in plan files - `/implement` and `/implement-tests` now create logical git commits and record them in a `## Commits` section.

### Changed
- `/implement` now finds the IN PROGRESS plan, breaks implementation into logical units, and creates granular commits using conventional commit format.
- `/implement-tests` now follows the same pattern for test implementation with `test:` prefixed commits.
- `/review` now appends results to the IN PROGRESS plan file instead of creating separate files in `reviews/` directory.

## [1.0.8] - 2025-12-05

### Improved
- Release command now adds a new `[Unreleased]` section after creating a release.

## [1.0.7] - 2025-12-05

### Added
- `/release` command to automate version releases with changelog updates and git tagging.

## [1.0.6] - 2025-12-05

### Improved
- Documentation style guidelines now enforce consistent punctuation in lists.

## [1.0.5] - 2025-12-05

### Added
- `/execute` command for surgical code changes using inline instruction markers.

## Previous releases

See git log for earlier changes.
