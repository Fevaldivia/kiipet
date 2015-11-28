$(document).ready ->

  $("#q_county_region_name_cont").autocomplete
    source: $("#q_county_region_name_cont").data('autocomplete-source')
  
  $("#profile_region_id").on "change", (event) ->
    $.ajax
      url: "/regions/" + $('#profile_region_id option:selected').val() + "/counties.js"
      type: "GET"
      dataType: "script"

  $('#profile_region_id').trigger('change')
