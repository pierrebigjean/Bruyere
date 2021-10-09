const initPlantHome = () => {
  const interieures = document.getElementById("interieures")
  if (interieures) {
    window.addEventListener("scroll", () => {
      if (window.scrollY < 440) {
        interieures.style.backgroundPosition = `${-window.scrollY}px`;
      }
    })
  }

  const incontournables = document.getElementById("incontournables")
  if (incontournables) {
    window.addEventListener("scroll", () => {
      if (window.scrollY < 300) {
        incontournables.style.opacity = 0;
        incontournables.style.top = "-15px";
      } else {
        incontournables.style.opacity = 1;
        incontournables.style.top = "0px";
      }
    })
  }

  const alocasiaSanderiana = document.getElementById("alocasia-sanderiana")
  if (alocasiaSanderiana) {
    window.addEventListener("scroll", () => {
      if (window.scrollY < 400) {
        alocasiaSanderiana.style.opacity = 0;
        alocasiaSanderiana.style.top = "-15px";
      } else {
        alocasiaSanderiana.style.opacity = 1;
        alocasiaSanderiana.style.top = "0px";
      }
    })
  }

  const philodendron = document.getElementById("philodendron")
  if (philodendron) {
    window.addEventListener("scroll", () => {
      if (window.scrollY < 500) {
        philodendron.style.opacity = 0;
        philodendron.style.top = "-15px";
      } else {
        philodendron.style.opacity = 1;
        philodendron.style.top = "0px";
      }
    })
  }

  const ficus = document.getElementById("ficus")
  if (ficus) {
    window.addEventListener("scroll", () => {
      if (window.scrollY < 600) {
        ficus.style.opacity = 0;
        ficus.style.top = "-15px";
      } else {
        ficus.style.opacity = 1;
        ficus.style.top = "0px";
      }
    })
  }

  const aromatiques = document.getElementById("aromatiques")
  if (aromatiques) {
    window.addEventListener("scroll", () => {
      if (window.scrollY < 750) {
        aromatiques.style.opacity = 0;
        aromatiques.style.bottom = "-20px";
      } else {
        aromatiques.style.opacity = 1;
        aromatiques.style.bottom = "0px";
      }
    })
  }

}

export { initPlantHome }