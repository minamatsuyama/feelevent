$(document).ready(function() {
    var $window = $(window), $card = $(".favorite, .preparefree, .advanceprepare"), toggleSlick;
    toggleSlick = function() {
        if ($window.width() < 450) {
            $card.slick({
                dots: false,
                infinite: true,
                speed: 600,
                arrows: false,
                variableWidth: true
            });
        } else {
            $card.unslick();
        }
    };
    $window.resize(toggleSlick);
    toggleSlick();
});