class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :create]

  def index
    @posts = Post.all
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def create
  @user = User.find(params[:user_id])
  @post = Post.create(post_params)
  @post.user_id = @user.id

  if @post.save
    redirect_to user_posts_path(@user, @post)
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
    # use callbacks to share common setup or constraints between actions
    def set_post
      @post = Post.find(params[:id])
    end

    # never trust parameters from the internet, only allow the white list through
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
