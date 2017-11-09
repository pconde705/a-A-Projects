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

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3);


$(() => {
  const followToggles = [];
  $(".follow-toggle").each((idx, domEl) => {
    followToggles.push(new FollowToggle(domEl));
  });

  const $usersSearch = $(".users-search");
  window.us = new UsersSearch($usersSearch[0]);

});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__ (2);

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userID = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();
    this.$el.click(this.handleClick.bind(this));
  }

  render(){
    if (this.followState === "unfollowed") {
      this.$el.text("Follow!");
    } else if (this.followState === "followed") {
      this.$el.text("Unfollow!");
    }
  }

  handleClick(eve){
    eve.preventDefault();
    const userId = this.userID;
    // debugger;
    this.$el.prop("disabled", true);
    if (this.followState === 'unfollowed') {
      APIUtil.followUser(userId)
        .then(
          response => {
            console.log(response);
          this.followState = 'followed',
          this.render();
          this.$el.prop("disabled", false);
        });
    } else {
      APIUtil.unfollowUser(userId)
        .then(
          response => {
            console.log(response);
          this.followState = 'unfollowed',
          this.render();
          this.$el.prop("disabled", false);
        });
    }
  }

}

module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      type: 'POST',
      dataType: 'JSON',
      url: `/users/${id}/follow`
      // success: response => {
      //   console.log(response);
      //   this.followState = 'followed',
      //   this.render();
      // }
    });
  },

  unfollowUser: id => {
    return $.ajax({
      type: 'DELETE',
      dataType: 'JSON',
      url: `/users/${id}/follow`
      // success: response => {
      //   console.log(response);
      //   this.followState = 'unfollowed',
      //   this.render();
      // }
    });
  },

  searchUsers: (queryVal) => {
    return $.ajax({
      type: 'GET',
      url: '/users/search',
      dataType: 'JSON',
      data: { query: queryVal }
    });
  }



};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);
const FollowToggle = __webpack_require__(1);

class UsersSearch {

  constructor(el) {
    this.$el = $(el);
    this.$input = $('#user-search-input');
    this.$ul = $('.users');
    this.$input.on("input", (e) => {
      let newText = $(e.currentTarget).val();
      this.handleInput(newText);
    });
  }

  // render(){}

  handleInput(inputString) {
    APIUtil.searchUsers(inputString)
      .then((response) => {
        console.log(response);
        this.buildUsersList(response);
        });
  }

  buildUsersList(resArr){
    this.$ul.html("");
    for (var i = 0; i < resArr.length; i++) {
      let item = resArr[i];
      let $newLink =
        $(`<li><a href="/users/${item.id}">${item.username}</a></li>`);
      let $newButton = $("<button/>");
      $newButton.addClass("follow-toggle");
      $newButton.attr("data-user-id", item.id);
      $newButton.attr("data-initial-follow-state",
        item.followed ? 'followed' : 'unfollowed'
      );
      $newButton.text(item.followed ? 'Unfollow!' : 'Follow!');


      this.$ul.append($newLink);
      $newLink.append($newButton);
      console.log($newButton);

      new FollowToggle($newButton[0]);

    }
  }


}

module.exports = UsersSearch;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map