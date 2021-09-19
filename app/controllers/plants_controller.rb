class PlantsController < ApplicationController

  def index
    @plants = Plant.search(params[:search])
    @locations = Location.all
    if params[:search].nil? || params[:search] == ""
      @plants = Plant.all.order(:name)
    end
    @ownership = Ownership.new
  end

end
