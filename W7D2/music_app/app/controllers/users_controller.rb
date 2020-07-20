class UsersController < ApplicationController
    def new
        @user = User.new # dummy user object
        render :new
    end

    def create
       @user = User.new(user_params)
        if @user.save
            log_in_user!(@user) 
            flash[:success] = "successfully sign up, bitch"
            redirect_to user_url(@user)
        else
            flash.now[:error] = "unable to sign up, idiot"
            render :new            
        end
    end

    # route : music_app.com/users/(:id)

    def show
        @user = User.find_by(id:params[:id])
        redirect_to bands_url
    end


    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end

