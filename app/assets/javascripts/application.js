//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//
//= require nested_form_fields
//= require dependent-fields
//
//= require_self
//
//= require_tree ./objects

window.init = {};

$(document).on('turbolinks:load', function () {
  init.dependentFields();
  init.select2();
});

$(document).on('fields_added.nested_form_fields', function (e) {
  init.dependentFields();
  init.select2();
});

$(window).on('resize', function () {
});
