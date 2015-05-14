$(document).ready ->
  $("#profile_region_id").on "change", (event) ->
    $.ajax
      url: "/regions/" + $('#profile_region_id option:selected').val() + "/counties.js"
      type: "GET"
      dataType: "script"

  $('#profile_region_id').trigger('change')
