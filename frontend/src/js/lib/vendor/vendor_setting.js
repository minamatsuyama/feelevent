(function(){
  'use strict';
  //setting delimiter of underscore.js
  _.templateSettings = {
    interpolate: /\{%=(.+?)%\}/g,
    escape:      /\{%-(.+?)%\}/g,
    evaluate:    /\{%(.+?)%\}/g
  };

  //RequestAnimationFrame
  var req = window.requestAnimationFrame || window.mozRequestAnimationFrame ||
    window.webkitRequestAnimationFrame || window.msRequestAnimationFrame || function(c){ setTimeout(c, 50); };

  $.requestAnimationFrame = function(callback){
    req(callback);
  };
})();

define('vendor',
  [
    'jquery',
    'underscore',
    'backbone',
    'velocity',
    'select2',
    'flipsnap',
    'scrollreveal'
  ],
  function(
    $,
    _,
    backbone,
    velocity,
    select2,
    flipsnap,
    ScrollReveal
  ){
    //結合したファイル内でrequireで読むとうまくglobalに作られないので作る
    // window.moment = moment;

    // d3.layout.cloud = d3_layout;

    // scrollreveal
    window.sr = ScrollReveal({
      easing: 'ease-in-out'
    });

    // select2
    $.fn.select2.defaults.set('width', '');

    $.getWindowWidth = function(){
      return window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
    };

    $.support.cors = true;

    $.VIEW_WIDTH_MIN_LARGE = 1062;//lgの見え方になる横幅
    $.VIEW_WIDTH_MAX_SMALL = 767;//smの見え方になる横幅
    $.VIEW_WIDTH_MAX_XSMALL = 400;
    $.RESPONSIVE_RESIZE_DELAY = 200;//リサイズ時のイベント発行までのディレイ(ms)
    $.RESPONSIVE_ORIENTATION_DELAY = 500;//リサイズ時のイベント発行までのディレイ(ms)

    //クエリストリングの取得
    $.getQueryString = function() {
      if (1 < document.location.search.length) {
        var query = document.location.search.substring(1);
        var parameters = query.split('&');
        var result = {};
        var element = null;
        var paramName = null;
        var paramValue = null;
        _.each(parameters, function(elements){
          element = elements.split('=');
          paramName = decodeURIComponent(element[0]);
          paramValue = decodeURIComponent(element[1]);
          result[paramName] = decodeURIComponent(paramValue);
        });
        return result;
      }
      return null;
    };

    var ImgPreload = function(url, callback){
      if(!url){
        if(callback) {
          callback();
        }
        return;
      }
      var img = new Image();
      $(img).one('load error', function(e){
        if(callback) {
          callback(e);
        }
      });
      img.src = url;
    };

    var ImageLoader = function(){
      this.init.apply(this, arguments);
    };
    ImageLoader.prototype.init = function(selector, callback){
      var count = 0;
      var $imgs = $(selector).find('img');
      var length = $imgs.length;
      var url;

      $imgs.each(function(i, img){
        url = $(img).attr('src');
        new ImgPreload(url, onComplete);
      });

      if(length <= 0){
        doCallback();
      }

      function onComplete(e){
        count++;
        if(count >= length){
          doCallback();
        }
      }

      function doCallback(){
        // FIXME: active after browser sleep
        if(window.requestAnimationFrame === undefined) {
          window.setTimeout(callback, 1000 / 60);
        } else {
          requestAnimationFrame(function(){
            callback();
          });
        }
      }
    };

    $.fn.loadImage = function(callback){
      //var defaults = {text:'hello'};
      //var option = $.extend(defaults, option);

      new ImageLoader(this, function(){
        if(callback){
          callback();
        }
      });

      return this;
    };

    return {};
});
