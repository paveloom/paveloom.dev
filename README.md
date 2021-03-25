# Description

Code of my website. Powered by [Zola](https://www.getzola.org/) and [minify](https://github.com/tdewolff/minify).

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

Minify all files in the `public` directory recursively:

```bash
minify -rav -o public/ public
```
