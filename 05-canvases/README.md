![Chapter 05: Canvases](assets/chapter-header.svg)

> **What if the agent's work was not trapped in a chat transcript?**

Chat works well for instruction and ambiguity. Once a GitHub Copilot session is doing real work, a long chat thread becomes hard to scan. You need a place where the work itself is visible.

That place is a **canvas**.

A canvas is a shared board in the side panel. You create it with `/create-canvas` and say what you want on it. Chat is still for questions. The board is where you and Copilot keep the plan, checks, and next decision visible.

This chapter asks `/create-canvas` for a **session board**: plan steps, validation checks, and notes. You don't pick a canvas type. The app builds one from your prompt.

| Term | Meaning in this course | Required? |
|---|---|---|
| Built-in work surfaces | Plan output, terminal, browser, and the Review panel already in a session | Yes |
| Session canvas | The board `/create-canvas` opens in the side panel for this session | Yes |
| Chat fallback | The same board returned as markdown in the session if a canvas does not open | Fallback only |

In this chapter you'll:

1. Recognize built-in work surfaces you already use: plan, browser, and terminal
2. Run `/create-canvas` and ask for a session board for `samples/book-app-web`
3. Update that canvas only when terminal or browser evidence exists

If `/create-canvas` is missing or the canvas does not open, keep the same board as markdown in the session and continue. Skip the generated extension files for now.

## 🎯 Learning Objectives

By the end of this chapter, you'll be able to:

- Explain why canvases exist and when a long chat thread gets in the way
- Identify built-in work surfaces such as plan, browser, and terminal
- Create a session canvas with `/create-canvas`
- Keep plan state and validation evidence visible on that canvas
- Explain the difference between chat history and shared canvas state
- Fall back to markdown in the session if a canvas does not open

> ⏱️ **Estimated Time**: ~50 minutes (15 min reading + 35 min hands-on)

---

## ✅ Prerequisites

Before starting:

- Complete Chapter 04
- Open the course repository in the GitHub Copilot app
- Use `samples/book-app-web` as the sample app path
- Know how to open the Review panel terminal and browser surfaces from Chapter 03

The prepared concept folder at `.github/extensions/release-checklist` is optional fallback material, not the main exercise.

---

## 🧩 Real-World Analogy: The Band's Arrangement Board

Imagine a band planning a song. They could argue every part in a long group chat, but a shared arrangement board works better:

![Arrangement board analogy for canvases](assets/arrangement-board-canvas.webp)

| Group chat | Arrangement board |
|---|---|
| Good for discussion | Good for shared state |
| Hard to scan later | Easy to inspect at a glance |
| Mostly linear | Can show sections, parts, previews, and controls |
| Updates are buried | Updates are visible |

A canvas is the app's arrangement board for human-agent work.

---

## Core Concepts

### A canvas is a shared control panel

GitHub documents custom canvases as **bidirectional** work surfaces: both sides can change the same board.

Simple example:

1. GitHub Copilot adds plan steps to the board.
2. You uncheck a step or write "pause before edits" in the notes.
3. GitHub Copilot continues from *your* update, not from a buried chat sentence.

A custom canvas can include:

- visible state
- UI controls
- agent-callable capabilities (actions the agent can run on that board, such as updating a checklist item)
- artifacts such as plans, checklists, dashboards, browser previews, terminals, or documents

![Human and agent shared canvas surface](assets/human-agent-shared-surface.webp)

### Built-in work surfaces come first

You already used these panels in earlier chapters. They come with the session. You don't create them with `/create-canvas`:

| Built-in work surface | What you inspect |
|---|---|
| Plan | Steps, options, and pause points before implementation |
| Terminal | Install, test, and build evidence |
| Browser | Running app behavior |
| Diff / Review panel | What changed and what still needs review |

Those panels stay tied to the live session. In Exercise 2 you'll add one more surface with `/create-canvas`: the session board.

### When to use a canvas

| Use chat when... | Use a canvas when... |
|---|---|
| You need a quick answer | You need visible state |
| The task is short | The task has multiple steps |
| The result can be text | The result needs controls or inspection |
| You don't need to revisit it | You want a reusable work surface for the session |

![Chat versus canvas work surfaces](assets/chat-vs-canvas.webp)

### The beginner example: `/create-canvas` plus a session board

Type `/create-canvas`, then describe the board. The docs show sample prompts, like a kanban board or a planning board. Here you'll ask for a **session board** for one change. Save it in **user scope** (`~/.copilot/extensions`) so the generated files stay on your machine and don't land in the course fork.

The board should include:

```text
Plan
- [ ] Understand book-card layout
- [ ] Propose a small change
- [ ] Pause for approval
- [ ] Implement
- [ ] Validate

Validation evidence
- [ ] npm test -- --run
- [ ] npm run build
- [ ] browser preview

Session notes
- current mode
- next human decision
- what blocked last turn
```

![Session plan and validation board](assets/session-plan-validation-board.webp)

That board is useful only when it stays linked to evidence from the same session. Checking a validation box because the chat sounded confident is not enough.

---

## Hands-On Exercises

In these exercises, you'll:

- Find built-in work surfaces in the app
- Create a session canvas with `/create-canvas`
- Update that canvas only when evidence exists

### 1. Find the built-in work surfaces

Open or create a session for the course repository.

1. Set mode to **Plan** or **Interactive**.
2. Open the **Review panel** in the upper-right corner of the app.
3. Locate the **Terminal** tab. Create a terminal if needed.
4. Locate the **Browser** surface or browser tab if your build exposes it.
5. Notice where plan output appears in the session when you ask for a plan.

![Review panel open beside a session. This capture is a README planning session. Your session title will differ. What matters is the Plan surface, Changes tab, and composer](assets/app-review-panel.webp)

#### Expected result

You can point to at least two built-in work surfaces that make session work inspectable without scrolling the full chat.

#### How it works

Chat still carries the conversation. The plan, terminal, browser, and diff surfaces carry the work. Next you will run `/create-canvas` so the session board has its own surface in the side panel.

---

### 2. Create a session canvas

Stay in the same session. Type `/` in the composer and select `/create-canvas` if it appears, or paste the prompt below.

```text
/create-canvas Create a session board for a small book-card spacing or responsive-layout improvement in @samples/book-app-web.

Use this structure:

Plan
- [ ] Understand current book-card layout
- [ ] Propose one small beginner-safe spacing or responsive improvement
- [ ] Pause for my approval before editing files
- [ ] Implement the approved change
- [ ] Validate

Validation evidence
- [ ] cd samples/book-app-web && npm test -- --run
- [ ] cd samples/book-app-web && npm run build
- [ ] browser preview on 127.0.0.1:5173

Session notes
- current mode
- next human decision
- blockers

People should be able to check and uncheck plan and validation items and edit session notes.
The agent should update those items only from terminal or browser evidence in this session.
Keep the first version simple. No GitHub write actions.
Prefer user scope so this stays on my machine and is not committed.
Do not edit the book-app-web source files yet.
```

![The /create-canvas skill selected in the session composer typeahead](assets/app-create-canvas-command.webp)

The canvas should open in the right side panel. If `/create-canvas` is missing or the canvas does not open, ask for the same board as markdown in the session and keep it updated each turn. That fallback is enough to finish the chapter.

#### Expected output

- A canvas in the side panel, or the same board as markdown in chat
- Plan steps, validation checks, and session notes
- A clear pause before file edits
- No `samples/book-app-web` file changes yet

Demo output varies. What matters is that the board is scannable and tied to this session.

#### Pause point

Before any implementation:

1. Is the proposed change small?
2. Is the pause point explicit?
3. Are validation commands exact?
4. Can you tell the next human decision from the board, without rereading the whole chat?

---

### 3. Update the board with real evidence

Now collect evidence and update the board. Prefer the session terminal and browser surfaces.

```bash
cd samples/book-app-web
npm install
npm test -- --run
npm run build
```

For browser validation:

```bash
cd samples/book-app-web
npm run dev -- --host 127.0.0.1 --port 5173
```

Prompt GitHub Copilot:

```text
Update the session board for samples/book-app-web.
If the canvas is open, update that surface.
If not, return the full board as markdown.
Mark only the steps that have evidence from terminal or browser output in this session.
Do not invent passing results.
```

The updated board should match the plan + validation graphic earlier in this chapter. Check off only items you can prove from this session's terminal or browser.

#### Expected output

- Terminal output shows install, test, and build evidence
- Browser preview runs at `127.0.0.1:5173` when you start it
- Board state matches what you actually verified
- Unchecked items stay unchecked until evidence exists

#### Why this matters

A confident chat sentence is not validation. The board should change only when the terminal, browser, or diff gives you proof.

---

<details>
<summary>Optional fallback: release checklist concept</summary>

If you want a second shape to compare, open:

```text
.github/extensions/release-checklist/README.md
```

That folder is a design concept, not a loadable extension. It is useful as a release-oriented checklist after you have a pull request. Prefer the session canvas from Exercise 2 because it stays tied to live plan, terminal, and browser evidence.

</details>

<details>
<summary>Intermediate: Markdown workboards that launch and track sessions</summary>

After one session board feels natural, you can run `/create-canvas` again for a board that lists issues and pull requests and tracks session status. Official docs show that kind of planning board as another example prompt.

Example stretch prompt:

```text
/create-canvas Create a workboard for this repository that lists open issues and pull requests, lets me choose one item, and tracks the session status for that item. Prefer user scope. No GitHub write actions.
```

</details>

<details>
<summary>Advanced: Where canvas files live</summary>

You already ran `/create-canvas` on the beginner path. Opening the generated files is optional.

| Location | Scope | Best for |
|---|---|---|
| `~/.copilot/extensions` | User | Personal experiments. Prefer this in the course so nothing is committed |
| `.github/extensions` | Project or team | Shared course and team workflows |

A canvas commonly includes `package.json`, an entry file such as `extension.mjs`, and optional JSON artifacts for persisted state.

Pause before accepting extra generated code. Inspect capability names, stored state, UI controls, and whether any private data is included.

If a canvas fails to open after edits, check extension dependencies, reload requirements, syntax errors, and whether the app is reading the user-scoped or project-scoped folder.

</details>

---

## Troubleshooting

If you are still stuck, see the [Troubleshooting Reference](../appendices/troubleshooting-reference.md).

<details>
<summary>Canvas issues</summary>

| Problem | What to check |
|---|---|
| No canvas opens | Confirm you typed `/create-canvas`. If the command or panel is missing, keep the same board as markdown in the session |
| Built-in terminal or browser missing | Review panel toggle, View menu, app version |
| Agent says it updated the board but state looks wrong | Ask for the full board again and compare it with terminal or browser evidence |
| Validation marked complete without proof | Require evidence; uncheck items that lack output |
| Browser or terminal validation is stale | Confirm the command ran in the correct `samples/book-app-web` worktree |
| Sensitive data appears in a custom canvas | Remove it, regenerate safe sample data, retake screenshots |

</details>

---

## 🔑 Key Takeaways

1. Chat is for questions. A canvas is the board in the side panel.
2. Create that board with `/create-canvas` and a short description.
3. Use the built-in plan, browser, terminal, and diff panels first.
4. This chapter's board tracks the plan, the checks you ran, and the next decision.
5. Only check off items you can prove from this session.
6. If a canvas does not open, keep the same board as markdown in the session.

---

## 📝 Assignment

![Assignment](../assets/assignment.webp)

Run one small session with `/create-canvas`:

1. Use `/create-canvas` to create a session board for one beginner-safe **stats-label** improvement in `samples/book-app-web`. Do not reuse empty-state copy, book-card polish, or a filter-row change you already shipped in Chapter 03.
2. Prefer user scope. Keep a pause point before file edits.
3. Run `npm test -- --run` and `npm run build`.
4. Update the canvas (or the markdown fallback) only after evidence exists.
5. Ask GitHub Copilot to summarize what remains unchecked and what the next human decision is.

Success criteria: You can point to the canvas in the side panel, or say why you used the markdown fallback. You can also tell the next decision from the board without rereading the whole chat.

---

## ➡️ What's Next

In the next chapter, you'll turn repeatable prompts into automations. You'll start with a manual open-work summary before trying schedules or cloud workflows.

**[← Back to Chapter 04](../04-skills-mcp-plugins/README.md)** | **[Next: Automations →](../06-automations/README.md)**

---

## Source References

- [Working with canvas extensions](https://docs.github.com/en/copilot/how-tos/github-copilot-app/working-with-canvas-extensions)
- [Customizing the GitHub Copilot app](https://docs.github.com/en/copilot/how-tos/github-copilot-app/customize-github-copilot-app)
- [GitHub Copilot app generally available](https://github.blog/changelog/2026-06-17-github-copilot-app-generally-available/)
- [GitHub Copilot app product blog](https://github.blog/news-insights/product-news/github-copilot-app-the-agent-native-desktop-experience/)
