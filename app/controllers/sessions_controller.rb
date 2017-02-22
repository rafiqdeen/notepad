class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in (user)
      redirect_to user
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/signin'
  end

  private

  def login(user)
    session[:user_id] = user.id
  end
end
