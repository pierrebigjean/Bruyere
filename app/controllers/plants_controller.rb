require 'csv'

class PlantsController < ApplicationController

  def index
    # store_exposures_in_csv

    @ownership = Ownership.new
    @locations = Location.all
 
    @plants = Plant.where(category: params[:category]).order(:nickname)
    
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
      csv << ["exposures", "traductions"]
      exposures.each do |exposure|
        csv << [exposure, 0]
      end
    end
  end

  # def parse
  #   csv_options = { headers: :first_row, header_converters: :symbol }
  #   CSV.foreach("../../db/exposures.csv", 'wb', csv_options) do |row|
  #     row[:id] = row[:id].to_i
  #     row[:price] = row[:price].to_i
  #     @customers << Customer.new(row)
  #   end
  # end

end
