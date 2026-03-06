import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "dropdown", "search", "list", "count"]
  static values = { open: Boolean }

  connect() {
    this.openValue = false
    this._outsideClick = this.outsideClick.bind(this)
    document.addEventListener("click", this._outsideClick)
    this.updateCount()
  }

  disconnect() {
    document.removeEventListener("click", this._outsideClick)
  }

  toggle(event) {
    event.stopPropagation()
    this.openValue = !this.openValue
    if (this.openValue) {
      this.dropdownTarget.classList.remove("hidden")
      if (this.hasSearchTarget) {
        this.searchTarget.value = ""
        this.filterList("")
        requestAnimationFrame(() => this.searchTarget.focus())
      }
    } else {
      this.dropdownTarget.classList.add("hidden")
    }
  }

  outsideClick(event) {
    if (!this.element.contains(event.target) && this.openValue) {
      this.openValue = false
      this.dropdownTarget.classList.add("hidden")
    }
  }

  search() {
    this.filterList(this.searchTarget.value.toLowerCase().trim())
  }

  filterList(query) {
    this.listTarget.querySelectorAll("[data-option]").forEach(item => {
      item.classList.toggle("hidden", query.length > 0 && !item.dataset.label.toLowerCase().includes(query))
    })
  }

  check(event) {
    this.updateCount()
  }

  updateCount() {
    const checked = this.listTarget.querySelectorAll("input[type='checkbox']:checked")
    if (this.hasCountTarget) {
      if (checked.length > 0) {
        this.countTarget.textContent = checked.length
        this.countTarget.classList.remove("hidden")
      } else {
        this.countTarget.classList.add("hidden")
      }
    }
  }
}
