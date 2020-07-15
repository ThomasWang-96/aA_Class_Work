class CommentsController < ApplicationController
    # params
    # 1. user1 => comments by user1 => users/user_id/comments => params =  { user_id:1 }
    # 2. artwork2 => comments on artwork2 => artworks/:id/comments =>  params = { artwork_id:2 }
    
    # params
    # comment => create 

    # comments?comments[user_id]=1
    # comments?comments[artwork_id]=2

    # comments[user_id] = 1
    # comments[artwork_id] = 2

    def index

        if comment_params.has_key?(:author_id)
            @comments = Comment.where(author_id: comment_params[:author_id])
        elsif comment_params.has_key?(:artwork_id)
            @comments = Comment.where(artwork_id: comment_params[:artwork_id])
        else
            render json: @comments.errors.full_messages, status: :unprocessable_entity
        end

        # if params.has_key?(:user_id)
        #     @comments = Comment.where(author_id: params[:user_id])
        # elsif params.has_key?(:artwork_id)
        #     @comments = Comment.where(artwork_id: params[:artwork_id])
        # else
        #     render json: @comments.errors.full_messages, status: :unprocessable_entity
        #     # render json: Comment.all
        # end

        render json: @comments
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        if comment.destroy
            render json: comment
        else
            redner json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body)
    end
    
end
