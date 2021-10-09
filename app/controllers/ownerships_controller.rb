class OwnershipsController < ApplicationController

  def create
    @ownership = Ownership.new(ownerships_params)
    @ownership.plant = Plant.find(params[:plant_id])
    @ownership.save
    redirect_to locations_path, notice: "Your ownership has been registered"
  end

  def update
    @ownership = Ownership.find(params[:id])
    @ownership.update(ownerships_params)
    redirect_to locations_path, notice: "Your ownership has been successfully updated"
  end

  def destroy
    @ownership = Ownership.find(params[:id])
    @ownership.destroy
    redirect_to locations_path, notice: "Your ownership has been deleted"
  end
  
  private

  def ownerships_params
    params.require(:ownership).permit(:last_watering_date, :watering_frequency, :location_id)
  end

end
