!function(definition) {
    define("modal", [ "vendor" ], definition);
}(function(vendor) {
    "use strict";
    var $body = $("body");
    var callbackString = "webkitTransitionEnd transitionend oTransitionEnd";
    var Modal = Backbone.View.extend({
        closeButton: ".modal-close",
        modalInner: ".modal-inner",
        modalBackground: ".modal-bg",
        initialize: function(options) {
            this.options = $.extend(true, {
                onComplete: function() {}
            }, options || {});
        },
        render: function() {},
        destroy: function() {
            this._unbindObject();
            if (this.isTemplate) {
                $(this.el).remove();
            }
        },
        _bindObject: function() {
            this.onCloseButtonClick = _.bind(this._onCloseButtonClick, this);
            this.$el.find(this.closeButton).on("click", this.onCloseButtonClick);
            this.$el.find(this.modalBackground).on("click", this.onCloseButtonClick);
        },
        _unbindObject: function() {
            if (this.$el.find(this.closeButton).off) {
                this.$el.find(this.closeButton).off("click", this.onCloseButtonClick);
            }
            if (this.$el.find(this.modalBackground).off) {
                this.$el.find(this.modalBackground).off("click", this.onCloseButtonClick);
            }
        },
        open: function(elementOrSelector, json) {
            this.destroy();
            var $element = $(elementOrSelector);
            var isTemplate = this.isTemplate = $element.get(0).tagName.toLowerCase() == "script";
            $.requestAnimationFrame(_.bind(function() {
                if (isTemplate) {
                    var temp = _.template($element.html());
                    var html = temp(json ? json : "");
                    this.$el = $(html).appendTo($body);
                } else {
                    this.$el = $element;
                }
                this.el = this.$el.get(0);
                this.trigger(Modal.events.OPEN_START);
                this.$el.show();
                $.requestAnimationFrame(_.bind(function() {
                    this._bindObject();
                    this.$el.addClass("open");
                    this.$el.find(this.modalInner).addClass("open");
                    this.$el.one(callbackString, _.bind(function() {
                        this.trigger(Modal.events.OPEN_COMPLETE);
                        this.options.onComplete();
                    }, this));
                }, this));
            }, this));
        },
        close: function() {
            this.trigger(Modal.events.CLOSE_START);
            this.$el.removeClass("open").one(callbackString, _.bind(function() {
                this.trigger(Modal.events.CLOSE_COMPLETE);
                this.$el.hide();
                this.destroy();
            }, this));
            return false;
        },
        _onCloseButtonClick: function() {
            this.close();
            return false;
        }
    });
    if (!window.modal) {
        window.modal = new Modal();
    }
    Modal.getInstance = function() {
        return window.modal;
    };
    Modal.events = {
        OPEN_START: "OPEN_START",
        OPEN_COMPLETE: "OPEN_COMPLETE",
        CLOSE_START: "CLOSE_START",
        CLOSE_COMPLETE: "CLOSE_COMPLETE"
    };
    return Modal;
});

(function(definition) {
    define("responsive", [ "vendor" ], definition);
})(function() {
    "use strict";
    var $window = $(window);
    var Model = Backbone.Model.extend({
        orientationType: {
            LANDSCAPE: "landscape",
            PORTRAIT: "portrait"
        },
        screenType: {
            LARGE: "lg",
            MIDDLE: "md",
            SMALL: "sm"
        },
        setOrientation: function(value) {
            this.set("orientation", value);
        },
        getOrientation: function() {
            return this.get("orientation");
        },
        setScreen: function(value) {
            this.set("screen", value);
        },
        getScreen: function() {
            return this.get("screen");
        }
    });
    var Responsive = Backbone.View.extend({
        event: {
            RESIZE: "Responsive_RESIZE",
            CHANGE_ORIENTATION: "Responsive_CHANGE_ORIENTATION",
            CHANGE_SCREEN: "Responsive_CHANGE_SCREEN"
        },
        initialize: function(options) {
            options = options || {};
            this.resizeDelay = options.resizeDelay || 16;
            this.orientationDelay = options.orientationDelay || 500;
            this.minLgSize = options.minLgSize || 1031;
            this.maxSmSize = options.maxSmSize || 639;
            this.isOrientation = "onorientationchange" in window;
            this.model = new Model();
            this._setBindObject();
            this._setResizeEvent();
        },
        _setBindObject: function() {
            var self = this;
            this.model.on("change:screen", function() {
                $window.trigger(self.event.CHANGE_SCREEN);
                self.trigger(self.event.CHANGE_SCREEN);
            });
            this.model.on("change:orientation", function() {
                $window.trigger(self.event.CHANGE_ORIENTATION);
                self.trigger(self.event.CHANGE_ORIENTATION);
            });
        },
        _setResizeEvent: function() {
            var self = this;
            var $tgt = $("html");
            var onResizeDeb = _.debounce(onResize, this.resizeDelay);
            var onOrientationDeb = _.debounce(onResize, this.orientationDelay);
            var screenType = this.model.screenType;
            var orientationType = this.model.orientationType;
            var screenAllType = _.values(screenType).join(" ");
            var orientationAllType = _.values(orientationType).join(" ");
            init();
            function init() {
                if (self.isOrientation) {
                    $window.on("orientationchange", onOrientationDeb);
                }
                $window.resize(onResizeDeb);
                setScreen(getScreen($.getWindowWidth()));
                setOrientation(getOrientation());
            }
            function getScreen(width) {
                var type;
                if (width >= self.minLgSize) {
                    type = screenType.LARGE;
                } else if (width <= self.maxSmSize) {
                    type = screenType.SMALL;
                } else {
                    type = screenType.MIDDLE;
                }
                return type;
            }
            function setScreen(type) {
                self.screen = type;
                $tgt.removeClass(screenAllType);
                $tgt.addClass(type);
                self.model.setScreen(type);
            }
            function getOrientation() {
                var orientation = null;
                if (self.isOrientation) {
                    if (Math.abs(window.orientation) === 90) {
                        orientation = orientationType.LANDSCAPE;
                    } else {
                        orientation = orientationType.PORTRAIT;
                    }
                } else {
                    if ($window.height() < $.getWindowWidth()) {
                        orientation = orientationType.LANDSCAPE;
                    } else {
                        orientation = orientationType.PORTRAIT;
                    }
                }
                return orientation;
            }
            function setOrientation(type) {
                self.orientation = type;
                $tgt.removeClass(orientationAllType);
                $tgt.addClass(type);
                self.model.setOrientation(type);
            }
            function onResize() {
                var orientation = getOrientation();
                setOrientation(orientation);
                var type = getScreen($.getWindowWidth());
                setScreen(type);
                $window.trigger(self.event.RESIZE, [ {
                    orientation: orientation,
                    screen: type
                } ]);
                self.trigger(self.event.RESIZE, [ {
                    orientation: orientation,
                    screen: type
                } ]);
            }
        }
    });
    return Responsive;
});