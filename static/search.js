class Search {
  constructor() {
    this.$input = document.getElementById("search-input");
    this.$results = document.getElementById("search-results");

    this.fuse = null;
  }

  static search_index_urls = [
    new URL("./search_index.en.json", document.currentScript.src),
  ];

  static onResultItemHover(event) {
    event.target.focus();
  }

  static onResultItemClick(event) {
    event.target.click();
    event.preventDefault();
  }

  static createResultItem(result) {
    const a = document.createElement("a");
    a.setAttribute("class", "search-results-item");
    a.setAttribute("href", result.item.url);
    a.textContent = result.item.title;

    // Update the focus on result items only via keyboard or when a cursor is
    // moved. This allows us to use a keyboard for searching even when a cursor
    // is hovering (but not moving) over search results.
    a.addEventListener("mousemove", this.onResultItemHover);
    a.addEventListener("touchstart", this.onResultItemHover);

    // Handle the click early so that it actually works for an element that is
    // about to get hidden after the focus is lost.
    a.addEventListener("mousedown", this.onResultItemClick);

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

  clearInputBox() {
    this.$input.value = "";
    this.search("");
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
      return;
    }

    if (activeElement == this.$input) {
      const firstResultItem = this.$results.firstElementChild;
      if (firstResultItem != null) {
        firstResultItem.click();
      }
      return;
    }
  }

  static async fetchSearchIndex(url) {
    try {
      const response = await fetch(url);
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
    let allData = [];

    for (const search_index of Search.search_index_urls) {
      const data = await Search.fetchSearchIndex(search_index);
      if (data == null) {
        return;
      }

      allData.push(...data);
    }

    this.fuse = new Fuse(allData, {
      keys: ["title", "description", "body"],
      ignoreLocation: true,
    });
  }

  setUpEventListeners() {
    this.$input.addEventListener("input", (event) => {
      this.search(event.target.value);
    });

    // Make elements in the search container lose focus when body is tapped
    document.body.addEventListener("mousedown", () => {
      document.activeElement.blur();
    });

    document.addEventListener("keydown", (event) => {
      if (event.ctrlKey || event.metaKey || event.altKey) {
        return;
      }

      switch (event.key) {
        case "/":
        case "s":
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
          this.clearInputBox();
          break;
      }
    });
  }

  async init() {
    await this.setUpSearchBackend();
    this.setUpEventListeners();
  }
}

const search = new Search();
search.init();
