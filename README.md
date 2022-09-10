# Description

Code of my website. Powered by [Zola](https://www.getzola.org) and [mdBook](https://rust-lang.github.io/mdBook).

Git mirrors:
- [Codeberg](https://codeberg.org/paveloom/pages)
- [GitHub](https://github.com/Paveloom/paveloom.github.io)
- [GitLab](https://gitlab.com/paveloom-g/personal/site)

Website mirrors:
- [GitHub Pages](https://paveloom.github.io/)
- [GitLab Pages](https://paveloom-g.gitlab.io/personal/site/)
- [Fleek](https://paveloom.on.fleek.co/) ([HNS](http://home.paveloom/))

## Build

Build the site:

```bash
zola build
```

Build the knowledge book:

```bash
mdbook serve knowledge
```

## Develop

Develop the site using a local server:

```bash
zola serve
```

Develop the knowledge book using a local server:

```bash
mdbook serve knowledge
```

## Minify

[minify](https://github.com/tdewolff/minify) the content:

```bash
minify -ra -o . public
```
