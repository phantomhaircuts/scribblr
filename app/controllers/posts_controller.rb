 class PostsController < ApplicationController

# index
def index
  @posts = Post.all
  end

# new
def new
  @post = Post.new
end

# create
def create
  @post = Post.create(post_params)
  redirect_to posts_path
end

#show
def show
  @post = Post.find(params[:id])
  @comments = @post.comments.all
end

#delete
def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
end

def archive
  @posts = Post.all
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
  @post.update(post_params)
  redirect_to post_path(@post)
end

private
  def post_params
  params.require(:post).permit(:title, :body)
  end
end
