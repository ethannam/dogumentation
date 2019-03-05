class InstructionsController < ApplicationController
  def index
    @instructions = Instruction.all.inject({}) do |hash, instruction|
      hash[instruction.id] = {
        header: instruction.header,
        content: instruction.content,
        dog_name: instruction.dog.name
      }
      hash
    end
  end

  def show
    @instruction = Instruction.find(params[:id])
    @dog = @instruction.dog
  end

  def new
    @instruction = Instruction.new
    @dogs = Dog.all
  end

  def create
    instruction = Instruction.create(instruction_params)
    if instruction.valid?
      redirect_to instruction
    else
      flash[:errors] = instruction.errors.full_messages
      redirect_to new_instruction_path
    end
  end

  def edit
    @instruction = Instruction.find(params[:id])
    @dog = @instruction.dog
    @dogs = Dog.all
  end

  def update
    instruction = Instruction.find(params[:id])
    if instruction.update(instruction_params)
      redirect_to instruction
    else
      flash[:errors] = instruction.errors.full_messages
      redirect_to edit_instruction_path
    end
  end

  private # ********************

  def instruction_params
    params.require(:instruction).permit(:header, :content, :dog_id)
  end
end
