class PlantsController < ApplicationController

  def index
  end

  private

  def plants_params
    params.require(:plant).permit(:name, :height, :exposure, :watering_frequency, :description)
  end
end
