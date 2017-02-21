class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login_user(user)
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private

  def login_user(user)
    session[:user_id] = user.id
    redirect_to root_path, notice: 'Logged In successfully'
  end
end
