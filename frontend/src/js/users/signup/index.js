
$(document).ready(function () {

  initInputLabel();
  initSelect2();
});

function initInputLabel() {
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
}

function initSelect2() {
  $('.selectpicker select').select2({
    placeholder: "年齢を選択",
    minimumResultsForSearch: Infinity
  });
}
