class PetsController < ApplicationController

  def index
    @owner = Owner.find_by(id: params[:owner_id])
  end

  def show
    @pet = Pet.find_by(id: params[:id])
  end

  def new
    @pet = Pet.new
    # @pet.owner_id = @owner.id
  end

  def create
    pet = Pet.create(pet_params)
    @owner = Owner.find_by(id: params[:owner_id])
    @owner.pets.push(pet)
    redirect_to pet_path(pet)
  end

  # TODO: set up *new* method with data for new view

  # TODO: set up *create* method with database interactions for create
  # TODO: handle save errors and communicate issues to user

  private
  def pet_params
    params.require(:pet).permit(:name, :breed)
  end

end
