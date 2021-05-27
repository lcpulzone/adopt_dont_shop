class ApplicationsController < ApplicationController

  def index
  end

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
    if params[:search].present?
      @searched_pets = Pet.search(params[:search])
    end
  end

  def new
    @application = Application.new
  end

  def create
    application = Application.new(app_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      redirect_to '/applications/new'
      flash[:alert] = "Error: #{error_message(application.errors)}"
    end
  end

  def update
    @application = Application.find(params[:id])
    @application.description = (params[:description])
    @application.status = 'Pending'
    @application.save
    redirect_to "/applications/#{@application.id}"
  end

  private

  def app_params
    params.require(:application).permit(:id, :name, :street_address, :city, :state, :zip_code)
  end
end
