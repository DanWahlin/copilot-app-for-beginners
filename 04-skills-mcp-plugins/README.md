![Chapter 04: Skills, Model Context Protocol Servers, and Plugins](assets/chapter-header.svg)

> **What if GitHub Copilot could reuse your team's review checklist without gaining any new external access?**

Chapter 03 put you through a full supervised loop: change, evidence, issue, pull request. This chapter adds the next layer: reusable expertise.

**Today's required path is skills.** Model Context Protocol (MCP) servers, plugins, and custom agents are only a map for later.

In the GitHub Copilot app, the safest extension point is a **repo-local skill**. A skill is a folder of guidance GitHub Copilot can load when a task matches. It keeps the beginner path local, reviewable in git, and free of new credentials.

MCP servers, plugins, model providers, and custom agents are useful too. They also add setup, permissions, or policy decisions. Those stay optional in collapsible sections so you can learn the map without leaving the beginner path.

## 🎯 Learning Objectives

By the end of this chapter, you'll be able to:

- Explain when skills help more than a one-off prompt
- Inspect the repo-local `book-app-reviewer` skill included with the course
- Use a skill-guided review prompt in a GitHub Copilot app session
- Discover skills with `/skills` or the slash palette when your app supports it
- Explain the difference between reusable expertise and external tool access
- Choose least-context and least-tool setups
- Locate optional MCP server, plugin, model provider, and custom agent settings without depending on them

> ⏱️ **Estimated Time**: ~55 minutes (20 min reading + 35 min hands-on)

---

## ✅ Prerequisites

Before starting:

- Complete Chapter 03
- Open the course repository in the GitHub Copilot app
- Use `samples/book-app-web` for all hands-on prompts
- Keep the beginner path repo-local

---

## 🧩 Real-World Analogy: A Song Chart for the Session

Imagine a session band. The players are skilled, but the bandleader still hands out a chart for each song:

![Song chart analogy for Copilot skills](assets/song-chart-skills.webp)

| Chart note | Why it helps |
|---|---|
| Key and tempo | Everyone stays in sync |
| Song structure | No one gets lost |
| Dynamics marked | A consistent feel |
| Final run-through | Validation before the take |

A skill is like that chart. It does not hand the player a new instrument. It reminds them how this band wants the song played.

---

## Core Concepts

### Skills first

Skills package task-specific instructions in a folder with a `SKILL.md` file. GitHub documents them as agent skills: folders of instructions, scripts, and resources that GitHub Copilot can load when they are relevant.

| Extension type | Beginner meaning | Required for this chapter? |
|---|---|---|
| Skills | Reusable expertise and checklists | Yes |
| MCP servers | External tools or live data | No |
| Plugins | Bundled capabilities that may include tools, skills, or agents | No |
| Custom agents | Specialized roles selected with `/agent` | No |

![Extending the GitHub Copilot app](assets/extending-copilot-app.webp)

![Skills settings. Your list will be shorter than this capture. Look for Project skills and `book-app-reviewer`, not every skill on someone else's machine](assets/app-settings-skills.webp)

You can manage skills in app **Settings → Skills**. Skills already configured for your repositories or Copilot CLI are also available in the GitHub Copilot app.

> 💡 **Tip**: A skill changes how GitHub Copilot approaches work. It does not automatically give GitHub Copilot access to new external systems.

### Where repo-local skills live

Use this structure:

```text
.github/
└── skills/
    └── book-app-reviewer/
        └── SKILL.md
```

Repo-local skills are ideal for this course because:

- they are version controlled
- teammates can review them
- they do not require API keys
- they keep the beginner path predictable

### Skill versus one-off prompt

| One-off prompt | Skill |
|---|---|
| Good for a single task | Good for a repeated checklist |
| Easy to forget later | Lives in the repository |
| Hard for a team to share | Reviewable in pull requests |
| Easy to drift between sessions | Same guidance each time |

![One-off prompt versus skill](assets/skill-vs-one-off-prompt.webp)

---

## Hands-On Exercises

In these exercises, you'll:

- Inspect the `book-app-reviewer` skill
- Compare a generic review with a skill-guided review
- Use the skill before making a real change

### 1. Inspect the `book-app-reviewer` skill

This repository already includes the skill:

```text
.github/skills/book-app-reviewer/SKILL.md
```

Open that file and confirm it includes guidance for:

- accessibility
- responsive layout
- testing and validation commands
- safe, focused changes

If your app shows `/skills` in the slash command palette, use it as an optional discovery step:

```text
/skills list
```

The output should show skills GitHub Copilot can find from built-in, user, plugin, or project locations. If `/skills` is not available, continue by inspecting the repo-local skill file directly.

If you'd like to rebuild it manually for practice, copy the existing file to a scratch folder first. Do not overwrite the course copy during the beginner path.

#### Expected result

You now know what the skill tells GitHub Copilot to care about before it reviews `samples/book-app-web`.

#### How it works

GitHub Copilot can use the skill when your prompt matches the skill description. You can also refer to the skill by name in your prompt.

Some installed skills also appear as direct slash commands, such as `/skill-name`. Those commands vary by environment, so treat the slash palette as the source of truth.

> 💡 **Tip**: Skills do not always attach automatically. If the reply looks generic, name `book-app-reviewer` in the prompt and ask which checklist items from the skill it considered. That is normal, not a failed exercise.

---

### 2. Compare a generic review and a skill-guided review

Open a new Plan or Interactive session in the app. Try a generic prompt first:

```text
Review @samples/book-app-web for one beginner-friendly improvement. Do not edit files yet.
```

Then try a skill-guided prompt:

```text
Use the book-app-reviewer skill to review @samples/book-app-web for one small accessibility or responsive layout improvement. Do not edit files yet.
```

Demo output varies. Look for differences in focus, not exact wording.

#### Expected output

The skill-guided response should be more likely to mention accessibility, responsive layout, tests, validation commands, and safe change boundaries.

#### How it works

The prompt and skill description point at the same concerns, so GitHub Copilot has a clearer reason to use the skill.

---

### 3. Use the skill before a real change

Ask GitHub Copilot to plan a small improvement. Use book-card layout this time, not empty-state copy:

```text
Using the book-app-reviewer skill, create a plan to improve book-card spacing or responsive layout in @samples/book-app-web. Keep the change small and include validation commands. Do not edit files yet.
```

Pause and inspect the plan before allowing implementation.

#### Expected result

The plan should include:

- the likely files to inspect, such as `BookCard.tsx` or `app.css`
- a small spacing, hierarchy, or responsive-layout improvement
- validation with:
  - `cd samples/book-app-web`
  - `npm test -- --run`
  - `npm run build`

Demo output varies.

#### Pause point

Before you allow any file edits, confirm:

1. The change is small enough for a beginner course chapter.
2. The skill's accessibility or responsive-layout guidance is visible in the plan.
3. Validation commands are present.
4. You still want the change.

---

<details>
<summary>Intermediate: MCP servers are optional external tool access</summary>

MCP servers connect GitHub Copilot to tools or live data, such as documentation sources or internal services. Any MCP servers configured for your repositories or Copilot CLI are available in the GitHub Copilot app. You can also manage them under **Settings → MCP Servers**.

They can help a lot, but authentication and organization policy can vary.

Beginner rule:

| Question | Recommendation |
|---|---|
| Do I need external live data? | If no, use repo files and skills first |
| Do I need GitHub issue or PR data? | Use built-in GitHub integration when available |
| Do I need third-party docs or tools? | Add only the MCP server required for the task |

![Give the agent only what it needs](assets/least-tool-principle.webp)

![MCP servers settings showing configured servers grouped by source](assets/app-settings-mcp-servers.webp)

If an MCP server does not work, check authentication, environment variables, enabled status, and whether the session needs to restart.

</details>

<details>
<summary>Intermediate: Plugins, model providers, and model strategy</summary>

Plugins are installable packages that can add skills, hooks (small automated reactions to app events), custom agents, or other capabilities. Browse them under **Settings → Plugins**.

Model providers can affect which models are available to sessions. Do not require plugin installation for this chapter. Learn where the controls are and how to disable capabilities you do not need.

Beginner model strategy:

| Task | Suggested approach |
|---|---|
| Quick explanation | Use a faster model and lower reasoning |
| Planning a code change | Use enough reasoning to compare options |
| Debugging failing tests | Use a stronger model if the failure is subtle |
| Large multi-file change | Keep context tight before increasing model capability |

![Plugins settings with install, manage, and enable/disable controls](assets/app-settings-plugins.webp)

Least-tool principle:

1. Start with repository context and a skill.
2. Add an MCP server only when the task needs external data.
3. Enable plugins intentionally.
4. Remove or disable capabilities that create noise.

</details>

<details>
<summary>Advanced: Custom agents, `/agent`, and built-in skills</summary>

Custom agents are specialized roles. In a session, type `/agent` to choose one. They are useful when you repeatedly need a persona such as security reviewer, documentation writer, or release manager.

Use `/agent` only after you're able to explain why a role is better than a skill for the task.

If `/agent` is available, the picker lists built-in, custom, plugin, or user agents. Skip it unless you can say why a role is better than the `book-app-reviewer` skill for this task.

| Use a skill when... | Use a custom agent when... |
|---|---|
| You need a repeatable checklist | You need a specialist persona |
| The normal agent can do the work | The workflow needs a different role |
| You want repo-local, lightweight guidance | You need reusable behavior across many tasks |

The GitHub Copilot app also ships built-in skills. Treat them as optional tools you discover when a task needs them, not as required setup for this chapter. One worth knowing about: `/security-review` scans a session's changes for vulnerabilities and reports findings with severity, making it a security-focused sibling to the `/rubber-duck` critique you used in Chapter 03. Official references:

- [About agent skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills)
- [Built-in skills for the GitHub Copilot app](https://docs.github.com/en/copilot/reference/github-copilot-app-reference/built-in-skills)

</details>

---

## Troubleshooting

If you are still stuck, see the [Troubleshooting Reference](../appendices/troubleshooting-reference.md).

<details>
<summary>Skills and extension issues</summary>

| Problem | What to check |
|---|---|
| Skill does not seem to apply | Skill path, `SKILL.md` filename, description keywords, session restart |
| GitHub Copilot gives generic advice | Mention `book-app-reviewer` and `@samples/book-app-web` explicitly |
| MCP server fails | Authentication, environment variables, enabled status, app reload |
| Plugin feature not visible | Plugin enabled state, project scope, app version |
| Too many irrelevant suggestions | Disable unused tools and keep prompt context narrower |

</details>

---

## 🔑 Key Takeaways

1. Start extension work with repo-local skills.
2. A skill provides reusable expertise, not automatic external access.
3. Skills already configured for repositories or Copilot CLI are available in the GitHub Copilot app.
4. MCP servers and plugins are optional because they may require credentials or policy decisions.
5. Custom agents are advanced role-based workflows.
6. Give the agent only the tools and context it needs.

---

## 📝 Assignment

![Assignment](../assets/assignment.webp)

Improve the `book-app-reviewer` skill on a branch. Do not commit it unless you intend to contribute the change.

1. Add one rule about book-card spacing or visual hierarchy.
2. Add one rule about validating responsive layout in the browser.
3. Ask GitHub Copilot to review the skill for clarity.
4. Use the skill in a Plan-mode prompt against `@samples/book-app-web`.

Success criteria: You're able to explain why the required exercise uses a repo-local skill instead of MCP, plugins, or custom agents.

---

## ➡️ What's Next

In the next chapter, you'll use canvases as shared control panels for a session. Start with built-in plan, browser, and terminal surfaces, then run `/create-canvas` for a session board on `samples/book-app-web`.

**[← Back to Chapter 03](../03-development-workflows/README.md)** | **[Next: Canvases →](../05-canvases/README.md)**

---

## Source References

- [Customizing the GitHub Copilot app](https://docs.github.com/en/copilot/how-tos/github-copilot-app/customize-github-copilot-app)
- [About agent skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills)
- [Built-in skills for the GitHub Copilot app](https://docs.github.com/en/copilot/reference/github-copilot-app-reference/built-in-skills)
- [About GitHub Copilot plugins](https://docs.github.com/en/copilot/concepts/agents/about-plugins)
- [GitHub Copilot app product blog](https://github.blog/news-insights/product-news/github-copilot-app-the-agent-native-desktop-experience/)
