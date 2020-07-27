class CommentsController < ApplicationController
    before_action :require_current_user!

    def show
        @comment = Comment.find_by(id: params[:id])
        render :show
    end
    
    def new
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save 
            redirect_to post_url(comment_params[:post_id])
        else
            render :new
        end  
    end

    private

    def comment_params
        params.require(:comment).permit(:author_id, :content, :post_id, :parent_comment_id)
    end
end
