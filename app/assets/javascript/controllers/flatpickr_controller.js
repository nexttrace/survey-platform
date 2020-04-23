import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {
  connect() {
    console.log("hello")
    super.connect()
  }

  initialize() {
    this.config = {
      inline: true,
    }
  }
}
