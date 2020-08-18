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
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
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
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(nodesArr) {\n    this.nodesArr = nodesArr;\n  }\n\n  html(str) {\n    for (let i = 0; i < this.nodesArr.length; i++) {\n      let node = this.nodesArr[i];\n      if (str) {\n        node.innerHTML = str;\n      } else {\n        return node.innerHTML;\n      }\n    }\n  }\n\n  empty() {\n    this.nodesArr.forEach((node) => {\n      node.innerHTML = \"\";\n    });\n  }\n\n  append(args) {\n    this.nodesArr.forEach((node) => {\n      if (args instanceof DOMNodeCollection) {\n        args.nodesArr.forEach((arg) => {\n          node.append(arg.outerHTML);\n        });\n      } else {\n        node.append(args);\n      }\n    });\n  }\n\n  attr(key, val) {\n    for (let i = 0; i < this.nodesArr.length; i++) {\n      let node = this.nodesArr[i];\n      if (val) {\n        node.setAttribute(key, val);\n      } else {\n        return node.getAttribute(key);\n      }\n    }\n  }\n\n  addClass(str) {\n    for (let i = 0; i < this.nodesArr.length; i++) {\n      let node = this.nodesArr[i];\n      node.className = str;\n    }\n  }\n\n  removeClass() {\n    for (let i = 0; i < this.nodesArr.length; i++) {\n      let node = this.nodesArr[i];\n      node.className = \"\";\n    }\n  }\n\n  children() {\n    const arr = [];\n    let res;\n    for (let i = 0; i < this.nodesArr.length; i++) {\n      let node = this.nodesArr[i];\n      let children = node.children;\n      res = arr.concat(Array.from(children));\n    }\n    return new DOMNodeCollection(res);\n  }\n\n  parent() {\n    const arr = [];\n    for (let i = 0; i < this.nodesArr.length; i++) {\n      let node = this.nodesArr[i];\n      let parent = node.parentElement;\n      arr.push(parent);\n    }\n    return new DOMNodeCollection(arr);\n  }\n\n  find(str) {\n    let res = [];\n    this.nodesArr.forEach((node) => {\n      let selected = node.querySelectorAll(str);\n      let arr = Array.from(selected);\n      res = res.concat(arr);\n    });\n\n    return new DOMNodeCollection(res);\n  }\n\n  remove() {\n    this.nodesArr.forEach((node) => {\n      node.remove();\n    });\n  }\n\n  on(type, listener, options) {\n    this.nodesArr.forEach((node) => {\n    node.setAttribute('eventListener', listener);   \n    node.addEventListener(type, listener, options);\n    });\n  }\n\n  off(type, options) {\n    this.nodesArr.forEach((node) => {\n      node.removeEventListener(type, node.getAttribute('eventListener'), options);\n    });\n  }\n}\n\n\n\nmodule.exports = DOMNodeCollection\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\")\n\nwindow.$l = arg => {\n    const myStatus = document.readyState === \"complete\" || (document.readyState !== \"loading\" && !document.documentElement.doScroll)\n    let res = [];\n    const myQue = [];\n\n    if (typeof arg === 'function') {\n        myQue.push(arg)\n    }\n\n    else { \n        if (typeof arg === 'string') {\n            const nodes = document.querySelectorAll(arg)\n            res = Array.from(nodes)\n        } \n        else if (arg instanceof HTMLElement) {\n            res.push(arg)\n        }\n        const final = new DOMNodeCollection(res)\n        return final\n    }\n\n\n    for(let i = 0; i < myQue.length; i ++) {\n        const callback  = myQue[i];\n        if (myStatus) {\n            callback();\n            myQue.shift();\n        } else {\n            document.addEventListener(\"DOMContentLoaded\", callback);\n        }\n    }\n\n  \n\n}\n$l = {\n    extend: function (base, ...otherObjs) {\n        Object.assign(base, ...otherObjs)\n        return base\n    }\n}\n// $l.extend = (base, ...otherObjs) => {\n//     Object.assign(base,...otherObjs)\n// }\n\n$l.ajax = (options) => {\n    const xhr = new XMLHttpRequest();\n    const defaults = {\n        success: () => {},\n        error:() => {},\n        url:'',\n        method:'get',\n        data: {},\n        contentType: 'application/x-www-form-urlencoded; charset=UTF-8'\n    }\n\n    options = $l.extend(defaults, options)\n\n    if (options.method === \"GET\") {\n        // data is query string for get\n        options.url += `?${toQueryString(options.data)}`;\n    }\n\n    xhr.open(options.method, options.url);\n\n    xhr.onload = () => {\n        if(xhr.status === 200){\n            options.success(xhr.response)\n        }\n        else {\n            options.error(xhr.response)\n        }\n    }\n    xhr.send(JSON.stringify(options.data))\n}   \n\ntoQueryString = (obj) => {\n    let result = \"\";\n    for (const prop in obj) {\n        if (Object.prototype.hasOwnProperty.call(obj, prop)) {\n            result += `${prop}=${obj[prop]}&`;\n        }\n    }\n    return result.substring(0, result.length - 1);\n};\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });