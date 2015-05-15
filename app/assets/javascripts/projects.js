$(document).on('ready page:load', function() {
  $('#search-form').on("input", function() {
    // .submit(function(event) {
    // event.preventDefault();
    var searchValue = $('#search').val();

    $.getScript('/projects?search=' + searchValue);
  });
});