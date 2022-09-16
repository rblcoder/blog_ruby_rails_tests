import { Application } from "@hotwired/stimulus";

const application = Application.start();

//= require bootstrap-sprockets
// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
