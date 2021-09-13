class OwnershipsController < ApplicationController

  def index
    @ownerships = ownership.all
    @ownership = Ownership.new
  end

  def create
    @ownership = Ownership.new(ownerships_params)
    @ownership.location = Plant.find(params[:location_id])
    @ownership.save
    redirect_to ownerships_path, notice: "Your ownership has been registered"
  end

  def update
    @ownership = Ownership.find(params[:id])
    @ownership.update(ownerships_params)
    redirect_to ownerships_path, notice: "Your ownership has been successfully updated"
  end

  def destroy
    @ownership = Ownership.find(params[:id])
    @ownership.destroy
    redirect_to ownerships_path, notice: "Your ownership has been deleted"
  end
  
  private

  def ownerships_params
    params.require(:ownership).permit(:last_watering_date, :plant)
  end

end
