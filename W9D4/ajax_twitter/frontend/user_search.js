const APIUtil = require('./api_util');
const FollowToggle = require('./follow_toggle');

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