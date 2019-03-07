class DogsController < ApplicationController
  skip_before_action :check_authorization, only: [:show]

  def index
    @dogs = Dog.all
  end

  def show
    # To-do: Handle situation when bad username is returned. Show the user an error page.
    @dog = Dog.where(username: params[:username]).first
    @owner = @dog.user
    @instructions = @dog.instructions
    @vets = @dog.vets
    @editing_privileges = logged_in? && (@owner == current_session_user)
  end

  def new
    @dog = Dog.new
  end

  def create
    # Set the owner to the current session user
    params[:dog][:user_id] = session[:user_id]

    dog = Dog.create(dog_params)
    if dog.valid?
      dog.profile_picture.attach(params[:dog][:profile_picture])
      redirect_to user_path(session[:user_id])
    else
      flash[:errors] = dog.errors.full_messages
      redirect_to new_dog_path
    end
  end

  def edit
    @dog = Dog.find_by(username: params[:username])
  end

  def update
    dog = Dog.find_by(id: params[:username].to_i)
    if dog && dog.update(dog_params)
      dog.profile_picture.attach(params[:dog][:profile_picture])
      redirect_to user_path(session[:user_id])
    else
      flash[:errors] = dog.errors.full_messages
      dog = Dog.find_by(id: params[:username].to_i)
      redirect_to edit_dog_path(dog.username)
    end
  end

  def destroy
    dog = Dog.find_by(username: params[:username])
    owner = dog.user
    dog.destroy
    redirect_to owner
  end

  private # *************************

  def dog_params
    params.require(:dog).permit(:name, :breed, :birthday, :size, :username, :user_id)
  end
end
