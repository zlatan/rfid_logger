# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#reports').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    aLengthMenu: [[25, 50, 75, 100, -1], [25, 50, 75, 100, "All"]],
    iDisplayLength: 75
