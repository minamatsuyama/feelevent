(function(definition){
  define('responsive', ['vendor'],definition);
})(function(){
  'use strict';
  /**
   * リサイズや端末の回転を検出し、ビューの状態を決定し、イベントを発行する
   * @constructor
   */

  var $window = $(window);

  var Model = Backbone.Model.extend({
    orientationType:{
      LANDSCAPE : 'landscape',
      PORTRAIT : 'portrait'
    },
    screenType:{
      LARGE:'lg',
      MIDDLE:'md',
      SMALL:'sm'
    },
    setOrientation:function(value){
      this.set('orientation', value);
    },
    getOrientation:function(){
      return this.get('orientation');
    },
    setScreen:function(value){
      this.set('screen', value);
    },
    getScreen:function(){
      return this.get('screen');
    }
  });

  var Responsive = Backbone.View.extend({
    event:{
      RESIZE:'Responsive_RESIZE',
      CHANGE_ORIENTATION:'Responsive_CHANGE_ORIENTATION',
      CHANGE_SCREEN:'Responsive_CHANGE_SCREEN'
    },
    initialize:function(options){
      options = options || {};
      this.resizeDelay = options.resizeDelay || 16;
      this.orientationDelay = options.orientationDelay || 500;
      this.minLgSize = options.minLgSize || 1031;
      this.maxSmSize = options.maxSmSize || 639;
      this.isOrientation = ('onorientationchange' in window);

      this.model = new Model();

      this._setBindObject();
      this._setResizeEvent();
    },
    _setBindObject:function(){
      var self = this;
      this.model.on('change:screen', function(){
        $window.trigger(self.event.CHANGE_SCREEN);
        self.trigger(self.event.CHANGE_SCREEN);
      });

      this.model.on('change:orientation', function(){
        $window.trigger(self.event.CHANGE_ORIENTATION);
        self.trigger(self.event.CHANGE_ORIENTATION);
      });
    },
    _setResizeEvent : function(){
      var self = this;
      var $tgt = $('html');
      var onResizeDeb = _.debounce(onResize, this.resizeDelay);
      var onOrientationDeb = _.debounce(onResize, this.orientationDelay);
      var screenType = this.model.screenType;
      var orientationType = this.model.orientationType;
      var screenAllType = _.values(screenType).join(' ');
      var orientationAllType = _.values(orientationType).join(' ');

      init();

      function init(){
        //モバイル
        if(self.isOrientation){
          $window.on('orientationchange' ,onOrientationDeb);
        }

        $window.resize(onResizeDeb);

        setScreen(getScreen($.getWindowWidth()));
        setOrientation(getOrientation());
      }

      function getScreen(width){
        var type;
        if(width >= self.minLgSize){
          type = screenType.LARGE;
        }else if(width <= self.maxSmSize){
          type = screenType.SMALL;
        }else{
          type = screenType.MIDDLE;
        }
        return type;
      }

      function setScreen(type){
        self.screen = type;
        $tgt.removeClass(screenAllType);
        $tgt.addClass(type);
        self.model.setScreen(type);
      }

      function getOrientation(){
        var orientation = null;
        if(self.isOrientation){
          if(Math.abs(window.orientation) === 90){
            //横向き
            orientation = orientationType.LANDSCAPE;
          }else{
            //縦向き
            orientation = orientationType.PORTRAIT;
          }
        }else{
          if($window.height() < $.getWindowWidth()){
            //横向き
            orientation = orientationType.LANDSCAPE;
          }else{
            //縦向き
            orientation = orientationType.PORTRAIT;
          }
        }
        return orientation;
      }

      function setOrientation(type){
        self.orientation = type;
        $tgt.removeClass(orientationAllType);
        $tgt.addClass(type);
        self.model.setOrientation(type);
      }

      function onResize(){
        var orientation = getOrientation();
        setOrientation(orientation);
        var type = getScreen($.getWindowWidth());
        setScreen(type);

        $window.trigger(self.event.RESIZE, [{orientation:orientation, screen:type}]);
        self.trigger(self.event.RESIZE, [{orientation:orientation, screen:type}]);
      }
    }
  });

  return Responsive;
});
