class Plant < ApplicationRecord
  has_many :ownerships, dependent: :destroy
  has_many :locations, through: :ownerships

  validates :name, presence: true

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :exposure, :name, :height ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
