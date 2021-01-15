import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["field"]

  connect() {
    if (typeof(google) != "undefined") {
      this.initMap()
    }
  }

  initMap() {
    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)

  }
}

