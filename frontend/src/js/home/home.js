jQuery(document).ready(function(){
	mainSlideshowInit();
  datepickerInit();
  select2Init();
	$('.main-slideshow').on('setPosition',function(){
    arrowsPosition();
	});
  arrowsPosition();
  buttonToggle();
  buttonCheckbox();
  buttonLikeboxInit();

});
function mainSlideshowInit(){
  $('.main-slideshow').slick({
    centerMode: true,
    slidesToShow: 1,
    centerPadding: 0,
    variableWidth: true
  })
}

function arrowsPosition(){
	windowsWidth = $(window).width();
  centerWidth = $(".slick-center").width();
	centerPadding = (windowsWidth - centerWidth)/2;
  arrowWidth = $(".slick-arrow").width();
  $(".slick-prev").css("left",centerPadding-(arrowWidth/2));
  $(".slick-next").css("right",centerPadding-(arrowWidth/2));
}

function datepickerInit(){
  $(".search-area .date-picker input").datepicker({
    regional: "ja",
    dateFormat:"yy.mm.dd",
    onClose: function(arg) {
      var inputValue = $(this).val();
      if(inputValue.trim()){
        $(this).addClass("has-value");
      }else{
        $(this).removeClass("has-value");
      }
    }
  });
}
function select2Init(){
  $('.held-area select').select2({
    placeholder:"開催場所",
    minimumResultsForSearch: Infinity
  });
  $('.entry-fee-type select').select2({
    placeholder:"参加費",
    minimumResultsForSearch: Infinity
  });
  $('.qualifying-age select').select2({
    placeholder:"対象年齡",
    minimumResultsForSearch: Infinity
  });
}
function buttonToggle(){
  AddAndRemoveActive('.btn-toggle');
  $('.btn-toggle').click(function(){
    boxId =  $(this).attr('data-toggle');
    $('#'+boxId).toggle();
  });
}
function AddAndRemoveActive(btn){
  $(btn).click(function(e){
    hasActive = $(this).hasClass('active');
    if(hasActive){
      $(this).removeClass('active');
    }else{
      $(this).addClass('active');
    }
    e.stopPropagation();
    e.preventDefault();
  });
}
function buttonCheckbox(){
  $('.btn-checkbox').click(function(evt){
      hasActive = $(this).hasClass('active');
    if(hasActive){
      $(this).find('input').prop('checked', false);
      $(this).removeClass('active');
    }else{
      $(this).find('input').prop('checked', true);
      $(this).addClass('active');
    }
    evt.stopPropagation();
    evt.preventDefault();
  });
}
function buttonLikeboxInit(){
  AddAndRemoveActive('.btn-like-box');
}
