// household_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "householdButton", "groupButton", "nextHouseholdVisitors", "nextWorkContacts"]

  connect() {
    if (this.householdButtonTarget.checked) {
      this.householdSelected()
    } else if (this.groupButtonTarget.checked) {
      this.groupSelected()
    }
    super.connect()
  }

  householdSelected() {
    document.getElementById("followup_group").classList.add("is-hidden")
    document.getElementById("followup_household").classList.remove("is-hidden")
    this.nextWorkContactsTarget.classList.add("is-hidden")
    this.nextWorkContactsTarget.getElementsByClassName("next-step")[0].name = "next_step_disabled"
    this.nextHouseholdVisitorsTarget.classList.remove("is-hidden")
    this.nextHouseholdVisitorsTarget.getElementsByClassName("next-step")[0].name = "next_step"
  }

  groupSelected() {
    document.getElementById("followup_household").classList.add("is-hidden")
    document.getElementById("followup_group").classList.remove("is-hidden")
    this.nextWorkContactsTarget.classList.remove("is-hidden")
    this.nextWorkContactsTarget.getElementsByClassName("next-step")[0].name = "next_step"
    this.nextHouseholdVisitorsTarget.classList.add("is-hidden")
    this.nextHouseholdVisitorsTarget.getElementsByClassName("next-step")[0].name = "next_step_disabled"
  }
}