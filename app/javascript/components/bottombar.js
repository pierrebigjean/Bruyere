const initBottombar = () => {
  const encyclopédieButton = document.getElementById("encyclopédie-button")
  const maisonButton = document.getElementById("maison-button")
  const calendrierButton = document.getElementById("calendrier-button")

  if (document.location.pathname.includes("locations")) {
    setTimeout(() => { maisonButton.style.opacity = 1; }, 100);
  }

  if (document.location.pathname.includes("calendar")) {
    setTimeout(() => { calendrierButton.style.opacity = 1; }, 100);
  }

  if (document.location.pathname === "/") {
    setTimeout(() => { encyclopédieButton.style.opacity = 1; }, 100);
  }
}

export { initBottombar };