// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
    $(".removeFromFarm").click(function() {
        $(this).closest('tr').remove();
    })
});