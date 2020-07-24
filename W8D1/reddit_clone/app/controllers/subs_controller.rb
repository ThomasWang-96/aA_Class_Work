class SubsController < ApplicationController
    before_action :require_current_user!, only:[:new, :create]
    before_action :require_moderator!, only:[:edit, :update]

    def index
        @subs = Sub.all
        render :index
    end

    def new
    end

    def create
        @sub = Sub.new(sub_params)
        if @sub.save
            redirect_to sub_url(@sub)
        else
            render :new
        end
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end


    def edit 
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            redirect_to subs_url
        end        
    end


    private

    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end
    
end
