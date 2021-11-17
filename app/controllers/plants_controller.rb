require 'csv'

class PlantsController < ApplicationController

  def index
    # store_exposures_in_csv
    # create_real_exposures

    @ownership = Ownership.new
    @locations = Location.all
 
    @plants = Plant.where(category: params[:category]).order(:nickname)
    
    if params[:real_exposure].present?
      @plants = Plant.where(category: params[:category], real_exposure: params[:real_exposure]).order(:nickname)
    end

    if params[:search].present?
      @plants = Plant.search(params[:search]).order(:nickname)
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'plants/list.html', locals: { plants: @plants } }
    end
  end

  private

  def get_all_exposures
    exposures = []
    Plant.all.each do |plant|
      exposures << plant.exposure
    end
    return exposures.uniq
  end

  def store_exposures_in_csv
    exposures = get_all_exposures
    CSV.open("db/exposures.csv", 'wb') do |csv|
      csv << ["exposures", "real_exposures"]
      exposures.each do |exposure|
        csv << [exposure, 0]
      end
    end
  end

  def create_real_exposures
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach("db/exposures.csv", csv_options) do |row|
      Plant.all.each do |plant|
        if plant.exposure == row[:exposures]
          plant.real_exposure = row[:real_exposures]
          plant.save
        end
      end
    end
  end
end
