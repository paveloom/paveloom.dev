/* global keyboard$ */

// Let the user navigate the pages with arrow keys
keyboard$.subscribe((key) => {
  let href = null;
  if (key.mode === "global") {
    switch (key.type) {
      case "ArrowLeft": {
        key.claim();
        let a = document.querySelector('a[rel="prev"]');
        if (a) {
          href = a.getAttribute("href");
        }
        break;
      }
      case "ArrowRight": {
        key.claim();
        let a = document.querySelector('a[rel="next"]');
        if (a) {
          href = a.getAttribute("href");
        }
        break;
      }
    }
  }
  if (href) {
    window.location.href = href;
  }
});
