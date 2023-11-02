# November 2023

### Thursday, 2 {#2}

#### [Kirk](../../git.md#kirk) {#2#kirk}

Converted the code back to C (from C++). My compilation is fast and error messages are nice again! Split the authorization into two buttons ("send" and "cancel") and put them into a `GtkStack`. I used to switch labels and callbacks on runtime, but with `GtkStack` I can just switch to another page (and make sure the focus is grabbed when needed).

### Wednesday, 1 {#1}

#### [Kirk](../../git.md#kirk) {#1#kirk}

Pushed the commit with the feature to fetch the application ID from Qobuz. Switched to GLib's `GRegex`, created a generic asynchronous wrapper for it. Solved the problem with asynchronous functions running in the background after the preferences window is closed.

#### Maintenance {#1#maintenance}

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/264796) to update [Anki](https://apps.ankiweb.net) and a [pull request](https://github.com/NixOS/nixpkgs/pull/264809) to update [`obs-teleport`](https://github.com/fzwoch/obs-teleport) in [Nixpkgs](https://github.com/NixOS/nixpkgs).
