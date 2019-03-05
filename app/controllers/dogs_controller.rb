class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    # To-do: Handle situation when bad username is returned. Show the user an error page.
    @dog = Dog.where(username: params[:username]).first
    @owner = @dog.user
    @instructions = @dog.instructions
    @vets = @dog.vets
  end

  def new
    @dog = Dog.new
  end

  def create
    dog = Dog.create(dog_params)
    if dog.valid?
      redirect_to dog
    else
      flash[:errors] = dog.errors.full_messages
      redirect_to new_dog_path
    end
  end

  def edit
    @dog = Dog.where(username: params[:username]).first
  end

  def update
    @dog = Dog.where(username: params[:username]).first
    if dog.update(dog_params)
      redirect_to dog
    else
      flash[:errors] = dog.errors.full_messages
      redirect_to edit_dog_path
    end
  end

  def destroy
  end

  private # *************************

  def dog_params
    params.require(:dog).permit(:name, :breed, :birthday, :size, :username, :img_url, :user_id)
  end
end
