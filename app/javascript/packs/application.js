import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application" 
import '@fortawesome/fontawesome-free/js/all';


const images = require.context('../images/', true)
Rails.start()
Turbolinks.start()
ActiveStorage.start()
require('./preview') 



