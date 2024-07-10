// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import { Turbo } from "@hotwired/turbo-rails"
import { encodeMethodIntoRequestBody } from "./turbo_methods"

document.addEventListener("turbo:before-fetch-request", encodeMethodIntoRequestBody)


//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require salary_deductions

//= require_tree .
