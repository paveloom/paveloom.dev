function scrollToHash() {
  if (window.location.hash) {
    const targetElement = document.querySelector(window.location.hash);
    if (targetElement) {
      setTimeout(() => {
        targetElement.scrollIntoView(true);
      }, 100);
    }
  }
}

window.addEventListener('load', scrollToHash);
