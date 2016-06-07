// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var addNewTagHandler = function() {
    $(".add-tag").click(function(clickEvent) {
        var id = $(clickEvent.target).data("comment-id");
        var form = $("#new-tag-" + id);
        if (form.is(":visible")) {
            form.hide();
        } else {
            form.show();
        }
    });
}

$(document).ready(addNewTagHandler);
$(document).on("page:change", addNewTagHandler);
