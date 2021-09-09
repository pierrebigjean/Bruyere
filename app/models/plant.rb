class Plant < ApplicationRecord
  has_many :ownerships, dependent: :destroy
  has_many :locations, through: :ownerships

  validates :name, presence: true
end
