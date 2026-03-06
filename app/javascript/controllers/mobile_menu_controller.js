import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "backdrop", "iconOpen", "iconClose"]

  toggle() {
    const opening = this.menuTarget.classList.contains("hidden")
    this.menuTarget.classList.toggle("hidden", !opening)
    this.backdropTarget.classList.toggle("hidden", !opening)
    this.iconOpenTarget.classList.toggle("hidden", opening)
    this.iconCloseTarget.classList.toggle("hidden", !opening)
  }

  close() {
    this.menuTarget.classList.add("hidden")
    this.backdropTarget.classList.add("hidden")
    this.iconOpenTarget.classList.remove("hidden")
    this.iconCloseTarget.classList.add("hidden")
  }
}
