class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :login
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
