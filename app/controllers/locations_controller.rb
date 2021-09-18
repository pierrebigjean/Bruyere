class LocationsController < ApplicationController
  
  def index
    @locations = Location.all
    @location = Location.new
  end

  def create
    @location = Location.new(locations_params)
    @location.user = current_user
    @location.save
    redirect_to locations_path, notice: "Your location has been registered"
  end

  def update
    @location = Location.find(params[:id])
    @location.update(locations_params)
    redirect_to locations_path, notice: "Your location has been successfully updated"
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path, notice: "Your location has been deleted"
  end
  
  private

  def locations_params
    params.require(:location).permit(:category, :brightness, :name)
  end
  
end