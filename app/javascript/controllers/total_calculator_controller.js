import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["total"]

  connect() {
    this.calculate()
  }

  calculate() {
    let total = 0

    const menuInput = this.element.querySelector("[name='meal[menu_item_id]']")
    if (menuInput && menuInput.value) {
      total += parseFloat(menuInput.dataset.price || 0)
    }

    this.element.querySelectorAll("input[type='checkbox']:checked").forEach(cb => {
      total += parseFloat(cb.dataset.price || 0)
    })

    if (this.hasTotalTarget) {
      this.totalTarget.textContent = total.toFixed(2)
    }
  }
}
