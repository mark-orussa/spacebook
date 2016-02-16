# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "click", "#findFriendsResultsClose", ->
  $("#findFriendsResults").hide()

###
document.addEventListener("page:load", ->
    $.ajax({
      type: "POST",
      url: '/galaxy/get_friends',
      data: {
        id: current_user.id
      },
      success: (data) ->
        alert data.id
        return false
      error: (data) ->
        return false
    })
)
###
