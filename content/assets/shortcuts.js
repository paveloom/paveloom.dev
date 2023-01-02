/* global keyboard$ */

/**
 * Go to the link in the selected element
 */
function setLocation(selector) {
  const link = document.querySelector(selector) || undefined;
  if (typeof link !== "undefined") window.location.href = link.href;
}

// Let the user navigate the pages with arrow keys
keyboard$.subscribe((key) => {
  if (key.mode === "global") {
    switch (key.type) {
      case "ArrowLeft": {
        setLocation("link[rel=prev]");
        break;
      }
      case "ArrowRight": {
        setLocation("link[rel=next]");
        break;
      }
    }
  }
});
