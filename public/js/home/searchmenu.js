jQuery(document).ready(function() {
    SpDatepickerInit();
    select2Init(".held-area", "開催場所");
    select2Init(".entry-fee-type", "参加費");
    select2Init(".qualifying-age", "対象年齡");
    buttonToggle();
    buttonCheckbox();
});

function SpDatepickerInit() {
    var from = $("#sp-held-started-on").find("input").datepicker({
        regional: "ja",
        dateFormat: "yy.mm.dd",
        onClose: function(arg) {
            var inputValue = this.value;
            if (inputValue.indexOf("~") == -1) {
                if (inputValue.trim()) {
                    jQuery(this).addClass("has-value");
                    this.value = "開始日 : " + this.value + " ~";
                } else {
                    jQuery(this).removeClass("has-value");
                }
                jQuery("." + this.id).val(inputValue);
                var ToValue = to[0].value;
                to.datepicker("option", "minDate", inputValue);
                to[0].value = ToValue;
            }
        }
    }), to = $("#sp-held-ended-on").find("input").datepicker({
        regional: "ja",
        dateFormat: "yy.mm.dd",
        onClose: function(arg) {
            var inputValue = this.value;
            if (inputValue.indexOf("~") == -1) {
                if (inputValue.trim()) {
                    jQuery(this).addClass("has-value");
                    this.value = "終了日 : ~ " + this.value;
                } else {
                    jQuery(this).removeClass("has-value");
                }
                jQuery("." + this.id).val(inputValue);
                var FromValue = from[0].value;
                from.datepicker("option", "maxDate", inputValue);
                from[0].value = FromValue;
            }
        }
    });
}

function select2Init(className, placeholder) {
    jQuery(className).find("select").select2({
        placeholder: placeholder,
        minimumResultsForSearch: Infinity
    });
}

function buttonToggle() {
    AddAndRemoveActive(".btn-toggle");
    jQuery(".btn-toggle").on("click", function(e) {
        boxId = jQuery(this).attr("data-toggle");
        console.log(boxId);
        jQuery("#" + boxId).toggle();
        e.stopPropagation();
        e.preventDefault();
    });
}

function AddAndRemoveActive(btn) {
    jQuery(btn).on("click", function(e) {
        hasActive = jQuery(this).hasClass("active");
        if (hasActive) {
            jQuery(this).removeClass("active");
        } else {
            jQuery(this).addClass("active");
        }
        e.stopPropagation();
        e.preventDefault();
    });
}

function buttonCheckbox() {
    jQuery(".btn-checkbox").on("click", function(evt) {
        hasActive = jQuery(this).hasClass("active");
        if (hasActive) {
            jQuery(this).find("input").prop("checked", false);
            jQuery(this).removeClass("active");
        } else {
            jQuery(this).find("input").prop("checked", true);
            jQuery(this).addClass("active");
        }
        evt.stopPropagation();
        evt.preventDefault();
    });
}