class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # stores all emails in lowercase to avoid duplicates and case-sensitive login errors
    @user.email.downcase!

    if @user.save

      # if user saves in the db successfully
      flash[:notice] = "Account created!"
      session[:user_id] = @user.id
      redirect_to new_post_path(@user)
    else

      # if user fails model validation
      flash.now.alert = "Please make sure you are using a valid email and password...try again"
      render :new
    end
end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
    if current_user.id == @user.id

      @user.update_attributes(user_params)
      redirect_to users_path

    else
      flash[:notice] = "You are not authorized!"
      redirect_to request.referrer
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session.delete(:user_id)
    redirect_to users_path
  end

  private

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:name, :email, :password, :password_confirmation, posts_attributes:[:id, :body, :title])
  end

end
