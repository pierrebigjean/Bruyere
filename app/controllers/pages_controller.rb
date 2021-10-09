class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def plant_home
    @ownership = Ownership.new
    @locations = Location.all
    @plants = Plant.all
  end
end
