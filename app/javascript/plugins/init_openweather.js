// TODO: Write your JS code in here
const initWeather = () => {
  const d = new Date();
  
  const fetchWeather = (url) => {
    document.querySelector("#date").innerText = `${d.toDateString()}`;
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        const weatherIcon = data.weather[0].icon
        const weatherIconUrl = `https://openweathermap.org/img/w/${weatherIcon}.png`;
        document.querySelector("#city").innerText = data.name;
        document.querySelector("#weather-description").innerText = data.weather[0].description;
        document.querySelector("#weather-icon").src = weatherIconUrl;
        document.querySelector("#temperature").innerText = `${data.main.temp}°C`;
      });
  };

  navigator.geolocation.getCurrentPosition((data) => {
    const openWeatherKey = document.querySelector(".topbar").dataset.openweatherApiKey
    const urlCurrent = `https://api.openweathermap.org/data/2.5/weather?lat=${data.coords.latitude}&lon=${data.coords.longitude}&appid=${openWeatherKey}&units=metric`;
    fetchWeather(urlCurrent);
  });
}

export { initWeather }
