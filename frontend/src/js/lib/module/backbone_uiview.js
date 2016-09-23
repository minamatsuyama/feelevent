(function(definition){
  define('backbone_uiview' ,['vendor'], definition);
})(function(){
  'use strict';

  //var _ensureElement = Backbone.View.prototype._ensureElement;
  var UIView = Backbone.View.extend({
    /*
    _ensureElement : function () {
      console.log('_ensureElement');
      _ensureElement.call(this);
      this._bindUIElements();
    },
    */
    bindUIElements:function(){
      if(!this.ui){
        return;
      }
      if(!this._uiBindings){
        this._uiBindings = this.ui;
      }
      var bindings = _.result(this, '_uiBindings');
      this.ui = {};
      _.each(bindings, function(selector, key){
        this.ui[key] = this.$el.find(selector);
      }, this);
    },
    unbindUIElements:function(){
      if(!this.ui || !this._uiBindings){
        return;
      }
      _.each(this.ui, function($el, name){
        delete this.ui[name];
      }, this);
      this.ui = this._uiBindings;
      delete this._uiBindings;
    }
  });
  Backbone.UIView = UIView;

  return UIView;
});
