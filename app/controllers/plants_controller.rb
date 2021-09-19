class PlantsController < ApplicationController

  def index
    @ownership = Ownership.new
    @locations = Location.all
    
    @plants = Plant.order(:name)
    if params[:query].present?
      @plants = @plants.where('name ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'list.html', locals: { plants: @plants } }
    end
  end

end
