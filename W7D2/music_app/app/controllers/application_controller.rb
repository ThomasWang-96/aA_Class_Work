class ApplicationController < ActionController::Base
    before_action :require_current_user, except: [:create, :new]

    def log_in_user!(user) 
        @current_user = user
        new_token = current_user.reset_session_token!
        session[:session_token] = new_token
        redirect_to user_url(current_user)
    end

    def current_user
        return nil if self.session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token] )
    end

    def logged_in?
        !!current_user
    end

    def require_current_user
        redirect_to new_session_url if current_user.nil?        
    end
end
