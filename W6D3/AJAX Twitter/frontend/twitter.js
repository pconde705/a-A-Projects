const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');


$(() => {
  const followToggles = [];
  $(".follow-toggle").each((idx, domEl) => {
    followToggles.push(new FollowToggle(domEl));
  });

  const $usersSearch = $(".users-search");
  window.us = new UsersSearch($usersSearch[0]);

});
