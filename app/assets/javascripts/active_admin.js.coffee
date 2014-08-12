#= require active_admin/base
#= require autocomplete-rails
#= require_tree ./active_admin
#= require just_datetime_picker/nested_form_workaround
#= require jquery.ui.all
#= require jquery-ui-timepicker-addon
#= require chosen-jquery

$(document).ready ->
  jQuery("input.hasDatetimePicker").datetimepicker
    dateFormat: "dd/mm/yy"
    beforeShow: ->
      setTimeout (->
        $("#ui-datepicker-div").css "z-index", "3000"
        return
      ), 100
      return

  return
