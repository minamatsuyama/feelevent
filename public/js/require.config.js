if (!require) {
    var require = {};
}

require.waitSeconds = 3;

require.baseUrl = "/js/";

if (!require.paths) {
    require.paths = {};
}

require.paths.vendor = "lib/vendor";

require.paths.jquery = "lib/vendor";

require.paths.underscore = "lib/vendor";

require.paths.backbone = "lib/vendor";

require.paths.backbone_uiview = "lib/module";

require.paths.modal = "lib/module";

require.paths.responsive = "lib/module";

if (!require.shim) {
    require.shim = {};
}