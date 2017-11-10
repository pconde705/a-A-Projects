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

const DOMNodeCollection = __webpack_require__(1);

const $l = function(argument) {
  let arrayFunctions = [];
  if (argument instanceof HTMLElement) {
    return new DOMNodeCollection([argument]);
  } else if (argument instanceof Function) {
    if (document.readyState !== "complete") {
      arrayFunctions.push(argument);
    } else {
      arrayFunctions.forEach((el) => {
        el();
      });
    }
  } else {
    let selected = document.querySelectorAll(argument);
    return new DOMNodeCollection(Array.from(selected));
  }

}

$l.extend = function (...args) {
  return Object.assign(...args)
};

$l.ajax = function (optionsObject) {
  let defaults = {
    type: 'GET',
    dataType: 'JSON',
    url: "",
    data: {},
    success: response => {
      console.log(response);
    },
    error: err => {
      console.log(err);
    }
  };
  
    this.extend(defaults, optionsObject);
    
    const xhr = new XMLHttpRequest();
    
    xhr.open(defaults.type, defaults.url);
    
    xhr.onload = function () {
      // if (xhr.status === 200) {
      //   defaults.success(xhr.response);
      // } else {
      //   defaults.error(xhr.response);
      // }
      console.log(xhr.status);
      console.log(xhr.responseType);
      defaults.success(xhr.response);
    }
    
    const optionalData = defaults.data;
    xhr.send(JSON.stringify(optionalData));
  
};



window.$l = $l;


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(HTMLarray) {
    this.HTMLarray = HTMLarray;
  }
}

DOMNodeCollection.prototype.html = function (string = "") {
  if (string) {
    this.HTMLarray.forEach((el) => {
      el.innerHTML = string;
    });
  } else {
    return this.HTMLarray[0];
  }
};

DOMNodeCollection.prototype.empty = function () {
  this.HTMLarray.forEach( (el) => {
    el.innerHTML = "";
  });
};

DOMNodeCollection.prototype.append = function (argument) {
  // debugger
  if (typeof argument === "string") {
    this.HTMLarray.forEach( (el) => {
      el.innerHTML += argument;
    });
  } else if (argument instanceof DOMNodeCollection) {
    argument.HTMLarray.forEach( (el) => {
      this.HTMLarray.forEach((innerEl) => {
        innerEl.append(el.cloneNode(true));
      });
    });
  } else {
    this.HTMLarray.forEach( (el) => {
      el.append(argument.cloneNode(true));
    });
  }
};

DOMNodeCollection.prototype.children = function () {
  let arr = [];
  this.HTMLarray.forEach( (el) => {
    arr = arr.concat(Array.from(el.children));
  });
  return new DOMNodeCollection(arr);
};

DOMNodeCollection.prototype.parent = function () {
  let arr = [];
  this.HTMLarray.forEach( (el) => {
    arr.push(el.parentElement)
  });
  return new DOMNodeCollection(arr);
};

DOMNodeCollection.prototype.find = function (argument) {
  let found = [];
  this.HTMLarray.forEach((el) => {
    found = found.concat(Array.from(el.querySelectorAll(argument)));
  });
  return new DOMNodeCollection(found);
};

DOMNodeCollection.prototype.remove = function () {
  this.empty();
  this.HTMLarray = [];
};

DOMNodeCollection.prototype.on = function (type, callback) {
  this.HTMLarray.forEach( (el) => {
    el.addEventListener(type, callback);
    el[callback] = callback;
  });
};

DOMNodeCollection.prototype.off = function (type) {
  this.HTMLarray.forEach( (el) => {
    el.removeEventListener(type, el[callback]);
  });
};















module.exports = DOMNodeCollection;














//

/***/ })
/******/ ]);
//# sourceMappingURL=jquery_lite.js.map