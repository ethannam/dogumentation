class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @dogs = @user.dogs
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.valid?
      redirect_to user
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
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
    params.require(:user).permit(:first_name, :last_name, :phone_num, :email, :username, :password_digest)
  end
end
