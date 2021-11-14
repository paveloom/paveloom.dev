# Description

Code of my website. Powered by [Zola](https://www.getzola.org).

Git mirrors:
- [Codeberg](https://codeberg.org/paveloom/pages)
- [GitHub](https://github.com/Paveloom/paveloom.github.io)
- [GitLab](https://gitlab.com/paveloom-g/personal/site)
- [SourceHut](https://sr.ht/~paveloom/paveloom.shrt.site/)

Website mirrors:
- [GitHub Pages](https://paveloom.github.io/)
- [GitLab Pages](https://paveloom-g.gitlab.io/personal/site/)
- [SourceHut Pages](https://paveloom.srht.site)
- [Fleek](https://paveloom.on.fleek.co/) ([HNS](http://home.paveloom/))

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
