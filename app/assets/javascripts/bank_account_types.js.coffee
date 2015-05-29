$(document).ready ->
  $("#profile_bank_account_attributes_bank_id").on "change", (event) ->
    $.ajax
      url: "/banks/" + $('#profile_bank_account_attributes_bank_id option:selected').val() + "/bank_account_types.js"
      type: "GET"
      dataType: "script"

  $('#profile_bank_account_attributes_bank_id').trigger('change')
