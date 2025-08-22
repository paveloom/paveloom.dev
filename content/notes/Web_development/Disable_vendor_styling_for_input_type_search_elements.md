+++
title = "Disable vendor styling for input[type=\"search\"] elements"
+++

The following snippets should be added to a CSS stylesheet.

To remove the cancel button in Chrome and Safari, add

```css
input[type="search"]::-webkit-search-cancel-button {
  appearance: none;
}
```

To remove Safari left inner padding under macOS or the magnifying glass on the left under iOS:

```css
[type="search"]::-webkit-search-decoration {
  appearance: none;
}
```

## References

- [Stack Overflow: How do I remove all default Webkit search field styling?](https://stackoverflow.com/a/77190241)
