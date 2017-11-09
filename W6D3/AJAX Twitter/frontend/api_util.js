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
