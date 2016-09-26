$(function() {
    initPopMessage();
});

function initPopMessage() {
    var $pop = $(".pop");
    $(".btn-logout").on("click", function(e) {
        $pop.toggle();
    });
}