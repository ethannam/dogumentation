class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
    @dogs = @owner.dogs
  end

  def new
    @owner = Owner.new
  end

  def create
    owner = Owner.create(owner_params)
    if owner.valid?
      redirect_to owner
    else
      flash[:errors] = owner.errors.full_messages
      redirect_to new_owner_path
    end
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    owner = Owner.find(params[:id])
    if owner.update(owner_params)
      redirect_to owner
    else
      flash[:errors] = owner.errors.full_messages
      redirect_to edit_owner_path
    end
  end

  private # ********************

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :phone_num, :email)
  end
end
