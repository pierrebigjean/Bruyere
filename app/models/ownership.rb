class Ownership < ApplicationRecord
  belongs_to :plant
  belongs_to :location

  FREQUENCY = ["Quotidiennement", "Tous les 2 jours",  "Tous les 3 jours", "Tous les 4 jours", "Tous les 5 jours", "Tous les 6 jours",  "Hebdomadairement", "Tous les 10 jours", "Tous les 20 jours", "Mensuellement", "Tous les 50 jours", "Trimestriellement"]

  validates :last_watering_date, presence: true
  validates :watering_frequency, presence: true
end
