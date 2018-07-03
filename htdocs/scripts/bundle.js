/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _anchor = __webpack_require__(1);

var _anchor2 = _interopRequireDefault(_anchor);

var _modal = __webpack_require__(2);

var _modal2 = _interopRequireDefault(_modal);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var newClass;

// import Menu from 'view/menu'
// import Tab from 'view/tab'
// import Slider from 'view/slider'
// import LoopSlider from 'view/loop-slider'
// import FixedGo2Top from 'view/fixed-go2top'
// import Validate from 'view/validate'
// import FixedSubmit from 'view/fixed-submit'

// multiple new class
newClass = function newClass(className, elm, opts) {
  var elmArr;
  elmArr = document.querySelectorAll(elm);
  return Array.from(elmArr, function (_elm) {
    if (opts) {
      return new className(_elm, opts);
    } else {
      return new className(_elm);
    }
  });
};

window.addEventListener('DOMContentLoaded', function () {
  var newClassArray;
  newClassArray = [[_anchor2.default, 'a[href^="#"]']];
  // [ Tab, '.js-tab']
  // [ Slider, '.js-slider' ]
  // [ LoopSlider, '.js-loop-slider']
  // [ FixedGo2Top, '.js-fixed-go2top' ]
  // [ Validate, '.js-validate' ]
  // [ FixedSubmit, '.js-search-submit']
  newClassArray.forEach(function (arr) {
    return newClass.apply(this, arr);
  });
  return new _modal2.default();
});

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Anchor, deepAssign;

var _VENDORS = VENDORS;
deepAssign = _VENDORS.deepAssign;


Anchor = function () {
  var defOpts;

  var Anchor = function () {
    function Anchor(elm1) {
      var opts = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};

      _classCallCheck(this, Anchor);

      this.onClicked = this.onClicked.bind(this);
      this.elm = elm1;

      var _deepAssign = deepAssign({}, defOpts, opts);

      this.duration = _deepAssign.duration;
      this.easing = _deepAssign.easing;
      this.offset = _deepAssign.offset;

      this.elm.addEventListener('click', this.onClicked);
    }

    _createClass(Anchor, [{
      key: 'onClicked',
      value: function onClicked(event) {
        var _elm, elm, href, nowHash, nowHref, targetHash, targetLink;
        elm = this.elm;

        href = elm.getAttribute('href');
        targetLink = elm.href;
        targetHash = elm.dataset.hash;
        nowHash = location.hash;
        nowHref = location.href.replace(nowHash, '');
        if (href.indexOf('#') !== 0) {
          if (targetLink === nowHref) {
            href = targetHash;
          } else {
            $elm.href = targetLink + targetHash;
            return true;
          }
        }
        if (href.length === 0) {
          return;
        }
        event.preventDefault();
        _elm = href === '#' ? 'html' : href;
        return this.scroll(_elm);
      }
    }, {
      key: 'scroll',
      value: function scroll(_elm) {
        _elm = document.querySelector(_elm);
        if (!_elm) {
          return true;
        }
        Velocity(_elm, 'stop');
        return Velocity(_elm, 'scroll', {
          duration: this.duration,
          easing: this.easing,
          offset: this.offset
        });
      }
    }]);

    return Anchor;
  }();

  ;

  defOpts = {
    duration: 600,
    easing: 'easeOutQuad',
    offset: 0
  };

  return Anchor;
}();

exports.default = Anchor;

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Modal, deepAssign;

var _VENDORS = VENDORS;
deepAssign = _VENDORS.deepAssign;


Modal = function () {
  var defOpts;

  var Modal = function () {
    function Modal(elm1) {
      var _this = this;

      var opts = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};

      _classCallCheck(this, Modal);

      this.onClicked = this.onClicked.bind(this);
      this.elm = elm1;

      var _deepAssign = deepAssign({}, defOpts, opts);

      this.duration = _deepAssign.duration;
      this.easing = _deepAssign.easing;
      this.offset = _deepAssign.offset;

      this.button = document.querySelectorAll('.js-modal-button');
      Array.from(this.button, function (_button) {
        return _button.addEventListener('click', _this.openClick);
      });
    }

    _createClass(Modal, [{
      key: 'openClick',
      value: function openClick() {
        return console.log('open');
      }
    }, {
      key: 'onClicked',
      value: function onClicked(event) {
        var _elm, elm, href, nowHash, nowHref, targetHash, targetLink;
        elm = this.elm;

        href = elm.getAttribute('href');
        targetLink = elm.href;
        targetHash = elm.dataset.hash;
        nowHash = location.hash;
        nowHref = location.href.replace(nowHash, '');
        if (href.indexOf('#') !== 0) {
          if (targetLink === nowHref) {
            href = targetHash;
          } else {
            $elm.href = targetLink + targetHash;
            return true;
          }
        }
        if (href.length === 0) {
          return;
        }
        event.preventDefault();
        _elm = href === '#' ? 'html' : href;
        return this.scroll(_elm);
      }
    }, {
      key: 'scroll',
      value: function scroll(_elm) {
        _elm = document.querySelector(_elm);
        Velocity(_elm, 'stop');
        return Velocity(_elm, 'scroll', {
          duration: this.duration,
          easing: this.easing,
          offset: this.offset
        });
      }
    }]);

    return Modal;
  }();

  ;

  defOpts = {
    duration: 600,
    easing: 'easeOutQuad',
    offset: 0
  };

  return Modal;
}();

exports.default = Modal;

/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map