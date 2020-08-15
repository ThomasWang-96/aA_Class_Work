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
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

const APIUtil = {
    
    followUser: id => {
        return $.ajax({
            url: `/users/${id}/follow`,
            method: 'post',
            dataType:'json'
        })
    },

    unfollowUser: id => {
        return $.ajax({
            url: `/users/${id}/follow`,
            method: 'delete',
            dataType: 'json'
        })
    },

    searchUsers: queryVal => {
        return $.ajax({
            url: `/users/search`,
            method: 'get',
            dataType: 'json',
            data: { query: queryVal }
        })
    }

}

module.exports = APIUtil;



/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js")

class FollowToggle {
    constructor($el, options){
        this.userId = $el.data("userId") || options.userId;
        this.followState = $el.data("initialFollowState") || options.followState;
        this.$el = $el;
        this.render();
        this.$el.on('click', this.handleClick.bind(this));
    }

    render() {
        switch(this.followState) {
            case 'unfollowed': 
                this.$el.prop('disabled', false);
                this.$el.text("Follow!");
                break
            case 'followed':
                this.$el.prop('disabled', false);
                this.$el.text('Unfollow!')
                break
            case 'following':
                this.$el.prop('disabled', true);
                this.$el.text('following')
                break
            case 'unfollowing':
                this.$el.prop('disabled', true);
                this.$el.text('unfollowing')
                break
        };
    }
    

    handleClick(e) {
        const followToggle = this;

        e.preventDefault();
        if (this.followState === 'unfollowed') {
            this.followState = 'following';
            this.render();
            APIUtil.followUser(this.userId)
            .then(()=> {
                followToggle.followState = 'followed'
                followToggle.render()
            })
 
        } else if (this.followState === 'followed') {
            this.followState = 'unfollowing';
            this.render();
            APIUtil.unfollowUser(this.userId)
            .then(()=> {
                followToggle.followState = 'unfollowed'
                followToggle.render()
            })
            
        }
        
    }


    
    
}

module.exports= FollowToggle;



/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./user_search */ "./frontend/user_search.js")

$(() => {
    const toggleBtns = $(".follow-toggle")
    toggleBtns.each(function() {
        let button = new FollowToggle($(this));
    });


    const usersSearch = $(".users-search")
    usersSearch.each(function() {
        let search = new UsersSearch($(this));
    });
})

/***/ }),

/***/ "./frontend/user_search.js":
/*!*********************************!*\
  !*** ./frontend/user_search.js ***!
  \*********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

class UsersSearch {
    constructor($el){
        this.$el = $el;
        this.$ul = this.$el.find('.users');
        this.$input = this.$el.find('input[name=username]')
        this.$el.on('input', this.handleInput.bind(this))
    }

    
    handleInput(e) {
        e.preventDefault()
        APIUtil.searchUsers(this.$input.val())
            .then(users => this.renderResult(users))    
    }

    renderResult(users){
        this.$ul.empty();
        
        for (let index = 0; index < users.length; index++) {
            const user = users[index];

            let $a = $('<a></a>');
            $a.text(`@${user.username}`);
            $a.attr('href', `/users/${user.id}`);

            const $toggleBtn = $('<button></button>');
            
            new FollowToggle($toggleBtn, {
                userId: user.id,
                followState: user.followed ? 'followed' : 'unfollowed'
            });

            const $li = $('<li></li>');
            $li.append($a);
            $li.append($toggleBtn)
            this.$ul.append($li);
        }
            
    }

}

module.exports = UsersSearch;

/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map