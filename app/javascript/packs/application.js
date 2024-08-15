// app/javascript/packs/application.js
import Rails from "@rails/ujs";
Rails.start();

// If you are using Turbo, add this as well:
import { Turbo } from "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
