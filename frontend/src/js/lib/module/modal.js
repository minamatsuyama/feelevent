/**
 * Created by 2015mac08 on 11/26/15.
 */

!function(definition){
  define('modal', ['vendor'], definition);
}(function(vendor){
  'use strict';

  var $body = $('body');
  var callbackString = 'webkitTransitionEnd transitionend oTransitionEnd';


  var Modal = Backbone.View.extend({

    closeButton :     ".modal-close",
    modalInner :      ".modal-inner",
    modalBackground:  ".modal-bg",

    initialize:function(options){
      this.options = $.extend(true, {
        'onComplete': function() {}
      }, options || {});
    },
    render:function(){
    },
    destroy:function(){
      this._unbindObject();
      //this.unbindUIElements();
      if(this.isTemplate){
        $(this.el).remove();
      }
    },
    _bindObject:function(){
      this.onCloseButtonClick = _.bind(this._onCloseButtonClick, this);
      this.$el.find(this.closeButton).on('click', this.onCloseButtonClick);
      this.$el.find(this.modalBackground).on('click', this.onCloseButtonClick);
    },
    _unbindObject:function(){
      if(this.$el.find(this.closeButton).off){
        this.$el.find(this.closeButton).off('click', this.onCloseButtonClick);
      }
      if(this.$el.find(this.modalBackground).off){
        this.$el.find(this.modalBackground).off('click', this.onCloseButtonClick);
      }
    },
    open:function(elementOrSelector, json){
      this.destroy();
      var $element = $(elementOrSelector);
      var isTemplate = this.isTemplate = ($element.get(0).tagName.toLowerCase() == 'script');
      //FIXED: wait rendering;
      //$.requestAnimationFrame : from vendor_setting.js;
      $.requestAnimationFrame(_.bind(function(){
        if(isTemplate){
          var temp = _.template($element.html());
          var html = temp( (json ? json : '') );
          this.$el = $(html).appendTo($body);
        }else{
          this.$el = $element;
        }
        this.el = this.$el.get(0);

        this.trigger(Modal.events.OPEN_START);
        this.$el.show();

        $.requestAnimationFrame(_.bind(function(){
          //this.bindUIElements();
          this._bindObject();
          this.$el.addClass('open');
          this.$el.find(this.modalInner).addClass('open');

          this.$el.one(callbackString, _.bind(function(){
            this.trigger(Modal.events.OPEN_COMPLETE);
            this.options.onComplete();
          }, this));
        }, this));
      }, this));
    },
    close:function(){
      //get transition end
      this.trigger(Modal.events.CLOSE_START);
      this.$el.removeClass('open').one(callbackString, _.bind(function(){
        this.trigger(Modal.events.CLOSE_COMPLETE);
        this.$el.hide();
        this.destroy();
      }, this));
      //this.ui.modalInner.removeClass('open');
      return false;
    },
    _onCloseButtonClick:function(){
      this.close();
      return false;
    }
  });

  if(!window.modal){
    window.modal = new Modal();
  }

  Modal.getInstance = function(){
    return window.modal;
  };

  Modal.events = {
    OPEN_START:'OPEN_START',
    OPEN_COMPLETE:'OPEN_COMPLETE',
    CLOSE_START:'CLOSE_START',
    CLOSE_COMPLETE:'CLOSE_COMPLETE'
  };

  return Modal;
});
