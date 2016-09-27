jQuery(document).ready(function() {
    jQuery.getScript("/js/home/searchmenu.js", function() {
        mainSlideshowInit();
        datepickerInit();
        jQuery(".main-slideshow").on("setPosition", function() {
            arrowsPosition();
        });
        arrowsPosition();
        buttonLikeboxInit();
    });
});

function mainSlideshowInit() {
    jQuery(".main-slideshow").slick({
        centerMode: true,
        slidesToShow: 1,
        centerPadding: 0,
        variableWidth: true
    });
}

function arrowsPosition() {
    windowsWidth = jQuery(window).width();
    centerWidth = jQuery(".slick-center").width();
    centerPadding = (windowsWidth - centerWidth) / 2;
    arrowWidth = jQuery(".slick-arrow").width();
    jQuery(".slick-prev").css("left", centerPadding - arrowWidth / 2);
    jQuery(".slick-next").css("right", centerPadding - arrowWidth / 2);
}

function datepickerInit() {
    from = $("#held-started-on").find("input").datepicker({
        regional: "ja",
        dateFormat: "yy.mm.dd",
        onClose: function(arg) {
            var inputValue = this.value;
            if (inputValue.trim()) {
                jQuery(this).addClass("has-value");
            } else {
                jQuery(this).removeClass("has-value");
            }
        }
    }).on("change", function() {
        to.datepicker("option", "minDate", this.value);
    }), to = $("#held-ended-on").find("input").datepicker({
        regional: "ja",
        dateFormat: "yy.mm.dd",
        onClose: function(arg) {
            var inputValue = this.value;
            if (inputValue.trim()) {
                jQuery(this).addClass("has-value");
            } else {
                jQuery(this).removeClass("has-value");
            }
        }
    }).on("change", function() {
        from.datepicker("option", "maxDate", this.value);
    });
}

function buttonLikeboxInit() {
    AddAndRemoveActive(".btn-like-box");
}