// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.
console.log("controller index")

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("javascript/controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))
