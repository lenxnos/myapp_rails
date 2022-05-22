class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]


  def index
    @users = User.all
  end


  def show
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    if @user.save
      flash[:notice] = "Welcome to the site, #{@user.username}! You have successfully signed up."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end