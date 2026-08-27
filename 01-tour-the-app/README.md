![Chapter 01: Tour the App](assets/chapter-header.svg)

> **What if agent work stopped bouncing you between chat, diffs, terminals, browser tabs, and pull requests?**

Now that the app is installed and connected to the course repository, this chapter answers why the desktop app helps if you already use GitHub Copilot in an editor or terminal. Then you'll tour the main navigation, compare chats with project sessions, and see how session modes change how much control you keep.

## 🎯 Learning Objectives

By the end of this chapter, you'll be able to:

- Explain when the GitHub Copilot app helps beyond using Copilot in an editor or Copilot CLI in the terminal
- Navigate Home, My work, Automations, Search, Sessions, and Chats
- Locate major settings areas such as General, Accounts, Sessions, Themes, Accessibility, and Voice dictation
- Explain Interactive, Plan, and Autopilot
- Select a model and reasoning effort based on task complexity (*reasoning effort* controls how hard the model thinks: lower is faster and cheaper, higher can help on harder tasks)
- Optionally try voice dictation

> ⏱️ **Estimated Time**: ~40 minutes (20 min reading + 20 min hands-on)

---

## ✅ Prerequisites

Complete [Chapter 00](../00-setup/README.md) first. If you jumped straight here, pause and use Chapter 00 to fork and clone the course repository, run the training setup script, and connect the repository in the GitHub Copilot app.

---

## Why use the GitHub Copilot app?

If you already use GitHub Copilot in VS Code or use Copilot CLI in the terminal, why bother with a separate app?

### The challenge

GitHub Copilot in the editor or terminal is excellent next to the code you already have open. VS Code can also open multi-root workspaces when you need more than one folder. The harder part is supervising agent work end to end: planning, isolated edits, tests, previews, issues, and pull requests. You end up piecing the story together yourself and asking "where was I?"

| Challenge | What it feels like |
|---|---|
| Shared working copy | Two agent tasks touch the same folder and branch, and the changes blur together |
| Scattered evidence | Plan in chat, diff in the editor, tests in a terminal, PR in the browser |
| Unclear autonomy | You are guessing whether to steer every step, approve a plan first, or let Copilot run |
| Explore versus change | A quick question and a real code change feel the same until files start changing |
| Repeat work | You retype the same prompt every week for PR summaries, checks, or cleanup tasks |

### The solution

The GitHub Copilot app is designed to make that supervision loop easier. It is not a replacement for your editor, and it is not "multi-project support" by itself. Editors already handle multi-folder work. The app gives you a desktop place to run and review agent sessions, keep task evidence together, and move work through GitHub without hunting across tools.

| Challenge | What the app adds |
|---|---|
| Scattered tools | Agent sessions, diffs, terminal output, browser previews, and GitHub work in one desktop app |
| Shared working copy | Project sessions keep focused work separate (you'll learn about worktrees later) |
| Unclear autonomy | Interactive, Plan, and Autopilot make the level of control obvious |
| Explore versus change | Chats for safe questions; project sessions when you are ready to work in the repo |
| Repeat work | Automations save a prompt and run it on demand, on a schedule, or from selected GitHub events |

![Editor versus GitHub Copilot app](assets/editor-vs-app.webp)

You still keep your editor. The app makes it easy to open the project in VS Code when you want to read code, debug, or edit by hand:

- Stay in VS Code, JetBrains, or your usual editor for deep editing and the IDE workflow you already know
- Open the GitHub Copilot app when you want to run agent sessions, pick a mode, review what changed, and move work through issues and pull requests
- Jump back to VS Code from the app any time you want the full editor on the same project
- Use Automations later for repeatable agent work you do not want to retype each time

---

## 🧩 Real-World Analogy: The Producer's Control Room

A producer in the control room doesn't handle every song the same way. Some takes need close direction. Some need the arrangement charted out first. Some quick questions just need a fast answer.

![Producer's control room analogy for GitHub Copilot app session modes](assets/producer-control-room-modes.webp)

The GitHub Copilot app works the same way:

- A chat is like asking a session musician a quick question.
- Interactive mode is like directing a take with frequent check-ins.
- Plan mode is like charting the arrangement and approving it before the first take.
- Autopilot is like giving a clearly defined task to a trusted system and letting it complete it with minimal intervention.

## Core Concepts

### Chat Versus Project Session

| Use this | When you're trying to... | Creates branch or worktree? |
|---|---|---|
| Chat | Ask questions, brainstorm, summarize, orient yourself | No |
| Project session | Plan, inspect, edit, test, or create PR-ready work | Usually yes, depending on session settings |

![Chat versus project session](assets/quick-chat-vs-project-session.webp)

### Session Modes

| Mode | How the app describes it | Beginner meaning | Use case |
|---|---|---|---|
| Interactive | "Step-by-step collaboration" | Copilot works with you step by step | You'd like to be involved throughout the entire process |
| Plan | "Plan first, execute when ready" | Copilot creates a plan before executing | The initial approach and project details matter |
| Autopilot | "End-to-end execution without interruption" | Copilot works independently | Tasks that are well defined and have clear outcomes |

![Session modes: Interactive, Plan, and Autopilot. Pick one for the task.](assets/session-mode-decision-ladder.webp)

### Automations

Sessions are for work you start and steer now. **Automations** are for work you want to reuse.

An automation stores a prompt and a trigger so you do not rebuild the same agent run every time. Common first uses include summarizing open pull requests, checking a recurring validation step, or kicking off a known cleanup task. You can start with a manual run, then move to schedules or selected GitHub events when the prompt is trustworthy.

For now, just notice **Automations** in the sidebar. You'll build one in [Chapter 06](../06-automations/README.md).

---

## Hands-On Exercises

In these exercises, you'll:

- Tour the app's main surfaces
- Brainstorm with chats
- Compare session modes to learn how you can use them
- Try search and voice dictation

### 1. Tour the App

Open the GitHub Copilot app and notice these areas in the sidebar:

1. **Home**: the landing view. Start a session, pick a repository, and see **Up next** issues or pull requests from connected repos
2. **My work**: your GitHub inbox for issues, pull requests, review requests, and checks
3. **Automations**: saved agent tasks you can run later
4. **Search**: find sessions, issues, pull requests, or paste a GitHub URL
5. **Sessions**: project sessions grouped by repository
6. **Chats**: short conversations that do not create a branch or worktree.

![App sidebar with Home, My work, Automations, Search, Sessions, and Chats](assets/app-sidebar.webp)

When you open **Home**, notice that you can start a session without picking a sidebar project first, and that **Up next** is a shortcut into GitHub work. You will use My work for that inbox in Chapter 03.

When you open **Automations**, you should see a place to create and manage saved agent runs. Do not build one yet. The goal is only to know where recurring work lives in the app.

Now open **Settings** and locate:

- General
- Accounts
- Sessions
- Themes
- Accessibility
- Voice dictation

![App settings](assets/app-settings.webp)

Here's a summary of the key settings areas:

| Setting area | What to notice now |
|---|---|
| General | App updates, where worktrees are stored, and some appearance controls |
| Accounts | Personal and Enterprise account information |
| Sessions | Default model, reasoning effort, remote access, branch prefix, session lifecycle settings, and **app-wide instructions** that apply to every session across projects |
| Themes | Dedicated light and dark theme options. Some theme controls also appear under General |
| Accessibility | Display zoom and keyboard shortcuts |
| Voice dictation | Microphone settings, shortcut setup, and transcription models |

Instructions live in more than one place:

- **Settings → Sessions**: app-wide **App instructions** that apply to every session across projects
- **Settings → Projects**, then the repository name: per-repository instructions added alongside the app-wide ones
- `.github/copilot-instructions.md`: the git-reviewable file form. You will open that file in Chapter 03.

Don't worry about changing any settings at this point - unless you want to. The goal is to know where key app settings live.

<details>
<summary>Additional settings</summary>

You'll also see Skills, Model Context Protocol (MCP) servers, Plugins, and Model providers.

- Skills are specific capabilities that can be used to extend the functionality of the app.
- MCP servers can connect the app to external tools or data.
- Plugins can add bundled capabilities (Skills, MCP servers, etc.).
- Model providers can be used to add custom models to the app.

</details>

### 2. Use Chats for Brainstorming

Open Chats and try this prompt:

```text
I'm learning the GitHub Copilot app with the copilot-app-for-beginners repository. What are three safe things I can ask before changing code?
```

Now try the following prompt and notice the response:

```text
Can this chat modify code if I tell it to do that?
```

#### Expected Output

Copilot should suggest exploration tasks such as explaining structure, identifying test commands, or summarizing the sample app.

For the second prompt, the response may say something like the following:

> Not directly in your configured repositories.
>
> This chat can **read and inspect** your repos, but it should not modify files in those primary working copies. If you ask for code changes, I'll create or open a dedicated project session with its own isolated worktree and coding agent, then delegate the work there.

> Note: Demo output varies. Treat the response as guidance, not a reproducible script.

#### How It Works

Chats help you learn without starting a branch. They are a great way to explore and understand your codebase before making changes.

---

### 3. Compare Session Modes

You'll compare the session modes by starting from the course project in the sidebar. Keep these prompts read-only so you can focus on how the modes feel before asking Copilot to change files.

![Session modes](assets/app-session-modes.webp)

1. In the left sidebar, find the **copilot-app-for-beginners** project you connected in Chapter 00.
2. Click the **+** button next to the project name.
3. When the prompt box opens, find the mode dropdown below it. It will show **Interactive**, **Plan**, or **Autopilot**. Next to it, you'll also see the model and reasoning effort dropdowns.
4. Choose the mode listed below, paste the matching prompt, and run it.
5. After you review the response, change the dropdown to the next mode and repeat.

> 💡 **Tip**: The model and **reasoning effort** controls sit beside the mode selector. Reasoning effort is how much thinking budget the model uses. Choose a faster model with lower reasoning for quick questions, and a stronger model with higher reasoning for complex changes. If the picker offers **Auto**, the app chooses a model from the task. Use `/usage` later if you want to see plan limits and credit spend. Use enough capability for the task, but not more than you need.

#### Plan Mode Prompt

Set the mode dropdown to **Plan**, then use this prompt:

```text
Plan how you'd investigate a hypothetical unread count bug in samples/book-app-web.
```

Once the plan is generated, review it and consider how you would implement the steps.

#### Interactive Mode Prompt

Set the mode dropdown to **Interactive**, then use this prompt:

```text
Walk me through the files you'd inspect for a hypothetical unread count bug in samples/book-app-web. Ask before suggesting any code change.
```

#### Autopilot Orientation Prompt

Set the mode dropdown to **Autopilot**, then use this prompt:

```text
Explain when Autopilot would be appropriate for a small documentation-only task in this repository. Do not edit files.
```

#### Expected Output

You'll notice that Plan mode emphasizes an approach, Interactive mode encourages step-by-step steering, and Autopilot is framed as higher autonomy.

#### Success Check

You're able to describe, in your own words, how Plan, Interactive, and Autopilot differ in how much you stay involved while Copilot works.

---

### 4. Search

Select **Search** from the sidebar. It is a jump box, not a full GitHub search engine.

1. Type `copilot-app-for-beginners`. You should see a way to create a new session or open the connected project.
2. Clear the box and type `is:issue`. Notice that issues can appear alongside sessions.
3. Paste a GitHub issue or pull request URL from your fork if you have one. Search can open that item in the app.

Close **Search** and reopen it. Scroll through the list to see other actions such as:

- New session
- Start from a canvas (you'll use canvases in [Chapter 05](../05-canvases/README.md); skip this for now)
- Add a project
- New issue

Experiment with **New session** or **Add a project** if you want practice. You do not need every action yet.

#### Success Check

You can find a session, issue, or pull request in Search, and you know it can start a session from what you find.

---

### 5. Voice Dictation (optional)

This step is optional. Skip it if you prefer typing prompts.

Go back to the GitHub Copilot app's **Settings** dialog. Select **Voice dictation** and explore the available options:

- Input device
- Microphone privacy
- Test microphone
- Keyboard shortcut
- Push to talk
- Transcription models

Perform the following actions:

> Note: Microphone permission is granted at the operating-system level, so the exact screen differs by platform (for example, System Settings on macOS, or Settings → Privacy & security → Microphone on Windows). Follow your OS prompts to allow the GitHub Copilot app to use the microphone.

1. Select **Microphone privacy**, **Open preferences** and ensure the GitHub Copilot app has the necessary permissions to use the microphone.
2. Select **Test microphone** to verify that it's working correctly.
3. Note the keyboard shortcut for activating voice dictation.
4. Exit the **Settings** dialog and return to the main app window.
5. Create a new chat under **Chats** and test voice dictation by using the keyboard shortcut.

#### How It Works

Voice dictation turns speech into editable prompt text which can save time and effort when creating prompts.

---

## Troubleshooting

If you are still stuck, see the [Troubleshooting Reference](../appendices/troubleshooting-reference.md).

<details>
<summary>First navigation problems</summary>

### I Cannot Find a Setting Shown in the Chapter

Settings can vary by app version, operating system, organization policy, and enabled features. Look for the closest matching category, then check the official docs if the screen still does not match.

### Voice Dictation Does Not Work

Check microphone permission, local transcription model download status, shortcut conflicts, and language support.

### A Mode or Model Option Is Missing

Check your plan, organization policy, project settings, and app version.

</details>

---

## 🔑 Key Takeaways

1. Keep your editor for deep coding. Open GitHub Copilot app when agent work needs a clearer place to run and review.
2. From the app, you can open the project in VS Code any time you want the full editor.
3. The app is organized around work surfaces: Home for starting work, My work for GitHub items, Search, Sessions, Chats, and Automations.
4. **Chats** are for exploration. **Sessions** are for focused repository work. **Automations** are for repeatable agent runs.
5. **Interactive**, **Plan**, and **Autopilot** change the level of autonomy.
6. Model and reasoning choices affect speed, quality, and cost. Use enough capability for the task, but not more than needed.

---

## 📝 Assignment

![Assignment](../assets/assignment.webp)

Create a small mode map for the Book App. The goal is to use the app surfaces from this chapter without changing files yet.

1. Open Chats and submit this prompt:

   ```text
   I'm learning the copilot-app-for-beginners course with samples/book-app-web. Give me a beginner-friendly overview of what the app does, which files look important, and one safe question I should ask before editing code.
   ```

   Write down one useful thing the chat taught you about the app.

2. Create a Plan-mode session and submit this prompt:

   ```text
   Plan how you would investigate why the Book App's reading stats might look wrong after filters are applied. Do not edit files. Tell me which files you would inspect and what evidence would prove the behavior.
   ```

   Write down the first file Copilot would inspect and one validation idea it suggested.

3. Switch to Interactive-mode and submit this prompt:

   ```text
   Walk me through how search and filters work in samples/book-app-web. Ask me before recommending any code changes, and do not edit files.
   ```

   Write down one question Copilot asked or one checkpoint where you stayed in control.

---

## ➡️ What's Next

In the next chapter, you'll solve the "shared working copy" challenge from this chapter: isolated sessions with worktrees, plus focused context with `@`, `#`, and `/`.

**[← Back to Chapter 00](../00-setup/README.md)** | **[Continue to Chapter 02 →](../02-sessions-worktrees-context/README.md)**

---

## Source References

- [Getting started with the GitHub Copilot app][getting-started]
- [Working with agent sessions][agent-sessions]
- [GitHub Copilot app changelog][app-changelog]
- [Voice input documentation (Copilot CLI, which the app is built on)][voice-input]
- [AI models reference][ai-models]

[getting-started]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/getting-started
[agent-sessions]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/agent-sessions
[app-changelog]: https://github.com/github/app/blob/main/changelog.md
[voice-input]: https://docs.github.com/en/copilot/how-tos/copilot-cli/use-copilot-cli/voice-input
[ai-models]: https://docs.github.com/en/copilot/reference/ai-models
