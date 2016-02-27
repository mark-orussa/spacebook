// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .


document.addEventListener("page:load", function () {
    $('#menu').slicknav();
});

$(function () {
    $('#menu').slicknav();

    $("body").on("click", ".toggleButton", function () {
        //Hide all toggle elements.
        /*
         Toggle something.
         There should be a containing element around the arrow img. That container needs a custom attribute of "toggleButton" The sibling to be toggled must have a class of "toggleMe".
         */
        var toggleMe = $(this).next('.toggleMe');
        console.log("clicked: " + toggleMe.html());
        //Toggle the stuff outside of contentFloater.

        var arrow = $(this).children(".fa");
        $(".toggleMe").each(function () {
            if ($(this).is(":visible")) {
                //Close all toggles.
                $(this).slideUp(200);
                //var arrow = $(this).find(".fa");
                $("span").removeClass("fa-rotate-90");
            }
        });
        if (toggleMe.css('display') == 'none') {
            toggleMe.slideDown(200);
            arrow.toggleClass("fa-rotate-90", true);
        } else {
            toggleMe.slideUp();
            arrow.toggleClass("fa-rotate-90", false);
        }
    })
});



$(document).on('page:load', function () {
    /* if (initialLoad) {
     ready;
     }*/

});