class UsersController < ApplicationController
    def new

    end

    def create
        @user = User.new(user_params)

        if @user.save
            log_in_user!(@user) 
            flash[:success] = "successfully sign up, bitch"
            redirect_to user_url
        else
            flash.now[:error] = "unable to sign up, idiot"
            render :new            
        end

    end

    # route : music_app.com/users/(:id)

    def show
        @user = User.find_by(id:params[:id])
        render :show
    end


    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end

