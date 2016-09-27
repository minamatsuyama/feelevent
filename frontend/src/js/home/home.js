jQuery(document).ready(function(){
	mainSlideshowInit();
  datepickerInit();
  select2Init();
	jQuery('.main-slideshow').on('setPosition',function(){
    arrowsPosition();
	});
  arrowsPosition();
  buttonToggle();
  buttonCheckbox();
  buttonLikeboxInit();

});
function mainSlideshowInit(){
  jQuery('.main-slideshow').slick({
    centerMode: true,
    slidesToShow: 1,
    centerPadding: 0,
    variableWidth: true
  })
}

function arrowsPosition(){
	windowsWidth = jQuery(window).width();
  centerWidth = jQuery(".slick-center").width();
	centerPadding = (windowsWidth - centerWidth)/2;
  arrowWidth = jQuery(".slick-arrow").width();
  jQuery(".slick-prev").css("left",centerPadding-(arrowWidth/2));
  jQuery(".slick-next").css("right",centerPadding-(arrowWidth/2));
}

function datepickerInit(){
  jQuery(".date-picker").find('input').datepicker({
    regional: "ja",
    dateFormat:"yy.mm.dd",
    onClose: function(arg) {
      var inputValue = jQuery(this).val();
      if(inputValue.trim()){
        jQuery(this).addClass("has-value");
      }else{
        jQuery(this).removeClass("has-value");
      }
    }
  });
}
function select2Init(){
  jQuery('.held-area').find('select').select2({
    placeholder:"開催場所",
    minimumResultsForSearch: Infinity
  });
  jQuery('.entry-fee-type').find('select').select2({
    placeholder:"参加費",
    minimumResultsForSearch: Infinity
  });
  jQuery('.qualifying-age').find('select').select2({
    placeholder:"対象年齡",
    minimumResultsForSearch: Infinity
  });
}
function buttonToggle(){
  AddAndRemoveActive('.btn-toggle');
  jQuery('.btn-toggle').on("click",function(){
    boxId =  jQuery(this).attr('data-toggle');
    jQuery('#'+boxId).toggle();
  });
}
function AddAndRemoveActive(btn){
  jQuery(btn).on("click",function(){
    hasActive = jQuery(this).hasClass('active');
    if(hasActive){
      jQuery(this).removeClass('active');
    }else{
      jQuery(this).addClass('active');
    }
    e.stopPropagation();
    e.preventDefault();
  });
}
function buttonCheckbox(){
  jQuery('.btn-checkbox').on("click",function(evt){
      hasActive = jQuery(this).hasClass('active');
    if(hasActive){
      jQuery(this).find('input').prop('checked', false);
      jQuery(this).removeClass('active');
    }else{
      jQuery(this).find('input').prop('checked', true);
      jQuery(this).addClass('active');
    }
    evt.stopPropagation();
    evt.preventDefault();
  });
}
function buttonLikeboxInit(){
  AddAndRemoveActive('.btn-like-box');
}
