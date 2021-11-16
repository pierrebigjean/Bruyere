class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def plant_home
    @ownership = Ownership.new
    @locations = Location.all
    @plants = Plant.all
  end

  def calendar
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
  
    # For a monthly view:
    @ownerships = Ownership.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @waterings = []
    @ownerships.each do |ownership|
      for i in (0..30)
        @waterings << Watering.create(start_time: ownership.start_time.to_date + watering_frequency_converter(ownership)*i, ownership: ownership)
        i += 1
      end
    end
  end

  private

  def watering_frequency_converter(ownership)
    case ownership.watering_frequency
    when "Quotidiennement"
      return 1
    when "Tous les 2 jours"
      return 2
    when "Tous les 3 jours"
      return 3
    when "Tous les 4 jours"
      return 4
    when "Tous les 5 jours"
      return 5
    when "Tous les 6 jours"
      return 6
    when "Hebdomadairement"
      return 7
    when "Tous les 10 jours"
      return 10
    when "Tous les 20 jours"
      return 20
    when "Mensuellement"
      return 30
    when "Tous les 50 jours"
      return 50
    when "Trimestriellement"
      return 120
    end
  end
end