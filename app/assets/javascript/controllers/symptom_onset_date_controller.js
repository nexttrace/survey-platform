import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {
  static targets = [ "text", "startDate", "endDate" ]

  connect() {
    super.connect()
  }

  initialize() {
    // minDate is three weeks ago
    var minDate = new Date()
    minDate.setDate(minDate.getDate() - 21)

    this.config = {
      inline: true,
      minDate: minDate,
      maxDate: new Date()
    }
  }

  change(selectedDates, dateStr, instance) {
    let onsetDate = selectedDates[0]

    // format of our output dates
    const dateOptions = { weekday: 'long', month: 'long', day: 'numeric' };

    // calculate start date as 2 days prior to symptom onset
    var startDate = new Date(onsetDate)
    startDate.setDate(startDate.getDate() - 2)
    let startDateStr = startDate.toLocaleDateString(startDate, dateOptions)

    // calculate end date as 7 days after symptom onset, or today, whichever is less
    const isAtLeastToday = (someDate) => {
      const today = new Date()
      return someDate.getDate() >= today.getDate() &&
        someDate.getMonth() >= today.getMonth() &&
        someDate.getFullYear() >= today.getFullYear()
    }    
    var endDate = new Date(onsetDate)
    endDate.setDate(endDate.getDate() + 7)
    let endDateStr = isAtLeastToday(endDate) ? "today" : endDate.toLocaleDateString(endDate, dateOptions)

    this.startDateTarget.innerText = startDateStr
    this.endDateTarget.innerText = endDateStr
    this.textTarget.classList.remove('is-hidden')
  }
}
