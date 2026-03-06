import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select", "options"]

  loadOptions() {
    const menuItemId = this.selectTarget.value
    if (!menuItemId) {
      this.optionsTarget.innerHTML = ""
      return
    }

    fetch(`/menu_items/${menuItemId}/options`, {
      headers: { "Accept": "text/html" }
    })
    .then(response => response.text())
    .then(html => {
      this.optionsTarget.innerHTML = html
    })
  }
}
