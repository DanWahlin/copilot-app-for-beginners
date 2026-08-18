# Training GitHub Scenarios

The root README and Chapter 00 include the normal fork, clone, and setup-script path. This appendix explains what that setup creates and gives manual fallback steps for learners who cannot run the script.

Use a fork or disposable training repository. Do not use a production repository.

## What you'll create

| Course item | Source draft | Used in |
|---|---|---|
| Seeded issues | `samples/app-course-issues.md` | Chapters 02, 03 |
| Practice branches | Training branch setup steps in each issue draft | Chapters 02, 03 |
| Pull request scenarios | `samples/app-course-pr-scenarios.md` | Chapter 03 |
| Failing check example | PR scenario 2 and the `Book app web` workflow | Chapter 03 |
| Merge-readiness example | PR scenario 3 | Chapter 03 |

## Prerequisites

- A GitHub account with permission to create issues and pull requests in the training repository
- A fork of this course repository, or another disposable training copy pushed to GitHub
- GitHub Actions enabled for the repository if you'd like to practice failing checks. In a new fork, open its **Actions** tab on GitHub and enable workflows if GitHub shows a prompt.
- Git, Node.js LTS, and the GitHub CLI (`gh`)
- `gh auth login` completed for the account that owns the fork or training repository

If you cannot create issues or pull requests, read the workflows and follow along with the screenshots instead.

## Recommended path: Fork, clone, run the setup script

1. Fork this repository on GitHub.
2. Clone your fork:

   ```bash
   git clone https://github.com/YOUR-USER/copilot-app-for-beginners.git
   cd copilot-app-for-beginners
   ```

3. Sign in with GitHub CLI if needed:

   ```bash
   gh auth login
   ```

4. Preview what the setup script will do:

   ```bash
   node .github/scripts/setup-training-scenarios.js --dry-run
   ```

5. Confirm that the `Repository:` line shows your fork, then run the setup:

   ```bash
   node .github/scripts/setup-training-scenarios.js --yes
   ```

6. Open the GitHub Copilot app and connect your fork or local clone.

The setup script is designed to be safe to rerun. It reuses existing labels, issues, branches, pull requests, and the seeded PR comment when they already exist.

## What the setup script creates

The setup script creates:

- course labels such as `book-app-web`, `good first issue`, `bug`, `tests`, `accessibility`, `copy`, `ui`, `responsive`, and `ci`
- five seeded GitHub issues based on [`samples/app-course-issues.md`](../samples/app-course-issues.md)
- practice branches with intentional course regressions
- three pull request scenarios based on [`samples/app-course-pr-scenarios.md`](../samples/app-course-pr-scenarios.md)
- a safe PR conversation comment for the empty-state copy exercise
- one failing-check PR that uses the `Book app web` workflow

The setup script assigns seeded issues to the GitHub user authenticated with `gh`, so they are easier to find in My work. Manual fallback issues should be assigned to the learner when possible.

## Manual fallback: Create the seeded issues

If you cannot run the script, open [`samples/app-course-issues.md`](../samples/app-course-issues.md) and create one GitHub issue for each issue draft you'd like to practice.

Minimum set for the course:

1. `Make search case-insensitive`
2. `Keep unread stats correct when filters are active`
3. `Improve the empty state copy`
4. `Polish book card spacing and responsive layout`
5. `Simulate a failing stats test for CI practice`

With GitHub CLI, create them from the repository root:

```bash
gh issue create --title "Make search case-insensitive" --label "bug,good first issue,book-app-web" --body-file samples/app-course-issues.md
```

That command uses the full file as the body, so it is only a shortcut. For a cleaner training repo, copy each issue section into its own issue. If the labels do not exist in your repository, create them first or omit the `--label` option.

## Manual fallback: Create practice branches

For each issue you plan to practice, create the branch named in that issue draft, then apply only that issue's training-branch setup.

Example for Issue 1:

```bash
git switch -c practice-search-case-bug
```

Then apply the small regression shown under "Training branch setup" in the issue draft. Commit the regression so Copilot has a real branch state to inspect:

```bash
git add samples/book-app-web/src/App.tsx
git commit -m "Seed search case practice bug"
git push -u origin practice-search-case-bug
```

Repeat this pattern only for the scenarios you'd like to use. Keep each regression on its own branch.

## Manual fallback: Create pull request scenarios

Open [`samples/app-course-pr-scenarios.md`](../samples/app-course-pr-scenarios.md). Create one pull request for each scenario you'd like to practice.

Recommended minimum:

1. A PR with a safe PR conversation comment about empty-state copy
2. A PR with a failing stats check
3. A PR used only to discuss Agent Merge readiness

For a PR conversation comment exercise:

1. Create a branch from the relevant practice branch.
2. Make a small change to the empty-state copy.
3. Open a pull request.
4. Add the seeded PR conversation comment from the scenario file.

The learner can then open the PR in the GitHub Copilot app and ask Copilot to propose the smallest safe response.

## Manual fallback: Create a failing check example

The repository includes `.github/workflows/book-app-web.yml`. It installs dependencies, runs tests, and builds `samples/book-app-web`.

To create the failing-check scenario:

1. Create a branch named `practice-failing-stats-check`.
2. Apply the intentional stats regression from PR scenario 2.
3. Push the branch and open a pull request.
4. Wait for the `Book app web` workflow to fail.

Use this PR in Chapter 03 when practicing failing-check analysis.

## Keep the training repo safe

- Use a fork or disposable training repository.
- Keep one regression per branch.
- Do not merge intentional regression branches into the default branch.
- Do not add secrets, production data, or private customer data.
- Delete training branches after the course if you no longer need them.

## Quick readiness check

Before starting Chapter 03, confirm:

- At least one seeded issue exists.
- At least one practice branch exists.
- At least one pull request exists for review or failing-check practice.
- GitHub Actions can run in the repository if you want CI examples.
- You can see the repository, issues, and PRs in the GitHub Copilot app.
