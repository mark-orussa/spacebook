# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "click", "#findFriendsResultsClose", ->
  $("#findFriendsResults").hide()
###

console.log('hello')
$("body").on "click", ".toggleButton", ->
#Hide all toggle elements.
  ###
###   Toggle something.
     There should be a containing element around the arrow img. That container needs a custom attribute of "toggleButton" The sibling to be toggled must have a class of "toggleMe".###
###
  toggleMe = $(this).next('.toggleMe');
  console.log "clicked: " + toggleMe.html()
  #Toggle the stuff outside of contentFloater.
  arrow = $(this).children(".fa");
  $(".toggleMe").each ->
    if $(this).is(":visible")
#Close all toggles.
      $(this).slideUp(200)
    #var arrow = $(this).find(".fa");
    $("span").removeClass("fa-rotate-90")


  if toggleMe.css('display') == 'none'
    toggleMe.slideDown(200);
    arrow.toggleClass("fa-rotate-90", true);
  else
    toggleMe.slideUp();
    arrow.toggleClass("fa-rotate-90", false);
###
