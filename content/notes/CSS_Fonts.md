+++
title = "CSS: Fonts"
+++

Here's an example of adding a local font to a CSS stylesheet:

```css
@font-face {
  font-family: Font, serif;
  font-weight: 400;
  font-style: normal;
  src: url("fonts/font.woff2");
}
```

Note the usage of the [`url()`](https://developer.mozilla.org/en-US/docs/Web/CSS/url_function) function. This allows us to specify the path to the font that is relative to the URL of the stylesheet.
