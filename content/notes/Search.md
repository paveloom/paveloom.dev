+++
title = "Search"
+++

Use the search field above to search for notes in the collection.

White space acts as an **AND** operator, while a single pipe character (`|`) acts as an **OR** operator. To escape white space, use double quotes, e.g., use `="scheme language"` for exact matching.

Extended search is supported via additional operators:

<div class="table-container">

| Token       | Match type                 | Description                           |
| ----------  | -------------------------  | ------------------------------------- |
| `jscript`   | fuzzy-match                | Items that fuzzy match `jscript`      |
| `=scheme`   | exact-match                | Items that are `scheme`               |
| `'python`   | include-match              | Items that include `python`           |
| `!ruby`     | inverse-exact-match        | Items that do not include `ruby`      |
| `^java`     | prefix-exact-match         | Items that start with `java`          |
| `!^erlang`  | inverse-prefix-exact-match | Items that do not start with `erlang` |
| `.js$`      | suffix-exact-match         | Items that end with `.js`             |
| `!.go$`     | inverse-suffix-exact-match | Items that do not end with `.go`      |

</div>

The implementation is a library called [Fuse.js](https://www.fusejs.io), downloaded from [jsDelivr](https://www.jsdelivr.com/). There might be a delay before search starts working if the library and the search index are downloaded for the first time.
