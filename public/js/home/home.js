jQuery(document).ready(function() {
    mainSlideshowInit();
    datepickerInit();
    select2Init();
    $(".main-slideshow").on("setPosition", function() {
        arrowsPosition();
    });
});

function mainSlideshowInit() {
    $(".main-slideshow").slick({
        centerMode: true,
        slidesToShow: 1,
        centerPadding: 0,
        variableWidth: true
    });
}

function arrowsPosition() {
    var windowsWidth = $(window).width();
    centerWidth = $(".slick-center").width();
    centerPadding = (windowsWidth - centerWidth) / 2;
    arrowWidth = $(".slick-arrow").width();
    $(".slick-prev").css("left", centerPadding - arrowWidth / 2);
    $(".slick-next").css("right", centerPadding - arrowWidth / 2);
}

function datepickerInit() {
    $(".search-area .date-picker input").datepicker($.datepicker.regional["ja"]);
}

function select2Init() {
    $(".held-area select").select2({
        minimumResultsForSearch: Infinity
    });
    $(".entry-fee-type select").select2({
        placeholder: "参加費",
        minimumResultsForSearch: Infinity
    });
    $(".qualifying-age select").select2({
        placeholder: "対象年齡",
        minimumResultsForSearch: Infinity
    });
}