
$(document).ready(function () {
  $('.input-label').bind('click mouseleave',function () {
    if ($('.check-box').is(':checked')) {
      $(this).css("background-color", "#dcf5e7");
    }
    else {
      $(this).css("background-color", "#f5f7fa");
    }
  }).mouseenter(function() {
      $(this).css("background-color", "#dcf5e7");
    });
});
