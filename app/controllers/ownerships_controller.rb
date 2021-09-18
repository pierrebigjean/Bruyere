class OwnershipsController < ApplicationController

  def create
    @ownership = Ownership.new(ownerships_params)
<<<<<<< HEAD
    @ownership.plant = Plant.find(params[:plant_id])
    @ownership.save
    redirect_to locations_path, notice: "Your ownership has been registered"
=======
    @ownership.location = Plant.find(params[:location_id])
    @ownership.save
    redirect_to ownerships_path, notice: "Your ownership has been registered"
>>>>>>> f74be2211bb1d72bd8fe7ad5446f9b7cec83267f
  end

  def destroy
    @ownership = Ownership.find(params[:id])
    @ownership.destroy
<<<<<<< HEAD
    redirect_to locations_path, notice: "Your ownership has been deleted"
=======
    redirect_to ownerships_path, notice: "Your ownership has been deleted"
>>>>>>> f74be2211bb1d72bd8fe7ad5446f9b7cec83267f
  end
  
  private

  def ownerships_params
<<<<<<< HEAD
    params.require(:ownership).permit(:last_watering_date, :watering_frequency, :location_id)
=======
    params.require(:ownership).permit(:last_watering_date, :plant)
>>>>>>> f74be2211bb1d72bd8fe7ad5446f9b7cec83267f
  end

end
