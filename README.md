![GitHub Copilot app for Beginners](assets/course-hero-command-center.webp)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)&ensp;
[![GitHub Copilot app documentation](https://img.shields.io/badge/GitHub-Copilot_App_Docs-00a3ee?style=flat-square&logo=github)](https://docs.github.com/en/copilot/concepts/agents/github-copilot-app)&ensp;
[![Course level](https://img.shields.io/badge/Level-Beginner-success?style=flat-square)](#target-audience)

🎯 [What You'll Learn](#what-youll-learn) &ensp; 👥 [Target Audience](#target-audience) &ensp; 🤖 [Copilot Family](#understanding-the-github-copilot-family) &ensp; 📚 [Course Structure](#course-structure) &ensp; 🙋 [Getting Help](#getting-help)

# GitHub Copilot app for Beginners

> Learn to direct and orchestrate AI coding agents from a single desktop app.

Think of the GitHub Copilot app as a desktop cockpit for agentic coding work. Here, *agentic* means AI agents can plan and take actions for you, while you still supervise what they do. The app brings together sessions, plans, diffs, tests, browser previews, AI chats, issues, pull requests, and more so you can guide that work without bouncing between multiple tools.

This course treats the app as a place to guide and review work, not a magic code button. You'll practice choosing context, picking a session mode, checking evidence, and deciding when automation is appropriate to use.

![GitHub Copilot app](assets/github-copilot-app.webp)

## 🎯 What You'll Learn

By the end of the course, you'll be able to:

- Install and sign in to the GitHub Copilot app
- Connect a repository and use chats for safe exploration
- Start sessions from prompts, issues, and pull requests
- Explain Interactive, Plan, and Autopilot modes
- Use worktree-backed sessions without colliding with your main branch
- Attach useful context with `@`, `#`, and `/`
- Review diffs, run tests, preview a web app, and validate changes
- Use My work for issues, PRs, review comments, and failing checks
- Understand where settings, instructions, skills, canvases, and automations fit

The main sample used throughout the course can be found at:

```text
samples/book-app-web
```

## Target Audience

This course is designed for:

- Developers who want to orchestrate, guide, and review agent-driven coding work
- Students and self-taught learners who want a guided path
- Teams evaluating how to keep humans in control while agents do more work
- Copilot CLI or IDE Copilot users who want to understand where the desktop app fits

No agentic development experience is required. Basic GitHub, Git, and JavaScript project familiarity will help. The sample app is a small React/Vite project, so basic npm command familiarity helps in the development chapters. Use the current [Node.js LTS](https://nodejs.org) for `samples/book-app-web`.

The GitHub Copilot app works with a Copilot plan or with your own model provider. Business and Enterprise accounts need the **GitHub Copilot app** policy left enabled. That policy is separate from the Copilot CLI policy.

## 🤖 Understanding the GitHub Copilot Family

| Product | Where it runs | Best for |
|---|---|---|
| GitHub Copilot app (this course) | Desktop app | Supervising sessions, plans, diffs, browser validation, PRs, canvases, and automations |
| GitHub Copilot in IDEs | VS Code, Visual Studio, JetBrains, and other editors | Agents, inline suggestions, chat, and editor-centered coding |
| GitHub Copilot CLI | Terminal | Terminal-native agent work and command-line workflows |
| Copilot cloud agent | GitHub-hosted environment | Background work on issues and cloud sessions when enabled |

![Where the GitHub Copilot app fits across Copilot surfaces](assets/copilot-family-comparison.webp)

This course focuses on the GitHub Copilot app. Along the way, you'll see how it connects to GitHub, local tools, browser previews, terminal output, and cloud capabilities when available.

## 📚 Course Structure

| Chapter | Title | What learners do |
|:--:|---|---|
| 00 | 🚀 [Quick Start](./00-quick-start/README.md) | Prepare the course environment and verify a chat |
| 01 | 👋 [First Steps](./01-first-steps/README.md) | Learn why you'd use the app, then tour key features: UI, Chats, settings, sessions, modes, and model controls |
| 02 | 🌳 [Sessions, Worktrees, and Context](./02-sessions-worktrees-context/README.md) | Start isolated sessions and use `@`, `#`, and `/` for context |
| 03 | ⚡ [Development and GitHub Workflows](./03-development-workflows/README.md) | Review, debug, test, and preview a change, then move it through My work, issues, PRs, review comments, checks, and guided fixes |
| 04 | 🧰 [Skills, Model Context Protocol (MCP) Servers, and Plugins](./04-skills-mcp-plugins/README.md) | Start with repo-local skills, then learn optional MCP servers, plugins, and agents |
| 05 | 🖼️ [Canvases](./05-canvases/README.md) | Run `/create-canvas` for a session board and keep plan plus validation evidence visible |
| 06 | 🔁 [Automations](./06-automations/README.md) | Start with a manual open-work summary, then learn schedules and optional cloud automations |

## 📖 How This Course Works

Each chapter follows the same beginner-friendly pattern:

1. A short hook that explains why the topic matters
2. Learning objectives and estimated time
3. Prerequisites when needed
4. A real-world analogy
5. Core concepts in plain language
6. Hands-on examples using `samples/book-app-web`
7. Contextual images and app screenshots to support the lesson
8. Expected output and notes about how it works
9. Troubleshooting tips and common issues
10. Key takeaways, an assignment, and navigation links

When a chapter shows a model response, remember that demo output varies. Your app version, model, reasoning setting, repository context, and enabled tools can change the response.

## Glossary, Appendices, and Sample

- [Glossary](./GLOSSARY.md)
- [Git worktrees](./appendices/git-worktrees.md)
- [Training GitHub scenarios](./appendices/training-github-scenarios.md)
- [Troubleshooting reference](./appendices/troubleshooting-reference.md)
- [Book App Web sample](./samples/book-app-web/README.md)

## Command, Reference, and Help

- [GitHub Copilot app overview][about-app]
- [Getting started with the app][getting-started]
- [Working with sessions][agent-sessions]
- [Issues and pull requests][issues-prs]
- [Using automations][automations]
- [Working with canvas extensions][canvas-docs]
- [Customizing the GitHub Copilot app][customizing]

## Getting Help

- Re-read the troubleshooting section in the chapter you're working on
- Check the official GitHub Copilot app documentation
- Confirm that your GitHub account, repository permissions, and organization policies allow the feature you're trying to use

## Contributing

Course samples are designed to support predictable learning exercises. If you contribute, avoid changing sample behavior unless the course instructions and checks are updated at the same time.

Suggested flow:

1. Fork the repository
2. Create a feature branch
3. Update the relevant course file
4. Verify links and sample commands
5. Open a pull request

## License

This project is licensed under the terms of the MIT open source license. See [LICENSE](./LICENSE) for details.

## Additional References

- [Public app repository][app-readme]
- [GitHub Copilot app GA changelog][ga-changelog]

[about-app]: https://docs.github.com/copilot/concepts/agents/github-copilot-app
[getting-started]: https://docs.github.com/copilot/how-tos/github-copilot-app/getting-started
[agent-sessions]: https://docs.github.com/copilot/how-tos/github-copilot-app/agent-sessions
[issues-prs]: https://docs.github.com/copilot/how-tos/github-copilot-app/managing-issues-and-pull-requests
[automations]: https://docs.github.com/copilot/how-tos/github-copilot-app/using-automations
[canvas-docs]: https://docs.github.com/copilot/how-tos/github-copilot-app/working-with-canvas-extensions
[customizing]: https://docs.github.com/copilot/how-tos/github-copilot-app/customize-github-copilot-app
[app-readme]: https://github.com/github/app
[ga-changelog]: https://github.blog/changelog/2026-06-17-github-copilot-app-generally-available/
