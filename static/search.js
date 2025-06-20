class Search {
  constructor() {
    this.$input = document.getElementById("search-input");
    this.$results = document.getElementById("search-results");

    this.fuse = null;
  }

  static index_path = "/search_index.en.json";

  static createResultItem(result) {
    const a = document.createElement("a");
    a.setAttribute("class", "search-results-item");
    a.setAttribute("href", result.item.url);
    a.textContent = result.item.title;

    // Update the focus on result items only via keyboard or when a cursor is
    // moved. This allows us to use a keyboard for searching even when a cursor
    // is hovering (but not moving) over search results.
    a.addEventListener("mousemove", (event) => {
      a.focus();
      event.preventDefault();
    });

    return a;
  }

  search(value) {
    const results = this.fuse.search(value);

    const result_items = [];
    for (const result of results) {
      const result_item = Search.createResultItem(result);
      result_items.push(result_item);
    }
    this.$results.replaceChildren(...result_items);
  }

  focusInputBox(event) {
    if (document.activeElement != this.$input) {
      event.preventDefault();
      this.$input.focus();
    }
  }

  focusNextResultItem(event) {
    const activeElement = document.activeElement;

    let resultToFocus = null;

    if (activeElement == this.$input) {
      resultToFocus = this.$results.firstElementChild;
    }

    if (activeElement.className == "search-results-item") {
      resultToFocus = activeElement.nextElementSibling;
      if (resultToFocus == null) {
        resultToFocus = this.$results.firstElementChild;
      }
    }

    if (resultToFocus) {
      event.preventDefault();
      resultToFocus.focus();
    }
  }

  focusPrevResultItem(event) {
    const activeElement = document.activeElement;

    let resultToFocus = null;

    if (activeElement == this.$input) {
      resultToFocus = this.$results.lastElementChild;
    }

    if (activeElement.className == "search-results-item") {
      resultToFocus = activeElement.previousElementSibling;
      if (resultToFocus == null) {
        resultToFocus = this.$results.lastElementChild;
      }
    }

    if (resultToFocus) {
      event.preventDefault();
      resultToFocus.focus();
    }
  }

  selectCurrentResultItem() {
    const activeElement = document.activeElement;

    if (activeElement.className == "search-results-item") {
      activeElement.click();
    }
  }

  static async fetchSearchIndex() {
    try {
      const response = await fetch(this.index_path);
      if (!response.ok) {
        console.error(`Got a non-OK response: ${response.status}`);
        return;
      }

      const data = await response.json();
      return data;
    } catch (error) {
      console.error(error.message);
      return;
    }
  }

  async setUpSearchBackend() {
    const data = await Search.fetchSearchIndex();
    if (data == null) {
      console.error(`Failed to fetch the search index.`);
      return;
    }

    this.fuse = new Fuse(data, {
      keys: ["title", "description", "body"],
      ignoreLocation: true,
    });
  }

  setUpEventListeners() {
    this.$input.addEventListener("input", (event) => {
      this.search(event.target.value);
    });

    document.addEventListener("keydown", (event) => {
      switch (event.key) {
        case "/":
          this.focusInputBox(event);
          break;
        case "ArrowDown":
          this.focusNextResultItem(event);
          break;
        case "ArrowUp":
          this.focusPrevResultItem(event);
          break;
        case "Enter":
          this.selectCurrentResultItem();
          break;
        case "Escape":
          this.$input.value = "";
          this.search("");
        case "Alt":
        case "Control":
          break;
        default:
          // This makes it so that any other key pressed goes immediately to the search box
          this.$input.focus();
      }
    });
  }

  async init() {
    await this.setUpSearchBackend();
    this.setUpEventListeners();
  }
}

search = new Search();
search.init();
