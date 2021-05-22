# Description

Code of my website. Powered by [Zola](https://www.getzola.org).

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

Minifiers [minify](https://github.com/tdewolff/minify) and [minify-html](https://github.com/wilsonzlin/minify-html) are being used to minify the content:

```bash
for file in `find public -name "*.html" -type f`; do
    minify-html -s "$file" -o "$file" --css --js
done

minify -ra -o . public
```
