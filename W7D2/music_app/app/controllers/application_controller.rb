class ApplicationController < ActionController::Base
    before_action :require_current_user, except: [:create, :new]
    
    helper_method :current_user
    helper_method :logged_in?

    def log_in_user!(user) 
        user.reset_session_token!
        session[:session_token] = user.session_token
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


