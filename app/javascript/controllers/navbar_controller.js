import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "burger", "menu" ]

  toggle() {
    this.menuTargets.forEach(e => e.classList.toggle("is-active"))
  }
}

