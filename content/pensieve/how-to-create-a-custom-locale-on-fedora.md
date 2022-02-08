+++
title = "How to create a custom locale on Fedora?"
description = "How would one create a custom locale on Fedora?"
+++

# {{ title() }} {#}
#### Updated: 08-Feb-2022 {#}

First of all, let's get a template.

Install the `glibc-locale-source` package since it provides files with default source definitions:

```bash
sudo dnf install glibc-locale-source
```

Copy any existing locale of your choice from `/usr/share/i18n/locales` and give it a new name. For example, let's create a custom `en_US` locale:

```bash
cd /usr/share/i18n/locales
sudo cp en_US en_US_custom
```

Now, let's edit the new file. A common thing to do with a new locale is to change the first day of the week and the first working day of the week from Sunday to Monday (or vice versa). We can accomplish that by adding/changing the following two lines in the `LC_TIME` section of the locale file:

```conf
% <...>
LC_TIME
% <...>
first_weekday 2
first_workday 2
% <...>
END LC_TIME
% <...>
```

When that's done, we should compile the locale by executing


```bash
sudo localedef -i en_US_custom -f UTF-8 en_US_custom.UTF-8
```

That's it. All we have left to do now is tell our applications / shell / desktop environment to use the new locale. That's, however, can be tricky since not every piece of software respects the other. Start by setting the system locale:

```bash
localectl set-locale en_US_custom.UTF-8
```

Log in / log out (or reload the desktop environment if that's possible) and check the locale settings by issuing `locale` in the terminal. If you don't see the new locale there, that's because something else overrides it. A classic example on Fedora installations would be `gnome-session`, if you use Gnome. This session manager uses GSettings, so you can change the locale by changing a specific key:

```bash
gsettings set org.gnome.system.locale region en_US_custom.UTF-8
```

If that's still not it, you should check your shell initialization scripts (like `~/.bashrc`, depending on your shell) to see if you change the locale there (especially if you set `LC_ALL` anywhere).

After that, that should be it.
