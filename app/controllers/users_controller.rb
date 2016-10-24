class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:create] = "Congrats you're signed up"
      render :show
    else
      flash[:not_success] = "Try again"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end

  def require_login
    if session[:user_id] == nil
      flash[:error] = "You must be logged in access"
      redirect_to login_path
    end
  end
end
