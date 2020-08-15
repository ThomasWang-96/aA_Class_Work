const FollowToggle = require("./follow_toggle");
const UsersSearch = require('./user_search')

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