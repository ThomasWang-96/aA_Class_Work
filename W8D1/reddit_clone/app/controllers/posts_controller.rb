class PostsController < ApplicationController
    before_action :require_current_user!, only:[:new, :create]
    before_action :require_author!, only:[:edit, :update]

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_url(@post)
        else
            render :new
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])

        if @post.update(post_params)
           redirect_to post_url(@post)
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
        redirect_to posts_url
    end

    private
    
    def post_params
        params.require(:post).permit(:title, :url, :content, :author_id, sub_ids:[])
    end
end
