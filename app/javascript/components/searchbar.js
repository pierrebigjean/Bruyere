const initSearchBar = () => {
  const searchBar = document.querySelector(".search-bar")
  if (searchBar) {
    window.addEventListener("scroll", () => {
      if (window.scrollY < 50) {
        searchBar.style.top = 0;
        searchBar.style.opacity = 1;
      } else if (window.scrollY < 100) {
        searchBar.style.top = 0;
        searchBar.style.opacity = `${1 - (window.scrollY - 50) / 50}`
      } else if (window.scrollY < 150) {
        searchBar.style.top = "84vh";
        searchBar.style.opacity = `${(window.scrollY - 100) / 50}`
      } else {
        searchBar.style.top = "84vh";
        searchBar.style.opacity = 1;
      }
    })
  }

}

export { initSearchBar }