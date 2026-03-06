import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "dropdown", "search", "list", "hidden"]
  static values = { open: Boolean }

  connect() {
    this.openValue = false
    this._outsideClick = this.outsideClick.bind(this)
    document.addEventListener("click", this._outsideClick)
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
    const query = this.searchTarget.value.toLowerCase().trim()
    this.filterList(query)
  }

  filterList(query) {
    const items = this.listTarget.querySelectorAll("[data-option]")
    items.forEach(item => {
      const label = item.dataset.label.toLowerCase()
      item.classList.toggle("hidden", query.length > 0 && !label.includes(query))
    })
  }

  pick(event) {
    event.preventDefault()
    event.stopPropagation()
    const el = event.currentTarget
    const value = el.dataset.value
    const label = el.dataset.label
    const price = el.dataset.price

    this.hiddenTarget.value = value
    if (price !== undefined) {
      this.hiddenTarget.dataset.price = price
    }
    this.buttonTarget.querySelector("[data-label]").textContent = label
    this.buttonTarget.classList.remove("text-slate-500")
    this.buttonTarget.classList.add("text-white")

    // Highlight selected
    this.listTarget.querySelectorAll("[data-option]").forEach(opt => {
      opt.classList.toggle("text-amber-400", opt.dataset.value === value)
      opt.classList.toggle("bg-amber-500/5", opt.dataset.value === value)
    })

    this.openValue = false
    this.dropdownTarget.classList.add("hidden")

    // Dispatch change event on hidden input for other controllers
    this.hiddenTarget.dispatchEvent(new Event("change", { bubbles: true }))
  }
}
