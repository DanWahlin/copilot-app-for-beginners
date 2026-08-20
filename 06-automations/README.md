![Chapter 06: Automations](assets/chapter-header.svg)

> **What if your recurring GitHub Copilot prompt became a reusable button?**

Chapter 05 made session work visible with canvases. This chapter makes repeatable work reusable.

Automations let you save agent tasks in the GitHub Copilot app and run them on demand or later on a schedule. You'll start with a manual open-work summary that runs only when you choose. Scheduled, cloud, and issue-triggered automations appear later because they can involve policy, billing, and permission decisions.

## 🎯 Learning Objectives

By the end of this chapter, you'll be able to:

- Explain when to automate recurring agent work instead of starting a manual session
- Create and test an on-demand local automation
- Review automation run history, status, errors, and selected tools
- Apply least-privilege tool selection
- Understand scheduled automations as an intermediate next step
- Recognize cloud and issue-triggered automations as advanced workflows

> ⏱️ **Estimated Time**: ~50 minutes (20 min reading + 30 min hands-on)

---

## ✅ Prerequisites

Before starting:

- Complete Chapter 05
- Open the course repository in the GitHub Copilot app
- Run the Chapter 00 setup script so practice issues and pull requests exist
- Use `samples/book-app-web` for validation examples

If you skipped the setup script earlier, [run it now](../00-setup/README.md#2-fork-clone-and-prepare-the-course-repository) before the first automation exercise. The open-work summary needs real issues or pull requests to inspect.

---

## 🧩 Real-World Analogy: Programming the Sequencer

A producer does not replay the same drum pattern by hand every night. They program it into a sequencer once and let it run when needed:

![Sequencer analogy for automations](assets/sequencer-automation.webp)

| Sequencer | App automation |
|---|---|
| Programmed pattern | Saved prompt |
| Hit play | Manual trigger |
| Run on the clock | Schedule |
| Chosen instruments | Selected tools |
| Producer checks the mix | Human reviews the result |

Start with a manual automation so you can test the prompt safely before giving it a schedule or trigger.

---

## Core Concepts

### Automation Is a Saved Agent Run

An automation has four beginner-friendly parts:

| Part | Question |
|---|---|
| Trigger | What starts it? |
| Prompt | What should the agent do? |
| Tools | What is the least access needed? |
| Review path | Where do I inspect the result? |

![Automation trigger to agent run](assets/automation-trigger-to-run.webp)

### Local versus cloud, in one line

- **Local automation**: runs from your machine while the app can reach the project
- **Cloud automation**: can run on GitHub-hosted infrastructure when policy and repository settings allow it

Start local and manual. Add cloud only after the prompt is trustworthy.

### Start Manual

Manual automations run on demand. They're the safest first step because you can:

- test the prompt
- inspect output
- adjust scope
- avoid surprise runs
- confirm tools are minimal

![Start manual, then expand automations](assets/manual-first-path.webp)

### A Good Beginner Automation

Pick work you already do more than once:

- "What open issues and pull requests need attention?"
- "What validation steps should I run before opening a PR?"

Avoid first automations that write code, post comments, change labels, approve reviews, or merge pull requests.

> 💡 **Tip**: Automations are saved in the app, not committed with the repository. Treat the prompt like production instructions: keep secrets out of it, and give the automation only the tools it needs.
>
> Issue titles and bodies can contain untrusted text. A read-only summary is safer than an automation that posts comments or edits the repository. That reduces **prompt-injection** risk, where hostile text tries to steer the agent.

---

## Hands-On Exercises

In these exercises, you'll:

- Create a manual open-work summary automation
- Run it and inspect its history
- Create a second manual validation checklist automation

### 1. Create a Manual Open-Work Summary

This is the main beginner automation for the chapter. It answers a real daily question: what needs attention in this repository right now?

Create an automation named:

```text
Course repo open work summary
```

Use a manual trigger.

Create it with this path:

1. Open **Automations** in the sidebar.
2. Choose **New automation**.
3. Select **Manual** as the trigger.
4. Paste the prompt below.
5. Select the smallest read-only tool set available.
6. Prefer **local** if the app offers local versus cloud.
7. Save, then run it with the play control.

If a control label differs slightly by app version, stay on Manual + read-only tools and the same prompt.

![New automation form with the trigger dropdown open showing Manual, scheduled, and issue-based choices](assets/app-automation-new-triggers.webp)

> Note: Official automations docs list **Manual**, **Hourly**, **Daily**, **Weekly**, **CRON**, **Issue**, and **Pull request** trigger categories. The exact events available under Issue and Pull request can vary by app version or repository capabilities. Use only **Manual** for this chapter. You'll also see a **Templates** gallery with prebuilt automations. The same rules apply: start manual and read-only, then expand once the prompt is trustworthy.

Use this prompt:

```text
Summarize open issues and open pull requests in this repository.
For each item, include: number, title, status, and the next human action.
Do not edit files, add comments, change labels, approve reviews, or merge anything.
```

Tool guidance:

- Allow read-only repository or GitHub context if available.
- Do not grant write-capable tools for this beginner exercise.
- Keep the automation local if local automations are available in your setup.

#### Expected Output

The run should produce a short list of open issues and pull requests, plus a suggested next human action for each item.

Demo output varies. Repository state, permissions, and available tools will change the result. If the list is empty, confirm the Chapter 00 setup script created practice issues and pull requests, then check repository permissions.

#### How It Works

The automation saves the prompt and trigger so you can run the same bounded task again later. The selected tools control what the agent can inspect. Because the prompt is read-only, the risk stays low while you learn the review loop.

---

### 2. Run It and Inspect History

Run the automation manually. Then open the run details.

![Automations tab showing the course open-work summary. Ignore any leftover personal automations in the capture, such as an SRT file task](assets/app-automations-list.webp)

Look for:

- run status
- timestamp
- prompt used
- selected tools
- result summary
- error text if the run failed

![Automation run detail with tool activity and the open-work summary of issues and pull requests](assets/app-automation-run-detail.webp)

#### Pause Point

Before editing the automation, ask:

1. Did the prompt ask for one bounded task?
2. Did the automation have only the tools it needed?
3. Did the result need human review?
4. Would this be safe to run again?

---

### 3. Create a Manual Validation Checklist

Create a second manual automation for local project validation:

```text
Book app validation checklist
```

Prompt:

```text
Create a validation checklist for the current session before a pull request is opened. Include these commands exactly:

cd samples/book-app-web
npm install
npm test -- --run
npm run build

If browser validation is needed, include:

cd samples/book-app-web
npm run dev -- --host 127.0.0.1 --port 5173

Do not run commands or edit files. Return the checklist only.
```

#### Expected Output

The automation should return a checklist. It should not modify files or run commands.

Demo output varies, but the commands should remain exact.

#### Why Keep Both Automations

| Automation | Best for |
|---|---|
| Course repo open work summary | "What needs attention on GitHub?" |
| Book app validation checklist | "What should I verify before a PR?" |

Together they cover the two most common pre-handoff checks without writing anything for you.

---

<details>
<summary>Intermediate: Scheduled automations</summary>

After the manual open-work summary works reliably, you can consider a schedule.

Good candidates:

- daily open-work summary for the same repository
- weekly dependency review summary
- morning issue triage summary

Use a schedule only when the prompt is bounded and the result has a review path.

Before scheduling, narrow:

- repository scope
- branch or label filters
- read/write tools
- expected output format

A practical next step is to schedule the same open-work summary once a day, then check the run history the next morning. If the summary is noisy, tighten the prompt before adding more triggers.

</details>

<details>
<summary>Advanced: Cloud automations</summary>

Cloud automations can run when your machine is off, but they can depend on:

- organization policy
- repository cloud-agent settings
- billing
- selected tools
- permissions
- private or internal repository access for some cloud flows

Use cloud automations only after the manual version works and after you understand the permission model. Cloud automations can be unavailable on a public fork, which is what this course uses. Stay on local manual runs unless your account and repository clearly support cloud automations.

![Local versus cloud automations](assets/local-vs-cloud-automations.webp)

![Cloud automation Tools selector. This capture still shows many tools selected. For the course, keep only read actions such as Read issue, List issues, and Search issues](assets/app-automation-cloud-tools.webp)

</details>

<details>
<summary>Advanced: Issue-created triggers</summary>

Issue-triggered automations can respond when an issue is created. This is advanced because a broad trigger can run too often or act on untrusted input.

Safer pattern:

1. Start read-only.
2. Limit repository scope.
3. Filter by label.
4. Avoid write tools until the summary is reliable.
5. Review run history before expanding permissions.

If an issue-triggered automation fires too often, narrow the issue search query, label filter, or repository scope before adding write-capable tools.

</details>

---

## Troubleshooting

If you are still stuck, see the [Troubleshooting Reference](../appendices/troubleshooting-reference.md).

<details>
<summary>Automation issues</summary>

| Problem | What to check |
|---|---|
| Local automation does not run | App availability, project still connected, local tools and credentials |
| Open-work summary is empty | Setup script completed, repository permissions, filters, whether issues or PRs are open |
| Cloud automation unavailable | Organization policy, repository settings, billing, selected tools, public vs private repository limits |
| Scheduled run is noisy | Prompt scope, schedule frequency, repository or label filters |
| Automation made surprising suggestions | Remove tools, make the prompt more bounded, add explicit non-goals |

</details>

---

## 🔑 Key Takeaways

1. Automations turn repeatable prompts into reusable runs.
2. Manual automations are the safest first step.
3. Every automation needs a trigger, prompt, tool set, and review path.
4. An open-work summary is a strong beginner automation because it is useful, read-only, and easy to review.
5. Scheduled automations are intermediate because they run without you clicking each time.
6. Cloud and issue-triggered automations are advanced because policy, billing, and permissions matter.
7. Apply least privilege: give an automation only the tools it needs. Keep write actions out of early automations that read issue content, so untrusted text is less able to steer the agent.

---

## 📝 Assignment

![Assignment](../assets/assignment.webp)

Create one manual automation for your own workflow:

1. Name it clearly.
2. Use a manual trigger.
3. Write a prompt with one bounded task.
4. Give it only read-only tools if possible.
5. Run it once.
6. Inspect the run history and revise the prompt.

Success criteria: You're able to explain why the automation is safe to run again.

---

## 🎓 Course Complete

That's the full course. You've gone from setup and orientation through sessions, worktrees, and context; the development-and-GitHub workflow loop; skills, MCP servers, and plugins; canvases; and automations. Along the way, one habit stayed constant: keeping a human in control of quality and delivery.

Here's a recap of everything you practiced:

| Area | What you practiced |
|---|---|
| Sessions and worktrees | Work in scoped branches and isolated worktrees. Parallel sessions were optional |
| Context | Use prompts, files, issues, and instructions intentionally |
| Development and GitHub | Plan, change, and validate with tests, builds, browser previews, and diffs, then move work through issues, PRs, checks, and guided fixes |
| Customization | Repository instructions, skills, MCP servers, and plugins |
| Visibility | Canvases for shared, inspectable state |
| Repetition | Manual and scheduled automations, used safely |

That last habit is the whole point: human judgment stays in the loop at every major control point, before implementation starts, before a pull request is opened, and before any merge automation is enabled. Practice on small, real issues first, then add advanced workflows as the work stays independent, validated, and reviewable.

**[← Back to Chapter 05](../05-canvases/README.md)** | **[Return to Course Home →](../README.md)**

---

## Source References

- [Using automations in the GitHub Copilot app](https://docs.github.com/en/copilot/how-tos/github-copilot-app/using-automations)
- [About automations in the GitHub Copilot app](https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-automations)
- [GitHub Copilot app generally available](https://github.blog/changelog/2026-06-17-github-copilot-app-generally-available/)
- [GitHub Copilot app product blog](https://github.blog/news-insights/product-news/github-copilot-app-the-agent-native-desktop-experience/)
