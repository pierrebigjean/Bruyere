import { Controller } from "stimulus"

import { initPlant } from "../components/plant"
import { initFlatpickr } from "../plugins/init_flatpickr"

export default class extends Controller {
  static targets = [ "form", "list", "searchInput" ]

  update() {
    const url = `${this.formTarget.action}?search=${this.searchInputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;

        initPlant();
        initFlatpickr()
      })
  }
}