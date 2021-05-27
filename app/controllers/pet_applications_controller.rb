class PetApplicationsController < ApplicationController
  def create
    @application = Application.find(params[:application])
    @pet = Pet.find(params[:pet])
    pet_application = PetApplication.new(pet: @pet, application: @application)

    if pet_application.save
      redirect_to "/applications/#{@application.id}"
    else
      redirect_to "/applications/#{@application.id}"
      flash[:alert] = "Error: #{error_message(pet_application.errors)}"
    end
  end
end
