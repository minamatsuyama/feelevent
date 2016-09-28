$(function() {
    initInputLabel();
    initSelect2();
});

function initInputLabel() {
    var $input = $(".input-label");
    var activeColor = "#dcf5e7";
    var normalColor = "#f5f7fa";
    $input.on("click mouseleave", function() {
        if ($(".check-box").is(":checked")) {
            $input.css("background-color", activeColor);
        } else {
            $input.css("background-color", normalColor);
        }
    }).mouseenter(function() {
        $input.css("background-color", activeColor);
    });
}

function initSelect2() {
    $(".selectpicker select").select2({
        placeholder: "年齢を選択",
        minimumResultsForSearch: Infinity
    });
}