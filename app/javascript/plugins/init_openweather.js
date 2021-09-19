// TODO: Write your JS code in here
import $ from 'jquery';
import 'select2';

const initWeather = () => {
  const d = new Date();
  
  const fetchWeather = (url) => {
    document.querySelector("#date").innerText = `${d.toDateString()}`;
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        const weatherIcon = data.weather[0].icon
        const weatherIconUrl = `http://openweathermap.org/img/w/${weatherIcon}.png`;
        document.querySelector("#city").innerText = data.name;
        document.querySelector("#weather-description").innerText = data.weather[0].description;
        document.querySelector("#weather-icon").src = weatherIconUrl;
        document.querySelector("#temperature").innerText = `${data.main.temp}°C`;
      });
  };

  navigator.geolocation.getCurrentPosition((data) => {
    const urlCurrent = `http://api.openweathermap.org/data/2.5/weather?lat=${data.coords.latitude}&lon=${data.coords.longitude}&appid=0d167b4e614071f9f4f0f2fdabbc27a3&units=metric`;
    fetchWeather(urlCurrent);
  });
}

export { initWeather }
