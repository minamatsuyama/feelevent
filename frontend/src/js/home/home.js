jQuery(document).ready(function(){
  jQuery.getScript("/js/home/searchmenu.js",function (){
    mainSlideshowInit();
    datepickerInit();
    jQuery('.main-slideshow').on('setPosition',function(){
      arrowsPosition();
    });
    arrowsPosition();
    buttonLikeboxInit();
  });
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
	var windowsWidth = jQuery(window).width();
  var centerWidth = jQuery(".slick-center").width();
	var centerPadding = (windowsWidth - centerWidth)/2;
  var arrowWidth = jQuery(".slick-arrow").width();
  jQuery(".slick-prev").css("left",centerPadding-(arrowWidth/2));
  jQuery(".slick-next").css("right",centerPadding-(arrowWidth/2));
}

function datepickerInit(){
  var from = $( "#held-started-on" ).find('input')
    .datepicker({
      regional: "ja",
      dateFormat: "yy.mm.dd"
    })
    .on( "change", function() {
      datepickerChange(this);
      to.datepicker( "option", "minDate", this.value );
    }),
    to = $( "#held-ended-on" ).find('input').datepicker({
      regional: "ja",
      dateFormat: "yy.mm.dd"
    })
      .on( "change", function() {
        datepickerChange(this);
        from.datepicker( "option", "maxDate", this.value );
      });
}
function datepickerChange(obj){
  var inputValue = obj.value;
  if(inputValue.trim()){
    jQuery(obj).addClass("has-value");
  }else{
    jQuery(obj).removeClass("has-value");
  }
}
function buttonLikeboxInit(){
  AddAndRemoveActive('.btn-like-box');
}

