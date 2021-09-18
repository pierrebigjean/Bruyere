// TODO: Write your JS code in here
import $ from 'jquery';
import 'select2';

$('#city-input').select2();
const cities = ["Amsterdam", "Bali", "Barcelona", "Belo Horizonte", "Berlin", "Bordeaux", "Brussels", "Buenos Aires", "Casablanca", "Chengdu", "Copenhagen", "Kyoto", "Lausanne", "Lille", "Lisbon", "London", "Lyon", "Madrid", "Marseille", "Melbourne", "Mexico", "Milan", "Montréal", "Nantes", "Oslo", "Paris", "Rio de Janeiro", "Rennes", "Rome", "São Paulo", "Seoul", "Shanghai", "Shenzhen", "Singapore", "Stockholm", "Tel Aviv", "Tokyo"];
$('#city-input').select2({ data: cities, width: '100%' }); // <-- add the `data` and `width` options

const current = document.querySelector("#current");
const textBar = document.querySelector("#city-input");
const submit = document.querySelector("#submit");
const d = new Date();

const fetchWeather = (url) => {
  document.querySelector(".card-body > h3").innerText = `${d.toDateString()}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      document.querySelector(".card-body > h1").innerText = `Weather in ${data.name}`;
      document.querySelector(".card-body p").innerText = data.weather[0].description;
      document.querySelector(".card-body h2").innerText = data.main.temp;
    });
};

submit.addEventListener("click", (event) => {
  event.preventDefault();
  const url = `http://api.openweathermap.org/data/2.5/weather?q=${textBar.value}&appid=0d167b4e614071f9f4f0f2fdabbc27a3&units=metric`;
  fetchWeather(url);
});

current.addEventListener("click", (event) => {
  event.preventDefault();
  navigator.geolocation.getCurrentPosition((data) => {
    const urlCurrent = `http://api.openweathermap.org/data/2.5/weather?lat=${data.coords.latitude}&lon=${data.coords.longitude}&appid=0d167b4e614071f9f4f0f2fdabbc27a3&units=metric`;
    fetchWeather(urlCurrent);
  });
});
