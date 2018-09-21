// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require tether.min
//= require bootstrap.min
//= require ie10-viewport-bug-workaround
//= require activestorage
//= require inputmask
//= require jquery.inputmask
//= require turbolinks
//= require_tree .


  window.onload = function () {
    applyInputMaskDate();
  }

  function applyInputMaskDate() {
    var elems = document.getElementsByClassName('input-date-mask')
    if(elems != null) {
      for(var i = 0; i < elems.length; i++) {
        inputMask(elems[i]);
      }
    }
  }

  function inputMask(element_input_date) {
    var im = new Inputmask("99/99/9999");
    im.mask(element_input_date);
  }