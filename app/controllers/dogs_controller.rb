class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @owner = @dog.owner
    @instructions = @dog.instructions
    @vets = @dog.vets
  end

  def new
    @dog = Dog.new
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private # *************************

  def dog_params
    params.require(:dog).permit(:name, :breed, :birthday, :size, :img_url, :owner_id)
  end
end
