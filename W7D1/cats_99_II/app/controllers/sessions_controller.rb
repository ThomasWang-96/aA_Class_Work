class SessionsController < ApplicationController
    def new
    end
    
    def create 
        username = user_params[:user_name]
        password = user_params[:password]
        user = User.find_by_credentials(username, password)

        if user.nil?
            flash.now[:alert] = "Username or password is invaild"
            render :new
        else
            user.reset_session_token!
            session = user.session_token
            redirect_to user_url(user)
        end

    end

    def destroy
        redirect_to root_url, notice: "Logged Out!"
    end

    private
    def user_params
        params.require(:user).permit(:user_name, :password)
    end
    
end


# rails g controller sessions new create login welcome 