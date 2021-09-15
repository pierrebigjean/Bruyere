class Ownership < ApplicationRecord
  belongs_to :plant
  belongs_to :location

  validates :last_watering_date, presence: true
  validates :watering_frequency, presence: true
end
