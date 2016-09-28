require([ "vendor", "modal" ], function(vendor, Modal) {
    $(function() {
        var modal = Modal.getInstance();
        $(".modal-btn").on("click", function() {
            var $this = $(this);
            var tempName = $this.data("templateId");
            var json = $this.data("json");
            modal.open("#" + tempName, json);
            return false;
        });
    });
});