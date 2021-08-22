# Description

Code of my website. Powered by [Zola](https://www.getzola.org). Developed on [GitLab](https://gitlab.com/paveloom-g/personal/site).

## Build

Build using the base URL from the [config](config.toml):

```bash
zola build
```

Visit the site using a local server:

```bash
zola serve
```

Or browse the files in the `public` directory using a local base URL:

```bash
zola build -u "/path/to/the/public/"
```

## Minify

[minify](https://github.com/tdewolff/minify) the content:

```bash
minify -ra -o . public
```
