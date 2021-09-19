class PlantsController < ApplicationController

  def index
    @ownership = Ownership.new
    @locations = Location.all
    
    @plants = Plant.search(params[:search])
    if params[:search].nil? || params[:search] == ""
      @plants = Plant.order(:name)
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'plants/list.html', locals: { plants: @plants } }
    end
  end

end
