import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "select", "dialog", "search", "list"]

  connect() {
    this.debounceTimer = null
    // Auto-open modal if no user selected
    if (!this.selectTarget.value) {
      requestAnimationFrame(() => this.openModal())
    }
  }

  openModal() {
    this.dialogTarget.showModal()
    this.centerDialog()
    this.searchTarget.value = ""
    this.filterList("")
    requestAnimationFrame(() => this.searchTarget.focus())
  }

  closeModal() {
    this.dialogTarget.close()
  }

  backdropClose(event) {
    if (event.target === this.dialogTarget) {
      this.dialogTarget.close()
    }
  }

  centerDialog() {
    const rect = this.dialogTarget.getBoundingClientRect()
    const top = (window.innerHeight - rect.height) / 2
    const left = (window.innerWidth - rect.width) / 2
    this.dialogTarget.style.top = `${top}px`
    this.dialogTarget.style.left = `${left}px`
    this.dialogTarget.style.margin = '0'
  }

  onSearch() {
    clearTimeout(this.debounceTimer)
    this.debounceTimer = setTimeout(() => {
      this.filterList(this.searchTarget.value)
    }, 200)
  }

  filterList(query) {
    const items = this.listTarget.querySelectorAll("[data-user-item]")
    const q = query.toLowerCase().trim()
    items.forEach(item => {
      const name = item.dataset.userName.toLowerCase()
      item.classList.toggle("hidden", q.length > 0 && !name.includes(q))
    })
  }

  pick(event) {
    event.preventDefault()
    const userId = event.currentTarget.dataset.userValue
    const userName = event.currentTarget.dataset.userName
    this.selectTarget.value = userId
    this.element.querySelector("[data-display]").textContent = userName
    this.dialogTarget.close()
    this.formTarget.requestSubmit()
  }
}
