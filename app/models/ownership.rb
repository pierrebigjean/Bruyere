class Ownership < ApplicationRecord
  belongs_to :plant
  belongs_to :location
  has_many :waterings

  FREQUENCY = ["Quotidiennement", "Tous les 2 jours",  "Tous les 3 jours", "Tous les 4 jours", "Tous les 5 jours", "Tous les 6 jours",  "Hebdomadairement", "Tous les 10 jours", "Tous les 20 jours", "Mensuellement", "Tous les 50 jours", "Trimestriellement"]

  validates :start_time, presence: true
  validates :watering_frequency, presence: true
end
