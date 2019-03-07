class UsersController < ApplicationController
  skip_before_action :check_authorization, only: [:new, :create]

  def index
    redirect_to user_path(current_session_user.id)
      # @users = User.all
  end

  def show
    if params[:id].to_i == current_session_user.id
      @user = current_session_user
      @dogs = @user.dogs
      render :show
    else
      redirect_to user_path(current_session_user.id)
    end
  end

  def new
    if current_session_user
      redirect_to user_path(current_session_user.id)
    else
      @user = User.new
    end
  end

  def create
    byebug

    if check_password
      user = User.create(user_params)
      if user.valid?
        session[:user_id] = user.id
        redirect_to user
      else
        flash[:errors] = user.errors.full_messages
        redirect_to new_user_path
      end
    else
      flash[:errors] = ["The 'Password' and 'Re-enter password' fields did not match. Try again."]
      redirect_to new_user_path
    end  
  end

  def edit
    if params[:id].to_i == current_session_user.id
      @user = current_session_user
      render :edit
    else
      redirect_to edit_user_path(current_session_user.id)
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user
    else
      flash[:errors] = user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  private # ********************

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_num, :email, :username, :password)
  end

  def check_password
    params[:user][:password] == params[:user][:reenter_password] ? true : false
  end

  # def check_privileges
  #   # If the current session user is a regular user, return false
  #   # Else if the current session user is an admin, return true
  #   false
  # end
end
