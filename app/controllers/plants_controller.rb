class PlantsController < ApplicationController

  def index
    # store_exposures_in_csv
    # create_real_exposures

    @ownership = Ownership.new
    @locations = Location.all
 
    @plants = Plant.where(category: params[:category]).order(:nickname)
    
    if params[:real_exposure].present? && params[:category].present?
      @plants = Plant.where(category: params[:category], real_exposure: params[:real_exposure]).order(:nickname)
    elsif params[:real_exposure].present? && params[:category].nil?
      @plants = Plant.where(real_exposure: params[:real_exposure]).order(:nickname)
    end

    if params[:search].present?
      @plants = Plant.search(params[:search]).order(:nickname)
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'plants/list.html', locals: { plants: @plants } }
    end
  end
end
