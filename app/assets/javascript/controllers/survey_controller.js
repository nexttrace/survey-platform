// survey_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "contacts",  "householdButton", "groupButton" ]

  connect() {
    if (this.householdButtonTarget.checked) {
      this.householdSelected()
    } else if (this.groupButtonTarget.checked) {
      this.groupSelected()
    }
    super.connect()
  }

  addContact() {
    let contacts = this.contactsTarget.getElementsByClassName("contact")
    let newContact = contacts[0].cloneNode(true)
    newContact.getElementsByClassName("contact-number")[0].innerText = contacts.length + 1

    // clear inputs
    let inputs = newContact.getElementsByTagName("input")
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].value = ""        
    }

    this.contactsTarget.append(newContact)
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