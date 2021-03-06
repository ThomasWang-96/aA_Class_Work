class SessionsController < ApplicationController
    
    def new   
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            log_in_user!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:error] = 'wrong email or password'
            render :new
        end
    end


    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil
        render :new
    end

end
