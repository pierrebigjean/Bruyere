class PlantsController < ApplicationController

  def index
<<<<<<< HEAD
    @plants = Plant.search(params[:search])
    @locations = Location.all
    if params[:search].nil? || params[:search] == ""
      @plants = Plant.all.order(:name)
    end
    @ownership = Ownership.new
=======
    @plants = Plant.all
>>>>>>> f74be2211bb1d72bd8fe7ad5446f9b7cec83267f
  end

end
