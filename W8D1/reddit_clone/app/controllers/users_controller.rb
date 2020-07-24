class UsersController < ApplicationController
    before_action :require_current_user!, except: [:create, :new]

    def new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            # redirect_to Something_path
        else
            flash.now[:errors] = 'invalid input'
            render :new
        end
    end
    
    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
    end
    

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end



