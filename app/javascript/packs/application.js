// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import 'bulma/css/bulma.min.css';
import $ from "jquery";
import 'cocoon';
$(document).on("turbolinks:load", function() {
  $(".navbar-burger").click(function() {
    $(".navbar-burger").toggleClass("is-active");
    $(".navbar-menu").toggleClass("is-active");
  });
});
require("chartkick")
require("chart.js")

import '@fortawesome/fontawesome-free/js/all'

$(document).on("turbolinks:load", function() {
  $('.tab li').click(function() {
    var index = $('.tab li').index(this);
    $('.tab li').removeClass('active');
    $(this).addClass('active');
    $('.area ul').removeClass('show').eq(index).addClass('show');
  });
});