class SessionsController < ApplicationController
  skip_before_action :check_authorization, only: [:new, :create, :home]

  def home
    render "layouts/home"
  end

  def new
    render :login
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dogs_path
    else
      flash[:notice] = "Invalid username or password!"
      redirect_to login_path
    end
  end

  def destroy
  end
end
