$(document).ready(function() {
    var $window = $(window), $card = $(".favorite-list, .preparefree-list, .advanceprepare-list"), toggleSlick;
    toggleSlick = function() {
        if ($window.width() < 450) {
            if ($card.hasClass("slick-initialized")) {
                $card.slick("unslick");
            }
            $card.slick({
                dots: false,
                infinite: true,
                speed: 600,
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
    $(".preparefree .btn-more").click(function(e) {
        $(".preparefree-list .eventcard:hidden").slice(0, 3).css("display", "inline-block");
        if ($(".preparefree-list .eventcard").length == $(".preparefree-list .eventcard:visible").length) {
            $(".preparefree .btn-more").hide();
        }
        e.preventDefault();
    });
    $(".advanceprepare .btn-more").click(function(e) {
        $(".advanceprepare-list .eventcard:hidden").slice(0, 3).css("display", "inline-block");
        if ($(".advanceprepare-list .eventcard").length == $(".advanceprepare-list .eventcard:visible").length) {
            $(".advanceprepare .btn-more").hide();
        }
        e.preventDefault();
    });
});