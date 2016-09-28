$(function() {
    initSlick();
    initLoadMore();
});

function initSlick() {
    var $window = $(window), $card = $(".recommend-list"), toggleSlick;
    toggleSlick = function() {
        if ($(window).width() < 1e3) {
            if ($card.hasClass("slick-initialized")) {
                $card.slick("unslick");
            }
            $card.slick({
                infinite: false,
                speed: 600,
                dots: false,
                arrows: false,
                variableWidth: true
            });
        } else {
            if ($card.hasClass("slick-initialized")) {
                $card.slick("unslick");
            }
        }
    };
    $window.resize(toggleSlick);
    toggleSlick();
}

function initLoadMore() {
    var $btn = $(".recommends .btn-more");
    var $eventcard = $(".recommend-list .eventcard");
    $btn.on("click", function(e) {
        $(".recommend-list .eventcard:hidden").slice(0, 3).css("display", "inline-block");
        if ($eventcard.length == $(".recommend-list .eventcard:visible").length) {
            $btn.hide();
        }
        e.preventDefault();
    });
}