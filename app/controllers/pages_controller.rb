class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def plant_home
    @categories = Plant::CATEGORY
  end
end
