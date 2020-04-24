// survey_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "householdTable" ]

  addMoreHousehold() {
    let lastRow = this.householdTableTarget.rows[this.householdTableTarget.rows.length - 1]
    let newRow = lastRow.cloneNode(true)

    // clear inputs
    let inputs = newRow.getElementsByTagName("input")
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].value = ""        
    }

    lastRow.parentNode.append(newRow)
  }

  householdSelected() {
    document.getElementById("followup_group").classList.add("is-hidden")
    document.getElementById("followup_household").classList.remove("is-hidden")
  }

  groupSelected() {
    document.getElementById("followup_household").classList.add("is-hidden")
    document.getElementById("followup_group").classList.remove("is-hidden")
  }

}