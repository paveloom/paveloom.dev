+++
title = "Relative URL"
+++

To create a URL relative to the currently running script, use `document.currentScript.src` as follows:

```javascript
const url = new URL(
  "./relative/path/to/file",
  document.currentScript.src
);
```

## References

- [MDN Web Docs: Resolving relative references to a URL](https://developer.mozilla.org/en-US/docs/Web/API/URL_API/Resolving_relative_references)
