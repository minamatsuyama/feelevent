$(document).ready(function() {
    var $window = $(window), $card = $(".recommend-list"), toggleSlick;
    toggleSlick = function() {
        if ($(window).width() < 480) {
            if ($card.hasClass("slick-initialized")) {
                $card.slick("unslick");
            }
            $card.slick({
                infinite: true,
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
    $(".recommends .btn-more").click(function(e) {
        $(".recommend-list .eventcard:hidden").slice(0, 3).css("display", "inline-block");
        if ($(".recommend-list .eventcard").length == $(".recommend-list .eventcard:visible").length) {
            $(".recommends .btn-more").hide();
        }
        e.preventDefault();
    });
});