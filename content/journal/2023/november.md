# November 2023

### Thursday, 9 {#9}

#### [Site](../../git.md#site) {#9#site}

Set up a workflow for [Codeberg](https://codeberg.org) (yes, again). Turns out they silently switched from [Woodpecker](https://woodpecker-ci.org) to their own CI system, which is almost identical to [GitHub Actions](https://github.com/features/actions). They don't provide hosted runners, though, and expect users to [host their own](https://forgejo.org/docs/next/admin/actions/#forgejo-runner). Here's the [user guide](https://forgejo.org/docs/next/user/actions). I was surprised to learn that they mention NixOS in their documentation, and there is already a NixOS module in [Nixpkgs](https://github.com/NixOS/nixpkgs), so I just used it.

#### VSCode {#9#vscode}

Current gripes:

- No way to close the tab to the left instead of to the right;
- Seems like I need a plugin for every tool I use (in Neovim I used [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) and [`null-ls`](https://github.com/jose-elias-alvarez/null-ls.nvim) plugins). I found [Trunk](https://trunk.io), but it's proprietary and expects an [FHS](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard) compliant filesystem (which I'd rather avoid on NixOS).

Current positives:

- VSCode handles `all-packages.nix` like a champ. It's a file with 42K lines of code in [Nixpkgs](https://github.com/NixOS/nixpkgs) which contains all top-level derivations.

### Wednesday, 8 {#8}

#### VSCode {#8#vscode}

Almost done with setting up VSCode.

### Tuesday, 7 {#7}

#### VSCode {#7#vscode}

Started switching from [Neovim](https://neovim.io) to [Visual Studio Code](https://code.visualstudio.com) with the [VSCodeVim](https://github.com/VSCodeVim/Vim) extension.

### Monday, 6 {#6}

#### [Kirk](../../git.md#kirk) {#6#kirk}

Finished implementing support for notifying the user about expired Qobuz subscription. Started figuring out how to set up `Gtk.ListView` for storing and displaying the results of a release search.

### Friday, 3 {#3}

#### [Kirk](../../git.md#kirk) {#3#kirk}

Added a feature that allows one to stop fetching the application ID. Started working on implementing support for notifying about expired Qobuz subscription.

### Thursday, 2 {#2}

#### [Kirk](../../git.md#kirk) {#2#kirk}

Converted the code back to C (from C++). My compilation is fast and error messages are nice again! Split the authorization into two buttons ("send" and "cancel") and put them into a `GtkStack`. I used to switch labels and callbacks on runtime, but with `GtkStack` I can just switch to another page (and make sure the focus is grabbed when needed).

### Wednesday, 1 {#1}

#### [Kirk](../../git.md#kirk) {#1#kirk}

Pushed the commit with the feature to fetch the application ID from Qobuz. Switched to GLib's `GRegex`, created a generic asynchronous wrapper for it. Solved the problem with asynchronous functions running in the background after the preferences window is closed.

#### Maintenance {#1#maintenance}

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/264796) to update [Anki](https://apps.ankiweb.net) and a [pull request](https://github.com/NixOS/nixpkgs/pull/264809) to update [`obs-teleport`](https://github.com/fzwoch/obs-teleport) in [Nixpkgs](https://github.com/NixOS/nixpkgs).
