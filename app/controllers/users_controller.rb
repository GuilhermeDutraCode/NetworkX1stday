class UsersController < ApplicationController
  # before_action :check_for_admin, :only => [:index]
    
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @site = @user.chapter.build
  end

  def create
    @user = User.new user_params
    @site = @site.build(site_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end   