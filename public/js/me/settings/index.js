$(document).ready(function() {
    initInputLabel();
    initSelect2();
    buttonCheckbox();
});

function initInputLabel() {
    var $input = $(".input-label");
    var activeColor = "#dcf5e7";
    var normalColor = "#f5f7fa";
    $input.bind("click mouseleave", function() {
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

function buttonCheckbox() {
    $(".btn-checkbox").on("click", function(evt) {
        hasActive = $(this).hasClass("active");
        if (hasActive) {
            $(this).find("input").prop("checked", false);
            $(this).removeClass("active");
        } else {
            $(this).find("input").prop("checked", true);
            $(this).addClass("active");
        }
        evt.stopPropagation();
        evt.preventDefault();
    });
}