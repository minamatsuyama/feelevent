//Carousel for events detail page

$(document).ready(function () {
  var $window = $(window)
    , $card = $('.recommend-list')
    , toggleSlick;

  toggleSlick = function () {
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
  }

  $window.resize(toggleSlick);
  toggleSlick();
});

