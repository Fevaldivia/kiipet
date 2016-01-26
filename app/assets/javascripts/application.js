// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require moment
//= require fullcalendar
//= require bootstrap-datepicker
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require jquery-ui/tabs
//= require jquery.raty
//= require ratyrate
//= require_tree .

$(document).on('ready page:change', function() {
    $('.datetimepicker').datepicker();
  });
