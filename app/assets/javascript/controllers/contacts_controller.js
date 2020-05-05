// survey_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "contacts" ]

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
}