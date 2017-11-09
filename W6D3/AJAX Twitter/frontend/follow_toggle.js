const APIUtil = require ('./api_util');

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
