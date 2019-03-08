class VetsController < ApplicationController
  def index
    @vets = Vet.all
  end

  def show
    @vet = Vet.find(params[:id])
    @editing_privileges = logged_in? && (@owner == current_session_user)
  end

  def new
    @vet = Vet.new
    @user = current_session_user
    @dogs = current_session_user.dogs
  end

  def create
    vet = Vet.create(vet_params)
    if vet.valid?
      redirect_to vet
    else
      flash[:errors] = vet.errors.full_messages
      redirect_to new_vet_path
    end
  end

  def edit
    @vet = Vet.find(params[:id])
    @user = current_session_user
    @dog = @vet.dog
    @dogs = Dog.all
  end

  def update
    vet = Vet.find(params[:id])
    if vet.update(vet_params)
      redirect_to vet
    else
      flash[:errors] = vet.errors.full_messages
      redirect_to edit_vet_path
    end
  end

  private # ********************

  def vet_params
    params.require(:vet).permit(:first_name, :last_name, :address, :phone_num, :email)
  end
end
