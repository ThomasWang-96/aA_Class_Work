class ApplicationController < ActionController::Base
    helper_method :current_user

    def login!(user)
        @current_user = user
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        redirect_to subs_url
    end

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_current_user!
        redirect_to new_session_url if current_user.nil?
    end

    def require_moderator!
        redirect_to subs_url if current_user != Sub.find_by(id: params[:id]).moderator
    end

    def require_author!
        redirect_to posts_url if current_user != Post.find_by(id: params[:id]).author
    end


end


