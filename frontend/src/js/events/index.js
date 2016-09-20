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
    }
    //else {
    //  $card.slick('unslicked');
    //}
  };

  $window.resize(toggleSlick);
  toggleSlick();

  $('.recommends .btn-more').click(function (e) {
    $('.recommend-list .eventcard:hidden').slice(0, 3).css("display","inline-block");
    if ($('.recommend-list .eventcard').length == $('.recommend-list .eventcard:visible').length) {
      $('.recommends .btn-more').hide();
    }
    e.preventDefault();
  });
});

