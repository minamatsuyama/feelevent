if(!require){
  var require = {};
}
//待機時間
require.waitSeconds = 3;
//baseUrl設定
require.baseUrl = '/js/';
//モジュールの名前とパスの設定
if(!require.paths){
  require.paths = {};
}
//vendor
require.paths.vendor = 'lib/vendor';
require.paths.jquery = 'lib/vendor';
require.paths.underscore = 'lib/vendor';
require.paths.backbone = 'lib/vendor';
//module
require.paths.backbone_uiview = 'lib/module';
require.paths.modal = 'lib/module';
require.paths.responsive = 'lib/module';
//model

//モジュールの依存関係の設定
if(!require.shim){
  require.shim = {};
}

//言語設定
// var LANGUAGE = 'ja';//en etc...
