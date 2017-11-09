const APIUtil = require("./api_util");
const FollowToggle = require("./follow_toggle");

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
