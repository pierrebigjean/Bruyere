class Watering < ApplicationRecord
  belongs_to :ownership

  validates :start_time, presence: true
end
