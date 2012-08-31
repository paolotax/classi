# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->
  $("#classi_inserter_classe").change (e) ->
    $(".input.collection_checkbox span").addClass("hidden")
    classe = $(@).val()
    $("span[data-classe='#{classe}']").removeClass("hidden")