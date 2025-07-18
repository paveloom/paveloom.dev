+++
title = "Adding a user to a group"
+++

To add a user to a group, run `usermod -aG $GROUP $USERNAME`. You can check the current groups the user is in by running `groups` as that user. Do note that the new group will not be visible until and after a log-out and log-in. You can emulate what that would look like by entering a new login shell (e.g., via `su -l $USERNAME` or `sudo -i -u $USERNAME`), and then running `groups`.
