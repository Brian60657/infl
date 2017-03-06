class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @user = User.find(params[:user_id])
    @user = current_user
    @post = Post.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def create
  @user = User.find(params[:user_id])
  @post = Post.create(post_params)

  if @post.save
    redirect_to posts_path(@user, @post)
  else
    render :new
  end
end

  def edit
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to user_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to all_posts_path(@post)
  end

  private
    
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
