import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dialog"]

  open(event) {
    event.preventDefault()
    const id = event.currentTarget.dataset.modalId
    const dialog = document.getElementById(id)
    if (dialog) {
      dialog.showModal()
      this.centerDialog(dialog)
    }
  }

  close() {
    this.dialogTarget.close()
  }

  backdropClose(event) {
    if (event.target === this.dialogTarget) {
      this.dialogTarget.close()
    }
  }

  centerDialog(dialog) {
    const rect = dialog.getBoundingClientRect()
    const top = (window.innerHeight - rect.height) / 2
    const left = (window.innerWidth - rect.width) / 2
    dialog.style.top = `${top}px`
    dialog.style.left = `${left}px`
    dialog.style.margin = '0'
  }
}
