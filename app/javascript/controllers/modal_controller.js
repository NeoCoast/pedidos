import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dialog"]

  open(event) {
    event.preventDefault()
    const id = event.currentTarget.dataset.modalId
    const dialog = document.getElementById(id)
    if (dialog) {
      dialog.showModal()
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
}
