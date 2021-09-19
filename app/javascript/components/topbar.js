const initTopBar = () => {
  const topBar = document.querySelector(".topbar")
  const topBarContent = document.querySelector(".topbar-content")
  if (topBar) {

    window.scrollTo({
      top: 48,
      behavior: 'smooth'
    });
    window.addEventListener("scroll", () => {
      if (window.scrollY <= 10) {
        topBar.style.marginLeft = 0;
        topBar.style.marginRight = 0;
        topBarContent.style.opacity = 1;
      } else if (window.scrollY <= 48 && window.scrollY > 10) {
        topBar.style.marginLeft = `${window.scrollY - 10}%`;
        topBar.style.marginRight = `${window.scrollY - 10}%`;
        topBarContent.style.opacity = 0;
      } else {
        topBar.style.marginLeft = "38%";
        topBar.style.marginRight = "38%";
      }
    })
  }

  const weatherIcon = document.getElementById("weather-icon")
  weatherIcon.addEventListener("click", () => {
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  })
}

export { initTopBar }
