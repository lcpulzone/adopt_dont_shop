class AdminController < ApplicationController
  def index
    @shelter = Shelter.find(params[:id])
    @names_of_shelters = @shelter.reverse_alpha
  end
end
