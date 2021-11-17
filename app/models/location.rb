class Location < ApplicationRecord
  belongs_to :user
  has_many :ownerships, dependent: :destroy

  CATEGORY = %w(Intérieur Extérieur)
  BRIGHTNESS = ["Très faible", "Faible", "Moyenne", "Elevée", "Très Elevée"]

  validates :category, inclusion: { in: CATEGORY }
  validates :brightness, inclusion: { in: BRIGHTNESS }
  validates :name, presence: true
end
