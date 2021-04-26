// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "stylesheets/application"
import "@fortawesome/fontawesome-free/css/all"
import "jquery"
Rails.start()
Turbolinks.start()
import '@client-side-validations/client-side-validations'
ActiveStorage.start()

window.ClientSideValidations.validators.remote['client_uniqueness'] = function(element, options) {
    if ($.ajax({
        url: '/validators/client_uniqueness',
        data: { login: element.val() },
        // async *must* be false
        async: false
    }).status === 200) { console.log(options); return options.message; }
}