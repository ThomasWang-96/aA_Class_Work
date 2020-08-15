const APIUtil = require('./api_util')

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

