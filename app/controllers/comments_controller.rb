class CommentsController < ApplicationController

before_action :get_post_id

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.create!(comment_params.merge({user_id: session[:user]["id"]}))
    redirect_to post_path(@post)
  end

  def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post)
    end

  private

    def get_post_id
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
