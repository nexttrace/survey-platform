import $ from "jquery"
import flatpickr from "flatpickr";

$(document).ready(function() {
  $(".navbar-burger").click(function() {
    $(".navbar-burger").toggleClass("is-active");
    $(".navbar-menu").toggleClass("is-active");
  });

  flatpickr(".flatpickr", {});
  flatpickr(".flatpickr-inline", {inline: true});
});
