// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initTopBar } from "../components/topbar"
import { initSortable } from "../plugins/init_sortable"
import { initWeather } from "../plugins/init_openweather"
import { initSearchBar } from "../components/searchbar"
import { initPlant } from "../components/plant"
import { initFlatpickr } from "../plugins/init_flatpickr"
import { initSelect2 } from '../plugins/init_select2';
import { initBottombar } from "../components/bottombar"

// Internal imports, e.g:

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initSelect2();
  initTopBar();
  initSortable();
  initWeather();
  initSearchBar();
  initPlant();
  initFlatpickr();
  initBottombar();
});

import "controllers"

