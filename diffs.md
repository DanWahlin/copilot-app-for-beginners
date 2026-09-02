# Chapter 03 Changes Made by Copilot

This review-only diff contains the changes Copilot made to
`03-development-workflows/README.md`. It excludes the changes that were already
in the working tree before the review.

````diff
- Use the Workspace panel, tests, build output, and browser preview to validate a local change
+ Use the review panel, tests, build output, and browser preview to validate a local change

-| Diff | Workspace panel **Changes** tab | The change is focused and understandable |
-| Tests and build | Workspace panel **Terminal** tab | The relevant tests and build complete successfully |
-| Running app | Workspace panel browser tab | The behavior works as expected |
+| Diff | Review panel **Changes** tab | The change is focused and understandable |
+| Tests and build | Review panel **Terminal** tab | The relevant tests and build complete successfully |
+| Running app | Review panel browser tab | The behavior works as expected |

-1. Select **View ➡ Toggle Review Panel** or the **Toggle panel** icon in the upper-right corner.
+1. Select **View** > **Toggle Review Panel**.

-![Workspace panel with Changes, Terminal, and the Book App Web browser tab](assets/app-workspace-panel.webp)
+![Review panel with Changes, Terminal, and the Book App Web browser tab](assets/app-workspace-panel.webp)

-1. In the Workspace panel, select **+**, then **Browser**. Enter the **Local** URL shown in the terminal and press `Enter`.
+1. In the review panel, select **+**, then **Browser**. Enter the **Local** URL shown in the terminal and press `Enter`.

-1. In the Workspace panel, select **+**, then **Browser** (if it's not already open). Enter the **Local** URL shown in the terminal and press `Enter`.
+1. In the review panel, select **+**, then **Browser** (if it isn't already open). Enter the **Local** URL shown in the terminal and press `Enter`.

-1. Filter your fork by typing `repo:` into the searchbox and then selecting your repository:
+1. Filter your fork by typing `repo:` in the search box, then select your repository:

-Alternatively, you can select `All repositories` at the top of the **My work** panel, then select your repository from the list.
+Alternatively, select **All repositories** at the top of **My work**, then select your repository from the list.

-### 5. Identify an Issue and Open a Pull Request
+### 5. Start from an Issue and Open a Pull Request

-> You may recall that in a previous chapter you attached an issue to a session using the #[issue-number] syntax. Here, you'll attach the issue to a session again and create a pull request based on that session.
+> In Chapter 02, you attached an issue from the prompt box by typing `#`. This time, you'll start directly from the issue so the app loads its context into the new session automatically.

-1. Select **Create from** next to your project in the sidebar and select the `practice-search-case-bug` branch.
-1. Set the mode to **Plan**, then submit the following promp. Notice that it includes the issue you previously reviewed:
+1. Select **New session**.
+1. Use the branch selector below the prompt box to choose `practice-search-case-bug`.
+1. Set the mode to **Plan**, then submit:

-   Use issue #1 as the source of truth. Create a small implementation and validation plan. Name the files you expect to change and the tests or browser checks that should prove the fix. Don't edit files yet.
+   Use the attached issue as the source of truth. Create a small implementation and validation plan. Name the files you expect to change and the tests or browser checks that should prove the fix. Don't edit files yet.

-1. Review the plan, switch to **Interactive**, and ask Copilot to implement it.
+1. Review the plan, switch to **Interactive**, then submit:
+
+   ```text
+   Implement the plan. Include a focused regression test that proves uppercase and lowercase searches return the same result.
+   ```

-   - Inspect the diff in the **Review panel**.
-   - Open the terminal and run `npm install`.
-   - Run `npm test -- --run`.
-   - Run `npm run build`.
-   - Start the app with `npm run dev` and confirm that searches such as `hobbit` and `HOBBIT` return the same result.
+   - Inspect the diff in the **Changes** tab.
+   - In **Terminal**, change to `samples/book-app-web` and run `npm install`.
+   - Run `npm test -- --run` and `npm run build`.
+   - Start the app with `npm run dev`.
+   - Open a browser tab and confirm that searches such as `hobbit` and `HOBBIT` return the same result.
+   - Return to **Terminal** and press `Ctrl+C` to stop the development server.

-1. Review the draft, then select **Create PR** at the top of the Copilot app interface. Once the PR is created you can select it above the prompt box to view details.
-1. In a real-world situation you can merge the PR (assuming it's ready to merge) by selecting **Ready to merge** at the top of the Copilot app interface. For this exercise, merging is unnecessary because the corrected search behavior is already in  main .
-1. In addition to viewing the PR in the project session, you can also view it in **My work** and inspect the final diff.
+1. Review the draft, then select **Create PR** at the top of the session. Review the title and description before creating the pull request.
+1. After the pull request is created, select its link above the prompt box to view its details.
+1. Open the pull request in **My work**, review the **Overview** and **Changes** tabs, and confirm that its checks pass.
+
+Don't merge this practice pull request. The correct search behavior is already on `main`, and the advanced section later in this chapter explains how Agent Merge works.
+
+> [!NOTE]
+> The pull request diff may show only the improved regression test. That's expected: fixing the intentional bug restores `App.tsx` to the version already on `main`, while the stronger test remains as the new change.

-1. If a **Fix** control appears on the comment, select it. Otherwise, start a new session from the pull request as you did earlier.
+1. If a **Fix** control appears on the comment, select it. Otherwise, select **New session** to start a session from the pull request.

    npm install
    npm test -- --run
    npm run build
-   npm run dev
    ```

+1. Start the app with `npm run dev`, confirm the favorite count includes both read and unread favorites, then press `Ctrl+C` to stop the development server.

-Agent Merge can help carry a pull request through review comments, checks, and merge requirements. It runs in the background and merges only when GitHub allows it.
+Agent Merge can help carry a pull request through review comments, checks, and merge requirements. You enable it from the merge-readiness control at the top of a pull request. It runs in the background, can continue after the app restarts, and merges only when GitHub allows it.

-3. The Workspace panel keeps the local diff, terminal output, and browser preview visible.
+3. The review panel keeps the local diff, terminal output, and browser preview visible.
````

Minor cleanup included removing trailing whitespace from two edited lines.
