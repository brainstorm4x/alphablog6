class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You have been successfully logged in"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with login details"
      render 'new'  
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You were successfully logged out!"
    redirect_to root_path
  end

end