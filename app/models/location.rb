class Location < ApplicationRecord
  belongs_to :user
  has_many :ownerships, dependent: :destroy

  CATEGORY = %w(Indoor Outdoor)
  BRIGHTNESS = %w(Low Medium High)

  validates :category, inclusion: { in: CATEGORY }
  validates :brightness, presence: true
  validates :name, presence: true
end
