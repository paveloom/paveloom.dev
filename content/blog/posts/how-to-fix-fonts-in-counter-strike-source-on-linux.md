---
date:
    created: 2023-10-06
    updated: 2023-10-06
---

# How to fix fonts in Counter-Strike: Source on Linux?

<!-- separator -->

Note: all paths are relative to the root of the game (usually, `/path-to-the-steam-library/steamapps/common/Counter-Strike Source`).

1. Install the [`corefonts`](https://repology.org/project/corefonts/versions) package (standard Windows fonts).

2. Prepare a new font for the chat.

    We will mimic under the WenQuanYi Zen Hei font (**don't** install the [`wqy-zenhei`](https://repology.org/project/fonts:wqy-zenhei/versions) package!). This font is hard coded to be used as the last fallback font, so explicitly switching to it allows us to bypass all the other fall back fonts which may not contain required characters.

    You can use [FontForge](https://fontforge.org) to merge fonts. The specific fonts to merge will depend on your preferences, but I'd suggest starting with [DejaVu fonts](https://en.wikipedia.org/wiki/DejaVu_fonts). DejaVu Sans will make the "Lenny Face" [emoticon](https://en.wikipedia.org/wiki/List_of_emoticons) appear properly. If you'd like to add Japanese symbols to the font, merge DejaVu Sans with, for example, [Noto Sans JP](https://fonts.google.com/noto/specimen/Noto+Sans+JP). This should make the second "Shrug" emoticon appear properly.

    Here's the algorithm:

    1. Open FontForge.
    2. Open the DejaVu Sans font.
    3. Click `Element > Merge Fonts...` in the menu bar, open the Noto Sans JP font.
    4. When asked about whether to retain kerning information, select "No".
    5. Click `Element > Font Info...` in the menu bar, change the "Family Name" in the "PS Names" section to "WenQuanYi Zen Hei". Optionally, change other information about the font (for example, changing strings in the "TTF Names" section will affect the output of the `fc-match` command). When done, click OK.
    6. Click `File > Generate Fonts...` in the menu bar. Click on the clog icon, and check the "Show Hidden Files" option. Select the `~/.local/share/fonts` directory as the output directory (create it if it doesn't exist yet). Select "TrueType" as the font type. Click "Generate". If any errors occur, click "Generate" again.
    7. Update the Fontconfig cache with `fc-cache -f -v`, check if the font appears after running `fc-match "WenQuanYi Zen Hei"` and `fc-list | grep -i "WenQuanYi Zen Hei"`.

    Note: you can use the [GNOME Character Map](https://wiki.gnome.org/Apps/Gucharmap) application to search for characters in the installed fonts (including the custom ones). It can help you with debugging whether your fonts actually have the required characters. The `View > Show only glyphs from this font` option has to be enabled.

2. Override the chat font and make it bigger.

    1. Prepare a directory for overrides in the `cstrike/custom` directory (e.g., `cstrike/custom/linux_fixes`).
    2. Copy the `hl2/resource/chatscheme.res` file to the `cstrike/custom/linux_fixes/resource` directory.
    3. Override the `name` and `tall` properties in each preset (from "1" to "5") in the `ChatFont` section in the `cstrike/custom/linux_fixes/resource/chatscheme.res` file by adding/changing a similar line with the `[$LINUX]` part added to the end **above** the line being changed. Start by adding 3 to each value of `tall`, then test in the game.

        Here's an example:

        ```
        "ChatFont"
        {
            "1"
            {
                "name"          "WenQuanYi Zen Hei" [$LINUX]
                "name"          "Verdana"
                "tall"          "15" [$LINUX]
                "tall"          "12"
                "weight"        "700"
                "yres"          "480 599"
                "dropshadow"    "1"
            }
        // <...>
        }
        ```

3. Make the console font bigger.

    Override the `tall` property in the preset in the `ConsoleText` section in the `platform/resource/sourceschemebase.res` file by adding/changing a similar line with the `[$LINUX]` part added to the end **above** the line being changed.

    Here's an example:

    ```
    "ConsoleText"
    {
        "1"
        {
            "name"      "Lucida Console" [$WINDOWS]
            "name"      "Lucida Console" [$X360]
            "name"      "Verdana" [$POSIX]
            "tall"      "11" [$OSX]
            "tall"      "16" [$LINUX]
            "tall"      "10"
            "weight"    "500"
        }
    }
    ```

4. Make the output of the `cl_showpos` and `net_graph` commands bigger.

    Override the `tall` property in the preset in the `DefaultFixedOutline` section in the `platform/resource/sourceschemebase.res` file by adding/changing a similar line with the `[$LINUX]` part added to the end **above** the line being changed.

    Here's an example:

    ```
    "DefaultFixedOutline"
    {
        "1"
        {
            "name"          "Lucida Console" [$WINDOWS]
            "name"          "Lucida Console" [$X360]
            "name"          "Verdana" [$POSIX]
            "tall"          "16" [$LINUX]
            "tall"          "11" [$OSX]
            "tall"          "10"
            "tall_lodef"    "15"
            "tall_hidef"    "20"
            "weight"        "0"
            "outline"       "1"
        }
    }
    ```
