const initTopBar = () => {
  const topBar = document.querySelector(".topbar")
  if (topBar) {

    window.scrollTo({
      top: 48,
      behavior: 'smooth'
    });
    window.addEventListener("scroll", () => {
      if (window.scrollY <= 10) {
        topBar.style.marginLeft = 0;
        topBar.style.marginRight = 0;
      } else if (window.scrollY <= 48 && window.scrollY > 10) {
        topBar.style.marginLeft = `${window.scrollY - 10}%`;
        topBar.style.marginRight = `${window.scrollY - 10}%`;
      } else {
        topBar.style.marginLeft = "38%";
        topBar.style.marginRight = "38%";
      }
    })
  }
}

export { initTopBar }
