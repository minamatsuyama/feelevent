
$(document).ready(function () {
  initInputLabel();
});

function initInputLabel() {
  var $input = $('.input-label');
  var activeColor = "#dcf5e7";
  var normalColor = "#f5f7fa";
  $input.bind('click mouseleave',function () {
    if ($('.check-box').is(':checked')) {
      $input.css("background-color", activeColor);
    }
    else {
      $input.css("background-color", normalColor);
    }
  }).mouseenter(function() {
    $input.css("background-color", activeColor);
  });
}
